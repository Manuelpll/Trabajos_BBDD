
create database empresa

use empresa
create table pub(cod_pub varchar(9) primary key,  nombre varchar  (20) not null,licencia_fiscal varchar (12) not null,domicilio varchar (40), fecha_apertura date not null,horario varchar (10) check(horario=('HOR1'or'HOR2'or'HOR3')),cod_localidad int (5) not null,foreign key (cod_localidad) references localidad(cod_localidad) )

create table titular(DNI_titular varchar (9) primary key ,nombre varchar (20) not null, domicilio varchar(40), cod_pub varchar(9) not null,foreign key (cod_pub) references pub (cod_pub))

create table empleado(DNI_empleado varchar (9) primary key,nombre varchar (20) not null, domicilio varchar (40) )

create table existencias (cod_articulos varchar (5) primary key,nombre varchar (20) not null, cantidad int (6) not null, precio int (5) not null, cod_pub varchar(9) not null , foreign key (cod_pub) references pub (cod_pub) )

create table localidad(cod_localidad int (5) primary key , nombre varchar (20) not null)

create table pub_empleado(cod_pub varchar(9) not null, dni_empleado varchar (9), funcion varchar (8) check(funcion =('camarero'or'seguridad'or'limpieza') )


