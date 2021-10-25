import connection from "../database/database.js";
import { transactionsSchema } from "../schemas/transactions.js"
import dayjs from 'dayjs'


async function transactionsHistory (req, res) {

    const token = req.headers['authorization']?.replace('Bearer ', '');

    if(!token) {

        return res.status(401).send('Unauthorized');
    }
    
    try {

        const result = await connection.query(`
            SELECT sessions.user_name, sessions.user_id AS id
            FROM sessions
            JOIN users
            ON sessions."user_id" = users.id
            WHERE sessions.token = $1
        `, [token]);

        if(!result.rowCount){

            return res.status(401).send("Unauthorized");
        }

        const values = await connection.query(`

            SELECT jsonb_agg(DISTINCT jsonb_build_object('name', users.name)) 
            AS user, 
            jsonb_agg(json_build_object('value', transactions.value, 'description', transactions.description,'date', to_char(transactions.date, 'DD/MM/YYYY'))) 
            AS transactions
            FROM transactions 
            JOIN users 
            ON transactions.user_id = users.id 
            WHERE transactions.user_id = $1;

        `, [result.rows[0].id])
	

	if(!values.rows[0].user){
	    
	    return res.status(200).send(result.rows[0].user_name);
	}
	
        return res.status(200).send(values.rows);

    }
    catch (error) {

        return res.status(500);
    }
}

async function transactionsEntry (req, res) {

    const token = req.headers['authorization']?.replace('Bearer ', '');

    const {
        value,
        description,
    } = req.body;

    if(!token) {

        return res.status(401).send('Unauthorized');
    }

    const {error} = transactionsSchema.validate(req.body);

    if(error) {

        return res.status(400).send(error.details[0].message);
    }
    
    try {

        const result = await connection.query(`
            SELECT sessions.user_id AS id
            FROM sessions
            JOIN users
            ON sessions."user_id" = users.id
            WHERE sessions.token = $1
        `, [token]);

        if(!result.rowCount){

            return res.status(401).send("Unauthorized")
        }

        const date = dayjs().format('DD/MM/YYYY').substring(0, 10);
        
        await connection.query('INSERT INTO transactions (user_id, value, description, date) VALUES ($1, $2, $3, $4)', [result.rows[0].id, value, description, date]);

        return res.status(200).send("Value entered successfully!");
    }
    catch (error) {
        
        return res.sendStatus(500);
    }

}

async function transactionsExit (req, res) {

    const token = req.headers['authorization']?.replace('Bearer ', '');

    const {
        value,
        description,
    } = req.body;

    if(!token) {
        
        return res.status(401).send('Unauthorized');
    }

    const {error} = transactionsSchema.validate(req.body);

    if(error){

        return res.status(400).send(error.details[0].message);
    }

    try {
        
        const result = await connection.query(`
            SELECT sessions.user_id AS id
            FROM sessions
            JOIN users
            ON sessions."user_id" = users.id
            WHERE sessions.token = $1
        `, [token]);

        if(!result.rowCount){

            return res.status(401).send("Unauthorized");
        }
        
        const date = dayjs().format('DD/MM/YYYY').substring(0, 10);

        await connection.query('INSERT INTO transactions (user_id, value, description, date) VALUES ($1, $2, $3, $4)', [result.rows[0].id, -(value), description, date]);

        return res.status(200).send('Value entered successfully');
    }
    catch (error) {

        return res.sendStatus(500);
    }
}

export {
    transactionsEntry,
    transactionsExit,
    transactionsHistory,
}
