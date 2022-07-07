import dotenv from 'dotenv';

import logger from './src/utils/logger.js';

export function live() {
    dotenv.config({ path: './.env' });
    logger.log('Running in live mode.');
}

export function dev() {
    dotenv.config({ path: './.env.dev' });
    logger.log('Running in dev mode.');
}

export function test() {
    dotenv.config({ path: './.env.test' });
    logger.log('Running in test mode.');
}

const config = { live, dev, test };

export default config;
