import config from '../../config.js';
config.test();

import chai from 'chai';
import equalInAnyOrder from 'deep-equal-in-any-order';
chai.use(equalInAnyOrder);
const { expect } = chai;

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import instructions from '../../src/instructions.js';

describe('instructions.js', function() {

    // TODO: Test import functions

    describe('#getAllIds()', function() {
        it('should return all the instruction_rsj.id', async function() {
            expect(await instructions.getAllIds(1)).to.deep.equalInAnyOrder([ 1, 2 ]);
            expect(await instructions.getAllIds(2)).to.deep.equal([ 3 ]);
        });
        it('should return an empty array if beneficiary has no instruction', async function() {
            expect(await instructions.getAllIds(3)).to.be.empty;
        });
        it('should return an empty array if beneficiary does not exist', async function() {
            expect(await instructions.getAllIds(10)).to.be.empty;
        });
    });

    describe('#getClosestInstructionId()', function() {
        it('should return the closest instruction_rsj.id', async function() {
            expect(await instructions.getClosestInstructionId(1, '2022-01-27')).to.equal(1);
            expect(await instructions.getClosestInstructionId(1, '2022-02-01')).to.equal(2);
            expect(await instructions.getClosestInstructionId(2, '2022-02-23')).to.equal(3);
        });
        it('should return undefined if no instruction_rsj matches', async function() {
            expect(await instructions.getClosestInstructionId(1, '2021-12-30')).to.be.undefined;
        });
    });

    describe('#updateAfterNationalityDocuments()', function() {
        let row;

        before(async function() {
            await instructions.updateAfterNationalityDocuments(
                [ 1, 2 ],
                'ValidIdentityFr',
                { credentialDocument1Id: 1, credentialDocument2Id: 2 },
                { credentialDocumentDate1: '2010-01-01' }
            );

            const sql = sqlBuilder.getSelect({
                _select: [ '"credentialType"', '"credentialDocument1Id"', '"credentialDocument2Id"', '"credentialDocumentDate1"' ],
                _from: [ '"instruction_rsj"' ],
                _where: [ '"id" IN (1, 2)' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should update instruction_rsj.credentialType', async function() {
            for(let i=0; i<2; i++) {
                expect(row?.credentialType).to.equal('ValidIdentityFr');
            }
        });
        it('should update instruction_rsj.credentialDocumentIds', async function() {
            for(let i=0; i<2; i++) {
                expect(row?.credentialDocument1Id).to.equal(1);
                expect(row?.credentialDocument2Id).to.equal(2);
            }
        });
        it('should update instruction_rsj.credentialDocumentDates', async function() {
            for(let i=0; i<2; i++) {
                let date = (new Date(row?.credentialDocumentDate1)).toLocaleDateString();
                expect(date).to.equal('01/01/2010');
            }
        });

        after(async function() {
            const sql = sqlBuilder.getUpdate({
                _update: '"instruction_rsj"',
                _set: [ '"credentialType" = null', '"credentialDocument1Id" = null', '"credentialDocument2Id" = null', '"credentialDocumentDate1" = null' ],
                _where: [ '"id" IN (1, 2)' ]
            });
            await db.query(sql);
        });
    });

    describe('#updateAfterDwellingDocuments()', function() {
        beforeEach(async function() {
            await instructions.updateAfterDwellingDocuments([ 1, 2 ], { addressDocument1Id: 1 });
        });

        it('should update instruction_rsj.addressDocumentIds', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ '"addressDocument1Id"' ],
                _from: [ '"instruction_rsj"' ],
                _where: [ '"id" IN (1, 2)' ]
            });
            const res = await db.query(sql);

            for(let i=0; i<2; i++) {
                expect(res.rows[i]?.addressDocument1Id).to.equal(1);
            }
        });

        afterEach(async function() {
            const sql = sqlBuilder.getUpdate({
                _update: '"instruction_rsj"',
                _set: [ '"addressDocument1Id" = null' ],
                _where: [ '"id" IN (1, 2)' ]
            });
            await db.query(sql);
        });
    });

    describe('#updatePaymentDecision()', function() {
        let row;

        before(async function() {
            await instructions.updatePaymentDecision(1, 400, 3, 'test');

            const sql = sqlBuilder.getSelect({
                _select: [ '"paymentAmount"', '"paymentDuration"::integer', '"paymentOpinion"' ],
                _from: [ '"instruction_rsj"' ],
                _where: [ '"id" = 1' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should update instruction_rsj.paymentAmount', async function() {
            expect(row?.paymentAmount).to.equal(400);
        });
        it('should update instruction_rsj.paymentDuration', async function() {
            expect(row?.paymentDuration).to.equal(3);
        });
        it('should update instruction_rsj.paymentOpinion', async function() {
            expect(row?.paymentOpinion).to.equal('test');
        });

        after(async function() {
            await instructions.updatePaymentDecision(1, null, null, null);
        });
    });

});
