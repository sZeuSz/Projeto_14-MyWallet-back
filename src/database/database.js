import pg from 'pg';


const {Pool} = pg;

const user = 'postgres';
const password = 'admin';
const host = 'localhost';
const port = 5432;
const database = 'my_wallet_bd';

const connection = new Pool ({
    user,
    password,
    host,
    port,
    database
})

export default connection;
