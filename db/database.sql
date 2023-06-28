/*Esta base de datos fue creada para satisfacer la necesidad de contar con un sistema de registro y 
gestión de un negocio familiar dedicado a la reparación de camiones pesados. Surgió como respuesta 
a la falta de un sistema previo que permitiera llevar un seguimiento adecuado de todas las operaciones 
y elementos presentes en el negocio. Debido a la ausencia de registros previos, fue necesario comenzar 
desde cero y reconstruir toda la información que se había perdido..
*/
//Creacion de base de datos
CREATE DATABASE tmpdb;

//Creacion de tablas

CREATE TABLE `rol_empleado` (
  `id_rol_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(45) NOT NULL,
  PRIMARY KEY (`id_rol_empleado`)
);

CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `edad` varchar(45) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `salario` decimal(8,2) NOT NULL,
  `fecha_contratacion` date NOT NULL,
  `id_rol_empleado` int NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_rol_empleado_idx` (`id_rol_empleado`),
  CONSTRAINT `id_rol_empleado` FOREIGN KEY (`id_rol_empleado`) REFERENCES `rol_empleado` (`id_rol_empleado`)
);

CREATE TABLE `refaccion` (
  `id_refaccion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(30) DEFAULT NULL,
  `numero_piezas` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `numero_refaccionaria` tinyint DEFAULT NULL,
  `mueble` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_refaccion`)
);


CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
);

CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_refaccion` int NOT NULL,
  `numero_piezas`int NOT NULL,
  `fecha_venta` date NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_refaccion_idx` (`id_refaccion`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `id_refaccion` FOREIGN KEY (`id_refaccion`) REFERENCES `refaccion` (`id_refaccion`)
);

CREATE TABLE `reparacion` (
  `id_reparacion` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `id_venta` int NOT NULL,
  `precio_reparacion` decimal(10,2) NOT NULL,
  `fecha_reparacion` date NOT NULL,
  `observaciones` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_reparacion`),
  KEY `id_empleado_idx` (`id_empleado`),
  KEY `id_venta_idx` (`id_venta`),
  CONSTRAINT `id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `id_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`)
);

//Llenado de tablas
//Llenado tabla rol_empleado
INSERT INTO rol_empleado (nombre_rol) VALUES ('Mecánico');
INSERT INTO rol_empleado (nombre_rol) VALUES ('Contador');
INSERT INTO rol_empleado (nombre_rol) VALUES ('Administrativo');

//Llenado tabla empleado
INSERT INTO empleado (nombre, Apellidos, edad, telefono, direccion, salario, fecha_contratacion, id_rol_empleado)
VALUES ('Manuel Alejandro', 'Perez Soza', '27','4923214321','Calle nova#123 Col.Buenos aires Cp 98031 Zacatecas,zacatecas',
'8000.00' ,'2023-06-12', 1);
INSERT INTO empleado (nombre, Apellidos, edad, telefono, direccion, salario, fecha_contratacion, id_rol_empleado)
VALUES ('Diana', 'Lopez Caldera', '37','4924024321','Calle parcela#123 Col.Las americas Cp 98051 Zacatecas,zacatecas',
'15000.00' ,'2023-01-22', 2);
INSERT INTO empleado (nombre, Apellidos, edad, telefono, direccion, salario, fecha_contratacion, id_rol_empleado)
VALUES ('Raul', 'Romero Chavez', '23','4921234321','Calle roma#123 Col.Italia Cp 98762 Zacatecas,zacatecas',
'7000.00' ,'2022-08-14', 3);

//Llenado tabla refaccion
INSERT INTO refaccion (nombre, marca, modelo, numero_piezas, precio, numero_refaccionaria, mueble) 
VALUES ('Amortiguador', 'Monroe', '72937', 20, 4000.00, 4, 1); 
INSERT INTO refaccion (nombre, marca, modelo, numero_piezas, precio, numero_refaccionaria, mueble) 
VALUES ('Abrazadera 3/4', 'Monroe', 'AB-23142', 30, 500.00, 1, 2); 
INSERT INTO refaccion (nombre, marca, modelo, numero_piezas, precio, numero_refaccionaria, mueble) 
VALUES ('Rondana 7/8', 'Good Year', 'R-422134', 2000, 2.00, 2, 1); 

//Llenado tabla cliente
INSERT INTO cliente (nombre, apellidos, telefono, email) 
VALUES('Mario Roman', 'Sanchez Garcia', '4921305234', 'marioRSG@gmail.com');
INSERT INTO cliente (nombre, apellidos, telefono, email) 
VALUES('Miguel', 'Almarasz Sifuentes', '4925315136', 'miguelAS@gmail.com');
INSERT INTO cliente (nombre, apellidos, telefono) 
VALUES('Sonia', 'Ramirez Garcia', '4921003421');

//Llenado tabla venta
INSERT INTO venta (id_cliente, id_refaccion, numero_piezas,fecha_venta)
VALUES(1,1,3,'2023-06-27');

//Lenado tabla reparacion
INSERT INTO reparacion (id_empleado, id_venta, precio_reparacion, fecha_reparacion)
VALUES(1,1,5000.00,'2023-06-27');
