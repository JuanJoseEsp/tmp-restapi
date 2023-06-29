import { Router } from "express";
import {obtenerEmpleados, obtenerEmpleado, crearEmpleado, eliminarEmpleado } from "../controllers/empleados.controllers.js";

const router = Router();

router.get("/empleados", obtenerEmpleados);

router.get("/empleados/:id", obtenerEmpleado);

router.post("/empleados", crearEmpleado);

router.delete("/empleados/:id", eliminarEmpleado);

export default router;
