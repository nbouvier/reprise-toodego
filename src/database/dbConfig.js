const config = {
    host: process.env.DB_HOST || 'localhost',
    database: process.env.DB_NAME || 'rsa',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    port: process.env.DB_PORT || '',
    dateStrings: true
};

export default config;
