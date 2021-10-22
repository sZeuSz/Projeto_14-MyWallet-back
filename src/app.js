import express, { json } from 'express';
import cors from 'cors';
import { signInUser, signUpUser } from './controllers/users.js';

const app = express();

app.use(cors());
app.use(json());

// //Users
app.post('/login', signInUser);
app.post('/signup', signUpUser);

// // Transations getin getout


app.listen(4000);