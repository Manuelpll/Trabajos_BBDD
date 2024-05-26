CREATE DATABASE cadenaTiendas;
USE cadenaTiendas;
CREATE TABLE tienda (
	tiendaID DECIMAL(5) PRIMARY KEY,
	direccion VARCHAR(20),
	poblacion VARCHAR(20),
	provincia VARCHAR(20),
	codpostal DECIMAL(5) NOT NULL
);
insert into tienda values(1,"direc","pob","prov",28000);

CREATE TABLE fabricante (
	fabricanteID DECIMAL(5) PRIMARY KEY,
	nombre VARCHAR(20),
	nif VARCHAR(10) NOT NULL
);

CREATE TABLE articulo (
	articuloID DECIMAL(5) PRIMARY KEY,
	nombre VARCHAR(20),
	fabricanteID DECIMAL(5),
	PVD DECIMAL(7,2) DEFAULT 0,
	PVP DECIMAL(7,2) DEFAULT 0,
	FOREIGN KEY (fabricanteID) REFERENCES fabricante(fabricanteID)
);

CREATE TABLE existencia (
	existenciaID DECIMAL(6),
	tiendaID VARCHAR(20),
	articuloID VARCHAR(10),
	cantidad DECIMAL(6)
);

CREATE TABLE empleado (
    empleadoID DECIMAL(5) PRIMARY KEY,
    nombre VARCHAR(50),
    tiendaID DECIMAL(5),
    salario DECIMAL(10,2) constraint empleados_salario_chk_mayor_0 check(salario >0),
    FOREIGN KEY (tiendaID) REFERENCES tienda(tiendaID)
);
-- 1
alter table tienda add column telefono int(9);
-- 2
ALTER TABLE tienda  MODIFY codpostal INT(5);
-- 3
alter  table fabricante drop column nif;
-- 4
alter table fabricante  add column apellidos varchar(30);
-- 5
alter table articulo modify fabricanteID decimal(5) not null;
-- 6
drop table existencia;
-- 7
alter table empleado  modify nombre varchar(50) unique;
-- 8
alter  table empleado drop constraint empleados_salario_chk_mayor_0;
-- 9
alter  table tienda add column contacto varchar(20);
alter table tienda drop column telefono;
alter table tienda add column telefono varchar(15);
describe tienda;
-- 10
alter  table tienda  modify direccion varchar(40);
describe tienda;
-- 11
alter table tienda  modify direccion varchar(40) not null;
describe tienda;
-- 12
-- No se puede hacer