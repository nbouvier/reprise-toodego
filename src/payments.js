import db from './database/database.js';

import api from './utils/api.js';
import logger from './utils/logger.js';
import sqlBuilder from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import rib from './rib.js';
import instructions from './instructions.js';

const allowedInsertisIds = [ 364, 425, 427 ];

// Insert all payments
// Update remainingPayment
export async function importPayments() {
    logger.log('Fetching all payments ...');
    const payments = await api.fetchAll(process.env.TOODEGO_PAYMENT_PATH);

    for (let i=0; i<payments.data.length; i++) {
        logger.log(`Fetching payment #${payments.data[i].id} ...`);
        const payment = await api.fetchOne(process.env.TOODEGO_PAYMENT_PATH, payments.data[i].id);
        const insertisId = instruction.fields.identifiant_insertis;

        // Test only
        if (process.env.ENV == 'dev') {
            if (!allowedInsertisIds.includes(insertisId)) {
                logger.warning(`Skipping payment.`);
                continue;
            }
        }

        const beneficiaryId = await beneficiaries.getId(insertisId);
        if (!beneficiaryId) {
            logger.error(`Beneficiary not found with id #${insertisId}.`);
            continue;
        }

        const beneficiaryRsjId = await beneficiaries.getRsjId(insertisId);
        if (!beneficiaryRsjId) {
            logger.error(`BeneficiaryRsj not found with id #${insertisId}.`);
            continue;
        }

        const paymentDate = new Date(payment.receipt_time);
        const lastDayPreviousMonth = new Date(paymentDate.getFullYear(), paymentDate.getMonth(), 0).toLocalDateString('sv-SE');
        const instructionId = await instructions.getClosestInstructionId(beneficiaryId, lastDayPreviousMonth);
        if (!instructionId) {
            logger.error(`Instruction not found for beneficiary #${beneficiaryId} at date ${lastDayPreviousMonth}.`);
            continue;
        }

        const ribId = await beneficiaries.getRibId(beneficiaryRsjId);
        if (!ribId) {
            logger.error(`RIB not found for beneficiary #${beneficiaryId}.`);
            continue;
        }

        const paymentData = extractPaymentData(payment);
        await insert(beneficiaryRsjId, instructionId, ribId, paymentData.amount, paymentData.month, paymentData.createdAt);
        await rib.updateBeginDate(beneficiaryId, paymentDate);
    }

    await importNextPaymentData();

    logger.log('Updating next payments ...');
    await updateRemainingPayments();
}

// Create next payment row
// Update beneficiary data
export async function importNextPayment(_beneficiaryId, _data) {
    logger.log('Creating next payment ...');
    const nextPaymentId = await insertNextPayment();

    logger.log('Updating beneficiary ...');
    await beneficiaries.updateNextPaymentId(_beneficiaryId, nextPaymentId);
}

// Update next payment data
export async function importNextPaymentData() {
    logger.log('Creating planned payments ...');

    // For each beneficiary
    // I take the last accepted instruction (if not suspended)
    // And I count linked payments
    // To get those with linked payments < imported payments
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
            { _table: getSqlSelectInstructionPayments(), _as: 'a', _on: [ 'a."instructionRsjId" = i."id"' ] },
            { _table: getSqlSelectInstructionExpectedPayments(), _as: 'b', _on: [ 'b."instructionRsjId" = i."id"' ] },
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
        logger.log(`Creating ${row.missingPayments} payments of ${row.paymentAmount}€ for beneficiary #${row.beneficiaryId}`);
        for (let j=0; j<parseInt(row.missingPayments); j++) {
            const state = j ? 'Prévu' : 'Réalisé';
            const month = new Date(date.getFullYear(), date.getMonth()+j, 5).toLocaleDateString();
            logger.log(`Payment of ${month} (${state})`);
            insert(row.beneficiaryRsjId, row.instructionRsjId, row.paymentDataId, row.amount, month, date.toLocaleDateString(), state);
        }
    }
}

export function getSqlSelectInstructionPayments() {
    return sqlBuilder.getSelect({
        _select: [ '"instructionRsjId"', 'COUNT(*) AS "numberOfPayments"' ],
        _from: [ '"rsj_payment"' ],
        _groupBy: [ '"instructionRsjId"' ],
        _subquery: true
    });
}

export function getSqlSelectInstructionExpectedPayments() {
    return sqlBuilder.getSelect({
        _select: [
            '"id" AS "instructionRsjId"',
            sqlBuilder.getCase({
                _cases: [
                    { _when: '"paymentCounterProposal" = false', _then: 'SUBSTRING("paymentDuration" FROM 1 FOR 1)::INTEGER' },
                    { _when: '"paymentCounterProposal" = true', _then: 'SUBSTRING("paymentCounterDuration" FROM 1 FOR 1)::INTEGER' }
                ],
                _as: '"expectedNumberOfPayments"'
            })
        ],
        _from: [ '"instruction_rsj"' ],
        _subquery: true
    });
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
        _select: [ '"beneficiaryRsjId"', 'COUNT(*) AS "count"' ],
        _from: [ '"rsj_payment"' ],
        _groupBy: [ '"beneficiaryRsjId"' ],
        _subquery: true
    });
}

export async function updateRemainingPayments() {
    const sql = sqlBuilder.getUpdate({
        _update: '"rsj_next_payment" np',
        _set: [ `"remainingPayment" = 24 - c."count"` ],
        _from: [ '"beneficiary_rsj" brsj', `${getSqlSelectRemainingPayment()} c` ],
        _where: [ 'brsj."id" = c."beneficiaryRsjId"', 'np."id" = brsj."nextPaymentId"' ]
    });

    await db.query(sql);
}

export function extractPaymentData(_data) {
    return {
        amount: _data.fields.montant_verse,
        month: _data.receipt_time.substr(0, 10),
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

// TODO: Controls

/*
SELECT i."beneficiaryId", i.id AS "instructionId", CASE
	WHEN i."paymentCounterProposal" = false THEN SUBSTRING(i."paymentDuration" FROM 1 FOR 1)::INTEGER
	WHEN i."paymentCounterProposal" = true THEN SUBSTRING(i."paymentCounterDuration" FROM 1 FOR 1)::INTEGER
END - COUNT(*) AS "missingPayments", CASE
	WHEN i."paymentCounterProposal" = false THEN i."paymentAmount"
	WHEN i."paymentCounterProposal" = true THEN i."paymentCounterAmount"
END AS "paymentAmount"
FROM instruction_rsj i
JOIN rsj_payment p ON i.id = p."instructionRsjId"
WHERE i."paymentCounterProposal" IS NOT null
GROUP BY i.id
HAVING
 	(i."paymentCounterProposal" = false AND COUNT(*) <> SUBSTRING(i."paymentDuration" FROM 1 FOR 1)::INTEGER) OR
	(i."paymentCounterProposal" = true AND COUNT(*) <> SUBSTRING(i."paymentCounterDuration" FROM 1 FOR 1)::INTEGER)
*/

const payments = { importPayments, importNextPayment };

export default payments;
