import connection from "../database/database.js";
import {signInSchema} from "../schemas/users.js";
import bcrypt from 'bcrypt';

async function signInUser (req, res){

    const {
        email,
        password
    } =  req.body;

    const {error} = signInSchema.validate(req.body);

    if(error) return res.status(400).send(error.details[0].message);

    try{

        const searchUserEmail = connection.query('SELECT * FROM users WHERE email = $1', [email]);

        if(!searchUserEmail.rowCount){

            return res.status(401).send('Unauthorized user email');
        }

        const existPassword = bcrypt.compareSync(password, searchUserEmail.rows[0].password)

        if(!existPassword){

            return res.status(401).send('invalid password')
        }

        const token = uuid();

        await connection.query('INSERT INTO sessions (token, user_id) VALUES ($1, $2)', [token, searchUserEmail.rows[0].id];

        return res.status(200).send(token);
    }
    catch (error){

        return res.sendStatus(500);
    }
}

export{
    signInUser,
}