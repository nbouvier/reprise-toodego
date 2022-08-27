import dotenv from 'dotenv';
dotenv.config({ path: '.env.test' });

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';
import { decrypt } from '../../src/utils/encryption.js';

import documents, { getSqlSelectTitleId, insert } from '../../src/documents.js';

describe('documents.js', function() {

    describe('#getSqlSelectTitleId()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT "id" FROM "document_title" WHERE "label" = 'Réalisé' AND "tag" = 'rsj')`
            expect(await getSqlSelectTitleId('Réalisé')).to.equal(sql);
        });
    });

    describe('#insert()', function() {
        let row;
        let documentId;

        beforeEach(async function() {
            documentId = await insert({
                _title: 'Autre',
                _importDate: '2022-07-07T00:00:00.000Z',
                _userId: 1,
                _fileName: 'test',
                _fileType: 'pdf',
                _insertisId: '21N000001',
                _beneficiaryId: 3,
                _data: 'test'
            });

            const sql = sqlBuilder.getSelect({
                _select: [ '"id"', '"titleId"', '"importDate"', '"importedById"', '"filename"', '"beneficiaryId"', '"filedata"' ],
                _from: [ '"document"' ],
                _where: [ '"beneficiaryId" = 3' ]
            });
            const res = await db.query(sql);
            row = res.rows[0];
        });

        it('should create a new document', async function() {
            const sql = sqlBuilder.getSelect({
                _select: [ 'COUNT(*)::integer AS "count"' ],
                _from: [ '"document"' ],
                _where: [ '"beneficiaryId" = 3' ]
            });
            const res = await db.query(sql);

            expect(res.rows[0].count).to.equal(1);
        });
        it('should return document.id', async function() {
            expect(documentId).to.equal(row.id);
        });
        it('should set document properties', async function() {
            expect(row.titleId).to.equal(40);
            let importDate = (new Date(row.importDate)).toLocaleDateString();
            expect(importDate).to.equal('07/07/2022');
            expect(row.importedById).to.equal(1);
            expect(await decrypt(row.filename)).to.match(/21N000001_test_\d{13}\.pdf/);
            expect(row.beneficiaryId).to.equal(3);
            expect(await decrypt(row.filedata)).to.equal('test');
        });

        afterEach(async function() {
            const sql = sqlBuilder.getDelete({
                _from: [ '"document"' ],
                _where: [ '"beneficiaryId" = 3' ]
            });
            await db.query(sql);
        });
    });

});
