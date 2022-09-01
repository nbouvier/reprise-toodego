import fs from 'fs';
import minimist from 'minimist';
const args = minimist(process.argv.slice(2));
import cliProgress from 'cli-progress';

import { paymentsDataFolder, paymentsLogFolder, logFile, warningFile, errorFile } from '../config/config.js';

import db from './database/database.js';

import api from './utils/api.js';
import logger from './utils/logger.js';
import sqlBuilder from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import rib from './rib.js';
import instructions from './instructions.js';
import { MONTHS } from './mappings.js';

// Insert all payments
// Update remainingPayment
export async function importPayments() {
    const allowedPayments = args.payments ? JSON.parse(args.payments) : null;
    const payments = fs.readdirSync(paymentsDataFolder);
    const cliBar = new cliProgress.SingleBar({}, cliProgress.Presets.shades_classic);
    cliBar.start(allowedPayments ? allowedPayments.length : payments.length, 0);
    for (let i=0; i<payments.length; i++) {
        const payment = JSON.parse(fs.readFileSync(`${paymentsDataFolder}${payments[i]}`, 'utf8'));

        if (allowedPayments && !allowedPayments.includes(parseInt(payment.id))) {
            continue;
        }
        if (!args['replay-payments'] && fs.existsSync(`${paymentsLogFolder}${payment.id}.txt`)) {
            cliBar.increment();
            continue;
        }

        logger.log(`Importing payment #${payment.id} ...`, [ `${paymentsLogFolder}${payment.id}.txt`, `${paymentsLogFolder}${logFile}` ]);
        const insertisId = payment.fields.identifiant_insertis;

        const beneficiaryId = await beneficiaries.getId(insertisId);
        if (!beneficiaryId) {
            logger.error(`Payment #${payment.id} - Beneficiary #${insertisId} - Beneficiary not found.`, 'payments.js:importPayments', [ `${paymentsLogFolder}${payment.id}.txt`, `${paymentsLogFolder}${errorFile}` ]);
            cliBar.increment();
            continue;
        }

        const beneficiaryRsjId = await beneficiaries.getRsjId(insertisId);
        if (!beneficiaryRsjId) {
            logger.error(`Payment #${payment.id} - Beneficiary #${insertisId} - BeneficiaryRsj not found.`, 'payments.js:importPayments', [ `${paymentsLogFolder}${payment.id}.txt`, `${paymentsLogFolder}${errorFile}` ]);
            cliBar.increment();
            continue;
        }

        const splittedMonth = payment.fields.mois_du_paiement.split('-');
        const paymentDate = new Date(splittedMonth[1], MONTHS.indexOf(splittedMonth[0]), 5).toLocaleDateString('sv-SE');
        let instructionId = await instructions.getClosestInstructionId(beneficiaryId, paymentDate);
        if (!instructionId) {
            logger.warning(`Payment #${payment.id} - Beneficiary #${beneficiaryId} - Instruction not found at or before date ${paymentDate}.`, 'payments.js:importPayments', [ `${paymentsLogFolder}${payment.id}.txt`, `${paymentsLogFolder}${warningFile}` ]);
            instructionId = await instructions.getClosestInstructionId(beneficiaryId, paymentDate, true);
            if (!instructionId) {
                logger.error(`Payment #${payment.id} - Beneficiary #${beneficiaryId} - No instruction found.`, 'payments.js:importPayments', [ `${paymentsLogFolder}${payment.id}.txt`, `${paymentsLogFolder}${errorFile}` ]);
                cliBar.increment();
                continue;
            }
        }

        const ribId = await beneficiaries.getRibId(beneficiaryRsjId);
        if (!ribId) {
            logger.error(`Payment #${payment.id} - Beneficiary #${beneficiaryId} - RIB not found.`, 'payments.js:importPayments', [ `${paymentsLogFolder}${payment.id}.txt`, `${paymentsLogFolder}${errorFile}` ]);
            cliBar.increment();
            continue;
        }

        const paymentId = await insert(beneficiaryRsjId, instructionId, ribId, payment.fields.montant_verse, paymentDate, payment.last_update_time.substr(0, 10));
        if (!paymentId) {
            logger.error(`Payment #${payment.id} - Beneficiary #${beneficiaryId} - Failed to import payment #${payments[i].id}.`, 'payments.js:importPayments', [ `${paymentsLogFolder}${payment.id}.txt`, `${paymentsLogFolder}${errorFile}` ]);
        }
        logger.log(`Updating rib ...`, `${paymentsLogFolder}${payment.id}.txt`);
        await rib.updateBeginDate(beneficiaryId, paymentDate);

        cliBar.increment();
    }
    cliBar.stop();

    logger.log('Updating remaining payments ...', `${paymentsLogFolder}${logFile}`, true);
    await beneficiaries.updateRemainingPayments();

    await importNextPaymentData();
}

// For each beneficiary
// I take the last accepted instruction (if not suspended)
// And I count linked payments
// To get those with linked payments < imported payments
// Create missing payments
export async function importNextPaymentData() {
    logger.log('Creating planned payments ...', `${paymentsLogFolder}${logFile}`, true);

    const sql = sqlBuilder.getSelect({
        _select: [
            'i."id" AS "instructionId"',
            'b_rsj."beneficiaryId"',
            'b_rsj."id" AS "beneficiaryRsjId"',
            sqlBuilder.getCase({
                _cases: [
                    { _when: 'a."numberOfPayments" IS NOT null', _then: 'b."expectedNumberOfPayments" - a."numberOfPayments"' },
                    { _when: 'a."numberOfPayments" IS null', _then: 'b."expectedNumberOfPayments"' }
                ],
                _as: '"missingPayments"'
            }),
            sqlBuilder.getCase({
                _cases: [
                    { _when: 'i."paymentCounterProposal" = false', _then: 'i."paymentAmount"' },
                    { _when: 'i."paymentCounterProposal"', _then: 'i."paymentCounterAmount"' }
                ],
                _as: '"paymentAmount"'
            }),
            'b_rsj."paymentDataId"'
        ],
        _from: [ '"instruction_rsj" i' ],
        _join: [ { _table: '"beneficiary_rsj" b_rsj', _on: [ 'b_rsj."beneficiaryId" = i."beneficiaryId"' ] } ],
        _leftJoin: [
            { _table: instructions.getSqlSelectInstructionPayments(), _as: 'a', _on: [ 'a."instructionRsjId" = i."id"' ] },
            { _table: instructions.getSqlSelectInstructionExpectedPayments(), _as: 'b', _on: [ 'b."instructionRsjId" = i."id"' ] },
        ],
        _where: [
            'i."paymentCounterProposal" IS NOT null',
            `i."id" IN ${beneficiaries.getSqlSelectLastAcceptedInstructionsId()}`,
            `i."id" NOT IN ${instructions.getSqlSelectSuspendedInstructionsId()}`,
            '(b."expectedNumberOfPayments" - a."numberOfPayments" > 0 OR a."numberOfPayments" IS null)'
        ]
    });

    const res = await db.query(sql);

    const date = new Date();
    for (let i=0; i<res.rows.length; i++) {
        let row = res.rows[i];
        logger.log(`Creating ${row.missingPayments} payments of ${row.paymentAmount}€ for beneficiary #${row.beneficiaryId}`, `${paymentsLogFolder}${logFile}`);
        for (let j=0; j<parseInt(row.missingPayments); j++) {
            const state = j ? 'Prévu' : 'Réalisé';
            const month = new Date(date.getFullYear(), date.getMonth()+j, 5).toLocaleDateString('sv-SE');
            logger.log(`Payment of ${month} (${state})`, `${paymentsLogFolder}${logFile}`);
            const paymentId = await insert(row.beneficiaryRsjId, row.instructionId, row.paymentDataId, row.paymentAmount, month, date.toLocaleDateString('sv-SE'), state);
            if (!paymentId) {
                logger.error(`Beneficiary #${row.beneficiaryId} - Failed to create payment at month ${month}.`, 'payments.js:importNextPaymentData', [ `${paymentsLogFolder}${logFile}`, `${paymentsLogFolder}${errorFile}` ]);
            }
        }
    }
}

export function getSqlSelectStateId(_state) {
    return sqlBuilder.getSelect({
        _select: [ '"id"' ],
        _from: [ '"rsj_payment_state"' ],
        _where: [ `"label" = ${sqlBuilder.parseString(_state)}` ],
        _subquery: true
    });
}

export function getSqlSelectRemainingPayment() {
    return sqlBuilder.getSelect({
        _select: [ 'rp."beneficiaryRsjId"', 'COUNT(*) AS "totalPayments"' ],
        _from: [ '"rsj_payment" rp', '"rsj_payment_state" rpd' ],
        _where: [ 'rpd."id" = rp."stateId"' ],
        _groupBy: [ 'rp."beneficiaryRsjId"' ],
        _subquery: true
    });
}

export async function insert(_beneficiaryRsjId, _instructionId, _ribId, _amount, _paymentMonth, _stateDate, _state = 'Réalisé') {
    const stateQuery = getSqlSelectStateId('Réalisé');

    const sql = sqlBuilder.getInsert({
      _insert: [ '"paymentDataId"', '"stateDate"', '"stateId"', '"amount"', '"paymentMonth"', '"beneficiaryRsjId"', '"instructionRsjId"' ],
      _into: '"rsj_payment"',
      _values: [ [ _ribId, `'${_stateDate}'`, stateQuery, _amount, `'${_paymentMonth}'`, _beneficiaryRsjId, _instructionId ] ]
    });

    const res = await db.query(sql);
    return res[1].rows[0].id;
}

const payments = { importPayments, getSqlSelectRemainingPayment };

export default payments;
