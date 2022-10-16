import { Router } from 'express';
import { deleteUrls, getShortUrl, getUrls, postUrls } from '../controllers/urlsControllers.js';
import { validateSchema } from '../middlewares/schemaValidatorMiddleware.js';
import { verifyToken } from '../middlewares/validationToken.js';
import { urlUserSchema } from '../schemas/urlSchema.js';


const urlRouter = Router();

urlRouter.post ('/urls/shorten', validateSchema( urlUserSchema ), verifyToken, postUrls);
urlRouter.get('/urls/:id', getUrls );
urlRouter.get('/urls/open/:shortUrl', getShortUrl);
urlRouter.delete('/urls/:id', verifyToken, deleteUrls);
export { urlRouter }