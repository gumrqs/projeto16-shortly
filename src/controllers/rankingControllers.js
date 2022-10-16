
import connection from "../database/db.js";

export async function getRanking(req, res){
    try {
        const rankingUser = await connection.query(`
            SELECT  
              users.id, users.name, 
              COUNT(urls.id) as "linksCount", 
              SUM(urls."visitCount") as "visitCount"
            FROM 
                users
            LEFT JOIN
                urls
              ON   
            users.id=urls."userId" 
            GROUP BY 
                users.id 
            ORDER BY SUM(urls."visitCount") DESC NULLS LAST LIMIT 10;
        `)
        for(let i=0; i<rankingUser.rows.length; i++){

            if(rankingUser.rows[i].visitCount === null){
                rankingUser.rows[i].visitCount='0'
            }   
        }
        return res.status(200).send(rankingUser.rows)
    } catch (error) {
        return res.sendStatus(500)
    }
}