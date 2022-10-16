import connection from "../database/db.js"


export async function getUsers(req,res){
    try {
        const user = res.locals.user;
     const dataUsers =  await connection.query(`
        SELECT 
            id, "shortUrl", url, "visitCount"
        FROM 
            urls
        WHERE 
            "userId"=$1;
        `,[user.id]
        );
        console.log('PASSEI DA QUERY')
        let totalVisits=0;
        for(let i = 0; i < dataUsers.rows.length; i++){
            totalVisits += dataUsers.rows[i].visitCount;
        }
        return res.status(200).send({
            id:user.id,
            name: user.name,
            visitCount: totalVisits,
            shortenedUrls: dataUsers.rows

        })

        
    } catch (error) {
        return res.sendStatus(500)
    }
}