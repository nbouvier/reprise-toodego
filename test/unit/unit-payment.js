import dotenv from 'dotenv';
dotenv.config({ path: '.env.test' });

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import beneficiaries from '../../src/beneficiaries.js';
import payments, { getSqlSelectStateId, getSqlSelectRemainingPayment, insert } from '../../src/payments.js';

describe('payments.js', function() {

    describe('#getSqlSelectStateId()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT "id" FROM "rsj_payment_state" WHERE "label" = 'Prévu')`;
            expect(await getSqlSelectStateId('Prévu')).to.equal(sql);
        });
    });

    describe('#getSqlSelectRemainingPayment()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT rp."beneficiaryRsjId", COUNT(*) AS "totalPayments" FROM "rsj_payment" rp, "rsj_payment_state" rpd WHERE rpd."id" = rp."stateId" GROUP BY rp."beneficiaryRsjId")`;
            expect(await getSqlSelectRemainingPayment()).to.equal(sql);
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

});
