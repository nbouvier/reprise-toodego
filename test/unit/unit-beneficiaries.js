import config from '../../config.js';
config.test();

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import beneficiaries, { insertBeneficiaryRsj } from '../../src/beneficiaries.js';

describe('beneficiaries.js', function() {

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
        beforeEach(async function() {
            await beneficiaries.updateResidentialStatus(1, 'Tenant');
        });

        it('should update beneficiary_address.residentialStatus', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ '"residentialStatus"' ],
                _from: [ '"beneficiary_address" ba', '"beneficiary" b' ],
                _where: [ 'ba."id" = b."residentialAddressId"', 'b."id" = 1' ]
            });
            const res = await db.query(sql);

            expect(res.rows[0].residentialStatus).to.equal('Tenant');
        });

        afterEach(async function() {
            await beneficiaries.updateResidentialStatus(1, null);
        });
    });

    describe('#updateRibId()', function() {
        beforeEach(async function() {
            await beneficiaries.updateRibId(2, 1);
        });

        it('should update beneficiary_rsj.paymentDataId', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ '"paymentDataId"' ],
                _from: [ '"beneficiary_rsj"' ],
                _where: [ '"beneficiaryId" = 2' ]
            });
            const res = await db.query(sql);

            expect(res.rows[0].paymentDataId).to.equal(1);
        });

        afterEach(async function() {
            await beneficiaries.updateRibId(2, null);
        });
    });

    describe('#updateNextPaymentId()', function() {
        beforeEach(async function() {
            await beneficiaries.updateNextPaymentId(1, 1);
        });

        it('should update beneficiary_rsj.nextPaymentId', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ '"nextPaymentId"' ],
                _from: [ '"beneficiary_rsj"' ],
                _where: [ '"beneficiaryId" = 1' ]
            });
            const res = await db.query(sql);

            expect(res.rows[0].nextPaymentId).to.equal(1);
        });

        afterEach(async function() {
            await beneficiaries.updateNextPaymentId(1, null);
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
