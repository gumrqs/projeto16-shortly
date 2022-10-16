import connection from '../database/db.js'; 


export async function verifyToken(req,res, next){

    const authorization = req.headers.authorization;
    const token = authorization?.replace("Bearer ", "")
    
    if(!token){
        return res.sendStatus(401);
    }
    const sessions =  await connection.query(`
        SELECT * FROM 
            sessions
        WHERE 
            token=$1;
    `,[token]
    );

    if(sessions.rows.length === 0){
        return res.sendStatus(401);
    }else{
        const user = await connection.query(`
            SELECT * FROM 
                users
            WHERE 
                id=$1;
        `, [sessions.rows[0].userId]
        );

        delete user.rows[0].password;

        res.locals.user=user.rows[0];
        res.locals.token=token;
    }

    next();
}