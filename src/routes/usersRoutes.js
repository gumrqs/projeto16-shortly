import { Router } from 'express';
import { getUsers } from '../controllers/usersControllers.js';
import { verifyToken } from '../middlewares/validationToken.js';

const usersRouter = Router();

usersRouter.get('/users/me', verifyToken, getUsers);

export { usersRouter }