import express, { json } from 'express';
import cors from 'cors';
import { signInUser } from './controllers/users.js';

const app = express();

app.use(cors);
app.use(json);

//Users
app.post('/login', signInUser);

app.listen(4000);