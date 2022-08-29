import fs from 'fs';
import minimist from 'minimist';
const args = minimist(process.argv.slice(2));
import dotenv from 'dotenv';
dotenv.config({ path: args.config });
import cliProgress from 'cli-progress';

import api from './src/utils/api.js';
import logger from './src/utils/logger.js';

const cliBar = new cliProgress.SingleBar({}, cliProgress.Presets.shades_classic);

if (!args['skip-instructions']) {
    const allowedInstructions = args.instructions ? JSON.parse(args.instructions) : null;

    if (args['replay-instructions']) {
        logger.log('Deleting old instructions ...', 'log.txt', true);
        const files = fs.readdirSync(process.env.INSTRUCTION_DATA_FOLDER);
        cliBar.start(allowedInstructions ? allowedInstructions.length : files.length, 0);
        for (let i=0; i<files.length; i++) {
            if (allowedInstructions && !allowedInstructions.includes(parseInt(files[i].split('.')[0]))) {
                continue;
            }
            fs.unlinkSync(`${process.env.INSTRUCTION_DATA_FOLDER}${file}`);
            cliBar.increment();
        }
        cliBar.stop();
        if (!allowedInstructions) {
            fs.writeFileSync(`${process.env.LOG_FOLDER}instructions/log.txt`, '');
            fs.writeFileSync(`${process.env.LOG_FOLDER}instructions/error.txt`, '');
        }
    }

    logger.log('Fetching instructions ...', `instructions/log.txt`, true);
    const instructions = await api.fetchAll(process.env.TOODEGO_INSTRUCTION_PATH);
    cliBar.start(allowedInstructions ? allowedInstructions.length : instructions.length, 0);
    for (let i=0; i<instructions.length; i++) {
        if (allowedInstructions && !allowedInstructions.includes(instructions[i].id)) {
            continue;
        }
        const filename = `${process.env.INSTRUCTION_DATA_FOLDER}${instructions[i].id}.json`;
        if (!args['replay-instructions'] && fs.existsSync(filename)) {
            cliBar.increment();
            continue;
        }
        logger.log(`Fetching instruction #${instructions[i].id} ...`, `instructions/log.txt`);
        const instruction = await api.fetchOne(process.env.TOODEGO_INSTRUCTION_PATH, instructions[i].id);
        fs.writeFileSync(filename, JSON.stringify(instruction));
        cliBar.increment();
    }
    cliBar.stop();
    logger.log('All instructions has been fetched.', `instructions/log.txt`, true);
}

if (!args['skip-payments']) {
    const allowedPayments = args.payments ? JSON.parse(args.payments) : null;

    if (args['replay-payments']) {
        logger.log('Deleting old payments ...', `payments/log.txt`, true);
        const files = fs.readdirSync(process.env.PAYMENT_DATA_FOLDER);
        cliBar.start(allowedPayments ? allowedPayments.length : files.length, 0);
        for(let i=0; i<files.length; i++) {
            if (allowedPayments && !allowedPayments.includes(parseInt(files[i].split('.')[0]))) {
                continue;
            }
            fs.unlinkSync(`${process.env.PAYMENT_DATA_FOLDER}${files[i]}`);
            cliBar.increment();
        }
        cliBar.stop();
        if (!allowedPayments) {
            fs.writeFileSync(`${process.env.LOG_FOLDER}payments/log.txt`, '');
            fs.writeFileSync(`${process.env.LOG_FOLDER}payments/error.txt`, '');
        }
    }

    logger.log('Fetching payments ...', `payments/log.txt`, true);
    const payments = (await api.fetchAll(process.env.TOODEGO_PAYMENT_PATH)).data;
    cliBar.start(allowedPayments ? allowedPayments.length : payments.length, 0);
    for (let i=0; i<payments.length; i++) {
        if (allowedPayments && !allowedPayments.includes(payments[i].id)) {
            continue;
        }
        const filename = `${process.env.PAYMENT_DATA_FOLDER}${payments[i].id}.json`;
        if (!args['replay-payments'] && fs.existsSync(filename)) {
            cliBar.increment();
            continue;
        }
        logger.log(`Fetching payment #${payments[i].id} ...`, `payments/log.txt`);
        const payment = await api.fetchOne(process.env.TOODEGO_PAYMENT_PATH, payments[i].id);
        fs.writeFileSync(filename, JSON.stringify(payment));
        cliBar.increment();
    }
    cliBar.stop();
    logger.log('All payments has been fetched.', `payments/log.txt`, true);
}
