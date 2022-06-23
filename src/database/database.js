import pg from 'pg';

import config from './dbConfig.js';

import logger from '../utils/logger.js';

const RETRY_COOLDOWN = 2000;

var connection;

async function connect() {
    logger.info(`[LOG] database.js Connecting database`);
    connection = new pg.Client(config);

    connection.connect(error => {
        if(error) {
            logger.error(`database.js ${error}`);
            setTimeout(connect, RETRY_COOLDOWN);
        }
    });

    connection.on('error', function(error) {
        logger.error(`database.js ${error}`);
        if(error.code === 'PROTOCOL_CONNECTION_LOST') { connect(); }
        else throw error;
    });
}

export function query(sql, params = []) {
    return new Promise((resolve, reject) => {
        connection.query(sql, params, (err, results, fields) => {
            if (!err) { resolve(results); }
            else {
                logger.error(`database.js:query ${err}.`);
                reject(err);
            }
        });
    });
}

connect();

const db = { query };

export default db;
