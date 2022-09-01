import crypto from 'crypto';
import url from 'url';

import { toodegoUser, toodegoUrl, toodegoKey } from '../../config/config.js';

export function signURL(_url) {
    let parsedURL = url.parse(_url, true);
    let path = parsedURL.pathname;
    let timestamp = `${encodeURIComponent(new Date().toISOString().substr(0, 19))}Z`;
    let nonce = crypto.randomBytes(16).toString('hex');
    let query = `${(parsedURL.search ? `${parsedURL.search}&`.substr(1) : '')}algo=sha256&timestamp=${timestamp}&nonce=${nonce}&orig=${toodegoUser}`;
    let signature = encodeURIComponent(signHmacSha256(query));

    return `${toodegoUrl}${path}?${query}&signature=${signature}`;
}

function signHmacSha256(_str) {
    let hmac = crypto.createHmac('sha256', toodegoKey);
    let signed = hmac.update(Buffer.from(_str, 'utf-8')).digest('base64');

    return signed;
}

const signature = { signURL };

export default signature;
