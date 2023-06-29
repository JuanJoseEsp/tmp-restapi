import { Router } from "express";
import {obtenerEmpleados, obtenerEmpleado, crearEmpleado } from "../controllers/empleados.controllers.js";

const router = Router();

router.get("/empleados", obtenerEmpleados);

router.get("/empleados/:id", obtenerEmpleado);

router.post("/empleados", crearEmpleado);

export default router;
