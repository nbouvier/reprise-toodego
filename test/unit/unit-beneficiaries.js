import dotenv from 'dotenv';
dotenv.config({ path: '.env.test' });

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import beneficiaries, { getSqlSelectLastInstructionsId, insertBeneficiaryRsj } from '../../src/beneficiaries.js';

describe('beneficiaries.js', function() {

    describe('#getSqlSelectLastInstructionsId()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT DISTINCT ON ("beneficiaryId") "beneficiaryId", "id" AS "instructionRsjId" FROM "instruction_rsj" ORDER BY "beneficiaryId", "instructionDate" DESC, "id" DESC)`;
            expect(await getSqlSelectLastInstructionsId()).to.equal(sql);
        });
    });

    describe('#getSqlSelectLastAcceptedInstructionsId()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT t."instructionRsjId" FROM "traceability" t JOIN (SELECT DISTINCT ON ("beneficiaryId") "beneficiaryId", "id" AS "instructionRsjId" FROM "instruction_rsj" ORDER BY "beneficiaryId", "instructionDate" DESC, "id" DESC) a ON a."instructionRsjId" = t."instructionRsjId" WHERE t."status" = 'Acceptée')`;
            expect(await beneficiaries.getSqlSelectLastAcceptedInstructionsId()).to.equal(sql);
        });
    });

    describe('#getId()', function() {
        it('should return beneficiary.id', async function() {
            expect(await beneficiaries.getId('21N000001')).to.equal(1);
        });
        it('should return undefined if beneficiary does not exist', async function() {
            expect(await beneficiaries.getId('21N000000')).to.be.undefined;
        });
    });

    describe('#getRsjId()', function() {
        it('should return beneficiary_rsj.id', async function() {
            expect(await beneficiaries.getRsjId('21N000001')).to.equal(1);
        });
        it('should return undefined if beneficiary_rsj does not exist', async function() {
            expect(await beneficiaries.getRsjId('21N000100')).to.be.undefined;
        });
        it('should return undefined if beneficiary does not exist', async function() {
            expect(await beneficiaries.getRsjId('21N000000')).to.be.undefined;
        });
    });

    describe('#getRibId()', function() {
        it('should return beneficiary_rsj.paymentDataId', async function() {
            expect(await beneficiaries.getRibId(1)).to.equal(1);
        });
        it('should return null if beneficiary_rsj.paymentDataId is null', async function() {
            expect(await beneficiaries.getRibId(2)).to.be.null;
        });
        it('should return undefined if beneficiary_rsj does not exist', async function() {
            expect(await beneficiaries.getRibId(0)).to.be.undefined;
        });
    });

    describe('#updateResidentialStatus()', function() {
        let row;

        beforeEach(async function() {
            await beneficiaries.updateResidentialStatus(1, 'Tenant');

            const sql = sqlBuilder.getSelect({
                _select: [ '"residentialStatus"' ],
                _from: [ '"beneficiary_address" ba', '"beneficiary" b' ],
                _where: [ 'ba."id" = b."residentialAddressId"', 'b."id" = 1' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should update beneficiary_address.residentialStatus', async function() {
            expect(row.residentialStatus).to.equal('Tenant');
        });

        afterEach(async function() {
            await beneficiaries.updateResidentialStatus(1, null);
        });
    });

    describe('#updateRibId()', function() {
        let row;

        beforeEach(async function() {
            await beneficiaries.updateRibId(2, 1);

            const sql = sqlBuilder.getSelect({
                _select: [ '"paymentDataId"' ],
                _from: [ '"beneficiary_rsj"' ],
                _where: [ '"beneficiaryId" = 2' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should update beneficiary_rsj.paymentDataId', async function() {
            expect(row.paymentDataId).to.equal(1);
        });

        afterEach(async function() {
            await beneficiaries.updateRibId(2, null);
        });
    });

    describe('#updateRemainingPayments()', function() {
        let rows;
        let beneficiaryIds;
        let nextPaymentIds;

        before(async function() {
            beneficiaryIds = [ 1, 2, 4 ];

            await beneficiaries.updateRemainingPayments();

            const sql = sqlBuilder.getSelect({
                _select: [ '"id" AS "beneficiaryRsjId"', '"remainingPayment"' ],
                _from: [ '"beneficiary_rsj"' ],
                _where: [ `"beneficiaryId" IN (${beneficiaryIds.join(', ')})` ]
            });
            const res = await db.query(sql);
            rows = res.rows;
        });

        it('should update beneficiary_rsj.remainingPayment', async function() {
            let data = { 1: 22, 2: 24, 3: 23 };
            for(let i=0; i<beneficiaryIds.length; i++) {
                expect(rows[i].remainingPayment).to.equal(data[rows[i].beneficiaryRsjId]);
            }
        });

        after(async function() {
            const sql = sqlBuilder.getUpdate({
                _update: [ '"beneficiary_rsj"' ],
                _set: [ '"remainingPayment" = 24' ],
                _where: [ `"id" IN (${beneficiaryIds.join(', ')})` ]
            });
            await db.query(sql);
        });
    });

    describe('#updateState()', function() {
        let row;

        beforeEach(async function() {
            await beneficiaries.updateState(1, 'Refusé');

            const sql = sqlBuilder.getSelect({
                _select: [ 'rs."label"' ],
                _from: [ '"beneficiary_rsj" b_rsj', '"rsj_state" rs' ],
                _where: [ 'b_rsj."stateId" = rs."id"', 'b_rsj."beneficiaryId" = 1' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should update beneficiary_rsj.stateId', async function() {
            expect(row.label).to.equal('Refusé');
        });

        afterEach(async function() {
            await beneficiaries.updateState(1, 'Non orienté');
        });
    });

    describe('#openAllowance()', function() {
        let row;

        beforeEach(async function() {
            await beneficiaries.openAllowance(1, '2022-01-01');

            const sql = sqlBuilder.getSelect({
                _select: [ '"stateId"', '"rsjBeginDate"' ],
                _from: [ '"beneficiary_rsj"' ],
                _where: [ '"beneficiaryId" = 1' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should update beneficiary_rsj properties', async function() {
            expect(row.stateId).to.equal(2);
            const rsjBeginDate = new Date(row.rsjBeginDate).toLocaleDateString();
            expect(rsjBeginDate).to.equal('01/01/2022');
        });

        afterEach(async function() {
            const sql = sqlBuilder.getUpdate({
                _update: [ '"beneficiary_rsj"' ],
                _set: [ `"stateId" = 7`, `"rsjBeginDate" = null` ],
                _where: [ `"beneficiaryId" = 1` ]
            });
            await db.query(sql);
        });
    });

    describe('#closeAllowancesForAge()', function() {
        let rows;

        beforeEach(async function() {
            await beneficiaries.closeAllowancesForAge();

            const sql = sqlBuilder.getSelect({
                _select: [ '"beneficiaryId"', '"stateId"', '"rsjEndDate"' ],
                _from: [ '"beneficiary_rsj"' ],
                _where: [ '"beneficiaryId" IN (1, 2)' ]
            });
            const res = await db.query(sql);
            rows = res.rows;
        });

        it('should update beneficiary_rsj properties', async function() {
            const data = {
                1: { stateId: 5, rsjEndDate: '01/01/2015' },
                2: { stateId: 7, rsjEndDate: null }
            }

            for (let i=0; i<rows.length; i++) {
                expect(rows[i].stateId).to.equal(data[rows[i].beneficiaryId].stateId);
                const rsjEndDate = rows[i].rsjEndDate ? new Date(rows[i].rsjEndDate).toLocaleDateString() : null;
                expect(rsjEndDate).to.equal(data[rows[i].beneficiaryId].rsjEndDate);
            }
        });

        afterEach(async function() {
            const sql = sqlBuilder.getUpdate({
                _update: [ '"beneficiary_rsj"' ],
                _set: [ '"stateId" = 7', '"rsjEndDate" = null' ],
                _where: [ '"beneficiaryId" = 1' ]
            });
            const res = await db.query(sql);
        });
    });

    describe('#insertBeneficiaryRsj()', function() {
        let beneficiaryId;

        beforeEach(async function() {
            beneficiaryId = await insertBeneficiaryRsj(3);
        });

        it('should create a new beneficiary_rsj', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ 'COUNT(*)::integer AS "count"' ],
                _from: [ '"beneficiary_rsj"' ],
                _where: [ '"beneficiaryId" = 3' ]
            });
            const res = await db.query(sql);

            expect(res.rows[0].count).to.equal(1);
        });
        it('should return beneficiary_rsj.id', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ '"id"' ],
                _from: [ '"beneficiary_rsj"' ],
                _where: [ '"beneficiaryId" = 3' ]
            });
            const res = await db.query(sql);

            expect(beneficiaryId).to.equal(res.rows[0].id);
        });

        afterEach(async function() {
            const sql = sqlBuilder.getDelete({
                _from: [ '"beneficiary_rsj"' ],
                _where: [ '"beneficiaryId" = 3' ]
            });
            await db.query(sql);
        });
    });

});
