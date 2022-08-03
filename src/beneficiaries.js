import db from './database/database.js';

import logger from './utils/logger.js';
import sqlBuilder from './utils/sqlBuilder.js';

// Create RSJ folder
export async function importRsjFolder(_beneficiaryId, _data) {
    logger.log(`Creating RSJ folder ...`);
    await insertBeneficiaryRsj(_beneficiaryId);
}

export function getSqlSelectLastInstructionsId() {
    return sqlBuilder.getSelect({
        _select: [ 'DISTINCT ON ("beneficiaryId") "beneficiaryId"', '"id" AS "instructionRsjId"' ],
        _from: [ '"instruction_rsj"' ],
        _orderBy: [ '"beneficiaryId"', '"instructionDate" DESC', '"id" DESC' ],
        _subquery: true
    });
}

export function getSqlSelectLastAcceptedInstructionsId() {
    return sqlBuilder.getSelect({
        _select: [ 't."instructionRsjId"' ],
        _from: [ '"traceability" t' ],
        _join: [ { _table: getSqlSelectLastInstructionsId(), _as: 'a', _on: [ 'a."instructionRsjId" = t."instructionRsjId"' ] } ],
        _where: [ `t."status" = 'Acceptée'` ],
        _subquery: true
    });
}

export async function getId(_insertisId) {
    const sql = sqlBuilder.getSelect({
        _select: [ '"id"' ],
        _from: [ '"beneficiary"' ],
        _where: [ `"insertisId" = ${sqlBuilder.parseString(_insertisId)}` ]
    });

    const res = await db.query(sql);
    return res.rows[0]?.id;
}

export async function getRsjId(_insertisId) {
    const sql = sqlBuilder.getSelect({
        _select: [ 'brsj."id"' ],
        _from: [ '"beneficiary_rsj" brsj', '"beneficiary" b' ],
        _where: [ 'brsj."beneficiaryId" = b."id"', `b."insertisId" = ${sqlBuilder.parseString(_insertisId)}` ]
    });

    const res = await db.query(sql);
    return res.rows[0]?.id;
}

export async function getRibId(_beneficiaryRsjId) {
    const sql = sqlBuilder.getSelect({
        _select: [ '"paymentDataId"' ],
        _from: [ '"beneficiary_rsj"' ],
        _where: [ `"id" = ${_beneficiaryRsjId}` ]
    });

    const res = await db.query(sql);
    return res.rows[0]?.paymentDataId;
}

export async function updateResidentialStatus(_beneficiaryId, _residentialStatus) {
    const sql = sqlBuilder.getUpdate({
        _update: '"beneficiary_address" ba',
        _set: [ `"residentialStatus" = ${sqlBuilder.parseString(_residentialStatus)}` ],
        _from: [ '"beneficiary" b' ],
        _where: [ 'ba."id" = b."residentialAddressId"', `b."id" = ${_beneficiaryId}`, 'ba."residentialStatus" IS null' ]
    });

    await db.query(sql);
}

export async function updateRibId(_beneficiaryId, _paymentDataId) {
    const sql = sqlBuilder.getUpdate({
        _update: [ '"beneficiary_rsj"' ],
        _set: [ `"paymentDataId" = ${_paymentDataId}` ],
        _where: [ `"beneficiaryId" = ${_beneficiaryId}` ]
    });

    await db.query(sql);
}

export async function updateNextPaymentId(_beneficiaryId, _nextPaymentId) {
    const sql = sqlBuilder.getUpdate({
        _update: [ '"beneficiary_rsj"' ],
        _set: [ `"nextPaymentId" = ${_nextPaymentId}` ],
        _where: [ `"beneficiaryId" = ${_beneficiaryId}` ]
    });

    await db.query(sql);
}

export async function insertBeneficiaryRsj(_beneficiaryId) {
    const sql = sqlBuilder.getInsert({
        _insert: [ '"stateId"', '"beneficiaryId"' ],
        _into: '"beneficiary_rsj"',
        _values: [ [ '7', _beneficiaryId ] ]
    });

    const res = await db.query(sql);
    return res[1].rows[0].id;
}

const beneficiaries = { getSqlSelectLastAcceptedInstructionsId, getId, getRsjId, getRibId, updateResidentialStatus, updateRibId, updateNextPaymentId };

export default beneficiaries;
