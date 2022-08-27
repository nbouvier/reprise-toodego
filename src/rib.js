import db from './database/database.js';

import api from './utils/api.js';
import logger from './utils/logger.js';
import { encrypt } from './utils/encryption.js';
import sqlBuilder from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import documents from './documents.js';

// Import payment data
// Update beneficiary data
export async function importRib(_beneficiaryId, _data) {
    logger.log(`Importing banking document ...`, `instructions/${_data.id}.txt`);
    const documentId = await documents.importBankingDocument(_beneficiaryId, _data);
    if (!documentId) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Failed to import banking document.`, 'rib.js:importRib', [ `instructions/${_data.id}.txt`, 'instructions/error.txt' ]);
        return;
    }

    logger.log('Importing rib ...', `instructions/${_data.id}.txt`);
    const ribId = await insert(documentId, _data);
    if (!documentId) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Failed to import rib.`, 'rib.js:importRib', [ `instructions/${_data.id}.txt`, 'instructions/error.txt' ]);
        return;
    }

    logger.log('Updating beneficiary ...', `instructions/${_data.id}.txt`);
    await beneficiaries.updateRibId(_beneficiaryId, ribId);
}

export async function updateBeginDate(_beneficiaryId, _beginDate) {
    const sql = sqlBuilder.getUpdate({
        _update: '"rsj_payment_data" pd',
        _set: [ `"beginDate" = '${_beginDate}'` ],
        _from: [ '"beneficiary_rsj" brsj' ],
        _where: [ `${_beneficiaryId} = brsj."beneficiaryId"`, 'brsj."paymentDataId" = pd."id"', `pd."beginDate" > '${_beginDate}'` ]
    });

    await db.query(sql);
}

export async function insert(_documentId, _data) {
    const beginDate = _data.receipt_time.substr(0, 10);
    const encryptedFirstName = sqlBuilder.parseString(await encrypt(_data.fields.prenom_compte));
    const encryptedLastName = sqlBuilder.parseString(await encrypt(_data.fields.nom_compte));
    const encryptedBankName = sqlBuilder.parseString(await encrypt(_data.fields.banque));
    const encryptedIban = sqlBuilder.parseString(await encrypt(_data.fields.iban));
    const encryptedBic = sqlBuilder.parseString(await encrypt(_data.fields.bic));
    const livretA = _data.fields.livretA_raw == 'Oui';

    const sql = sqlBuilder.getInsert({
        _insert: [ '"beginDate"', '"endDate"', '"holderFirstName"', '"holderLastName"', '"bankName"', '"iban"', '"bic"', '"livretA"', '"ribId"' ],
        _into: '"rsj_payment_data"',
        _values: [ [ `'${beginDate}'`, 'null', encryptedFirstName, encryptedLastName, encryptedBankName, encryptedIban, encryptedBic, livretA, _documentId ] ]
    });

    const res = await db.query(sql);
    return res[1].rows[0].id;
}

const rib = { importRib, updateBeginDate };

export default rib;
