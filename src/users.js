import sqlBuilder from './utils/sqlBuilder.js';

export async function getId(_email) {
    const sql = sqlBuilder.getSelect({
        _select: [ '"id"' ],
        _from: [ '"user"' ],
        _where: [ `"email" = ${sqlBuilder.parseString(_email)}` ]
    });

    const res = await db.query(sql);
    return res.rows[0]?.id;
}

const users = { getId };

export default users;
