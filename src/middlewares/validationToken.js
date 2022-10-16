import connection from '../database/db.js'; 


export function verifyToken(req,res){

    const authorization = req.headers.authorization;
    const token = authorization?.replace("Bearer", "")

    if(!token){
        return res.sendStatus(401);
    }
    next();
}