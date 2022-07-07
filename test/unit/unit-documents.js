import config from '../../config.js';
config.test();

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import documents, { getSqlSelectTitleId, insert } from '../../src/documents.js';

describe('documents.js', function() {

    // TODO: Test import functions

    describe('#getSqlSelectTitleId()', function() {
        it('should return correct SQL subquery', async function() {
            const sql = `(SELECT "id" FROM "document_title" WHERE "label" = 'Réalisé' AND "tag" = 'rsj')`
            expect(await getSqlSelectTitleId('Réalisé')).to.equal(sql);
        });
    });

    describe('#insert()', function() {
        let documentId;

        beforeEach(async function() {
            documentId = await insert({
                _title: 'Autre',
                _importDate: '2022-07-07',
                _userId: 1,
                _fileName: 'test',
                _fileType: 'pdf',
                _insertisId: '21N000001',
                _beneficiaryId: 3,
                _data: 'test'
            });
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
            const sql = sqlBuilder.getSelect({
                _select: [ '"id"' ],
                _from: [ '"document"' ],
                _where: [ '"beneficiaryId" = 3' ]
            });
            const res = await db.query(sql);

            expect(documentId).to.equal(res.rows[0].id);
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
