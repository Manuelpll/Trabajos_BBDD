CREATE database IF NOT EXISTS ejercicio3;
use ejercicio3
create table if not exists ALUMNOS(alumnoID INT primary key, nombre varchar(40),dirreccion varchar(40),telefono varchar(12));
create table if not exists DEPARTAMENTOS(dptoID int primary key,nombre varchar(40));
create table if not exists ASIGNATURA(asignaturaID int primary key,nombre varchar(50),numhoras int ,precio int,dptoID int,numhoras check(1,1000),foreign key(dptoID) refereces DEPARTAMENTOS(dptoID));
create table if not exists CALIFICACIONES(calificacionID int primary key,alumnoID int,asidnaturaID int,fecha date, calificacion int,foreign key (alumnoID) references ALUMNOS (alumnosID), foreign key (asignaturaID) references ASIGNATURA(asignaturaID), alumnoID unique,asignaturaID unique) 