import fs from 'fs';

const TYPES = { NULL: '', INFO: '[INFO] ', ERROR: '[ERROR] ', WARNING: '[WARNING] ' };

function l(_msg, _file=`log.txt`, _type=TYPES.NULL, _stacktrace='', _stdout=false) {
    const stacktrace = _stacktrace ? `${_stacktrace} ` : '';
    const msg = `${_type}${stacktrace}${_msg}\n`;

    if (!(_file instanceof Array)) {
        fs.appendFileSync(`${process.env.LOG_FOLDER}${_file}`, msg);
    } else {
        for (let i=0; i<_file.length; i++) {
            fs.appendFileSync(`${process.env.LOG_FOLDER}${_file[i]}`, msg);
        }
    }

    if (_stdout) {
        console.log(_msg);
    }
}

export function log(_msg, _file='log.txt', _stdout=false) {
    l(_msg, _file, TYPES.NULL, '', _stdout);
}

export function info(_msg, _file='log.txt', _stdout=false) {
    l(_msg, _file, TYPES.INFO, '', _stdout);
}

export function error(_msg, _stacktrace, _file='log.txt') {
    l(_msg, _file, TYPES.ERROR, _stacktrace, true);
}

export function warning(_msg, _stacktrace, _file='log.txt', _stdout=false) {
    l(_msg, _file, TYPES.WARNING, _stacktrace, _stdout);
}

const logger = { log, info, error, warning };

export default logger;
