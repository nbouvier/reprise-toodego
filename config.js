import dotenv from 'dotenv';

var path;
if (process.argv[2] == 'prod') {
    console.log('Warning, running in production mode !');
    path = './.env';
} else {
    path = './.env.test';
}

dotenv.config({ path });
