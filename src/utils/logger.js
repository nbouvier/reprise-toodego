import fs from 'fs';

const TYPES = { NULL: '', INFO: '[INFO] ', ERROR: '[ERROR] ', WARNING: '[WARNING] ' };

export function log(_msg, _type = TYPES.NULL, _stacktrace = '') {
    const stacktrace = _stacktrace ? `${_stacktrace} ` : '';
    const msg = `${_type}${stacktrace}${_msg}\n`;
    fs.appendFileSync(process.env.LOG_FILE, msg);
    console.log(msg);
}

export function info(_msg) {
    log(_msg, TYPES.INFO);
}

export function error(_msg, _stacktrace) {
    log(_msg, TYPES.ERROR, _stacktrace);
}

export function warning(_msg, _stacktrace) {
    log(_msg, TYPES.WARNING, _stacktrace);
}

const logger = { log, info, error, warning };

export default logger;
