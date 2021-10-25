import app from '../src/app.js';
import supertest from 'supertest';
import connection from '../src/database/database.js';
import bcrypt from 'bcrypt';

beforeAll(async () => {
    await connection.query("DELETE FROM users");
    await connection.query("DELETE FROM sessions");
    await connection.query("DELETE FROM transactions");
})

afterAll(async () => {
    await connection.query("DELETE FROM users");
    await connection.query("DELETE FROM sessions");
    await connection.query("DELETE FROM transactions");

    connection.end();
})

describe("POST /mywallet/sign-in user", () => {

    beforeEach(async () => {
        await connection.query("INSERT INTO users (name, email, password) VALUES ($1, $2, $3)", ["rosenildo", "rosenildo@hotmail.com", bcrypt.hashSync("password", 12)])
    })

    afterEach(async () => {
        await connection.query("DELETE FROM users WHERE email = $1", ["rosenildo@hotmail.com"])

    })

    it("returns 400 for invalid params in body", async() => {
        const body = {
          email: "juninho@gmail.com",
        //   password: "123456"
        };

        const result = await supertest(app).post("/mywallet/sign-in").send(body);
        const status = result.status;
        
        expect(status).toEqual(400);
    });

    
    it('should return 401 when email doesnt exists or password invalid', async () => {

        const body = {
            email: "juninho@gmail.com",
            password: "123456"
        }

        const result = await supertest(app).post("/mywallet/sign-in").send(body)
        expect(result.status).toEqual(401)
    })
    
    it('should return 401 when invalid password', async () => {
        const body = {
            email: "driven@driven.com",
            password: "coancksjn"
        }

        const result = await supertest(app).post('/mywallet/sign-in').send(body)
        expect(result.status).toEqual(401)
    })

    it('should return 200 when valid credentials', async () => {
        const body = {
            email: "rosenildo@hotmail.com",
            password: "password"
        }

        const result = await supertest(app).post('/mywallet/sign-in').send(body)
        expect(result.status).toEqual(200)
        expect(result.body).toHaveProperty('token')
        expect(result.body).toEqual(expect.objectContaining({
            token: expect.any(String)
        }))
    })
})

describe ("POST /mywallet/sing-up user", () => {

    beforeEach(async () => {
        await connection.query("INSERT INTO users (name, email, password) VALUES ($1, $2, $3)", ["rosenildo", "rosenildo@hotmail.com", bcrypt.hashSync("password", 12)])
    })

    afterEach(async () => {
        await connection.query("DELETE FROM users WHERE email = $1", ["rosenildo@hotmail.com"])

    })

    it("returns 400 invalid body, Empty body", async () => {    

        const result = await supertest(app).post("/mywallet/sign-up").send({});

        expect(result.status).toEqual(400);
    });

    it("returns 201 valid body, create user", async () => {

        const body = {
            name: "jenifi",
            email: "jenifi@gmail.com",
            password: "12345678"
        }

        const resul = await supertest(app).post('/mywallet/sign-up').send(body);

        expect(resul.status).toEqual(201);
    })


    it("returns 409 for email has been used", async () => {

        const body = {
            name: "rosenildo2",
            email: "rosenildo@hotmail.com",
            password: "123456"
        }

        const resul = await supertest(app).post('/mywallet/sign-up').send(body);

        expect(resul.status).toEqual(409);
    });
})