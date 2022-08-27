import fs from 'fs';
import minimist from 'minimist';
const args = minimist(process.argv.slice(2));
import cliProgress from 'cli-progress';

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
    const payments = fs.readdirSync(process.env.PAYMENT_DATA_FOLDER);
    const cliBar = new cliProgress.SingleBar({}, cliProgress.Presets.shades_classic);
    cliBar.start(allowedPayments ? allowedPayments.length : payments.length, 0);
    for (let i=0; i<payments.length; i++) {
        const payment = JSON.parse(fs.readFileSync(`${process.env.PAYMENT_DATA_FOLDER}${payments[i]}`, 'utf8'));

        if (allowedPayments && !allowedPayments.includes(parseInt(payment.id))) {
            continue;
        }
        if (!args['replay-payments'] && fs.existsSync(`${process.env.LOG_FOLDER}payments/${payment.id}.txt`)) {
            cliBar.increment();
            continue;
        }

        logger.log(`Importing payment #${payment.id} ...`, [ `payments/${payment.id}.txt`, 'payments/log.txt' ]);
        const insertisId = payment.fields.identifiant_insertis;

        const beneficiaryId = await beneficiaries.getId(insertisId);
        if (!beneficiaryId) {
            logger.error(`Payment #${payment.id} - Beneficiary #${insertisId} - Beneficiary not found.`, 'payments.js:importPayments', [ `payments/${payment.id}.txt`, 'payments/error.txt' ]);
            cliBar.increment();
            continue;
        }

        const beneficiaryRsjId = await beneficiaries.getRsjId(insertisId);
        if (!beneficiaryRsjId) {
            logger.error(`Payment #${payment.id} - Beneficiary #${insertisId} - BeneficiaryRsj not found.`, 'payments.js:importPayments', [ `payments/${payment.id}.txt`, 'payments/error.txt' ]);
            cliBar.increment();
            continue;
        }

        let paymentDate = new Date(payment.receipt_time);
        const lastDayPreviousMonth = new Date(paymentDate.getFullYear(), paymentDate.getMonth(), 0).toLocaleDateString('sv-SE');
        paymentDate = paymentDate.toLocaleDateString('sv-SE');
        let instructionId = await instructions.getClosestInstructionId(beneficiaryId, lastDayPreviousMonth);
        if (!instructionId) {
            logger.warning(`Payment #${payment.id} - Beneficiary #${beneficiaryId} - Instruction not found at or before date ${lastDayPreviousMonth}.`, 'payments.js:importPayments', [ `payments/${payment.id}.txt`, 'payments/warning.txt' ]);
            instructionId = await instructions.getClosestInstructionId(beneficiaryId, lastDayPreviousMonth, true);
            if (!instructionId) {
                logger.error(`Payment #${payment.id} - Beneficiary #${beneficiaryId} - No instruction found.`, 'payments.js:importPayments', [ `payments/${payment.id}.txt`, 'payments/error.txt' ]);
                cliBar.increment();
                continue;
            }
        }

        const ribId = await beneficiaries.getRibId(beneficiaryRsjId);
        if (!ribId) {
            logger.error(`Payment #${payment.id} - Beneficiary #${beneficiaryId} - RIB not found.`, 'payments.js:importPayments', [ `payments/${payment.id}.txt`, 'payments/error.txt' ]);
            cliBar.increment();
            continue;
        }

        const paymentData = extractPaymentData(payment);
        const paymentId = await insert(beneficiaryRsjId, instructionId, ribId, paymentData.amount, paymentData.month, paymentData.createdAt);
        if (!paymentId) {
            logger.error(`Payment #${payment.id} - Beneficiary #${beneficiaryId} - Failed to import payment #${payments[i].id}.`, 'payments.js:importPayments', [ `payments/${payment.id}.txt`, 'payments/error.txt' ]);
        }
        logger.log(`Updating rib ...`, `payments/${payment.id}.txt`);
        await rib.updateBeginDate(beneficiaryId, paymentDate);

        cliBar.increment();
    }
    cliBar.stop();

    await importNextPaymentData();

    logger.log('Updating next payments ...', `payments/log.txt`, true);
    await updateNextPayments();
}

// Create next payment row
// Update beneficiary data
export async function importNextPayment(_beneficiaryId, _data) {
    logger.log('Creating next payment ...', `instructions/${_data.id}.txt`);
    const nextPaymentId = await insertNextPayment();
    if (!nextPaymentId) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Failed to create next payment.`, 'payments.js:importNextPayment', [ `payments/${_data.id}.txt`, 'payments/error.txt' ]);
        return;
    }

    logger.log('Updating beneficiary rsj ...', `instructions/${_data.id}.txt`);
    await beneficiaries.updateNextPaymentId(_beneficiaryId, nextPaymentId);
}

// For each beneficiary
// I take the last accepted instruction (if not suspended)
// And I count linked payments
// To get those with linked payments < imported payments
// Create missing payments
export async function importNextPaymentData() {
    logger.log('Creating planned payments ...', `payments/log.txt`, true);

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
        logger.log(`Creating ${row.missingPayments} payments of ${row.paymentAmount}€ for beneficiary #${row.beneficiaryId}`, `payments/log.txt`);
        for (let j=0; j<parseInt(row.missingPayments); j++) {
            const state = j ? 'Prévu' : 'Réalisé';
            const month = new Date(date.getFullYear(), date.getMonth()+j, 5).toLocaleDateString('sv-SE');
            logger.log(`Payment of ${month} (${state})`, `payments/log.txt`);
            const paymentId = await insert(row.beneficiaryRsjId, row.instructionId, row.paymentDataId, row.paymentAmount, month, date.toLocaleDateString('sv-SE'), state);
            if (!paymentId) {
                logger.error(`Beneficiary #${row.beneficiaryId} - Failed to create payment at month ${month}.`, 'payments.js:importNextPaymentData', [ `payments/log.txt`, `payments/error.txt` ]);
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
        _select: [ 'rp."beneficiaryRsjId"', 'COUNT(*) AS "count"', `MIN(rp."paymentMonth") FILTER (WHERE rpd."label" = 'Prévu') AS "nextMonth"`, `MIN(rp."amount") FILTER (WHERE rpd."label" = 'Prévu') AS "nextAmount"` ],
        _from: [ '"rsj_payment" rp' ],
        _join: [ { _table: '"rsj_payment_state"', _as: 'rpd', _on: [ 'rpd."id" = rp."stateId"' ] } ],
        _groupBy: [ 'rp."beneficiaryRsjId"' ],
        _subquery: true
    });
}

export async function updateNextPayments() {
    const sql = sqlBuilder.getUpdate({
        _update: '"rsj_next_payment" np',
        _set: [ `"remainingPayment" = 24 - c."count"`, '"nextPayment" = c."nextMonth"', '"nextAmount" = c."nextAmount"' ],
        _from: [ '"beneficiary_rsj" brsj', `${getSqlSelectRemainingPayment()} c` ],
        _where: [ 'brsj."id" = c."beneficiaryRsjId"', 'np."id" = brsj."nextPaymentId"' ]
    });

    await db.query(sql);
}

export function extractPaymentData(_data) {
    const splittedMonth = _data.fields.mois_du_paiement.split('-');
    const month = new Date(splittedMonth[1], MONTHS.indexOf(splittedMonth[0]), 5).toLocaleDateString('sv-SE');

    return {
        amount: _data.fields.montant_verse,
        month: month,
        createdAt: _data.last_update_time.substr(0, 10)
    };
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

export async function insertNextPayment() {
    const sql = sqlBuilder.getInsert({
        _insert: [ '"remainingPayment"' ],
        _into: '"rsj_next_payment"',
        _values: [ [ '24' ] ]
    });

    const res = await db.query(sql);
    return res[1].rows[0].id;
}

const payments = { importPayments, importNextPayment };

export default payments;
