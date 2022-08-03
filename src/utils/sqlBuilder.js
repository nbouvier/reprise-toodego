export function getCase({ _cases, _as }) {
    const cases = `CASE ${_cases.map(c => `WHEN ${c._when} THEN ${c._then}`).join(' ')} END`
    const as = _as ? ` AS ${_as}` : '';

    return `${cases}${as}`;
}

function getJoin(_linker, _joins) {
    return _joins.map(j => `${_linker} ${j._table}${j._as ? ` ${j._as}` : ''} ON ${j._on.join(' AND ')}`).join(' ');
}

export function getSelect({ _select = [ '*' ], _from, _join, _leftJoin, _rightJoin, _where, _groupBy, _orderBy, _limit, _subquery }) {
    const select = `SELECT ${_select.join(', ')}`;
    const from = _from ? ` FROM ${_from.join(', ')}` : '';
    const join = _join ? ` ${getJoin('JOIN', _join)}` : '';
    const leftJoin = _leftJoin ? ` ${getJoin('LEFT JOIN', _leftJoin)}` : '';
    const rightJoin = _rightJoin ? ` ${getJoin('RIGHT JOIN', _rightJoin)}` : '';
    const where = _where ? ` WHERE ${_where.join(' AND ')}` : '';
    const groupBy = _groupBy ? ` GROUP BY ${_groupBy.join(', ')}` : '';
    const orderBy = _orderBy ? ` ORDER BY ${_orderBy.join(', ')}` : '';
    const limit = _limit ? ` LIMIT ${_limit}` : '';
    const queryStart = _subquery ? '(' : '';
    const queryEnd = _subquery ? ')' : ';';

    return `${queryStart}${select}${from}${join}${leftJoin}${rightJoin}${where}${groupBy}${orderBy}${limit}${queryEnd}`;
}

export function getUpdate({ _update, _set, _from, _where }) {
    const update = `UPDATE ${_update}`;
    const set = ` SET ${_set.join(', ')}`;
    const from = _from ? ` FROM ${_from.join(', ')}` : '';
    const where = _where ? ` WHERE ${_where.join(' AND ')}` : '';

    return `${update}${set}${from}${where};`;
}

export function getInsert({ _insert, _into, _values, _id }) {
    const insert = _insert ? ` (${_insert.join(', ')})` : '';
    const into = `INSERT INTO ${_into}`;
    const values = ` VALUES (${_values.map(row => row.join(', ')).join('), ')})`;

    let select = '';
    if(_id !== null) {
        const id = _id || '"id"';
        select = getSelect({
            _select: [ id ],
            _from: [ _into ],
            _orderBy: [ `${id} DESC` ],
            _limit: 1
        });
    }

    return `${into}${insert}${values};${select}`;
}

export function getDelete({ _from, _where }) {
    const from = `DELETE FROM ${_from}`;
    const where = _where ? ` WHERE ${_where.join(' AND ')}` : '';

    return `${from}${where};`;
}

export function parseString(_string) {
    if(_string == null) { return null; }

    let filteredString = _string.replaceAll('\'', '\'\'')
                                .replaceAll('\n', '')
                                .replaceAll('<br>', '')
                                .replaceAll('<div>', '')
                                .replaceAll('</div>', '');

    return `'${filteredString}'`;
}

const sqlBuilder = { getCase, getSelect, getUpdate, getInsert, getDelete, parseString };

export default sqlBuilder;
