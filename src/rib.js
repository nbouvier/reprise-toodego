import fs from 'fs';

import db from './database/database.js';

import api from './utils/api.js';
import { encrypt } from './utils/encryption.js';
import { buildSqlSelect, buildSqlUpdate, buildSqlInsert, parseString } from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import documents from './documents.js';

// Import payment data
// Update beneficiary data
export async function importRib(_data) {
    const insertisId = _data.fields.identifiant_insertis;

    console.log('Importing rib ...');
    let sql = await getSqlInsert(_data);
    fs.appendFileSync(process.env.LOG_FILE, sql);
    await db.query(sql);

    console.log('Updating beneficiary ...');
    const ribQuery = await getSqlSelectLastId(insertisId);
    sql = beneficiaries.getSqlUpdateAfterRib(insertisId, ribQuery);
    fs.appendFileSync(process.env.LOG_FILE, sql);
    await db.query(sql);
}

export function getSqlSelectLastId(_insertisId) {
    return buildSqlSelect({
        _select: [ '"id"' ],
        _from: [ '"rsj_payment_data"' ],
        _orderBy: [ '"id" DESC' ],
        _limit: 1,
        _subquery: true
    });
}

export function getSqlUpdateBeginDate(_insertisId, _beginDate) {
    return buildSqlUpdate({
        _update: '"rsj_payment_data" pd',
        _set: [ `"beginDate" = '${_beginDate}'` ],
        _from: [ '"beneficiary" b', '"beneficiary_rsj" brsj' ],
        _where: [ 'b."id" = brsj."beneficiaryId"', 'brsj."paymentDataId" = pd."id"', `b."insertisId" = ${parseString(_insertisId)}` ]
    });
}

async function getSqlInsert(_data) {
    const beginDate = _data.receipt_time.substr(0, 10);
    const encryptedFirstName = parseString(await encrypt(_data.fields.prenom_compte));
    const encryptedLastName = parseString(await encrypt(_data.fields.nom_compte));
    const encryptedBankName = parseString(await encrypt(_data.fields.banque));
    const encryptedIban = parseString(await encrypt(_data.fields.iban));
    const encryptedBic = parseString(await encrypt(_data.fields.bic));
    const livretA = _data.fields.livretA_raw == 'Oui';
    const documentQuery = documents.getSqlSelectLastId(_data.fields.identifiant_insertis, 'Relevé d\'identité bancaire');

    return buildSqlInsert({
        _insert: [ '"beginDate"', '"endDate"', '"holderFirstName"', '"holderLastName"', '"bankName"', '"iban"', '"bic"', '"livretA"', '"ribId"' ],
        _into: '"rsj_payment_data"',
        _values: [ [ `'${beginDate}'`, 'null', encryptedFirstName, encryptedLastName, encryptedBankName, encryptedIban, encryptedBic, livretA, documentQuery ] ]
    });
}

const rib = { importRib, getSqlSelectLastId, getSqlUpdateBeginDate };

export default rib;
