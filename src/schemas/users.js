import joi from "joi";

const signInSchema = joi.object({
    email: joi.string().required(),
    password: joi.string().min(4).required(),
})

const signUpSchema = joi.object({
    name: joi.string().required(),
    email: joi.string().pattern(new RegExp("^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$")).required(),
    password: joi.string().min(4).required(),
    confirmPassword: joi.ref('password')
})

export {
    signInSchema,
    signUpSchema,
}