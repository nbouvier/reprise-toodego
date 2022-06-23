import fs from 'fs';

import db from './database/database.js';

import api from './utils/api.js';
import logger from './utils/logger.js';
import { buildSqlSelect, buildSqlUpdate, parseString } from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import rib from './rib.js';
import payments from './payments.js';
import documents from './documents.js';
import { WORKFLOW_STATUS } from './mappings.js';

const allowedInsertisIds = [ 364, 425, 427 ];

// Create RSJ folder
// Import all documents
// Import payment data
// Create next payment row
// Import states
export async function importInstructions() {
    logger.log('Fetching all instructions ...');
    const instrutions = await api.fetchAll(process.env.TOODEGO_INSTRUCTION_PATH);

    for (let i=0; i<instrutions.length; i++) {
        logger.log(`Fetching instruction #${instrutions[i].id} ...`);
        const instruction = await api.fetchOne(process.env.TOODEGO_INSTRUCTION_PATH, instrutions[i].id);
        const insertisId = instruction.fields.identifiant_insertis;

        // Test only
        if (process.env.ENV == 'dev') {
            if (!allowedInsertisIds.includes(insertisId)) {
                logger.warning(`Skipping instruction.`);
                continue;
            }
        }

        const beneficiaryId = await beneficiaries.getId(insertisId);
        if (!beneficiaryId) {
            logger.error(`Beneficiary not found with id #${insertisId}.`);
            continue;
        }

        await beneficiary.importRsjFolder(beneficiaryId, instruction);

        await documents.importNationalityDocuments(beneficiaryId, instruction);
        await documents.importDwellingDocuments(beneficiaryId, instruction);
        await documents.importBankingDocument(beneficiaryId, instruction);

        await rib.importRib(instruction);
        await payments.importNextPayment(instruction);

        await importStates(instruction);
    }
}

// Eventually update payment decision
// Eventually import document
// Import state
async function importStates(_data) {
    const insertisId = _data.fields.identifiant_insertis;

    console.log('Importing states ...');
    for (let i=0; i<_data.evolution.length; i++) {
        const stateData = _data.evolution[i];
        const state = WORKFLOW_STATUS[stateData.status];
        console.log(`Importing state '${state}' ...`);

        const stateDate = stateData.time.substr(0, 10);
        const instructionQuery = getSqlSelectClosestInstructionId(insertisId, stateDate);

        let comment = '';
        // TODO: Check que le dernier états soit pas aussi à mettre dans l'instruction elle même => si oui ça va être chiant
        for (let j=0; j<stateData.parts.length; j++) {
            const part = stateData.parts[i];

            switch (part.type) {
                case 'workflow-comment':
                    comment = [ comment, part.content ].join(' ');

                    if ([ 'new', 'accepted' ].contains(state)) {
                        console.log('Importing payment decision ...');
                        const amount = part.content.split(/ Euros| €/)[0].split(' ').pop();
                        const months = part.content.split(/ mois/)[0].split(' ').pop();

                        const sql = part.content.indexOf('contre-proposition') == -1 ?
                            getSqlUpdatePaymentDecision(amount, months, part.content, instructionQuery) :
                            getSqlUpdatePaymentCounterDecision(amount, months, part.content, instructionQuery);

                        fs.appendFileSync(process.env.LOG_FILE, sql);
                        await db.query(sql);
                    }

                    break;

                case 'workflow-attachment':
                    documents.importOtherDocument({ identifiant_insertis: insertisId, date: stateDate, ...part }, comment, instructionQuery);
                    break;

                default: console.log(`Error - Unhandled part type ${part.type}`);
            }
        }

        const sql = getSqlInsertState(state, stateDate, comment, instructionQuery);

        fs.appendFileSync(process.env.LOG_FILE, sql);
        await db.query(sql);
    }
}

export async function getAllIds(_beneficiaryId) {
    const sql = buildSqlSelect({
        _select: [ '"id"' ],
        _from: [ '"instruction_rsj"' ],
        _where: [ `"beneficiaryId" = ${_beneficiaryId}` ],
        _subquery: true
    });

    const res = await db.query(sql);
    return res.rows.map(row => row.id);
}

export function getSqlSelectClosestInstructionId(_insertisId, _date) {
    return buildSqlSelect({
        _select: [ 'ir."id"' ],
        _from: [ '"instruction_rsj" ir', '"beneficiary" b' ],
        _where: [ 'ir."beneficiaryId" = b."id"', `b."insertisId" = ${parseString(_insertisId)}`, `ir."instructionDate" <= '${_date}'` ],
        _orderBy: [ `'${_date}' - ir."instructionDate"` ],
        _limit: 1,
        _subquery: true
    });
}

export async function updateAfterNationalityDocuments(_instructionIds, _documentsType, _documents, _dates) {
    const sql = buildSqlUpdate({
        _update: '"instruction_rsj"',
        _set: [
            `"credentialType" = ${parseString(_documentsType)}`,
            ...Object.entries(_documents).map(([ k, v ]) => `"${k}" = ${v}`),
            ...Object.entries(_dates).map(([ k, v ]) => `"${k}" = '${v}'`)
        ],
        _where: [ `"id" IN [${_instructionIds.join(',')}]` ]
    });

    await db.query(sql);
}

export async function updateAfterDwellingDocuments(_instructionIds, _residentialStatus, _documents) {
    const sql1 = buildSqlUpdate({
        _update: '"instruction_rsj"',
        _set: Object.entries(_documents).map(([ k, v ]) => `"${k}" = ${v}`),
        _where: [ `"id" IN ${_instructionIds}` ]
    });

    const sql2 = buildSqlUpdate({
        _update: '"beneficiary_address" ba',
        _set: [ `"residentialStatus" = ${parseString(_residentialStatus)}` ],
        _from: [ '"instruction_rsj" ir' ],
        _where: [ `ir."id" = ${_instructionIds}`, 'ba."id" IN (ir."residentialAddressId", ir."postalAddressId")' ]
    });

    const sql = sql1 + sql2;

    await db.query(sql);
}

function getSqlUpdatePaymentDecision(_amount, _months, _comment, _instructionId) {
    return buildSqlUpdate({
        _update: '"instruction_rsj"',
        _set: [ '"paymentAmount"', '"paymentDuration"', '"paymentOpinion"' ],
        _values: [ [ _amount, _months, parseString(_comment) ] ],
        _where: [ `"id" = ${_instrutionId}` ]
    });
}

function getSqlUpdatePaymentCounterDecision(_amount, _months, _comment, _instructionId) {
    return buildSqlUpdate({
        _update: '"instruction_rsj"',
        _set: [ '"paymentCounterProposal"', '"paymentCounterAmount"', '"paymentCounterDuration"', '"paymentCounterOpinion"' ],
        _values: [ [ 'true', _amount, _months, parseString(_comment) ] ],
        _where: [ `"id" = ${_instrutionId}` ]
    });
}

function getSqlInsertState(_state, _date, _comment, _instructionId) {
    return buildSqlInsert({
        _insert: [ '"statusDate"', '"status"', '"comment"', '"instructionId"' ],
        _into: "traceability",
        _values: [ [ parseString(_state), `'${_date}'`, parseString(_comment), _instructionId ] ]
    });
}

export function getSqlInsertAfterOtherDocument(_documentId, _comment, _instructionId) {
    return buildSqlInsert({
        _insert: [ '"instructionRsjId"', '"documentId"', '"comment"' ],
        _into: '"instruction_rsj_other_document"',
        _values: [ [ _instrutionId, parseString(_comment), _documentId ] ]
    });
}

const instructions = { importInstructions, getAllIds, getSqlSelectClosestInstructionId, updateAfterNationalityDocuments, updateAfterDwellingDocuments, getSqlInsertAfterOtherDocument };

export default instructions;
