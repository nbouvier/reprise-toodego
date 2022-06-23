import fs from 'fs';

const PATH = process.env.LOG_FILE;

const TYPE = { INFO: '[INFO]', ERROR: '[ERROR]', WARNING: '[WARNING]' };

export function log(_msg, _type) {
    const msg = `${TYPE[_type]}${_msg}`;
    fs.appendFileSync(PATH, msg);
    console.log(msg);
}

export function info(_msg) {
    log(_msg, TYPE.INFO);
}

export function error(_msg) {
    log(_msg, TYPE.ERROR);
}

export function warning(_msg) {
    log(_msg, TYPE.WARNING);
}

const logger = { log, info, error, warning };

export default logger;
