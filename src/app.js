import express, { json } from 'express';
import cors from 'cors';
import { signInUser, signUpUser } from './controllers/users.js';
import { transactionsEntry, transactionsExit, transactionsHistory } from './controllers/transactions.js';

const app = express();

app.use(cors());
app.use(json());

// //Users
app.post('/login', signInUser);
app.post('/signup', signUpUser);

// // Transations getin getout
app.post('/entry', transactionsEntry);
app.post('/exit', transactionsExit);
app.get('/transactions', transactionsHistory);

app.listen(4000);