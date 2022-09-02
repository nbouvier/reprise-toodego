import minimist from 'minimist';
const args = minimist(process.argv.slice(2));
import dotenv from 'dotenv';
dotenv.config({ path: args.config || './config/.env' });

export const env = process.env.ENV;

export const dbUser = process.env.DB_USER;
export const dbPassword = process.env.DB_PASSWORD;
export const dbName = process.env.DB_NAME;
export const dbHost = process.env.DB_HOST;
export const dbPort = process.env.DB_PORT;

export const toodegoUser = process.env.TOODEGO_USER;
export const toodegoKey = process.env.TOODEGO_KEY;
export const toodegoUrl = process.env.TOODEGO_URL;
export const toodegoInstructionPath = process.env.TOODEGO_INSTRUCTION_PATH;
export const toodegoPaymentPath = process.env.TOODEGO_PAYMENT_PATH;

export const insertisEncryptKey = process.env.INSERTIS_ENCRYPT_KEY;
export const insertisEncryptIv = process.env.INSERTIS_ENCRYPT_IV;

export const logFolder = process.env.LOG_FOLDER;
export const instructionsLogFolder = process.env.INSTRUCTIONS_LOG_FOLDER;
export const paymentsLogFolder = process.env.PAYMENTS_LOG_FOLDER;

export const fetchLogFile = process.env.FETCH_LOG_FILE;
export const logFile = process.env.LOG_FILE;
export const warningFile = process.env.WARNING_FILE;
export const errorFile = process.env.ERROR_FILE;

export const dataFolder = process.env.DATA_FOLDER;
export const instructionsDataFolder = process.env.INSTRUCTIONS_DATA_FOLDER;
export const paymentsDataFolder = process.env.PAYMENTS_DATA_FOLDER;

const config = {
    env,
    dbUser, dbPassword, dbName, dbHost, dbPort,
    toodegoUser, toodegoKey, toodegoUrl, toodegoInstructionPath, toodegoPaymentPath,
    insertisEncryptKey, insertisEncryptIv,
    logFolder, instructionsLogFolder, paymentsLogFolder,
    fetchLogFile, logFile, warningFile, errorFile,
    dataFolder, instructionsDataFolder, paymentsDataFolder
};

export default config;
