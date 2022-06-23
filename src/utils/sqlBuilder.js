export function buildSqlSelect({ _select = [ '*' ], _from, _where, _orderBy, _limit, _subquery }) {
    const select = `SELECT ${_select.join(', ')}`;
    const from = _from ? ` FROM ${_from.join(', ')}` : '';
    const where = _where ? ` WHERE ${_where.join(' AND ')}` : '';
    const orderBy = _orderBy ? ` ORDER BY ${_orderBy.join(', ')}` : '';
    const limit = _limit ? ` LIMIT ${_limit}` : '';
    const queryStart = _subquery ? '(' : '';
    const queryEnd = _subquery ? ')' : ';';

    return `${queryStart}${select}${from}${where}${orderBy}${limit}${queryEnd}`;
}

export function buildSqlUpdate({ _update, _set, _from, _where }) {
    const update = `UPDATE ${_update}`;
    const set = ` SET ${_set.join(', ')}`;
    const from = _from ? ` FROM ${_from.join(', ')}` : '';
    const where = ` WHERE ${_where.join(' AND ')}`;

    return `${update}${set}${from}${where};`;
}

export function buildSqlInsert({ _insert, _into, _values, _id }) {
    const insert = _insert ? ` (${_insert.join(', ')})` : '';
    const into = `INSERT INTO ${_into}`;
    const values = ` VALUES (${_values.map(row => row.join(', ')).join('), ')})`;

    const id = _id || 'id';
    const select = buildSqlSelect({
        _select: [ `CURRVAL(pg_get_serial_sequence('${_into}', '${id}')) AS "${id}"` ]
    });

    return `${into}${insert}${values};${select}`;
}

export function parseString(_string) {
    let filteredString = _string.replaceAll('\'', '\'\'')
                                .replaceAll('\n', '')
                                .replaceAll('<br>', '')
                                .replaceAll('<div>', '')
                                .replaceAll('</div>', '');

    return `'${filteredString}'`;
}

const sqlBuilder = { buildSqlSelect, buildSqlUpdate, buildSqlInsert, parseString };

export default sqlBuilder;
