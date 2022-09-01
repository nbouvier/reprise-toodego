import express from 'express';
import { exec } from 'child_process';

const runProcess = (req, res, process) => {
    const args = Object.entries(req.body).map(([k, v]) => `--${k}${v ? `=${v}` : ''}`);
    const childProcess = exec(`npm run ${process} -- ${args.join(' ')}`);
    childProcess.stdout.on('data', data => console.log(data));
    childProcess.stderr.on('data', data => console.log(data));
    res.status(200).json({ res: true });
}

const router = express.Router();

router.post('/export', (req, res) => runProcess(req, res, 'export-prod'));
router.post('/import', (req, res) => runProcess(req, res, 'import-prod'));

export default router;
