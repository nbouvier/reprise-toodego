import fetch from 'node-fetch';

import { signURL } from './signature.js';

export async function fetchAll(_path) {
    const signedURL = signURL(`${process.env.TOODEGO_URL}${_path}list/`);
    const response = await fetch(signedURL);
    const objects = await response.json();

    return objects;
}

export async function fetchOne(_path, _id) {
    const signedURL = signURL(`${process.env.TOODEGO_URL}${_path}${_id}`);
    const response = await fetch(signedURL);
    const object = await response.json();

    return object;
}

const api = { fetchAll, fetchOne };

export default api;
