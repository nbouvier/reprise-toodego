import fs from 'fs';
import minimist from 'minimist';
const args = minimist(process.argv.slice(2));
import cliProgress from 'cli-progress';

import db from './database/database.js';

import api from './utils/api.js';
import logger from './utils/logger.js';
import sqlBuilder from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import rib from './rib.js';
import payments from './payments.js';
import documents from './documents.js';
import states from './states.js';

// Create RSJ folder
// Import all documents
// Import payment data
// Create next payment row
// Import states
export async function importInstructions() {
    const allowedInstructions = args.instructions ? JSON.parse(args.instructions) : null;
    const instructions = fs.readdirSync(process.env.INSTRUCTION_DATA_FOLDER);
    const cliBar = new cliProgress.SingleBar({}, cliProgress.Presets.shades_classic);
    cliBar.start(allowedInstructions ? allowedInstructions.length : instructions.length, 0);
    for (let i=0; i<instructions.length; i++) {
        const instruction = JSON.parse(fs.readFileSync(`${process.env.INSTRUCTION_DATA_FOLDER}${instructions[i]}`, 'utf8'));

        if (allowedInstructions && !allowedInstructions.includes(parseInt(instruction.id))) {
            continue;
        }
        if (!args['replay-instructions'] && fs.existsSync(`${process.env.LOG_FOLDER}instructions/${instruction.id}.txt`)) {
            cliBar.increment();
            continue;
        }

        const insertisId = instruction.fields.identifiant_insertis;
        logger.log(`Importing instruction #${instruction.id} for beneficiary #${insertisId} ...`, [ `instructions/${instruction.id}.txt`, `instructions/log.txt` ]);

        const beneficiaryId = await beneficiaries.getId(insertisId);
        if (!beneficiaryId) {
            logger.error(`Instruction #${instruction.id} - Beneficiary #${insertisId} - Beneficiary not found.`, 'instructions.js:importInstructions', [ `instructions/${instruction.id}.txt`, `instructions/error.txt` ]);
            cliBar.increment();
            continue;
        }

        await beneficiaries.importRsjFolder(beneficiaryId, instruction);

        await documents.importNationalityDocuments(beneficiaryId, instruction);
        await documents.importDwellingDocuments(beneficiaryId, instruction);
        await documents.importTutorshipDocuments(beneficiaryId, instruction);
        await documents.importCommitmentStatement(beneficiaryId, instruction);

        await rib.importRib(beneficiaryId, instruction);
        await payments.importNextPayment(beneficiaryId, instruction);

        await states.importStates(beneficiaryId, insertisId, instruction);

        await updateComment(beneficiaryId, instruction);

        cliBar.increment();
    }
    cliBar.stop();

    logger.log('Updating rsj folder status ...', `instructions/log.txt`, true);
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

export async function getClosestInstructionId(_beneficiaryId, _date, _revert=false) {
    const operator = _revert ? '>' : '<=';
    const order = _revert ? 'ASC' : 'DESC';
    const sql = sqlBuilder.getSelect({
        _select: [ '"id"' ],
        _from: [ '"instruction_rsj"' ],
        _where: [ `"beneficiaryId" = ${_beneficiaryId}`, `"instructionDate" ${operator} '${_date}'` ],
        _orderBy: [ `"instructionDate" ${order}` ],
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
        _where: [ `"id" IN (${_instructionIds.join(',')})` ]
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
    logger.log(`Saving payment decision in DIE comment ...`, `instructions/${_data.id}.txt`);

    const dateEn = new Date().toLocaleDateString('sv-SE');
    const instructionId = await getClosestInstructionId(_beneficiaryId, dateEn);
    if (!instructionId) {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - No instruction found.`, 'instructions.js:insertComment', [ `instructions/${_data.id}.txt`, `instructions/error.txt` ]);
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
