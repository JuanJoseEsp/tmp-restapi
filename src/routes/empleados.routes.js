import { Router } from "express";
import {obtenerEmpleados, obtenerEmpleado, crearEmpleado, modificarEmpleado, eliminarEmpleado } from "../controllers/empleados.controllers.js";

const router = Router();

router.get("/empleados", obtenerEmpleados);

router.get("/empleados/:id", obtenerEmpleado);

router.post("/empleados", crearEmpleado);

router.patch("/empleados/:id", modificarEmpleado);

router.delete("/empleados/:id", eliminarEmpleado);

export default router;
