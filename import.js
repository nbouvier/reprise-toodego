import fs from 'fs';
import minimist from 'minimist';
const args = minimist(process.argv.slice(2));

import config from './config/config.js';
const { logFolder, instructionsLogFolder, paymentsLogFolder, logFile, warningFile, errorFile } = config;

import logger from './src/utils/logger.js';

import { importInstructions } from './src/instructions.js';
import { importPayments } from './src/payments.js';

if (!fs.existsSync(logFolder)) {
    fs.mkdirSync(logFolder);
}

if (!args['skip-instructions']) {
    if (!fs.existsSync(logFolder)) {
        fs.mkdirSync(logFolder);
    }

    if (!fs.existsSync(instructionsLogFolder)) {
        fs.mkdirSync(instructionsLogFolder);
    } else {
        fs.appendFileSync(`${instructionsLogFolder}${logFile}`, '============================================================================\n');
        fs.appendFileSync(`${instructionsLogFolder}${warningFile}`, '============================================================================\n');
        fs.appendFileSync(`${instructionsLogFolder}${errorFile}`, '============================================================================\n');
    }

    logger.log('Importing instructions ...', `${instructionsLogFolder}${logFile}`, true);
    await importInstructions();
    logger.log('All instructions has been imported.', `${instructionsLogFolder}${logFile}`, true);
}

if (!args['skip-payments']) {
    if (!fs.existsSync(logFolder)) {
        fs.mkdirSync(logFolder);
    }

    if (!fs.existsSync(paymentsLogFolder)) {
        fs.mkdirSync(paymentsLogFolder);
    } else {
        fs.appendFileSync(`${paymentsLogFolder}${logFile}`, '============================================================================\n');
        fs.appendFileSync(`${paymentsLogFolder}${warningFile}`, '============================================================================\n');
        fs.appendFileSync(`${paymentsLogFolder}${errorFile}`, '============================================================================\n');
    }

    logger.log('Importing payments ...', `${paymentsLogFolder}${logFile}`, true);
    await importPayments();
    logger.log('All payments has been imported.', `${paymentsLogFolder}${logFile}`, true);
}
