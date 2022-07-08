import db from './database/database.js';

import logger from './utils/logger.js';
import { encrypt } from './utils/encryption.js';
import sqlBuilder from './utils/sqlBuilder.js';

import users from './users.js';
import beneficiaries from './beneficiaries.js';
import instructions from './instructions.js';
import { TYPE_JUSTIFICATIF_IDENTITE, TYPE_JUSTIFICATIF_DOMICILIATION } from './mappings.js';

// Import nationality documents
// Update instruction data
export async function importNationalityDocuments(_beneficiaryId, _data) {
    const nationalityMapping = TYPE_JUSTIFICATIF_IDENTITE[_data.fields.nationalite_raw];
    const mapping = nationalityMapping.values[_data.fields[nationalityMapping.field]];

    const userId = await users.getId('insertis@grandlyon.com');
    if (!userId) {
        logger.error(`User not found with email insertis@grandlyon.com.`);
        return;
    }

    var documents = {};
    logger.log(`Processing nationality documents ...`);
    for (let i=0; i<mapping.toodego.fileVar.length; i++) {
        logger.log(`Importing document "${mapping.insertis.fileTitle[i]}" ...`);
        const documentData = _data.fields[mapping.toodego.fileVar[i]];

        documents[mapping.insertis.fileVar[i]] = await insert({
            _title: mapping.insertis.fileTitle[i],
            _userId: userId,
            _fileName: mapping.insertis.fileName[i],
            _fileType: documentData.filename.split('.').pop(),
            _insertisId: _data.fields.identifiant_insertis,
            _beneficiaryId,
            _data: documentData.content
        });
    }

    logger.log(`Updating instructions ...`);
    const instructionIds = await instructions.getAllIds(_beneficiaryId);
    const dates = mapping.insertis.dateVar.reduce((dates, date, i) => {
        dates[date] = _data.fields[mapping.toodego.dateVar[i]];
        return dates;
    }, {});

    await instructions.updateAfterNationalityDocuments(instructionsIds, mapping.insertis.value, documents, dates);
}

// Import dwelling documents
// Update instruction data
export async function importDwellingDocuments(_beneficiaryId, _data) {
    const mapping = TYPE_JUSTIFICATIF_DOMICILIATION[_data.fields.hebergement_raw];

    const userId = await users.getId('insertis@grandlyon.com');
    if (!userId) {
        logger.error(`User not found with email insertis@grandlyon.com.`);
        return;
    }

    var documents = {};
    logger.log(`Processing dwelling documents ...`);
    for (let i=0; i<mapping.toodego.fileVar.length; i++) {
        logger.log(`Importing document "${mapping.insertis.fileTitle[i]}" ...`);
        const documentData = _data.fields[mapping.toodego.fileVar[i]];

        documents[mapping.insertis.fileVar[i]] = await insert({
            _title: mapping.insertis.fileTitle[i],
            _userId: userId,
            _fileName: mapping.insertis.fileName[i],
            _fileType: documentData.filename.split('.').pop(),
            _insertisId: _data.fields.identifiant_insertis,
            _beneficiaryId,
            _data: documentData.content
        });
    }

    logger.log(`Updating instructions ...`);
    const instructionIds = await instructions.getAllIds(_beneficiaryId);

    await instructions.updateAfterDwellingDocuments(instructionIds, documents);
    await beneficiaries.updateResidentialStatus(_beneficiaryId, mapping.insertis.value);
}

// Import banking document
export async function importBankingDocument(_beneficiaryId, _data) {
    const userId = await users.getId('insertis@grandlyon.com');
    if (!userId) {
        logger.error(`User not found with email insertis@grandlyon.com.`);
        return;
    }

    return await insert({
        _title: 'Relevé d\'identité bancaire',
        _userId: userId,
        _fileName: 'RIB',
        _fileType: 'pdf',
        _insertisId: _data.fields.identifiant_insertis,
        _beneficiaryId,
        _data: _data.fields.rib.content
    });
}

// Import other document
// Update instruction data
export async function importOtherDocument(_instrutionId, _data, _comment) {
    logger.log(`Importing  other document ...`);

    const userId = await users.getId('insertis@grandlyon.com');
    if (!userId) {
        logger.error(`User not found with email insertis@grandlyon.com.`);
        return;
    }

    const documentId = await insert({
      _title: 'Autre',
      _userId: userId,
      _fileName: 'autre',
      _fileType: _data.filename.split('.').pop(),
      _insertisId: insertisId,
      _data: _data.content,
      _date: _data.date
    });

    logger.log('Updating instruction ...');
    await instructions.insertOtherDocument(_instrutionId, documentId, _comment);
}

export function getSqlSelectTitleId(_title) {
    return sqlBuilder.getSelect({
        _select: [ '"id"' ],
        _from: [ '"document_title"' ],
        _where: [ `"label" = ${sqlBuilder.parseString(_title)}`, `"tag" = 'rsj'` ],
        _subquery: true
    });
}

export async function insert({ _title, _importDate, _userId, _fileName, _fileType, _insertisId, _beneficiaryId, _data }) {
    const titleQuery = getSqlSelectTitleId(_title);
    const importDate = _importDate || new Date().toISOString().substr(0, 10);
    const encryptedFileName = sqlBuilder.parseString(await encrypt(`${_insertisId}_${_fileName}_${Date.now()}.${_fileType}`));
    const encryptedFileData = sqlBuilder.parseString(await encrypt(_data));

    const sql = sqlBuilder.getInsert({
        _insert: [ '"titleId"', '"importDate"', '"importedById"', '"filename"', '"beneficiaryId"', '"filedata"' ],
        _into: [ '"document"' ],
        _values: [ [ titleQuery, `'${importDate}'`, _userId, `${encryptedFileName}`, _beneficiaryId, `${encryptedFileData}` ] ]
    });

    const res = await db.query(sql);
    return res[1].rows[0].id;
}

const documents = { importNationalityDocuments, importDwellingDocuments, importBankingDocument, importOtherDocument };

export default documents;
