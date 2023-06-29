import { pool } from "../db.js";

export const obtenerEmpleados = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM empleado");
    res.json(rows);
  } catch (error) {
    return res.status(500).json({
      mensaje: "Algo salio mal",
    });
  }
};

export const obtenerEmpleado = async (req, res) => {
  try {
    const [rows] = await pool.query(
      "SELECT * FROM empleado WHERE id_empleado = ?",
      [req.params.id]
    );
    if (rows.length <= 0) {
      return res.status(404).json({
        mensaje: "Empleado no encontrado",
      });
    }
    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({
      mensaje: "Algo salio mal",
    });
  }
};

export const crearEmpleado = async (req, res) => {
  const {
    nombre,
    apellidos,
    edad,
    telefono,
    direccion,
    salario,
    fecha_contratacion,
    id_rol_empleado,
  } = req.body;
  try {
    const [rows] = await pool.query(
      "INSERT INTO empleado (nombre, apellidos, edad, telefono, direccion, salario, fecha_contratacion, id_rol_empleado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
      [
        nombre,
        apellidos,
        edad,
        telefono,
        direccion,
        salario,
        fecha_contratacion,
        id_rol_empleado,
      ]
    );

    res.send({
      id: rows.insertId,
      nombre,
      apellidos,
      edad,
      telefono,
      direccion,
      salario,
      fecha_contratacion,
      id_rol_empleado,
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: "Algo salio mal",
    });
  }
};

export const eliminarEmpleado = async (req, res) => {
  try {
    const [result] = await pool.query(
      "DELETE FROM empleado WHERE id_empleado = ?",
      [req.params.id,]
    );
    if (result.affectedRows > 0) {
      return res.send("El empleado se ha borrado correctamente");
    }
    res.status(404).json({ mensaje: "Empleado no encontrado" });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      mensaje: "Algo salio mal",
    });
  }
};
