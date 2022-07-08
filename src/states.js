import db from './database/database.js';

import logger from './utils/logger.js';
import sqlBuilder from './utils/sqlBuilder.js';

import instructions from './instructions.js';
import documents from './documents.js';
import { WORKFLOW_STATUS } from './mappings.js';

// Eventually update payment decision
// Eventually import document
// Import state
async function importStates(_beneficiaryId, _data) {
    logger.log('Importing states ...');
    for (let i=0; i<_data.evolution.length; i++) {
        const stateData = _data.evolution[i];
        const state = WORKFLOW_STATUS[stateData.status];
        logger.log(`Importing state '${state}' ...`);

        const date = stateData.time.substr(0, 10);
        const instructionId = instructions.getClosestInstructionId(_beneficiaryId, date);
        if (!instructionId) {
            logger.error(`Instruction not found for beneficiary #${beneficiaryId} at date ${date}.`);
            continue;
        }

        let comment = '';
        for (let j=0; j<stateData.parts.length; j++) {
            const part = stateData.parts[i];

            switch (part.type) {
                case 'workflow-comment':
                    comment = [ comment, part.content ].join(' ');

                    if ([ 'new', 'accepted' ].contains(state)) {
                        logger.log('Importing payment decision ...');
                        const amount = part.content.split(/ Euros| €/)[0].split(' ').pop();
                        const months = part.content.split(/ mois/)[0].split(' ').pop();

                        if (part.content.indexOf('contre-proposition') == -1) {
                          await instructions.updatePaymentDecision(instructionId, amount, months, part.content);
                        } else {
                          await instructions.updatePaymentCounterDecision(instructionId, amount, months, part.content);
                        }
                    }

                    break;

                case 'workflow-attachment':
                    await documents.importOtherDocument(instructionId, { identifiant_insertis: insertisId, date, ...part }, comment);
                    break;

                default: logger.log(`Error - Unhandled part type ${part.type}`);
            }
        }

        await insert(instructionId, state, date, comment);
    }

    await instructions.updateStates();
}

export function getSqlSelectLastStates() {
    return sqlBuilder.getSelect({
        _select: [ 'DISTINCT ON ("instructionRsjId") "instructionRsjId"' , '"statusDate"', '"status"' ],
        _from: [ '"traceability"' ],
        _orderBy: [ '"instructionRsjId"', '"statusDate" DESC' ],
        _subquery: true
    });
}

async function insert(_instructionId, _state, _date, _comment) {
    const sql = sqlBuilder.getInsert({
        _insert: [ '"statusDate"', '"status"', '"comment"', '"instructionRsjId"' ],
        _into: "traceability",
        _values: [ [ sqlBuilder.parseString(_state), `'${_date}'`, sqlBuilder.parseString(_comment), _instructionId ] ]
    });

    await db.query(sql);
}

const states = { getSqlSelectLastStates, insert };

export default states;
