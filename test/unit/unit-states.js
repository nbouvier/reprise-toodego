import dotenv from 'dotenv';
dotenv.config({ path: '.env.test' });

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import states, { getLastState } from '../../src/states.js';

describe('states.js', function() {

    describe('#getSqlSelectInstructionsLastState()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = '(SELECT DISTINCT ON ("instructionRsjId") "instructionRsjId", "statusDate", "status", "id" AS "traceabilityId" FROM "traceability" WHERE "instructionRsjId" IS NOT null ORDER BY "instructionRsjId", "statusDate" DESC, "id" DESC)';
            expect(states.getSqlSelectInstructionsLastState()).to.equal(sql);
        });
    });

    describe('#getLastState()', function() {
        it('should return last traceability.status', async function() {
            expect(await getLastState(1)).to.equal('Acceptée');
            expect(await getLastState(2)).to.equal('Analyse en cours');
        });
        it('should return undefined if no traceability exists', async function() {
            expect(await getLastState(3)).to.be.undefined;
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
