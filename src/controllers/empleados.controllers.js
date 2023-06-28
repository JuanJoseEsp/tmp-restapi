import { pool } from "../db.js";

export const obtenerEmpleados = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM empleado");
    res.json(rows);
  } catch (error) {
    return res.status(500).json({
        mensaje: "Algo salio mal"
    });
  }
};

export const crearEmpleado = (req, res) =>{

};
