import connection from '../database/db.js'; 
import  { nanoid }  from 'nanoid'


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
           `,[id]);

           if(urlId.rows.length === 0){
                return res.sendStatus(404);
           }

        return res.status(200).send({id:id, 
                                    shortUrl: urlId.rows[0].shortUrl, 
                                    url:urlId.rows[0].url});
        }
        
    } catch (error) {
        return res.sendStatus(500)
    }
}

export async function getShortUrl(req,res){
    try {

        const { shortUrl } = req.params;
        if(shortUrl){
            const verifyShortUrl = await connection.query(`
                SELECT * FROM
                    urls
                WHERE
                    "shortUrl"=$1;
            `,[shortUrl]
            );
                console.log('PSSSEI DA PRIMEIRA')
            if(verifyShortUrl.rows.length === 0){
                
                return res.sendStatus(404);

            }else { console.log('OIASA')
              const teste =   await connection.query(`
                    UPDATE
                        urls
                    SET
                        "visitCount"=$1
                    WHERE
                        id=$2;
                `,[(verifyShortUrl.rows[0].visitCount + 1),verifyShortUrl.rows[0].id]
                ); console.log(teste, 'ABLUSLSDOAK***')
                return res.redirect(301, verifyShortUrl.rows[0].url);
                
            }
           
            
        }
    } catch (error) {
        return res.sendStatus(500);
    }
}

export async function deleteUrls(req, res){

    try {
        const { id } = req.params;
            if(id){
                const verifyIdUrl = await connection.query(`
                    SELECT * FROM 
                        urls
                    WHERE 
                        id=$1;
                `,[id]
                );
                
                if(verifyIdUrl.rows.length === 0){
                    return res.sendStatus(404);
                }
                const user = res.locals.user;
                
            if(verifyIdUrl.rows[0].userId === user.id){

                console.log(    'passei do if')
                await connection.query(`
                    DELETE FROM 
                        urls
                    WHERE 
                        id=$1;
                `,[id]
                );
                return res.sendStatus(204);
            } else {
                return res.sendStatus(401)
            }
        
                
            }
    } catch (error) {
        return res.sendStatus(500);
    }
}