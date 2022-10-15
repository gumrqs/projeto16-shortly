import bcrypt from 'bcrypt';
import {v4 as uuid} from "uuid";
import connection from '../database/db.js';

export async function postSignUp(req,res){
    try {
        const {name, email, password} = req.body
        const registerUser = await connection.query(`
            SELECT * FROM 
                users
            WHERE
                email=$1;

        `,[email])
        console.log('PASSEI DO PRIMEIRO SELECT')
        if(registerUser.rows.length != 0){
            return res.status(409).send('Este email já está sendo utilizado!')
        }

        console.log('PASSEI DO PRIMEIRO if')
        const passwordHash = bcrypt.hashSync(password,10);
        await connection.query(`
            INSERT INTO 
                users(name, email, password)
            VALUES
                ($1, $2, $3)
        `,[name,email,passwordHash]
        );

        console.log('PASSEI DO SEGUNdo SELECT')
        return res.sendStatus(201);


    } catch (error) {
        
    return res.sendStatus(500);
    }
}

export async function postSignIn (req,res){
    try {
        const { email, password} = req.body;
    const verifyUser = await connection .query(`
        SELECT * FROM
            users
        WHERE 
            email=$1;
    `,[email]);
        console.log('PASSEI DO PRIMEIRO SELECR')
    const validUser = verifyUser.rows[0];
    if(verifyUser.rows.length === 0){
        return res.sendStatus(401)
    }

    const passwordValid = bcrypt.compareSync(password,validUser.password);

   
    if(verifyUser.rows.length !=0 && passwordValid){
        const token= uuid();
        await connection.query(`
            INSERT INTO 
                sessions("userId", token)
            VALUES 
                ($1,$2);
        `,[validUser.id, token]
        );
        return res.status(200).send({token:token});
    }else {
        return res.status(401).send('email ou senha inválidos')
    }

    } catch (error) {
        return res.sendStatus(500)
    }
    

    
}