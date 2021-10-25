import app from '../src/app.js';
import supertest from 'supertest';

describe("POST /mywallet/sign-in user", () => {
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
            password: "123456"
        }

        const result = await supertest(app).post('/mywallet/sign-in').send(body)
        expect(result.status).toEqual(200)
        expect(result.body).toHaveProperty('token')
        expect(result.body).toEqual(expect.objectContaining({
            token: expect.any(String)
        }))
    })
})
