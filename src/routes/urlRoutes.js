import { Router } from 'express';
import { getUrls, postUrls } from '../controllers/urlsControllers.js';
import { validateSchema } from '../middlewares/schemaValidatorMiddleware.js';
import { urlUserSchema } from '../schemas/urlSchema.js';


const urlRouter = Router();

urlRouter.post ('/urls/shorten', validateSchema( urlUserSchema ), postUrls);
urlRouter.get('/urls/:id', getUrls )
export { urlRouter }