import dotenv from 'dotenv';
dotenv.config({ path: '.env.test' });

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import beneficiaries from '../../src/beneficiaries.js';
import payments, { getSqlSelectStateId, getSqlSelectRemainingPayment, updateNextPayments, extractPaymentData, insert, insertNextPayment } from '../../src/payments.js';

describe('payments.js', function() {

    describe('#getSqlSelectStateId()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT "id" FROM "rsj_payment_state" WHERE "label" = 'Prévu')`;
            expect(await getSqlSelectStateId('Prévu')).to.equal(sql);
        });
    });

    describe('#getSqlSelectRemainingPayment()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT rp."beneficiaryRsjId", COUNT(*) AS "count", MIN(rp."paymentMonth") FILTER (WHERE rpd."label" = 'Prévu') AS "nextMonth", MIN(rp."amount") FILTER (WHERE rpd."label" = 'Prévu') AS "nextAmount" FROM "rsj_payment" rp JOIN "rsj_payment_state" rpd ON rpd."id" = rp."stateId" GROUP BY rp."beneficiaryRsjId")`;
            expect(await getSqlSelectRemainingPayment('Prévu')).to.equal(sql);
        });
    });

    describe('#updateNextPayments()', function() {
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

            await updateNextPayments();

            const sql = sqlBuilder.getSelect({
                _select: [ 'brsj."id" AS "beneficiaryRsjId"', 'np."remainingPayment"', 'np."nextPayment"', 'np."nextAmount"' ],
                _from: [ '"rsj_next_payment" np', '"beneficiary_rsj" brsj' ],
                _where: [ 'np."id" = brsj."nextPaymentId"', `brsj."beneficiaryId" IN (${beneficiaryIds.join(', ')})` ]
            });
            const res = await db.query(sql);
            rows = res.rows;
        });

        it('should update properties', async function() {
            let data = {
                1: { remainingPayments: 22, nextMonth: '01/01/2023', nextAmount: '400' },
                2: { remainingPayments: 24, nextMonth: null, nextAmount: null },
                3: { remainingPayments: 23, nextMonth: null, nextAmount: null }
            };
            for(let i=0; i<beneficiaryIds.length; i++) {
                expect(rows[i].remainingPayment).to.equal(data[rows[i].beneficiaryRsjId].remainingPayments);
                let paymentMonth = rows[i].nextPayment ? (new Date(rows[i].nextPayment)).toLocaleDateString() : null;
                expect(paymentMonth).to.equal(data[rows[i].beneficiaryRsjId].nextMonth);
                expect(rows[i].nextAmount).to.equal(data[rows[i].beneficiaryRsjId].nextAmount);
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
                fields: {
                    montant_verse: 400,
                    mois_du_paiement: 'Juillet-2022'
                },
                last_update_time: '2022-07-18T00:00:00.000Z'
            }
            expect(extractPaymentData(data)).to.deep.equal({ amount: 400, month: '2022-07-05', createdAt: '2022-07-18' });
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
