import dotenv from 'dotenv';
dotenv.config({ path: '.env.test' });

import { expect } from 'chai';

import db from '../../src/database/database.js';
import sqlBuilder from '../../src/utils/sqlBuilder.js';

import users from '../../src/users.js';

describe('users.js', function() {

    describe('#getId()', function() {
        it('should return user.id', async function() {
            expect(await users.getId('nruffinoni@grandlyon.com')).to.equal(1);
        });
        it('should return undefined if user does not exist', async function() {
            expect(await users.getId('nbouvier@grandlyon.com')).to.be.undefined;
        });
    });

});
