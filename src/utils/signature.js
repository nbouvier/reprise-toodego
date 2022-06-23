import crypto from 'crypto';
import url from 'url';

const ORIG = process.env.TOODEGO_USER;
const KEY = process.env.TOODEGO_KEY;

export function signURL(_url) {
    let parsedURL = url.parse(_url, true);
    let path = parsedURL.pathname;
    let timestamp = `${encodeURIComponent(new Date().toISOString().substr(0, 19))}Z`;
    let nonce = crypto.randomBytes(16).toString('hex');
    let query = `${(parsedURL.search ? `${parsedURL.search}&`.substr(1) : '')}algo=sha256&timestamp=${timestamp}&nonce=${nonce}&orig=${ORIG}`;
    let signature = encodeURIComponent(signHmacSha256(query));

    return `${process.env.TOODEGO_URL}${path}?${query}&signature=${signature}`;
}

function signHmacSha256(_str) {
    let hmac = crypto.createHmac('sha256', KEY);
    let signed = hmac.update(Buffer.from(_str, 'utf-8')).digest('base64');

    return signed;
}

const signature = { signURL };

export default signature;
