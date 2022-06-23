import { createCipheriv, createDecipheriv, scrypt } from 'crypto';
import { promisify } from 'util';

export async function encrypt(_value) {
    if (!_value) return null;

    const key = await promisify(scrypt)(process.env.INSERTIS_ENCRYPT_KEY, 'salt', 32);
    const iv = Buffer.from(process.env.INSERTIS_ENCRYPT_IV);
    const cipher = createCipheriv('aes-256-cbc', key, iv);
    const encrypted = Buffer.concat([ cipher.update(_value), cipher.final() ]).toString('hex');

    return encrypted;
}

export async function decrypt(_value) {
    if (!_value) return null;

    const key = await promisify(scrypt)(process.env.INSERTIS_ENCRYPT_KEY, 'salt', 32);
    const iv = Buffer.from(process.env.INSERTIS_ENCRYPT_IV);
    const decipher = createDecipheriv('aes-256-cbc', key, iv);
    const decrypted = Buffer.concat([ decipher.update(Buffer.from(_value, 'hex')), decipher.final() ]).toString();

    return decrypted;
}

const encryption = { encrypt, decrypt };

export default encryption;
