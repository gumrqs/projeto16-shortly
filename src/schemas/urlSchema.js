import joi from 'joi';

const urlUserSchema = joi.object({ 
    url: joi.string().uri().required()
    
});


export {
    urlUserSchema
}