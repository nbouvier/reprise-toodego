import express from 'express';

import router from './router.js';

const port = process.env.PORT || 80;
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/', router);

app.listen(port, err => {
    if (err) console.log(err);
    console.log(`Server listening on port ${port}.`);
});

export default app;
