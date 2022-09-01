import fs from 'fs';

import { env, logFolder, logFile, warningFile, errorFile } from '../../config/config.js';

const TYPES = { NULL: '', INFO: '[INFO] ', ERROR: '[ERROR] ', WARNING: '[WARNING] ' };

function l(_msg, _file=`${logFolder}${logFile}`, _type=TYPES.NULL, _stacktrace='', _stdout=false) {
    if (env == 'test') { return; }
    const stacktrace = _stacktrace ? `${_stacktrace} ` : '';
    const msg = `${_type}${stacktrace}${_msg}\n`;

    if (!(_file instanceof Array)) {
        fs.appendFileSync(`${_file}`, msg);
    } else {
        for (let i=0; i<_file.length; i++) {
            fs.appendFileSync(`${_file[i]}`, msg);
        }
    }

    if (_stdout) {
        console.log(_msg);
    }
}

export function log(_msg, _file=`${logFolder}${logFile}`, _stdout=false) {
    l(_msg, _file, TYPES.NULL, '', _stdout);
}

export function info(_msg, _file=`${logFolder}${logFile}`, _stdout=false) {
    l(_msg, _file, TYPES.INFO, '', _stdout);
}

export function error(_msg, _stacktrace, _file=`${logFolder}${errorFile}`, _stdout=false) {
    l(_msg, _file, TYPES.ERROR, _stacktrace, _stdout);
}

export function warning(_msg, _stacktrace, _file=`${logFolder}${warningFile}`, _stdout=false) {
    l(_msg, _file, TYPES.WARNING, _stacktrace, _stdout);
}

const logger = { log, info, error, warning };

export default logger;
