import { Router } from "express";
import { authRouter } from "./authRoutes.js";
import { urlRouter } from "./urlRoutes.js";
import { usersRouter } from "./usersRoutes.js";


const router = Router();
router.use(authRouter);
router.use(urlRouter);
router.use(usersRouter)

export default router;
