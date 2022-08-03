import db from './database/database.js';

import logger from './utils/logger.js';
import sqlBuilder from './utils/sqlBuilder.js';

import instructions from './instructions.js';
import documents from './documents.js';
import { WORKFLOW_STATUS } from './mappings.js';

const AVOID_DUPLICATES = [ 'Versement en cours' ];
const PAYMENT_DECISION = [ 'new', 'accepted' ];

// Eventually update payment decision
// Eventually import document
// Import state
async function importStates(_beneficiaryId, _data) {
    logger.log('Importing states ...');
    for (let i=0; i<_data.evolution.length; i++) {
        const stateData = _data.evolution[i];

        const state = WORKFLOW_STATUS[stateData.status];
        if (!state) {
            logger.log(`Skipping state ${stateData.status} ...`);
            continue;
        }

        const stateDate = stateData.time.substr(0, 10);
        const instructionDate = new Date(stateData.time).toLocalDateString('sv-SE');

        const instructionId = instructions.getClosestInstructionId(_beneficiaryId, instructionDate);
        if (!instructionId) {
            logger.error(`Instruction not found for beneficiary #${beneficiaryId} at or before date ${lastDayPreviousMonth}.`);
            continue;
        }

        if (AVOID_DUPLICATES.includes(state) && state == await getLastState(instructionId)) {
            logger.log(`Skipping state ${stateData.status} ...`);
            continue;
        }

        logger.log(`Importing state '${state}' ...`);

        let comment = '';
        for (let j=0; j<stateData.parts.length; j++) {
            const part = stateData.parts[i];

            switch (part.type) {
                case 'workflow-comment':
                    comment = [ comment, part.content ].join(' ');

                    if (PAYMENT_DECISION.contains(stateData.status)) {
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
                            logger.error(`Error importing payment decision, got '${amount}'€ for '${months}' months ...`);
                        }
                    }

                    break;

                case 'workflow-attachment':
                    await documents.importOtherDocument(instructionId, { identifiant_insertis: insertisId, stateDate, ...part }, comment);
                    break;

                default: logger.log(`Error - Unhandled part type ${part.type}`);
            }
        }

        await insert(instructionId, state, stateDate, comment);
    }

    await instructions.updateStates();
}

export function getSqlSelectInstructionsLastState() {
    return sqlBuilder.getSelect({
        _select: [ 'DISTINCT ON ("instructionRsjId") "instructionRsjId"' , '"statusDate"', '"status"', '"id" AS "traceabilityId"' ],
        _from: [ '"traceability"' ],
        _orderBy: [ '"instructionRsjId"', '"statusDate" DESC', '"id" DESC' ],
        _subquery: true
    });
}

// export function getSqlSelectInstructionsLastState() {
//     return sqlBuilder.getSelect({
//         _select: [ '"instructionRsjId"', 'MAX("id") AS "traceabilityId"' ],
//         _from: [ '"traceability"' ],
//         _where: [ '"instructionRsjId" IS NOT null' ],
//         _groupBy: [ '"instructionRsjId"' ],
//         _subquery: true
//     });
// }

export async function getLastState(_instructionId) {
    const sql = sqlBuilder.getSelect({
        _select: [ '"status"' ],
        _from: [ '"traceability"' ],
        _where: [ `"instructionRsjId" = ${_instructionId}` ],
        _orderBy: [ '"statusDate" DESC' ],
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

const states = { getSqlSelectInstructionsLastState, insert };

export default states;
