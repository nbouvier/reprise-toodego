import config from '../../config/config.js';
const { dbHost, dbName, dbUser, dbPassword, dbPort } = config;

const dbConfig = {
    host: dbHost || 'localhost',
    database: dbName || 'rsa',
    user: dbUser || 'root',
    password: dbPassword || '',
    port: dbPort || '',
    dateStrings: true
};

export default dbConfig;
