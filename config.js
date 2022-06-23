import dotenv from 'dotenv';

var path;
if (process.argv[2] == 'live') {
    console.log('Warning, running in live mode !');
    path = './.env';
} else {
    path = './.env.test';
}

dotenv.config({ path });
