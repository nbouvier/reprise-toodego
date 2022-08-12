import fs from 'fs';

import config from './config.js';
if (process.argv[2] == 'live') {
    config.live();
} else {
    config.dev();
}

import fetcher from './src/utils/toodegoFetcher.js';

import { importInstructions } from './src/instructions.js';
import { importPayments } from './src/payments.js';

fs.writeFileSync(process.env.LOG_FILE, '');

if (process.env.ENV != 'test') {
    fs.writeFileSync(process.env.INSTRUCTION_DATA_FILE, '');
    fs.writeFileSync(process.env.PAYMENT_DATA_FILE, '');
}

await importInstructions();
await importPayments();
