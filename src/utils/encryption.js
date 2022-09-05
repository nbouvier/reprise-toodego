import { createCipheriv, createDecipheriv, scrypt } from 'crypto';
import { promisify } from 'util';

import config from '../../config/config.js';
const { insertisEncryptKey, insertisEncryptIv } = config;

export async function encrypt(_value) {
    if (!_value) return null;

    const key = await promisify(scrypt)(insertisEncryptKey, 'salt', 32);
    const iv = Buffer.from(insertisEncryptIv);
    const cipher = createCipheriv('aes-256-cbc', key, iv);
    const encrypted = Buffer.concat([ cipher.update(_value), cipher.final() ]).toString('hex');

    return encrypted;
}

export async function decrypt(_value) {
    if (!_value) return null;

    const key = await promisify(scrypt)(insertisEncryptKey, 'salt', 32);
    const iv = Buffer.from(insertisEncryptIv);
    const decipher = createDecipheriv('aes-256-cbc', key, iv);
    const decrypted = Buffer.concat([ decipher.update(Buffer.from(_value, 'hex')), decipher.final() ]).toString();

    return decrypted;
}

const encryption = { encrypt, decrypt };

export default encryption;
