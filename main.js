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

// console.log(fetcher.getFormUrl(process.env.TOODEGO_INSTRUCTION_PATH, 2150));

// await importInstructions();
// await importPayments();
