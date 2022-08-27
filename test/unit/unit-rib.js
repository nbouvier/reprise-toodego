import dotenv from 'dotenv';
dotenv.config({ path: '.env.test' });

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';
import { decrypt } from '../../src/utils/encryption.js';

import rib, { insert } from '../../src/rib.js';

describe('rib.js', function() {

    describe('#updateBeginDate()', function() {
        let rows;

        beforeEach(async function() {
            await rib.updateBeginDate(1, '2022-01-01');
            await rib.updateBeginDate(4, '2000-01-01');

            const sql = sqlBuilder.getSelect({
                _select: [ 'pd."beginDate"' ],
                _from: [ '"rsj_payment_data" pd', '"beneficiary_rsj" brsj' ],
                _where: [ 'pd."id" = brsj."paymentDataId"', 'brsj."beneficiaryId" IN (1, 4)' ],
                _orderBy: [ 'brsj."beneficiaryId"' ]
            });
            const res = await db.query(sql);
            rows = res.rows;
        });

        it('should update rsj_payment_data.beginDate if given date is older than current date', async function() {
            let beginDate = (new Date(rows[1].beginDate)).toLocaleDateString();
            expect(beginDate).to.equal('01/01/2000');
        });
        it('should not update rsj_payment_data.beginDate if given date is newer than current date', async function() {
            let beginDate = (new Date(rows[0].beginDate)).toLocaleDateString();
            expect(beginDate).to.equal('01/01/2010');
        });

        afterEach(async function() {
            await rib.updateBeginDate(1, '2010-01-01');
            await rib.updateBeginDate(2, '2010-01-01');
        });
    });

    describe('#insert()', function() {
        let row;
        let paymentDataId;

        beforeEach(async function() {
            let data = {
                fields: {
                    prenom_compte: 'Rsj',
                    nom_compte: 'TEST',
                    banque: 'CIC',
                    iban: 'FR76',
                    bic: 'AMD',
                    livretA_raw: 'Oui'
                },
                receipt_time: '2022-07-17T00:00:00.000Z'
            };

            paymentDataId = await insert(2, data);

            const sql = sqlBuilder.getSelect({
                _select: [ '"beginDate"', '"endDate"', '"holderFirstName"', '"holderLastName"', '"bankName"', '"iban"', '"bic"', '"livretA"', '"ribId"' ],
                _from: [ '"rsj_payment_data"' ],
                _orderBy: [ '"id" DESC'],
                _limit: 1
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should create a new rsj_payment_data', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ 'COUNT(*)::integer AS "count"' ],
                _from: [ '"rsj_payment_data"' ],
                _where: [ '"ribId" = 2' ]
            });
            const res = await db.query(sql);

            expect(res.rows[0].count).to.equal(1);
        });
        it('should set rsj_payment_data properties', async function() {
            let beginDate = (new Date(row.beginDate)).toLocaleDateString();
            expect(beginDate).to.equal('17/07/2022');
            expect(row.endDate).to.be.null;
            expect(await decrypt(row.holderFirstName)).to.equal('Rsj');
            expect(await decrypt(row.holderLastName)).to.equal('TEST');
            expect(await decrypt(row.bankName)).to.equal('CIC');
            expect(await decrypt(row.iban)).to.equal('FR76');
            expect(await decrypt(row.bic)).to.equal('AMD');
            expect(row.livretA).to.be.true;
            expect(row.ribId).to.equal(2);
        });

        afterEach(async function() {
            const sql = sqlBuilder.getDelete({
                _from: [ '"rsj_payment_data"' ],
                _where: [ `"id" = ${paymentDataId}` ]
            });
            await db.query(sql);
        });
    });

});
