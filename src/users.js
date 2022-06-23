import { buildSqlSelect, parseString } from './utils/sqlBuilder.js';

export function getSqlSelectId(_email) {
    return buildSqlSelect({
        _select: [ '"id"' ],
        _from: [ '"user"' ],
        _where: [ `"email" = ${parseString(_email)}` ],
        _subquery: true
    });
}

const users = { getSqlSelectId };

export default users;
