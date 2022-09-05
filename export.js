import fs from 'fs';
import minimist from 'minimist';
const args = minimist(process.argv.slice(2));
import cliProgress from 'cli-progress';

import config from './config/config.js';
const { logFolder, instructionsLogFolder, paymentsLogFolder, fetchLogFile, toodegoInstructionPath, toodegoPaymentPath, dataFolder, instructionsDataFolder, paymentsDataFolder }  = config;

import api from './src/utils/api.js';
import logger from './src/utils/logger.js';

const cliBar = new cliProgress.SingleBar({}, cliProgress.Presets.shades_classic);

if (!fs.existsSync(logFolder)) {
    fs.mkdirSync(logFolder);
}

if (!fs.existsSync(dataFolder)) {
    fs.mkdirSync(dataFolder);
}

if (!args['skip-instructions']) {
    const allowedInstructions = args.instructions ? JSON.parse(args.instructions) : null;

    if (!fs.existsSync(instructionsLogFolder)) {
        fs.mkdirSync(instructionsLogFolder);
    } else {
        fs.appendFileSync(`${instructionsLogFolder}${fetchLogFile}`, '============================================================================\n');
    }

    if (!fs.existsSync(instructionsDataFolder)) {
        fs.mkdirSync(instructionsDataFolder);
    }

    if (args['replay-instructions']) {
        logger.log('Deleting old instructions ...', `${instructionsLogFolder}${fetchLogFile}`, true);
        const files = fs.readdirSync(instructionsDataFolder);
        cliBar.start(allowedInstructions ? allowedInstructions.length : files.length, 0);
        for (let i=0; i<files.length; i++) {
            if (allowedInstructions && !allowedInstructions.includes(parseInt(files[i].split('.')[0]))) {
                continue;
            }
            fs.unlinkSync(`${instructionsDataFolder}${file}`);
            cliBar.increment();
        }
        cliBar.stop();
    }

    logger.log('Fetching instructions ...', `${instructionsLogFolder}${fetchLogFile}`, true);
    const instructions = await api.fetchAll(toodegoInstructionPath);
    cliBar.start(allowedInstructions ? allowedInstructions.length : instructions.length, 0);
    for (let i=0; i<instructions.length; i++) {
        if (allowedInstructions && !allowedInstructions.includes(instructions[i].id)) {
            continue;
        }
        const filename = `${instructionsDataFolder}${instructions[i].id}.json`;
        if (!args['replay-instructions'] && fs.existsSync(filename)) {
            cliBar.increment();
            continue;
        }
        logger.log(`Fetching instruction #${instructions[i].id} ...`, `${instructionsLogFolder}${fetchLogFile}`);
        const instruction = await api.fetchOne(toodegoInstructionPath, instructions[i].id);
        fs.writeFileSync(filename, JSON.stringify(instruction));
        cliBar.increment();
    }
    cliBar.stop();
    logger.log('All instructions has been fetched.', `${instructionsLogFolder}${fetchLogFile}`, true);
}

if (!args['skip-payments']) {
    const allowedPayments = args.payments ? JSON.parse(args.payments) : null;

    if (!fs.existsSync(paymentsLogFolder)) {
        fs.mkdirSync(paymentsLogFolder);
    } else {
        fs.appendFileSync(`${paymentsLogFolder}${fetchLogFile}`, '============================================================================\n');
    }

    if (!fs.existsSync(paymentsDataFolder)) {
        fs.mkdirSync(paymentsDataFolder);
    }

    if (args['replay-payments']) {
        logger.log('Deleting old payments ...', `${paymentsLogFolder}${fetchLogFile}`, true);
        const files = fs.readdirSync(paymentsDataFolder);
        cliBar.start(allowedPayments ? allowedPayments.length : files.length, 0);
        for(let i=0; i<files.length; i++) {
            if (allowedPayments && !allowedPayments.includes(parseInt(files[i].split('.')[0]))) {
                continue;
            }
            fs.unlinkSync(`${paymentsDataFolder}${files[i]}`);
            cliBar.increment();
        }
        cliBar.stop();
    }

    logger.log('Fetching payments ...', `${paymentsLogFolder}${fetchLogFile}`, true);
    const payments = (await api.fetchAll(toodegoPaymentPath)).data;
    cliBar.start(allowedPayments ? allowedPayments.length : payments.length, 0);
    for (let i=0; i<payments.length; i++) {
        if (allowedPayments && !allowedPayments.includes(payments[i].id)) {
            continue;
        }
        const filename = `${paymentsDataFolder}${payments[i].id}.json`;
        if (!args['replay-payments'] && fs.existsSync(filename)) {
            cliBar.increment();
            continue;
        }
        logger.log(`Fetching payment #${payments[i].id} ...`, `${paymentsLogFolder}${fetchLogFile}`);
        const payment = await api.fetchOne(toodegoPaymentPath, payments[i].id);
        fs.writeFileSync(filename, JSON.stringify(payment));
        cliBar.increment();
    }
    cliBar.stop();
    logger.log('All payments has been fetched.', `${paymentsLogFolder}${fetchLogFile}`, true);
}
