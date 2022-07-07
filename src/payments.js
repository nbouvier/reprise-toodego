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

        const date = payment.receipt_time.substr(0, 10);
        const instructionId = await instructions.getClosestInstructionId(beneficiaryId, date);
        if (!instructionId) {
            logger.error(`Instruction not found for beneficiary #${beneficiaryId} at date ${date}.`);
            continue;
        }

        const ribId = await beneficiaries.getRibId(beneficiaryRsjId);
        if (!ribId) {
            logger.error(`RIB not found for beneficiary #${beneficiaryId}.`);
            continue;
        }

        await insert(beneficiaryRsjId, instructionId, ribId, payment);
        await rib.updateBeginDate(beneficiaryId, date);
    }

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
export function importNextPaymentData() {
    // Pour chaque bénéficiaire
    // Je prends la dernière instruction
    // Et je compte les paiements qui lui sont associés
    // Si nombre de paiements prévu - nombre de paiements liés > 0
    // Je créer des paiements
}

function getSqlSelectStateId(_state) {
    return sqlBuilder.getSelect({
        _select: [ '"id"' ],
        _from: [ '"rsj_payment_state"' ],
        _where: [ `"label" = ${sqlBuilder.parseString(_state)}` ],
        _subquery: true
    });
}

function getSqlSelectRemainingPayment() {
    return sqlBuilder.getSelect({
        _select: [ '"beneficiaryRsjId"', 'COUNT(*) AS "count"' ],
        _from: [ '"rsj_payment"' ],
        _groupBy: [ '"beneficiaryRsjId"' ],
        _subquery: true
    });
}

async function updateRemainingPayments() {
    const remainingPaymentQuery = getSqlSelectRemainingPayment();

    const sql = sqlBuilder.getUpdate({
        _update: '"rsj_next_payment" np',
        _set: [ `"remainingPayment" = 24 - c."count"` ],
        _from: [ '"beneficiary_rsj" brsj', `${remainingPaymentQuery} c` ],
        _where: [ 'brsj."id" = c."beneficiaryRsjId"', 'np."id" = brsj."nextPaymentId"' ]
    });

    await db.query(sql);
}

async function insert(_beneficiaryRsjId, _instructionId, _ribId, _data) {
    const stateDate = _data.last_update_time.substr(0, 10);
    const stateQuery = getSqlSelectStateId('Réalisé');
    const amount = _data.fields.montant_verse;
    const paymentMonth = _data.receipt_time.substr(0, 10);

    const sql = sqlBuilder.getInsert({
      _insert: [ "paymentDataId", "stateDate", "stateId", "amount", "paymentMonth", "beneficiaryRsjId" ],
      _into: '"rsj_payment"',
      _values: [ [ _ribId, `'${stateDate}'`, stateQuery, amount, _instrutionId, _beneficiaryRsjId ] ]
    });

    await db.query(sql);
}

async function insertNextPayment() {
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
