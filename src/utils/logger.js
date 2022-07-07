import fs from 'fs';

const TYPES = { NULL: '', INFO: '[INFO] ', ERROR: '[ERROR] ', WARNING: '[WARNING] ' };

export function log(_msg, _type = TYPES.NULL) {
    const msg = `${_type}${_msg}\n`;
    fs.appendFileSync(process.env.LOG_FILE, msg);
    console.log(msg);
}

export function info(_msg) {
    log(_msg, TYPES.INFO);
}

export function error(_msg) {
    log(_msg, TYPES.ERROR);
}

export function warning(_msg) {
    log(_msg, TYPES.WARNING);
}

const logger = { log, info, error, warning };

export default logger;
