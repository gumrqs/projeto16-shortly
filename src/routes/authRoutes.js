import { Router } from 'express';
import { postSignIn, postSignUp } from '../controllers/authControllers.js';
import { validateSchema } from '../middlewares/schemaValidatorMiddleware.js';
import { loginSchema } from '../schemas/SignInSchema.js';
import { registerSchema } from '../schemas/signUpSchema.js';

const authRouter = Router();


authRouter.post('/signup',validateSchema(registerSchema), postSignUp);
authRouter.post('/signin',validateSchema(loginSchema), postSignIn);

export { authRouter }