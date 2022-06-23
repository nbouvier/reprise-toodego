import fs from 'fs';

import db from './database/database.js';

import logger from './utils/logger.js';
import { buildSqlSelect, buildSqlUpdate, parseString } from './utils/sqlBuilder.js';

// Create RSJ folder
export async function importRsjFolder(_beneficiaryId, _data) {
    logger.log(`Creating RSJ folder ...`);
    insertBeneficiaryRsj(_beneficiaryId);
}

export async function getId(_insertisId) {
    const sql = buildSqlSelect({
        _select: [ '"id"' ],
        _from: [ '"beneficiary"' ],
        _where: [ `"insertisId" = ${parseString(_insertisId)}` ],
        _subquery: true
    });

    const res = await db.query(sql);
    return res.rows[0]?.id;
}

export function getSqlSelectIdRsj(_insertisId) {
    return buildSqlSelect({
        _select: [ 'brsj."id"' ],
        _from: [ '"beneficiary_rsj" brsj', '"beneficiary" b' ],
        _where: [ 'brsj."beneficiaryId" = b."id"', `b."insertisId" = ${parseString(_insertisId)}` ],
        _subquery: true
    });
}

export function getSqlUpdateAfterRib(_insertisId, _paymentDataId) {
    return buildSqlUpdate({
        _update: [ '"beneficiary_rsj" brsj' ],
        _set: [ `"paymentDataId" = ${_paymentDataId}` ],
        _from: [ '"beneficiary" b' ],
        _where: [ 'brsj."beneficiaryId" = b."id"', `b."insertisId" = ${parseString(_insertisId)}` ]
    });
}

export function getSqlUpdateAfterNextPayment(_insertisId, _nextPaymentId) {
    return buildSqlUpdate({
        _update: [ '"beneficiary_rsj" brsj' ],
        _set: [ `"nextPaymentId" = ${_nextPaymentId}` ],
        _from: [ '"beneficiary" b' ],
        _where: [ 'brsj."beneficiaryId" = b."id"', `b."insertisId" = ${parseString(_insertisId)}` ]
    });
}

async function insertBeneficiaryRsj(_beneficiaryId) {
    const sql = buildSqlInsert({
        _insert: [ '"stateId"', '"beneficiaryId"' ],
        _into: '"beneficiary_rsj"',
        _values: [ [ '1', _beneficiaryId ] ]
    });

    await db.query(sql);
}

const beneficiaries = { getId, getSqlSelectIdRsj, getSqlUpdateAfterRib, getSqlUpdateAfterNextPayment };

export default beneficiaries;
