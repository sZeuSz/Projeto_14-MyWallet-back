import connection from "../database/database.js";
import {signInSchema, signUpSchema} from "../schemas/users.js";
import bcrypt from 'bcrypt';
import { v4 as uuid } from "uuid";

async function signInUser (req, res){

    const {
        email,
        password
    } =  req.body;

    try{

        const searchUserEmail = await connection.query('SELECT * FROM users WHERE email = $1', [email]);

        if(!searchUserEmail.rowCount){

            return res.status(401).send('Unauthorized user email');
        }

        const existPassword = bcrypt.compareSync(password, searchUserEmail.rows[0].password)

        if(!existPassword){

            return res.status(401).send('invalid password')
        }

        const token = uuid();

        await connection.query('INSERT INTO sessions (user_id, user_name, token) VALUES ($1, $2, $3)', [searchUserEmail.rows[0].id, searchUserEmail.rows[0].name, token]);

        return res.status(200).send(token);
    }
    catch (error){

        return res.sendStatus(500);
    }
}

async function signUpUser(req, res) {

    const {
        name,
        email,
        password,
        confirmPassword,
    } = req.body;

    const {error} = signUpSchema.validate(req.body);
   
    if(error){
        
        return res.status(400).send(error.details[0].message);
    }

    try{
        const existEmail = await connection.query('SELECT * FROM users WHERE email = $1', [email]);

        if(existEmail.rowCount){

            return res.status(401).send("Email in use");
        }

        const passwordEncryted = bcrypt.hashSync(password, 12);

        await connection.query('INSERT INTO users (name, email, password) VALUES ($1, $2, $3)', [name, email, passwordEncryted]);

        res.status(200).send('created');
    }   
    catch (error){

        return sendStatus(500);
    }

}

export{
    signInUser,
    signUpUser,
}