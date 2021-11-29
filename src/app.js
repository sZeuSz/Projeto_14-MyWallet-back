import express, { json } from 'express';
import cors from 'cors';
import { signInUser, signUpUser, logOutUser } from './controllers/users.js';
import { transactionsEntry, transactionsExit, transactionsHistory } from './controllers/transactions.js';

const app = express();

app.use(cors());
app.use(json());

// // Users
app.post('/mywallet/sign-in', signInUser);
app.post('/mywallet/sign-up', signUpUser);
app.get('/mywallet/log-out', logOutUser);

// // Transations getin getout
app.post('/entry', transactionsEntry);
app.post('/mywallet/exit', transactionsExit);
app.get('/mywallet/transactions', transactionsHistory);

// // listen port
export default app;
