import fs from 'fs';

import db from './database/database.js';

import api from './utils/api.js';
import { buildSqlSelect, buildSqlUpdate, buildSqlInsert, parseString } from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import rib from './rib.js';
import instructions from './instructions.js';

const allowedInsertisIds = [ 364, 425, 427 ];

// Insert all payments
// Update remainingPayment
export async function importPayments() {
    console.log('Fetching all payments ...');
    const payments = await api.fetchAll(process.env.TOODEGO_PAYMENT_PATH);

    for (let i=0; i<payments.data.length; i++) {
        console.log(`Fetching payment #${payments.data[i].id} ...`);
        const payment = await api.fetchOne(process.env.TOODEGO_PAYMENT_PATH, payments.data[i].id);
        if (!allowedInsertisIds.includes(payment.fields.identifiant_insertis)) {
            continue;
        }

        const sql = getSqlInsert(payment);

        fs.appendFileSync(process.env.LOG_FILE, sql);
        await db.query(sql);
    }

    console.log('Updating next payments ...');
    const sql = getSqlUpdateRemainingPayments();
    fs.appendFileSync(process.env.LOG_FILE, sql);
    await db.query(sql);
}

// Create next payment row
// Update beneficiary data
export async function importNextPayment(_data) {
    const insertisId = _data.fields.identifiant_insertis;

    console.log('Creating next payment ...');
    let sql = getSqlInsertNextPayment(insertisId);
    fs.appendFileSync(process.env.LOG_FILE, sql);
    await db.query(sql);

    console.log('Updating beneficiary ...');
    const nextPaymentQuery = getSqlSelectNextPaymentLastId(insertisId);
    sql = beneficiaries.getSqlUpdateAfterNextPayment(insertisId, nextPaymentQuery);
    fs.appendFileSync(process.env.LOG_FILE, sql);
    await db.query(sql);
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
    return buildSqlSelect({
        _select: [ '"id"' ],
        _from: [ '"rsj_payment_state"' ],
        _where: [ `"label" = ${parseString(_state)}` ],
        _subquery: true
    });
}

function getSqlSelectRemainingPayment(_insertisId) {
    return buildSqlSelect({
        _select: [ '"beneficiaryRsjId"', 'COUNT(*) AS "count"' ],
        _from: [ '"rsj_payment"' ],
        _groupBy: [ '"beneficiaryRsjId"' ],
        _subquery: true
    });
}

function getSqlSelectNextPaymentLastId() {
    return buildSqlSelect({
        _select: [ '"id"' ],
        _from: [ '"rsj_next_payment"' ],
        _orderBy: [ '"id" DESC' ],
        _limit: 1,
        _subquery: true
    });
}

function getSqlUpdateRemainingPayments() {
    const remainingPaymentQuery = getSqlSelectRemainingPayment(_insertisId);

    const sql = buildSqlUpdate({
        _update: '"rsj_next_payment" np',
        _set: [ `"remainingPayment" = 24 - c."count"` ],
        _from: [ '"beneficiary_rsj" brsj', `${remainingPaymentQuery} c` ],
        _where: [ 'brsj."id" = c."beneficiaryRsjId"', 'np."id" = brsj."nextPaymentId"' ]
    });

    return sql;
}

function getSqlInsert(_data) {
    const ribQuery = rib.getSqlSelectLastId(insertisId);
    const stateDate = _data.last_update_time.substr(0, 10);
    const stateQuery = getSqlSelectStateId('Réalisé');
    const amount = _data.fields.montant_verse;
    const paymentMonth = _data.receipt_time.substr(0, 10);
    const beneficiaryQuery = beneficiaries.getSqlSelectIdRsj(insertisId);
    const instructionQuery = instructions.getSqlSelectClosestInstructionId(insertisId, paymentMonth);

    const sql =
        rib.getSqlUpdateBeginDate(insertisId, paymentMonth) +
        `INSERT INTO "rsj_payment" ("paymentDataId", "stateDate", "stateId", "amount", "paymentMonth", "beneficiaryRsjId") ` +
        `VALUES (${ribQuery}, '${stateDate}', ${stateQuery}, ${amount}, '${paymentMonth}', ${beneficiaryQuery});`;

    return sql;
}

function getSqlInsertNextPayment(_insertisId) {
    return buildSqlInsert({
        _insert: [ '"remainingPayment"' ],
        _into: [ '"rsj_next_payment"' ],
        _values: [ [ '24' ] ]
    });
}

const payments = { importPayments, importNextPayment };

export default payments;
