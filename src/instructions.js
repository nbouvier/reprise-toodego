import db from './database/database.js';

import api from './utils/api.js';
import logger from './utils/logger.js';
import sqlBuilder from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import rib from './rib.js';
import payments from './payments.js';
import documents from './documents.js';
import states from './states.js';

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

        await rib.importRib(beneficiaryId, instruction);
        await payments.importNextPayment(beneficiaryId, instruction);

        await states.importStates(beneficiaryId, instruction);
    }
}

export async function getAllIds(_beneficiaryId) {
    const sql = sqlBuilder.getSelect({
        _select: [ '"id"' ],
        _from: [ '"instruction_rsj"' ],
        _where: [ `"beneficiaryId" = ${_beneficiaryId}` ]
    });

    const res = await db.query(sql);
    return res.rows.map(row => row.id);
}

export async function getClosestInstructionId(_beneficiaryId, _date) {
    const sql = sqlBuilder.getSelect({
        _select: [ '"id"' ],
        _from: [ '"instruction_rsj"' ],
        _where: [ `"beneficiaryId" = ${_beneficiaryId}`, `"instructionDate" <= '${_date}'` ],
        _orderBy: [ `'${_date}' - "instructionDate"` ],
        _limit: 1
    });

    const res = await db.query(sql);
    return res.rows[0]?.id;
}

export async function updateAfterNationalityDocuments(_instructionIds, _documentsType, _documents, _dates) {
    const sql = sqlBuilder.getUpdate({
        _update: '"instruction_rsj"',
        _set: [
            `"credentialType" = ${sqlBuilder.parseString(_documentsType)}`,
            ...Object.entries(_documents).map(([ k, v ]) => `"${k}" = ${v}`),
            ...Object.entries(_dates).map(([ k, v ]) => `"${k}" = '${v}'`)
        ],
        _where: [ `"id" IN (${_instructionIds.join(',')})` ]
    });

    await db.query(sql);
}

export async function updateAfterDwellingDocuments(_instructionIds, _documents) {
    const sql = sqlBuilder.getUpdate({
        _update: '"instruction_rsj"',
        _set: Object.entries(_documents).map(([ k, v ]) => `"${k}" = ${v}`),
        _where: [ `"id" IN (${_instructionIds})` ]
    });

    await db.query(sql);
}

export async function updatePaymentDecision(_instructionId, _amount, _months, _comment) {
    const sql = sqlBuilder.getUpdate({
        _update: '"instruction_rsj"',
        _set: [ `"paymentAmount" = ${_amount}`, `"paymentDuration" = ${_months}`, `"paymentOpinion" = ${sqlBuilder.parseString(_comment)}` ],
        _where: [ `"id" = ${_instructionId}` ]
    });

    await db.query(sql);
}

export async function updatePaymentCounterDecision(_instructionId, _amount, _months, _comment) {
    const counterProposal = _amount && _months ? true : null;

    const sql = sqlBuilder.getUpdate({
        _update: '"instruction_rsj"',
        _set: [ `"paymentCounterProposal" = ${counterProposal}`, `"paymentCounterAmount"  = ${_amount}`, `"paymentCounterDuration" = ${_months}`, `"paymentCounterComment"  = ${sqlBuilder.parseString(_comment)}` ],
        _where: [ `"id" = ${_instructionId}` ]
    });

    await db.query(sql);
}

export async function updateStates() {
    const lastStatesQuery = states.getSqlSelectLastStates();

    const sql = sqlBuilder.getUpdate({
        _update: '"instruction_rsj"',
        _set: [ '"status" = t."status"', '"statusDate" = t."statusDate"' ],
        _from: [ `${lastStatesQuery} t` ],
        _where: [ '"id" = t."instructionRsjId"' ]
    });

    await db.query(sql);
}

export async function insertOtherDocument(_documentId, _comment, _instructionId) {
    const sql = sqlBuilder.getInsert({
        _insert: [ '"instructionRsjId"', '"documentId"', '"comment"' ],
        _into: '"instruction_rsj_other_document"',
        _values: [ [ _instructionId, _documentId, sqlBuilder.parseString(_comment) ] ],
        _id: null
    });

    await db.query(sql);
}

const instructions = { importInstructions, getAllIds, getClosestInstructionId, updateAfterNationalityDocuments, updateAfterDwellingDocuments, updatePaymentDecision, updatePaymentCounterDecision, updateStates, insertOtherDocument };

export default instructions;
