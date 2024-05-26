
use prueba

CREATE TABLE `medico` (
  `codigo_medico` varchar (9) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_medico`)
)

CREATE TABLE `paciente` (
  `codigo_paciente` varchar (9) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_paciente`)
)


create table ingreso(
codigo int (12) primary key,
fecha date,
habitacion int (4) not null,
codigo_paciente varchar (9),
codigo_medico  varchar (9),
foreign key (codigo_paciente) references paciente (codigo_paciente),
foreign key (codigo_medico) references medico (codigo_medico) 
)