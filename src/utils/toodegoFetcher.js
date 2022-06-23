import { signURL } from './signature.js';

export function getSchemaUrl(_path) {
    const path = process.env.TOODEGO_INSTRUCTION_PATH ? '/demande-de-rsa-jeunes' : '/historique-des-paiements-des-jeunes';
    return signURL(`${process.env.TOODEGO_URL}${path}/schema`);
}

export function getListUrl(_path) {
    return signURL(`${process.env.TOODEGO_URL}${_path}list/`);
}

export function getFormUrl(_path, _id) {
    return signURL(`${process.env.TOODEGO_URL}${_path}${_id}`);
}

const fetcher = { getSchemaUrl, getListUrl, getFormUrl };

export default fetcher;
