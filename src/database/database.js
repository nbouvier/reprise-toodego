import pg from 'pg';

import config from './dbConfig.js';

import logger from '../utils/logger.js';

const RETRY_COOLDOWN = 2000;

var connection;

function connect() {
    const connection = new pg.Client(config.get());

    return new Promise((resolve, reject) => {
        connection.connect(error => {
            if(error) {
                logger.error(`database.js ${error}`);
                setTimeout(connect, RETRY_COOLDOWN);
            } else { resolve(connection); }
        });
    });
}

export async function query(sql, params = []) {
    const connection = await connect();

    return new Promise((resolve, reject) => {
        connection.query(sql, params, (err, results, fields) => {
            connection.end();
            if (err) {
                logger.error(`database.js:query ${err}.\n${sql}`);
                reject(err);
            } else { resolve(results); }
        });
    });
}

const db = { query };

export default db;
