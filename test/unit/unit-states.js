import config from '../../config.js';
config.test();

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import states from '../../src/states.js';

describe('states.js', function() {

    // TODO: Test import functions

    describe('#getSqlSelectLastStates()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = '(SELECT DISTINCT ON ("instructionRsjId") "instructionRsjId", "statusDate", "status" FROM "traceability" ORDER BY "instructionRsjId", "statusDate" DESC)'
            expect(states.getSqlSelectLastStates()).to.equal(sql);
        });
    });

    describe('#insert()', function() {
        let row;
        let stateId;

        beforeEach(async function() {
            stateId = await states.insert(4, 'Terminée', '2022-07-07', 'Commentaire');

            const sql = sqlBuilder.getSelect({
                _select: [ '"statusDate"', '"status"', '"comment"', '"instructionRsjId"' ],
                _from: [ '"traceability"' ],
                _where: [ '"instructionRsjId" = 4']
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should create a new traceability', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ 'COUNT(*)::integer AS "count"' ],
                _from: [ '"traceability"' ],
                _where: [ '"instructionRsjId" = 4' ]
            });
            const res = await db.query(sql);

            expect(res.rows[0].count).to.equal(1);
        });
        it('should set traceability properties', async function() {
            let statusDate = (new Date(row.statusDate)).toLocaleDateString();
            expect(statusDate).to.equal('07/07/2022');
            expect(row.status).to.equal('Terminée');
            expect(row.comment).to.equal('Commentaire');
            expect(row.instructionRsjId).to.equal(4);
        });

        afterEach(async function() {
            const sql = sqlBuilder.getDelete({
                _from: [ '"traceability"' ],
                _where: [ `"id" = ${stateId}` ]
            });
            await db.query(sql);
        });
    });

});
