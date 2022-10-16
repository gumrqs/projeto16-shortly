import connection from '../database/db.js'; 
import  {  nanoid  }  from 'nanoid' 


export async function postUrls(req,res){

    try {
        const {url} = req.body;

        const token = req.headers.authorization.replace("Bearer ", "");

       const dataUser = await connection.query(`
            SELECT * FROM 
                sessions
            WHERE 
                token=$1;
        `,[token]
        );
        
        const shortUrl = nanoid(12);
        await connection.query(`
            INSERT INTO 
                urls("userId", url, "shortUrl","visitCount")
            VALUES
                ($1, $2 ,$3, $4);

        `,[dataUser.rows[0].userId, url, shortUrl, 0])
        return res.status(201).send({shortUrl:shortUrl})

    } catch (error) {
        return res.sendStatus(500)
    }
}

export async function getUrls(req,res){

    try {
        const { id } = req.params;

        if(id){
           const urlId = await connection.query(`
                SELECT * FROM 
                    urls
                WHERE 
                    id=$1;
           `,[id])

           if(urlId.rows.length ===0){
                return res.sendStatus(404)
           }
           
        return res.status(200).send({id:id, 
                                    shortUrl: urlId.rows[0].shortUrl, 
                                    url:urlId.rows[0].url});
        }

        
        
    } catch (error) {
        return res.sendStatus(500)
    }
}