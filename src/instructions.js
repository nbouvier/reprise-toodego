import fs from 'fs';

import db from './database/database.js';

import api from './utils/api.js';
import logger from './utils/logger.js';
import sqlBuilder from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import rib from './rib.js';
import payments from './payments.js';
import documents from './documents.js';
import states from './states.js';

const allowedInstructionIds = [ 364, 425, 427 ];

// Create RSJ folder
// Import all documents
// Import payment data
// Create next payment row
// Import states
export async function importInstructions() {
    logger.log('Fetching all instructions ...');
    const instrutions = await api.fetchAll(process.env.TOODEGO_INSTRUCTION_PATH);

    fs.appendFileSync(process.env.INSTRUCTION_DATA_FILE, '{');
    for (let i=0; i<instrutions.length; i++) {
        // Test only
        if (process.env.ENV == 'dev') {
            if (!allowedInstructionIds.includes(instrutions[i].id)) {
                logger.warning(`Skipping instruction #${instrutions[i].id}.`);
                continue;
            }
        }

        logger.log(`Fetching instruction #${instrutions[i].id} ...`);
        const instruction = await api.fetchOne(process.env.TOODEGO_INSTRUCTION_PATH, instrutions[i].id);
        fs.appendFileSync(process.env.INSTRUCTION_DATA_FILE, `${i?',':''}"${instrutions[i].id}":${JSON.stringify(instruction)}`);
        const insertisId = instruction.fields.identifiant_insertis;

        const beneficiaryId = await beneficiaries.getId(insertisId);
        if (!beneficiaryId) {
            logger.error(`Beneficiary not found with id #${insertisId}.`, 'instructions.js:importInstructions');
            continue;
        }

        await documents.importTutorshipDocuments(beneficiaryId, instruction);

        await beneficiaries.importRsjFolder(beneficiaryId, instruction);

        await documents.importNationalityDocuments(beneficiaryId, instruction);
        await documents.importDwellingDocuments(beneficiaryId, instruction);

        await rib.importRib(beneficiaryId, instruction);
        await payments.importNextPayment(beneficiaryId, instruction);

        await states.importStates(beneficiaryId, insertisId, instruction);

        await updateComment(beneficiaryId, instruction);
    }
    fs.appendFileSync(process.env.INSTRUCTION_DATA_FILE, '}');

    logger.log('Updating rsj folder status ...');
    beneficiaries.closeAllowancesForAge()
}

export function getSqlSelectInstructionPayments() {
    return sqlBuilder.getSelect({
        _select: [ '"instructionRsjId"', 'COUNT(*) AS "numberOfPayments"' ],
        _from: [ '"rsj_payment"' ],
        _groupBy: [ '"instructionRsjId"' ],
        _subquery: true
    });
}

export function getSqlSelectInstructionExpectedPayments() {
    return sqlBuilder.getSelect({
        _select: [
            '"id" AS "instructionRsjId"',
            sqlBuilder.getCase({
                _cases: [
                    { _when: '"paymentCounterProposal" = false', _then: 'SUBSTRING("paymentDuration" FROM 1 FOR 1)::INTEGER' },
                    { _when: '"paymentCounterProposal" = true', _then: 'SUBSTRING("paymentCounterDuration" FROM 1 FOR 1)::INTEGER' }
                ],
                _as: '"expectedNumberOfPayments"'
            })
        ],
        _from: [ '"instruction_rsj"' ],
        _where: [ '"paymentCounterProposal" IS NOT null' ],
        _subquery: true
    });
}

export function getSqlSelectSuspendedInstructionsId() {
    return sqlBuilder.getSelect({
        _select: [ 't."instructionRsjId"' ],
        _from: [ '"traceability" t' ],
        _join: [ { _table: states.getSqlSelectInstructionsLastState(), _as: 'a', _on: [ 'a."traceabilityId" = t."id"' ] } ],
        _where: [ `t."status" = 'Suspendue'` ],
        _subquery: true
    });
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
        _orderBy: [ `"instructionDate" DESC` ],
        _limit: 1
    });

    const res = await db.query(sql);
    return res.rows[0]?.id;
}

export async function getPreviousInstructionId(_beneficiaryId, _instructionId) {
    const sql = sqlBuilder.getSelect({
        _select: [ 'i1."id"' ],
        _from: [ '"instruction_rsj" i1', '"instruction_rsj" i2' ],
        _where: [ `i1."beneficiaryId" = ${_beneficiaryId}`, `i1."instructionDate" < i2."instructionDate"`, `i2."id" = ${_instructionId}` ],
        _orderBy: [ `i1."instructionDate" DESC` ],
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

export async function updateAfterTutorshipDocuments(_instructionIds, _tutorship, _documents) {
    const sql = sqlBuilder.getUpdate({
        _update: '"instruction_rsj"',
        _set: [ `"underSupervision" = ${_tutorship}`, ...Object.entries(_documents).map(([ k, v ]) => `"${k}" = ${v}`) ],
        _where: [ `"id" IN (${_instructionIds})` ]
    });

    await db.query(sql);
}

export async function updatePaymentDecision(_instructionId, _amount, _months, _comment) {
    const sql = sqlBuilder.getUpdate({
        _update: '"instruction_rsj"',
        _set: [ `"paymentAmount" = ${_amount}`, `"paymentDuration" = '${_months} mois'`, `"paymentOpinion" = ${sqlBuilder.parseString(_comment)}`, `"paymentCounterProposal" = false` ],
        _where: [ `"id" = ${_instructionId}` ]
    });

    await db.query(sql);
}

export async function updatePaymentCounterDecision(_instructionId, _amount, _months, _comment) {
    const sql = sqlBuilder.getUpdate({
        _update: '"instruction_rsj"',
        _set: [ `"paymentCounterProposal" = true`, `"paymentCounterAmount"  = ${_amount}`, `"paymentCounterDuration" = '${_months} mois'`, `"paymentCounterComment"  = ${sqlBuilder.parseString(_comment)}` ],
        _where: [ `"id" = ${_instructionId}` ]
    });

    await db.query(sql);
}

export async function updateStates() {
    const lastStatesQuery = states.getSqlSelectInstructionsLastState();

    const sql = sqlBuilder.getUpdate({
        _update: '"instruction_rsj"',
        _set: [ '"status" = t."status"', '"statusDate" = t."statusDate"' ],
        _from: [ `${lastStatesQuery} t` ],
        _where: [ '"id" = t."instructionRsjId"' ]
    });

    await db.query(sql);
}

export async function updateComment(_beneficiaryId, _data) {
    logger.log(`Saving payment decision in DIE comment ...`);

    const dateEn = new Date().toLocaleDateString('sv-SE');
    const instructionId = await getClosestInstructionId(_beneficiaryId, dateEn);
    if (!instructionId) {
        logger.error(`Couldn't find latest instruction for beneficiary #${_beneficiaryId}`, 'instructions.js:insertComment');
        return;
    }

    const months = _data.workflow.fields.nombre_de_mois_retenu;
    const amount = _data.workflow.fields.montant_retenu;

    if (months && amount) {
        const comment = `Paiements prévus sur Toodego : ${months} mois, ${amount}€.`;

        const sql = sqlBuilder.getUpdate({
            _update: '"instruction_rsj"',
            _set: [ `"useTitleComment" = ${sqlBuilder.parseString(comment)}` ],
            _where: [ `"id" = ${instructionId}` ]
        });

        await db.query(sql);
    } else {
        logger.error(`Invalid payment decision for beneficiary #${_beneficiaryId}, got ${amount}€ for ${months} months`, 'instructions.js:updateComment');
    }
}

export async function insertOtherDocument(_instructionId, _documentId, _comment) {
    const sql = sqlBuilder.getInsert({
        _insert: [ '"instructionRsjId"', '"documentId"', '"comment"' ],
        _into: '"instruction_rsj_other_document"',
        _values: [ [ _instructionId, _documentId, sqlBuilder.parseString(_comment) ] ],
        _id: null
    });

    await db.query(sql);
}

const instructions = { importInstructions, getSqlSelectInstructionPayments, getSqlSelectInstructionExpectedPayments, getSqlSelectSuspendedInstructionsId, getAllIds, getClosestInstructionId, getPreviousInstructionId, updateAfterNationalityDocuments, updateAfterDwellingDocuments, updateAfterTutorshipDocuments, updatePaymentDecision, updatePaymentCounterDecision, updateStates, insertOtherDocument };

export default instructions;
