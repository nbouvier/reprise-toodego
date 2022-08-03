import config from '../../config.js';
config.test();

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import beneficiaries from '../../src/beneficiaries.js';
import payments, { getSqlSelectInstructionPayments, getSqlSelectInstructionExpectedPayments, getSqlSelectStateId, getSqlSelectRemainingPayment, updateRemainingPayments, extractPaymentData, insert, insertNextPayment } from '../../src/payments.js';

describe('payments.js', function() {

    // TODO: Test import functions

    describe('#getSqlSelectInstructionPayments()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT "instructionRsjId", COUNT(*) AS "numberOfPayments" FROM "rsj_payment" GROUP BY "instructionRsjId")`;
            expect(await getSqlSelectInstructionPayments()).to.equal(sql);
        });
    });

    describe('#getSqlSelectInstructionExpectedPayments()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT "id" AS "instructionRsjId", CASE WHEN "paymentCounterProposal" = false THEN SUBSTRING("paymentDuration" FROM 1 FOR 1)::INTEGER WHEN "paymentCounterProposal" = true THEN SUBSTRING("paymentCounterDuration" FROM 1 FOR 1)::INTEGER END AS "expectedNumberOfPayments" FROM "instruction_rsj")`;
            expect(await getSqlSelectInstructionExpectedPayments()).to.equal(sql);
        });
    });

    describe('#getSqlSelectStateId()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT "id" FROM "rsj_payment_state" WHERE "label" = 'Prévu')`;
            expect(await getSqlSelectStateId('Prévu')).to.equal(sql);
        });
    });

    describe('#getSqlSelectRemainingPayment()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT "beneficiaryRsjId", COUNT(*) AS "count" FROM "rsj_payment" GROUP BY "beneficiaryRsjId")`;
            expect(await getSqlSelectRemainingPayment('Prévu')).to.equal(sql);
        });
    });

    describe('#updateRemainingPayments()', function() {
        let rows;
        let beneficiaryIds;
        let nextPaymentIds;

        before(async function() {
            beneficiaryIds = [ 1, 2, 4 ];
            nextPaymentIds = [];
            for(let i=0; i<beneficiaryIds.length; i++) {
                nextPaymentIds.push(await insertNextPayment());
                await beneficiaries.updateNextPaymentId(beneficiaryIds[i], nextPaymentIds[i]);
            }

            await updateRemainingPayments();

            const sql = sqlBuilder.getSelect({
                _select: [ 'brsj."id" AS "beneficiaryRsjId"', 'np."remainingPayment"' ],
                _from: [ '"rsj_next_payment" np', '"beneficiary_rsj" brsj' ],
                _where: [ 'np."id" = brsj."nextPaymentId"', `brsj."beneficiaryId" IN (${beneficiaryIds.join(', ')})` ]
            });
            const res = await db.query(sql);
            rows = res.rows;
        });

        it('should update rsj_next_payment.remainingPayment', async function() {
            let remainingPayments = { 1: 22, 2: 24, 3: 23 };
            for(let i=0; i<beneficiaryIds.length; i++) {
                expect(rows[i].remainingPayment).to.equal(remainingPayments[rows[i].beneficiaryRsjId]);
            }
        });

        after(async function() {
            for(let i=0; i<beneficiaryIds.length; i++) {
                await beneficiaries.updateNextPaymentId(beneficiaryIds[i], null);
            }

            const sql = sqlBuilder.getDelete({
                _from: [ '"rsj_next_payment"' ],
                _where: [ `"id" IN (${nextPaymentIds.join(', ')})` ]
            });
            await db.query(sql);
        });
    });

    describe('#extractPaymentData()', function() {
        it('should return extracted data', async function() {
            const data = {
                fields: { montant_verse: 400 },
                receipt_time: '2022-07-17T00:00:00.000Z',
                last_update_time: '2022-07-18T00:00:00.000Z'
            }
            expect(extractPaymentData(data)).to.deep.equal({ amount: 400, month: '2022-07-17', createdAt: '2022-07-18' });
        });
    });

    describe('#insert()', function() {
        let row;
        let paymentId;

        beforeEach(async function() {
            paymentId = await insert(2, 1, 1, 400, '2022-07-17', '2022-07-18');

            const sql = sqlBuilder.getSelect({
                _select: [ '"stateDate"', '"stateId"', '"amount"', '"paymentMonth"', '"beneficiaryRsjId"' ],
                _from: [ '"rsj_payment"' ],
                _where: [ '"beneficiaryRsjId" = 2' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should create a new rsj_payment', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ 'COUNT(*)::integer AS "count"' ],
                _from: [ '"rsj_payment"' ],
                _where: [ '"beneficiaryRsjId" = 2' ]
            });
            const res = await db.query(sql);

            expect(res.rows[0].count).to.equal(1);
        });
        it('should set rsj_payment properties', async function() {
            let stateDate = (new Date(row.stateDate)).toLocaleDateString();
            expect(stateDate).to.equal('18/07/2022');
            expect(row.stateId).to.equal(2);
            expect(row.amount).to.equal('400');
            let paymentMonth = (new Date(row.paymentMonth)).toLocaleDateString();
            expect(paymentMonth).to.equal('17/07/2022');
            expect(row.beneficiaryRsjId).to.equal(2);
        });

        afterEach(async function() {
            const sql = sqlBuilder.getDelete({
                _from: [ '"rsj_payment"' ],
                _where: [ `"id" = ${paymentId}` ]
            });
            await db.query(sql);
        });
    });

    describe('#insertNextPayment()', function() {
        let row;
        let nextPaymentId;

        beforeEach(async function() {
            nextPaymentId = await insertNextPayment();

            const sql = sqlBuilder.getSelect({
                _select: [ '"remainingPayment"' ],
                _from: [ '"rsj_next_payment"' ],
                _where: [ `"id" = ${nextPaymentId}` ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should create a new rsj_next_payment', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ 'COUNT(*)::integer AS "count"' ],
                _from: [ '"rsj_next_payment"' ]
            });
            const res = await db.query(sql);

            expect(res.rows[0].count).to.equal(2);
        });
        it('should set rsj_next_payment properties', async function() {
            expect(row.remainingPayment).to.equal(24);
        });

        afterEach(async function() {
            const sql = sqlBuilder.getDelete({
                _from: [ '"rsj_next_payment"' ],
                _where: [ `"id" = ${nextPaymentId}` ]
            });
            await db.query(sql);
        });
    });

});
