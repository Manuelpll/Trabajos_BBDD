CREATE database IF NOT EXISTS ejercicio3;
use ejercicio3
create table if not exists ALUMNOS(alumnoID INT primary key, nombre varchar(40),dirreccion varchar(40),telefono varchar(12));
create table if not exists DEPARTAMENTOS(dptoID int primary key,nombre varchar(40));
create table if not exists ASIGNATURA(asignaturaID int primary key,nombre varchar(50),numhoras int ,precio int,dptoID int,numhoras check(1,1000),foreign key(dptoID) refereces DEPARTAMENTOS(dptoID));
create table if not exists CALIFICACIONES(calificacionID int primary key,alumnoID int,asignaturaID int,fecha date, calificacion int,foreign key (alumnoID) references ALUMNOS (alumnosID), foreign key (asignaturaID) references ASIGNATURA(asignaturaID), alumnoID unique,asignaturaID unique)
-- Lo anterior ya lo tengo puesto se haría con el insert into
insert into calificaciones (calificacionID,alumnoID,asignaturaID) values (1,2,4),(2,1,3),(3,3,6),(4,1,2),(5,2,5),(6,3,1),(7,3,4)
insert into alumnos (alumnoID, nombre, dirreccion, telefono) values (5, 'Romero Cifuentes Elena', 'Marcelo Usera 24', 624155975);
insert  into calificaciones (calificacionID,alumnoID,asignaturaID) values (8,5,4)
UPDATE calificaciones SET fecha = STR_TO_DATE('01/06/2018', '%d/%m/%Y') WHERE calificacionID = 1;
UPDATE calificaciones SET fecha = STR_TO_DATE('01/06/2018', '%d/%m/%Y') WHERE calificacionID = 2;
UPDATE calificaciones SET fecha = STR_TO_DATE('01/06/2018', '%d/%m/%Y') WHERE calificacionID = 3;
UPDATE calificaciones SET fecha = STR_TO_DATE('01/06/2018', '%d/%m/%Y') WHERE calificacionID = 4;
UPDATE calificaciones SET fecha = STR_TO_DATE('01/06/2018', '%d/%m/%Y') WHERE calificacionID = 5;
UPDATE calificaciones SET fecha = STR_TO_DATE('01/06/2018', '%d/%m/%Y') WHERE calificacionID = 6;
UPDATE calificaciones SET fecha = STR_TO_DATE('01/06/2018', '%d/%m/%Y')  WHERE calificacionID = 7;
UPDATE calificaciones SET fecha = STR_TO_DATE('01/06/2018', '%d/%m/%Y') WHERE calificacionID = 8;
UPDATE calificaciones SET calificacion = 6.25 WHERE calificacionID  = 1; 
ALTER TABLE calificaciones  MODIFY calificacion DECIMAL(10,2);
update calificaciones  set calificacion =9.25 where calificacionID  =3;
update calificaciones set calificacion =7.50 where calificacionID =6;
update calificaciones  set calificacion =5 where asignaturaID = 6;
ALTER TABLE asignatura  MODIFY precio DECIMAL(10,2);
insert into asignatura values(7,"Programacion en Python",200,500.00,1) ,insert into calificaciones (calificacionID,alumnoID,asignaturaID) values (9,1,7),(10,3,7),(11,5,7);
UPDATE asignatura SET precio = precio * 1.05 where asignaturaID=1;
UPDATE asignatura SET precio = precio * 1.05 where asignaturaID=2;
UPDATE asignatura SET precio = precio * 1.05 where asignaturaID=3;
UPDATE asignatura SET precio = precio * 1.05 where asignaturaID=4;
UPDATE asignatura SET precio = precio * 1.05 where asignaturaID=5;
UPDATE asignatura SET precio = precio * 1.05 where asignaturaID=6;
UPDATE asignatura SET precio = precio * 1.05 where asignaturaID=7;
UPDATE asignatura SET precio = precio * 1.05 where asignaturaID=8;
UPDATE asignatura SET precio = precio * 1.1 WHERE numhoras < 100;
update asignatura set precio = precio - 50  where  nombre = 'Bases de Datos';
commit;
UPDATE calificaciones SET calificacion = 0 WHERE calificacion IS NULL;
update asignatura  set dptoID=1 where asignaturaID = 5;
update asignatura  set dptoID=1 where asignaturaID = 6;
DELETE departamentos WHERE dptoID = 3;
rollback;
