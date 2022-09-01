import db from './database/database.js';

import { instructionsLogFolder, errorFile } from '../config/config.js';

import logger from './utils/logger.js';
import { encrypt } from './utils/encryption.js';
import sqlBuilder from './utils/sqlBuilder.js';

import users from './users.js';
import beneficiaries from './beneficiaries.js';
import instructions from './instructions.js';
import { TYPE_JUSTIFICATIF_IDENTITE, TYPE_JUSTIFICATIF_DOMICILIATION, JUSTIFICATIF_TUTELLE } from './mappings.js';

// Import nationality documents
// Update instruction data
export async function importNationalityDocuments(_beneficiaryId, _data) {
    const nationalityMapping = TYPE_JUSTIFICATIF_IDENTITE[_data.fields.nationalite_raw];
    const mapping = nationalityMapping.values[_data.fields[nationalityMapping.field]];
    if (!mapping) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Nationality mapping not found : ${_data.fields.nationalite_raw} / ${_data.fields[nationalityMapping.field]}.`, 'documents.js:importNationalityDocuments', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
        return;
    }

    const userId = await users.getId('insertis@grandlyon.com');
    if (!userId) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - User not found with email insertis@grandlyon.com.`, 'documents.js:importNationalityDocuments', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
        return;
    }

    var documents = {};
    logger.log(`Processing nationality documents ...`, `${instructionsLogFolder}${_data.id}.txt`);
    for (let i=0; i<mapping.toodego.fileVar.length; i++) {
        logger.log(`Importing document "${mapping.insertis.fileTitle[i]}" ...`, `${instructionsLogFolder}${_data.id}.txt`);
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

    logger.log(`Updating instructions ...`, `${instructionsLogFolder}${_data.id}.txt`);
    const instructionIds = await instructions.getAllIds(_beneficiaryId);
    if (instructionIds.length) {
        let dates = [];
        if (mapping.insertis.dateVar) {
            dates = mapping.insertis.dateVar.reduce((dates, date, i) => {
                dates[date] = _data.fields[mapping.toodego.dateVar[i]];
                return dates;
            }, {});
        }

        await instructions.updateAfterNationalityDocuments(instructionIds, mapping.insertis.value, documents, dates);
    } else {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - No instruction found.`, 'documents.js:importNationalityDocuments', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
    }
}

// Import dwelling documents
// Update instruction data
export async function importDwellingDocuments(_beneficiaryId, _data) {
    const mapping = TYPE_JUSTIFICATIF_DOMICILIATION[_data.fields.hebergement_raw];
    if (!mapping) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Dwelling mapping not found for beneficiary : ${_data.fields.hebergement_raw}.`, 'documents.js:importNationalityDocuments', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
        return;
    }

    const userId = await users.getId('insertis@grandlyon.com');
    if (!userId) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - User not found with email insertis@grandlyon.com.`, 'documents.js:importDwellingDocuments', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
        return;
    }

    var documents = {};
    logger.log(`Processing dwelling documents ...`, `${instructionsLogFolder}${_data.id}.txt`);
    for (let i=0; i<mapping.toodego.fileVar.length; i++) {
        logger.log(`Importing document "${mapping.insertis.fileTitle[i]}" ...`, `${instructionsLogFolder}${_data.id}.txt`);
        const documentData = _data.fields[mapping.toodego.fileVar[i]];

        if (documentData) {
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
    }

    logger.log(`Updating instructions ...`, `${instructionsLogFolder}${_data.id}.txt`);
    if (documents.length) {
        const instructionIds = await instructions.getAllIds(_beneficiaryId);
        if (instructionIds.length) {
            await instructions.updateAfterDwellingDocuments(instructionIds, documents);
        } else {
            logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - No instruction found.`, 'documents.js:importDwellingDocuments', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
        }
    }
    await beneficiaries.updateResidentialStatus(_beneficiaryId, mapping.insertis.value);
}

// Import banking document
export async function importBankingDocument(_beneficiaryId, _data) {
    const userId = await users.getId('insertis@grandlyon.com');
    if (!userId) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - User not found with email insertis@grandlyon.com.`, 'documents.js:importBankingDocument', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
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

// Import tutorship documents
// Update instructions data
export async function importTutorshipDocuments(_beneficiaryId, _data) {
    logger.log(`Processing tutorship documents ...`, `${instructionsLogFolder}${_data.id}.txt`);

    var documents = {};
    const tutorship = _data.fields.jeune_sous_tutelle_raw == "Oui";
    if (tutorship) {
        const mapping = JUSTIFICATIF_TUTELLE;

        const userId = await users.getId('insertis@grandlyon.com');
        if (!userId) {
            logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - User not found with email insertis@grandlyon.com.`, 'documents.js:importTutorshipDocuments', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
            return;
        }

        if (_data.fields.jeune_sous_tutelle_raw) {
            for (let i=0; i<mapping.toodego.fileVar.length; i++) {
                logger.log(`Importing document "${mapping.insertis.fileTitle[i]}" ...`, `${instructionsLogFolder}${_data.id}.txt`);
                const documentData = _data.fields[mapping.toodego.fileVar[i]];

                if (documentData) {
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
            }
        }
    }

    logger.log(`Updating instructions ...`, `${instructionsLogFolder}${_data.id}.txt`);
    const instructionIds = await instructions.getAllIds(_beneficiaryId);
    if (instructionIds.length) {
        await instructions.updateAfterTutorshipDocuments(instructionIds, tutorship, documents);
    } else {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - No instruction found.`, 'documents.js:importTutorshipDocuments', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
    }
}

export async function importCommitmentStatement(_beneficiaryId, _data) {
    logger.log(`Processing commitment document ...`, `${instructionsLogFolder}${_data.id}.txt`);

    if (_data.fields.acceptation_par_le_jeune) {
        const instructionId = await instructions.getClosestInstructionId(_beneficiaryId, '1900-01-01', true);
        if (!instructionId) {
            logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - No instruction found.`, 'documents.js:importCommitmentStatement', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
            return;
        }
        const date = new Date().toLocaleDateString('sv-SE');
        await documents.importOtherDocument(_beneficiaryId, instructionId, { id: _data.id, date: date, identifiant_insertis: _data.fields.identifiant_insertis, ..._data.fields.acceptation_par_le_jeune }, 'Déclaration d\'engagement');
    }
}

// Import other document
// Update instruction data
export async function importOtherDocument(_beneficiaryId, _instrutionId, _data, _title='Autre', _comment='') {
    logger.log(`Importing other document "${_title}" (${_data.filename}) ...`, `${instructionsLogFolder}${_data.id}.txt`);

    const userId = await users.getId('insertis@grandlyon.com');
    if (!userId) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - User not found with email insertis@grandlyon.com.`, 'documents.js:importOtherDocument', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
        return;
    }

    const documentId = await insert({
      _title: _title,
      _importDate: _data.date,
      _userId: userId,
      _fileName: _data.filename.split('.')[0],
      _fileType: _data.filename.split('.').pop(),
      _insertisId: _data.identifiant_insertis,
      _beneficiaryId: _beneficiaryId,
      _data: _data.content
    });
    if (!documentId) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Failed to import document.`, 'documents.js:importOtherDocument', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
        return;
    }

    logger.log('Updating instruction ...', `${instructionsLogFolder}${_data.id}.txt`);
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
    const importDate = _importDate || new Date().toLocaleDateString('sv-SE');
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

const documents = { importNationalityDocuments, importDwellingDocuments, importBankingDocument, importTutorshipDocuments, importCommitmentStatement, importOtherDocument };

export default documents;
