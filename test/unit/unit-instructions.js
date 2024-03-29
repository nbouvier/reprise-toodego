import dotenv from 'dotenv';
dotenv.config({ path: '.env.test' });

import chai from 'chai';
import equalInAnyOrder from 'deep-equal-in-any-order';
chai.use(equalInAnyOrder);
const { expect } = chai;

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import instructions, { updateComment } from '../../src/instructions.js';

describe('instructions.js', function() {

    describe('#getSqlSelectInstructionPayments()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT rp."instructionRsjId", COUNT(*) AS "numberOfPayments" FROM "rsj_payment" rp JOIN (SELECT DISTINCT ON (t."instructionRsjId") t."instructionRsjId", t."statusDate" FROM "traceability" t JOIN (SELECT DISTINCT ON ("beneficiaryId") "beneficiaryId", "id" AS "instructionRsjId" FROM "instruction_rsj" WHERE "status" <> 'En création' ORDER BY "beneficiaryId", "instructionDate" DESC, "id" DESC) a ON a."instructionRsjId" = t."instructionRsjId" WHERE t."status" = 'Acceptée' ORDER BY t."instructionRsjId", t."statusDate" DESC) t ON t."instructionRsjId" = rp."instructionRsjId" WHERE rp."paymentMonth" > t."statusDate" GROUP BY rp."instructionRsjId")`;
            expect(await instructions.getSqlSelectInstructionPayments()).to.equal(sql);
        });
    });

    describe('#getSqlSelectInstructionExpectedPayments()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT "id" AS "instructionRsjId", CASE WHEN "paymentCounterProposal" = false THEN "paymentDuration" WHEN "paymentCounterProposal" = true THEN "paymentCounterDuration" END AS "expectedNumberOfPayments" FROM "instruction_rsj" WHERE "paymentCounterProposal" IS NOT null)`;
            expect(await instructions.getSqlSelectInstructionExpectedPayments()).to.equal(sql);
        });
    });

    describe('#getSqlSelectSuspendedInstructionsId()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT t."instructionRsjId" FROM "traceability" t JOIN (SELECT DISTINCT ON ("instructionRsjId") "instructionRsjId", "statusDate", "status", "id" AS "traceabilityId" FROM "traceability" WHERE "instructionRsjId" IS NOT null ORDER BY "instructionRsjId", "statusDate" DESC, "id" DESC) a ON a."traceabilityId" = t."id" WHERE t."status" = 'Suspendue')`;
            expect(await instructions.getSqlSelectSuspendedInstructionsId()).to.equal(sql);
        });
    });

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
        it('should return the closest instruction_rsj.id in revert order', async function() {
            expect(await instructions.getClosestInstructionId(1, '2021-12-28', true)).to.equal(1);
            expect(await instructions.getClosestInstructionId(1, '2022-01-01', true)).to.equal(2);
            expect(await instructions.getClosestInstructionId(2, '2021-12-12', true)).to.equal(3);
        });
        it('should return undefined if no instruction_rsj matches', async function() {
            expect(await instructions.getClosestInstructionId(1, '2021-12-30')).to.be.undefined;
            expect(await instructions.getClosestInstructionId(1, '2022-02-01', true)).to.be.undefined;
        });
    });

    describe('#getPreviousInstructionId()', function() {
        it('should return the previous instruction_rsj.id', async function() {
            expect(await instructions.getPreviousInstructionId(1, 2)).to.equal(1);
        });
        it('should return undefined if no instruction_rsj matches', async function() {
            expect(await instructions.getPreviousInstructionId(2, 3)).to.be.undefined;
        });
    });

    describe('#updateAfterNationalityDocuments()', function() {
        let rows;

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
            rows = res.rows;
        });

        it('should update instruction_rsj properties', async function() {
            for(let i=0; i<2; i++) {
                expect(rows[i].credentialType).to.equal('ValidIdentityFr');
            }
            for(let i=0; i<2; i++) {
                expect(rows[i].credentialDocument1Id).to.equal(1);
                expect(rows[i].credentialDocument2Id).to.equal(2);
            }
            for(let i=0; i<2; i++) {
                let date = (new Date(rows[i].credentialDocumentDate1)).toLocaleDateString();
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
        let rows;

        before(async function() {
            await instructions.updateAfterDwellingDocuments([ 1, 2 ], { addressDocument1Id: 1 });

            const sql = sqlBuilder.getSelect({
                _select: [ '"addressDocument1Id"' ],
                _from: [ '"instruction_rsj"' ],
                _where: [ '"id" IN (1, 2)' ]
            });
            const res = await db.query(sql);
            rows = res.rows;
        });

        it('should update instruction_rsj properties', async function() {
            for(let i=0; i<2; i++) {
                expect(rows[i].addressDocument1Id).to.equal(1);
            }
        });

        after(async function() {
            await instructions.updateAfterDwellingDocuments([ 1, 2 ], { addressDocument1Id: null });
            // const sql = sqlBuilder.getUpdate({
            //     _update: '"instruction_rsj"',
            //     _set: [ '"addressDocument1Id" = null' ],
            //     _where: [ '"id" IN (1, 2)' ]
            // });
            // await db.query(sql);
        });
    });

    describe('#updateAfterTutorshipDocuments()', function() {
        let rows;

        before(async function() {
            await instructions.updateAfterTutorshipDocuments([ 1, 2 ], true, { supervisionDocument1Id: 1, supervisionDocument2Id: 2 });

            const sql = sqlBuilder.getSelect({
                _select: [ '"underSupervision"', '"supervisionDocument1Id"', '"supervisionDocument2Id"' ],
                _from: [ '"instruction_rsj"' ],
                _where: [ '"id" IN (1, 2)' ]
            });
            const res = await db.query(sql);
            rows = res.rows;
        });

        it('should update instruction_rsj properties', async function() {
            for(let i=0; i<2; i++) {
                expect(rows[i].underSupervision).to.be.true;
                expect(rows[i].supervisionDocument1Id).to.equal(1);
                expect(rows[i].supervisionDocument2Id).to.equal(2);
            }
        });

        after(async function() {
            await instructions.updateAfterTutorshipDocuments([ 1, 2 ], null, { supervisionDocument1Id: null, supervisionDocument2Id: null });
        });
    });

    describe('#updatePaymentDecision()', function() {
        let row;

        before(async function() {
            await instructions.updatePaymentDecision(1, 400, 3, 'test');

            const sql = sqlBuilder.getSelect({
                _select: [ '"paymentAmount"', '"paymentDuration"', '"paymentOpinion"', '"paymentCounterProposal"' ],
                _from: [ '"instruction_rsj"' ],
                _where: [ '"id" = 1' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should update instruction_rsj properties', async function() {
            expect(row.paymentCounterProposal).to.be.false;
            expect(row.paymentAmount).to.equal(400);
            expect(row.paymentDuration).to.equal(3);
            expect(row.paymentOpinion).to.equal('test');
        });

        after(async function() {
            await instructions.updatePaymentDecision(1, null, null, null);
        });
    });

    describe('#updatePaymentCounterDecision()', function() {
        let row;

        before(async function() {
            await instructions.updatePaymentCounterDecision(1, 400, 3, 'test');

            const sql = sqlBuilder.getSelect({
                _select: [ '"paymentCounterProposal"', '"paymentCounterAmount"', '"paymentCounterDuration"', '"paymentCounterComment"' ],
                _from: [ '"instruction_rsj"' ],
                _where: [ '"id" = 1' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should update instruction_rsj properties', async function() {
            expect(row.paymentCounterProposal).to.be.true;
            expect(row.paymentCounterAmount).to.equal(400);
            expect(row.paymentCounterDuration).to.equal(3);
            expect(row.paymentCounterComment).to.equal('test');
        });

        after(async function() {
            await instructions.updatePaymentCounterDecision(1, null, null, null);
        });
    });

    describe('#updateStates()', function() {
        let rows;

        before(async function() {
            await instructions.updateStates();

            const sql = sqlBuilder.getSelect({
                _select: [ '"status"', '"statusDate"' ],
                _from: [ '"instruction_rsj"' ],
                _where: [ '"id" IN (1, 2, 3)' ],
                _orderBy: [ '"id"' ]
            });
            const res = await db.query(sql);
            rows = res.rows;
        });

        it('should update instruction_rsj properties', async function() {
            expect(rows[0].status).to.equal('Acceptée');
            let date = (new Date(rows[0].statusDate)).toLocaleDateString();
            expect(date).to.equal('08/07/2022');

            expect(rows[1].status).to.equal('Analyse en cours');
            date = (new Date(rows[1].statusDate)).toLocaleDateString();
            expect(date).to.equal('06/07/2022');
        });
        it('should not update wrong instruction_rsj properties', async function() {
            expect(rows[2].status).to.equal('En création');
            let date = (new Date(rows[2].statusDate)).toLocaleDateString();
            expect(date).to.equal('01/01/2022');
        });

        after(async function() {
            let sql = [];

            sql.push(sqlBuilder.getUpdate({
                _update: '"instruction_rsj"',
                _set: [ `"status" = 'En création'`, `"statusDate" = '2022-01-01'` ],
                _where: [ '"id" = 1' ]
            }));

            sql.push(sqlBuilder.getUpdate({
                _update: '"instruction_rsj"',
                _set: [ `"status" = 'En création'`, `"statusDate" = '2022-02-02'` ],
                _where: [ '"id" = 2' ]
            }));

            await db.query(sql.join(''));
        });
    });

    describe('#updateComment()', function() {
        let rows;

        before(async function() {
            const data = { id: 1, workflow: { fields: { nombre_de_mois_retenu: 3, montant_retenu: 400 } } };
            await updateComment(1, data);

            const sql = sqlBuilder.getSelect({
                _select: [ '"id"', '"useTitleComment"' ],
                _from: [ '"instruction_rsj"' ],
                _where: [ '"id" IN (1, 2)' ]
            });
            const res = await db.query(sql);
            rows = res.rows;
        });

        it('should update latest instruction_rsj.comment', async function() {
            expect(rows.filter(r => r.id == 2)[0].useTitleComment).to.equal('Paiements prévus sur Toodego : 3 mois, 400€.');
        });
        it('should not update other instruction_rsj.comment', async function() {
            expect(rows.filter(r => r.id == 1)[0].useTitleComment).to.be.null;
        });

        after(async function() {
            const sql = sqlBuilder.getUpdate({
                _update: '"instruction_rsj"',
                _set: [ `"useTitleComment" = null` ],
                _where: [ `"id" = 2` ]
            });
            await db.query(sql);
        });
    });

    describe('#insertOtherDocument()', function() {
        let row;

        before(async function() {
            await instructions.insertOtherDocument(1, 1, 'no comment');

            const sql = sqlBuilder.getSelect({
                _select: [ '"documentId"', '"comment"' ],
                _from: [ '"instruction_rsj_other_document"' ],
                _where: [ '"instructionRsjId" = 1' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should create a new instruction_rsj_other_document', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ 'COUNT(*)::integer AS "count"' ],
                _from: [ '"instruction_rsj_other_document"' ],
                _where: [ '"instructionRsjId" = 1' ]
            });
            const res = await db.query(sql);

            expect(res.rows[0].count).to.equal(1);
        });
        it('should set instruction_rsj_other_document properties', async function() {
            expect(row.documentId).to.equal(1);
            expect(row.comment).to.equal('no comment');
        });

        after(async function() {
            const sql = sqlBuilder.getDelete({
                _from: [ '"instruction_rsj_other_document"' ],
                _where: [ '"instructionRsjId" = 1' ]
            });
            await db.query(sql);
        });
    });

});
