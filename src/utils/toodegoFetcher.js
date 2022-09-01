import { signURL } from './signature.js';

import { toodegoUrl, toodegoInstructionPath } from '../../config/config.js';

export function getSchemaUrl(_path) {
    const path = toodegoInstructionPath ? '/demande-de-rsa-jeunes' : '/historique-des-paiements-des-jeunes';
    return signURL(`${toodegoUrl}${path}/schema`);
}

export function getListUrl(_path) {
    return signURL(`${toodegoUrl}${_path}list/`);
}

export function getFormUrl(_path, _id) {
    return signURL(`${toodegoUrl}${_path}${_id}`);
}

const fetcher = { getSchemaUrl, getListUrl, getFormUrl };

export default fetcher;
