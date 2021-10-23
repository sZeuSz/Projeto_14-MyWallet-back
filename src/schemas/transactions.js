import joi from 'joi';

const transactionsSchema = joi.object({
    value: joi.number().min(0.01).required(),
    description: joi.string().min(4).required(),
})


export {
    transactionsSchema,
}