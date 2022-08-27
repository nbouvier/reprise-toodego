import fs from 'fs';
import minimist from 'minimist';
const args = minimist(process.argv.slice(2));
import dotenv from 'dotenv';
dotenv.config({ path: args.config });

import logger from './src/utils/logger.js';

import { importInstructions } from './src/instructions.js';
import { importPayments } from './src/payments.js';

if (!args['skip-instructions']) {
    if (args['replay-instructions']) {
        fs.readdirSync(`${process.env.LOG_FOLDER}instructions/`).forEach(file => {
            fs.unlinkSync(`${process.env.LOG_FOLDER}instructions/${file}`);
        });
        fs.writeFileSync(`${process.env.LOG_FOLDER}instructions/log.txt`, '');
        fs.writeFileSync(`${process.env.LOG_FOLDER}instructions/error.txt`, '');
    }
    logger.log('Importing all instructions ...', `instructions/log.txt`, true);
    await importInstructions();
    logger.log('All instructions has been imported.', `instructions/log.txt`, true);
}

if (!args['skip-payments']) {
    if (args['replay-payments']) {
        fs.readdirSync(`${process.env.LOG_FOLDER}payments/`).forEach(file => {
            fs.unlinkSync(`${process.env.LOG_FOLDER}payments/${file}`);
        });
        fs.writeFileSync(`${process.env.LOG_FOLDER}payments/log.txt`, '');
        fs.writeFileSync(`${process.env.LOG_FOLDER}payments/error.txt`, '');
    }
    logger.log('Importing all payments ...', `payments/log.txt`, true);
    await importPayments();
    logger.log('All payments has been imported.', `payments/log.txt`, true);
}
