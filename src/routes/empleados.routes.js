import { Router } from "express";
import { obtenerEmpleados } from "../controllers/empleados.controllers.js";

const router = Router();

router.get("/empleados", obtenerEmpleados);

export default router;
