import config from '../config/config.js';
const { instructionsLogFolder, warningFile, errorFile } = config;

import db from './database/database.js';

import logger from './utils/logger.js';
import sqlBuilder from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import instructions from './instructions.js';
import documents from './documents.js';
import { WORKFLOW_STATUS, AUTRE_DOCUMENTS } from './mappings.js';

const FINAL_STATE = [ 'Terminée', 'Refusée', 'Suspendue' ];
const PAYMENT_DECISION = [ 'new', 'accepted' ];

// Eventually update payment decision
// Eventually import document
// Import state
async function importStates(_beneficiaryId, _insertisId, _data) {
    let rsjFolderState = 'Non orienté';

    logger.log('Importing states ...', `${instructionsLogFolder}${_data.id}.txt`);
    for (let i=0; i<_data.evolution.length; i++) {
        const stateData = _data.evolution[i];

        let state = WORKFLOW_STATUS[stateData.status];
        if (!state) {
            logger.log(`Skipping state ${stateData.status} ...`, `${instructionsLogFolder}${_data.id}.txt`);
            continue;
        }

        const stateDate = stateData.time.substr(0, 10);
        const instructionDate = new Date(stateData.time).toLocaleDateString('sv-SE');

        let instructionId = await instructions.getClosestInstructionId(_beneficiaryId, instructionDate);
        if (!instructionId) {
            logger.warning(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Instruction not found at or before date ${instructionDate}.`, 'states.js:importStates', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${warningFile}` ]);
            instructionId = await instructions.getClosestInstructionId(_beneficiaryId, instructionDate, true);
            if (!instructionId) {
                logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - No instruction found.`, 'states.js:importStates', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
                continue;
            }
        }

        const lastState = await getLastState(instructionId);
        if (lastState == 'Demande de suspension' && state == 'Terminée') {
            state = 'Suspendue';
        }

        if (state == lastState || state == 'Terminée' && FINAL_STATE.includes(lastState)) {
            logger.log(`Skipping state ${stateData.status} ...`, `${instructionsLogFolder}${_data.id}.txt`);
            continue;
        }

        logger.log(`Importing state '${state}' ...`, `${instructionsLogFolder}${_data.id}.txt`);

        const comment = await importStatePart(_beneficiaryId, _insertisId, instructionId, _data, stateData);

        rsjFolderState = await updateRsjFolderState(_beneficiaryId, _data, state, stateDate, rsjFolderState);

        if (stateData.status == '3') {
            await importAdditionalState(_beneficiaryId, instructionId, _data, stateDate);
        }

        const stateId = await insert(instructionId, state, stateDate, comment);
        if (!stateId) {
            logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Failed to import state '${state}' on instruction #${instructionId}.`, 'states.js:importStates', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
        }
    }

    await instructions.updateStates();
}

async function importStatePart(_beneficiaryId, _insertisId, _instructionId, _data, _stateData) {
    let comment = _stateData.comment || '';

    for (let j=0; j<_stateData.parts?.length || 0; j++) {
        const part = _stateData.parts[j];

        switch (part.type) {
            case 'workflow-comment':
                comment = [ comment, part.content ].join(' ');
                if (PAYMENT_DECISION.includes(_stateData.status)) {
                    logger.log('Importing payment decision ...', `${instructionsLogFolder}${_data.id}.txt`);

                    const amount = parseInt(part.content.split(/ Euros| €/)[0].split(' ').pop());
                    const months = parseInt(part.content.split(' mois')[0].split(' ').pop());

                    if (amount && months) {
                        if (part.content.indexOf('contre-proposition') == -1) {
                          await instructions.updatePaymentDecision(_instructionId, amount, months, part.content);
                        } else {
                          await instructions.updatePaymentCounterDecision(_instructionId, amount, months, part.content);
                        }
                    }
                }
                break;

            case 'workflow-attachment':
                const stateDate = _stateData.time.substr(0, 10);
                const title = Object.entries(AUTRE_DOCUMENTS).reduce((prev, curr) => part.filename.includes(curr[0]) ? curr[1] : prev, 'Autre');
                await documents.importOtherDocument(_beneficiaryId, _instructionId, { id: _data.id, identifiant_insertis: _insertisId, date: stateDate, ...part }, title, comment);
                break;

            default: logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Unhandled part type ${part.type}.`, 'states.js:importStates', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
        }
    }

    return comment;
}

async function importAdditionalState(_beneficiaryId, _instructionId, _data, _stateDate) {
    logger.log(`Importing additional state 'Terminé' on previous instruction ...`, `${instructionsLogFolder}${_data.id}.txt`);
    let previousInstructionId = await instructions.getPreviousInstructionId(_beneficiaryId, _instructionId);
    if (!previousInstructionId) {
        logger.warning(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Instruction not found before instruction #${_instructionId}.`, 'states.js:importStates', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${warningFile}` ]);
        previousInstructionId = _instructionId;
    }
    const previousInstructionLastState = await getLastState(previousInstructionId);
    if (previousInstructionLastState) {
        if (!FINAL_STATE.includes(previousInstructionLastState)) {
            const additionalStateId = await insert(previousInstructionId, 'Terminée', _stateDate, '');
            if (!additionalStateId) {
                logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - Failed to import state 'Terminé' on instruction #${previousInstructionId}.`, 'states.js:importStates', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
            }
        }
    } else {
        logger.error(`Instruction #${_data.id} - Beneficiary #${_beneficiaryId} - No state found on instruction #${previousInstructionId}.`, 'states.js:importStates', [ `${instructionsLogFolder}${_data.id}.txt`, `${instructionsLogFolder}${errorFile}` ]);
    }
}

async function updateRsjFolderState(_beneficiaryId, _data, _state, _stateDate, _rsjFolderState) {
    let newRsjFolderState = _rsjFolderState;

    switch (_state) {
        case 'Analyse en cours':
            if ([ 'Non orienté', 'Refusé' ].includes(_rsjFolderState)) {
                logger.log(`Updating RSJ folder state to 'En analyse' ...`, `${instructionsLogFolder}${_data.id}.txt`);
                await beneficiaries.updateState(_beneficiaryId, 'En analyse');
                newRsjFolderState = 'En analyse';
            }
            break;

        case 'Refusée':
            if (_rsjFolderState == 'En analyse') {
                logger.log(`Updating RSJ folder state to 'Refusé' ...`, `${instructionsLogFolder}${_data.id}.txt`);
                await beneficiaries.updateState(_beneficiaryId, 'Refusé');
                newRsjFolderState = 'Refusé';
            }
            break;

        case 'Acceptée':
            if (_rsjFolderState == 'En analyse') {
                logger.log(`Updating RSJ folder state to 'Droit ouvert (en attente de versement)' ...`, `${instructionsLogFolder}${_data.id}.txt`);
                await beneficiaries.openAllowance(_beneficiaryId, _stateDate);
                newRsjFolderState = 'Droit ouvert (en attente de versement)';
            }
            break;

        case 'Versement en cours':
            if ([ 'Droit ouvert (en attente de versement)', 'Droit ouvert (sans versement)' ].includes(_rsjFolderState)) {
                logger.log(`Updating RSJ folder state to 'Droit ouvert (avec versement)' ...`, `${instructionsLogFolder}${_data.id}.txt`);
                await beneficiaries.updateState(_beneficiaryId, 'Droit ouvert (avec versement)');
                newRsjFolderState = 'Droit ouvert (avec versement)';
            }
            break;

        case 'Suspendue':
            if (_rsjFolderState == 'Droit ouvert (avec versement)') {
                logger.log(`Updating RSJ folder state to 'Droit ouvert (sans versement)' ...`, `${instructionsLogFolder}${_data.id}.txt`);
                await beneficiaries.updateState(_beneficiaryId, 'Droit ouvert (sans versement)');
                newRsjFolderState = 'Droit ouvert (sans versement)';
            }
            break;

        case 'Terminée':
            if (_rsjFolderState == 'Droit ouvert (avec versement)') {
                logger.log(`Updating RSJ folder state to 'Droit ouvert (sans versement)' ...`, `${instructionsLogFolder}${_data.id}.txt`);
                await beneficiaries.updateState(_beneficiaryId, 'Droit ouvert (sans versement)');
                newRsjFolderState = 'Droit ouvert (sans versement)';
            }
            break;
    }

    return newRsjFolderState;
}

export function getSqlSelectInstructionsLastState() {
    return sqlBuilder.getSelect({
        _select: [ 'DISTINCT ON ("instructionRsjId") "instructionRsjId"' , '"statusDate"', '"status"', '"id" AS "traceabilityId"' ],
        _from: [ '"traceability"' ],
        _where: [ '"instructionRsjId" IS NOT null' ],
        _orderBy: [ '"instructionRsjId"', '"statusDate" DESC', '"id" DESC' ],
        _subquery: true
    });
}

export async function getLastState(_instructionId) {
    const sql = sqlBuilder.getSelect({
        _select: [ '"status"' ],
        _from: [ '"traceability"' ],
        _where: [ `"instructionRsjId" = ${_instructionId}` ],
        _orderBy: [ '"statusDate" DESC', '"id" DESC' ],
        _limit: 1
    });

    const res = await db.query(sql);
    return res.rows[0]?.status;
}

async function insert(_instructionId, _state, _date, _comment) {
    const sql = sqlBuilder.getInsert({
        _insert: [ '"statusDate"', '"status"', '"comment"', '"instructionRsjId"' ],
        _into: "traceability",
        _values: [ [ `'${_date}'`, sqlBuilder.parseString(_state), sqlBuilder.parseString(_comment), _instructionId ] ]
    });

    const res = await db.query(sql);
    return res[1]?.rows[0]?.id;
}

const states = { importStates, getSqlSelectInstructionsLastState, insert };

export default states;
