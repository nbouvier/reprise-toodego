import fs from 'fs';
import dotenv from 'dotenv';
import camelCase from 'camelcase';

const envConfig = dotenv.parse(fs.readFileSync(process.env.CONFIG || './config/.env.sample'));
const config = Object.entries({ ...envConfig, ...process.env }).reduce((prev, [ k, v ]) => {
    return Object.keys(envConfig).includes(k) ? { ...prev, [camelCase(k)]: v } : prev;
}, {});

export default config;
