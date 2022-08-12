import db from './database/database.js';

import logger from './utils/logger.js';
import sqlBuilder from './utils/sqlBuilder.js';

import beneficiaries from './beneficiaries.js';
import instructions from './instructions.js';
import documents from './documents.js';
import { WORKFLOW_STATUS } from './mappings.js';

const FINAL_STATE = [ 'Terminée', 'Refusée', 'Suspendue' ];
const PAYMENT_DECISION = [ 'new', 'accepted' ];

// Eventually update payment decision
// Eventually import document
// Import state
async function importStates(_beneficiaryId, _insertisId, _data) {
    let rsjFolderState = 'Non orienté';

    logger.log('Importing states ...');
    for (let i=0; i<_data.evolution.length; i++) {
        const stateData = _data.evolution[i];

        let state = WORKFLOW_STATUS[stateData.status];
        if (!state) {
            logger.log(`Skipping state ${stateData.status} ...`);
            continue;
        }

        const stateDate = stateData.time.substr(0, 10);
        const instructionDate = new Date(stateData.time).toLocaleDateString('sv-SE');

        const instructionId = await instructions.getClosestInstructionId(_beneficiaryId, instructionDate);
        if (!instructionId) {
            logger.error(`Instruction not found for beneficiary #${beneficiaryId} at or before date ${lastDayPreviousMonth}.`, 'states.js:importStates');
            continue;
        }

        const lastState = await getLastState(instructionId);
        if (lastState == 'Demande de suspension' && state == 'Terminée') {
            state = 'Suspendue';
        }

        if (state == lastState || state == 'Terminée' && FINAL_STATE.includes(lastState)) {
            logger.log(`Skipping state ${stateData.status} ...`);
            continue;
        }

        logger.log(`Importing state '${state}' ...`);

        let comment = stateData.comment || '';
        for (let j=0; j<stateData.parts?.length || 0; j++) {
            const part = stateData.parts[j];

            switch (part.type) {
                case 'workflow-comment':
                    comment = [ comment, part.content ].join(' ');

                    if (PAYMENT_DECISION.includes(stateData.status)) {
                        logger.log('Importing payment decision ...');

                        const amount = parseInt(part.content.split(/ Euros| €/)[0].split(' ').pop());
                        const months = parseInt(part.content.split(' mois')[0].split(' ').pop());

                        if (amount && months) {
                            if (part.content.indexOf('contre-proposition') == -1) {
                              await instructions.updatePaymentDecision(instructionId, amount, months, part.content);
                            } else {
                              await instructions.updatePaymentCounterDecision(instructionId, amount, months, part.content);
                            }
                        } else {
                            logger.error(`Error importing payment decision, got ${amount}€ for '${months}' months ...`, 'states.js:importStates');
                        }
                    }

                    break;

                case 'workflow-attachment':
                    await documents.importOtherDocument(_beneficiaryId, instructionId, { identifiant_insertis: _insertisId, date: stateDate, ...part }, comment);
                    break;

                default: logger.error(`Unhandled part type ${part.type}`, 'states.js:importStates');
            }
        }

        switch (state) {
            case 'Analyse en cours':
                if (rsjFolderState == 'Non orienté') {
                    logger.log(`Updating RSJ folder state to 'En analyse' ...`);
                    beneficiaries.updateState(_beneficiaryId, 'En analyse');
                    rsjFolderState = 'En analyse';
                }
                break;

            case 'Refusée':
                if (rsjFolderState == 'En analyse') {
                    logger.log(`Updating RSJ folder state to 'Refusé' ...`);
                    beneficiaries.updateState(_beneficiaryId, 'Refusé');
                    rsjFolderState = 'Refusé';
                } else if (rsjFolderState == 'Droit ouvert (sans versement)') {
                    logger.log(`Updating RSJ folder state to 'Droit ouvert (sans versement)' ...`);
                    beneficiaries.updateState(_beneficiaryId, 'Droit ouvert (sans versement)');
                    rsjFolderState = 'Droit ouvert (sans versement)';
                }
                break;

            case 'Acceptée':
                if (rsjFolderState == 'En analyse') {
                    logger.log(`Updating RSJ folder state to 'Droit ouvert (en attente de versement)' ...`);
                    beneficiaries.openAllowance(_beneficiaryId, stateDate);
                    rsjFolderState = 'Droit ouvert (en attente de versement)';
                }
                break;

            case 'Versement en cours':
                if (rsjFolderState == 'Droit ouvert (en attente de versement)') {
                    logger.log(`Updating RSJ folder state to 'Droit ouvert (avec versement)' ...`);
                    beneficiaries.updateState(_beneficiaryId, 'Droit ouvert (avec versement)');
                    rsjFolderState = 'Droit ouvert (avec versement)';
                }
                break;

            case 'Suspendue':
                if (rsjFolderState == 'Droit ouvert (avec versement)') {
                    logger.log(`Updating RSJ folder state to 'Droit ouvert (sans versement)' ...`);
                    beneficiaries.updateState(_beneficiaryId, 'Droit ouvert (sans versement)');
                    rsjFolderState = 'Droit ouvert (sans versement)';
                }
                break;

            case 'Terminée':
                if (rsjFolderState == 'Droit ouvert (avec versement)') {
                    logger.log(`Updating RSJ folder state to 'Droit ouvert (sans versement)' ...`);
                    beneficiaries.updateState(_beneficiaryId, 'Droit ouvert (sans versement)');
                    rsjFolderState = 'Droit ouvert (sans versement)';
                }
                break;
        }

        if (stateData.status == '3') {
            logger.log(`Importing additional state 'Terminé' on previous instruction ...`);
            const previousInstructionId = await instructions.getPreviousInstructionId(_beneficiaryId, instructionId);
            if (previousInstructionId) {
                const previousInstructionLastState = await getLastState(previousInstructionId);
                if (previousInstructionLastState) {
                    if (!FINAL_STATE.includes(previousInstructionLastState)) {
                        const additionalStateId = await insert(previousInstructionId, 'Terminée', stateDate, '');
                        if (!additionalStateId) {
                            logger.error(`Failed to import state 'Terminé' on instruction #${previousInstructionId} for beneficiary ${_beneficiaryId}.`, 'state.js:importStates');
                        }
                    }
                } else {
                    logger.error(`Last state not found for instruction #${previousInstructionId} of beneficiary ${_beneficiaryId}.`, 'state.js:importStates');
                }
            } else {
                logger.error(`Instruction not found for beneficiary #${_beneficiaryId} before instruction #${instructionId}.`, 'states.js:importStates');
            }
        }

        const stateId = await insert(instructionId, state, stateDate, comment);
        if (!stateId) {
            logger.error(`Failed to import state '${state}' on instruction #${instructionId} for beneficiary ${_beneficiaryId}.`, 'state.js:importStates');
        }
    }

    await instructions.updateStates();
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
