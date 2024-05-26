CREATE database if not exists pokemon;
use pokemon;

create table if not exists grupoHuevo (
    IDgrupo int primary key,
    nombre varchar(20) not null,
    puedeCriar BOOLEAN
);

create table if not exists pokemon (
    PID int primary key,
    nombre varchar(50) not null,
    altura int not null,
    peso int not null,
    fechaObtenido timestamp not null,
    fechaIntroducido date not null,
    EO varchar(20) not null,
    cintas int not null,
    ataque int not null,
    defensa int not null,
    ataqueEsp int not null,
    defensaEsp int not null,
    pSalud int not null,
    velocidad int not null,
    IV int not null,
    EV int not null,
    exp int not null,
    IDgrupo int,
    foreign key (IDgrupo) references grupoHuevo(IDgrupo) ON DELETE SET null,
    CONSTRAINT CHK_values CHECK (IV>= 0 and IV <= 168 and EV >= 0 and EV <= 255),
    CONSTRAINT CHK_salud CHECK (pSalud > 0)
);

create table if not exists habilidad (
    hID int primary key,
    nombre varchar(20) not null,
    descripcion varchar (100)
);

create table if not exists tipo (
    IDtipo int primary key,
    nombreTipo varchar(20) not null,
    eficaz int,
    pocoEficaz int,
    debil int
);

create table if not exists movimiento (
    IDmov int primary key,
    nombre varchar(20) not null,
    IDtipo int not null,
    potencia int,
    precisionMov int not null,
    efecto varchar(100) not null,
    foreign key (IDtipo) references tipo(IDtipo) on delete cascade,
    constraint CHK_precision CHECK (precisionMov>0 and precisionMov<=100)
);

create table if not exists evoluciona (
    PIDevolucion int not null,
    método char(7),
    nivel int,
    PIDevolucionado int not null,
    descripcion varchar(100),
    foreign key (PIDevolucionado) references pokemon(PID) ON DELETE cascade,
    foreign key (PIDevolucion) references pokemon(PID) ON DELETE cascade,
    CONSTRAINT pk_evol primary key (PIDevolucion, PIDevolucionado),
    CONSTRAINT CHK_metodo  CHECK (método in ('NIVELES', 'PIEDRAS', 'AMISTAD', 'CAMBIOS', 'OBJETOS'))
);

create table if not exists tieneTipo (
    PID int not null,
    IDtipo int not null,
    dobleTipo BOOLEAN,
    foreign key (PID) references pokemon(PID) ON DELETE cascade,
    foreign key (IDtipo) references tipo(IDtipo) ON DELETE cascade,
    constraint pk_tieneTipo primary key (PID, IDtipo)
);

create table if not exists aprendeMovimiento (
    PID int,
    IDmov int,
    nivel int,
    aprendeMT BOOLEAN,
    foreign key (PID) references pokemon(PID) ON DELETE CASCADE,
    foreign key (IDmov) references movimiento(IDmov) ON DELETE cascade,
    constraint pk_aprendeMov primary key (PID, IDmov)
);

create table if not exists adquiereHabilidad (
    PID int not null,
    hID int not null,
    esOculta BOOLEAN,
    foreign key (PID) references pokemon(PID) ON DELETE cascade,
    foreign key (hID) references habilidad(hID) ON DELETE cascade,
    constraint pk_adquiereHabilidad primary key (PID,hID)
);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (1, 'Acero', 8, 1, 7);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (2, 'Agua', 7, 2, 5);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (3, 'Bicho', 12, 1, 7);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (4, 'Dragón', 4, 1, 8);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (5, 'Electrico', 2, 4, 16);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (6, 'Fantasma', 6, 11, 15);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (7, 'Fuego', 1, 2, 14);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (8, 'Hada', 4, 17, 1);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (9, 'Hielo', 18, 2, 14);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (10, 'Lucha', 14, 6, 13);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (11, 'Normal', 0, 6, 10);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (12, 'Planta', 2, 3, 17);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (13, 'Psiquico', 10, 15, 13);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (14, 'Roca', 3, 16, 1);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (15, 'Siniestro', 6, 10, 8);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (16, 'Tierra', 2, 18, 9);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (17, 'Veneno', 8, 1, 13);

insert into tipo (IDtipo, nombreTipo, eficaz, pocoeficaz, debil)
values (18, 'Volador', 10, 5, 9);

insert into grupoHuevo (IDgrupo, nombre, puedeCriar)
values (8, 'Agua', true);

insert into grupoHuevo (IDgrupo, nombre, puedeCriar)
values (13, 'Dragon', true);

insert into grupoHuevo (IDgrupo, nombre, puedeCriar)
values (2, 'Bicho', true);

insert into grupoHuevo (IDgrupo, nombre, puedeCriar)
values (1, 'Desconocido', false);

insert into pokemon (PID, nombre, altura, peso, fechaObtenido, fechaIntroducido, EO, cintas, ataque, defensa, ataqueEsp, defensaEsp, psalud, velocidad, IV, EV, exp, IDgrupo)
values (149, 'Dragonite', 2, 210, '1996-2-27', '1996-3-30', '10 ANIV', 2, 134, 95, 100, 100, 91, 80, 31, 252, 1250000, 13);

insert into habilidad (HID, nombre, descripcion)
values (39, 'Inner Focus', 'Evita que el Pokemon sea afectado por Intimidacion');

insert into movimiento (IDmov, nombre, IDtipo, potencia, precisionMov, efecto)
values (63, 'Hiperrayo', 11, 120, 90, 'Si Hiperrayo golpea al oponente el usuario descansara el siguiente turno');

insert into tieneTipo (PID, IDtipo, dobleTipo)
values (149, 4, 18);

insert into aprendeMovimiento (PID, IDmov, nivel, aprendeMT)
values (149, 63, 75, true);

insert into adquiereHabilidad (PID, HID, esOculta)
values (149, 39, false);

insert into pokemon (PID, nombre, altura, peso, fechaObtenido, fechaIntroducido, EO, cintas, ataque, defensa, ataqueEsp, defensaEsp, psalud, velocidad, IV, EV, exp, IDgrupo)
values (589, 'Escavalier', 1, 33, '2010-9-18', '2011-10-19', 'Germán', 2, 135, 105, 60, 105, 70, 20, 20, 120, 1900000, 2);

insert into habilidad (HID, nombre, descripcion)
values (69, 'Enjambre', 'Aumenta la potencia de movimientos de tipo bicho en 50% cuando su salud este por debaja de un 1/3');

insert into movimiento (IDmov, nombre, IDtipo, potencia, precisionMov, efecto)
values (162, 'Zumbido', 3, 90, 100, 'Movimiento que causa daño y tiene una probabilidad del 10% de bajar defensa especial');

insert into tieneTipo (PID, IDtipo, dobleTipo)
values (589, 3, 1);

insert into aprendeMovimiento (PID, IDmov, nivel, aprendeMT)
values (589, 162, 75, true);

insert into adquiereHabilidad (PID, HID, esOculta)
values (589, 39, false);

insert into pokemon (PID, nombre, altura, peso, fechaObtenido, fechaIntroducido, EO, cintas, ataque, defensa, ataqueEsp, defensaEsp, psalud, velocidad, IV, EV, exp, IDgrupo)
values (809, 'Melmetal',2, 800, '2018-11-16', '2019-12-31', 'Manuel', 1, 143, 143, 80, 65, 135, 34, 23, 234, 6100000, 1);

insert into habilidad (HID, nombre, descripcion)
values (89, 'Puño Férreo', 'Aumenta 20% los ataques basados en puños');

insert into movimiento (IDmov, nombre, IDtipo, potencia, precisionMov, efecto)
values (15, 'Hiperrayo', 11, 150, 90, 'Movimiento que causa daño sin efecto secundario');

insert into tieneTipo (PID, IDtipo, dobleTipo)
values (809, 1, false);

insert into aprendeMovimiento (PID, IDmov, nivel, aprendeMT)
values (809, 89, 75, true);

insert into adquiereHabilidad (PID, HID, esOculta)
values (809, 39, false);

insert into pokemon (PID, nombre, altura, peso, fechaObtenido, fechaIntroducido, EO, cintas, ataque, defensa, ataqueEsp, defensaEsp, psalud, velocidad, IV, EV, exp, IDgrupo)
values (808, 'Meltan', 1, 8, '2018-11-16', '2020-10-3', 'Francesco', 1, 65, 65, 55, 35, 46, 34, 27, 127, 1800000, 1);

insert into habilidad (HID, nombre, descripcion)
values (42, 'Iman', 'Impide que oponentes de tipo acero huyan del combate o sean cambiados');

insert into movimiento (IDmov, nombre, IDtipo, potencia, precisionMov, efecto)
values (430, 'Foco Resplandor', 1, 80, 100, 'Causa daño y tiene una probabilidad el 10% de bajar defensa especial');

insert into tieneTipo (PID, IDtipo, dobleTipo)
values (808, 1, false);

insert into evoluciona (PIDevolucion, método, nivel, PIDevolucionado, descripcion)
values (809, 'CARAMEL', 1, 808, 'Evoluciona excusivamente en Pokémon GO por 100 caramelos Meltan.');

insert into aprendeMovimiento (PID, IDmov, nivel, aprendeMT)
values (808, 430, 40, true);

insert into adquiereHabilidad (PID, HID, esOculta)
values (808, 42, false);

insert into pokemon (PID, nombre, altura, peso, fechaObtenido, fechaIntroducido, EO, cintas, ataque, defensa, ataqueEsp, defensaEsp, psalud, velocidad, IV, EV, exp, IDgrupo)
values (588, 'Karrablast', 1, 6, '2010-9-18', '2011-10-19', 'SMR2011', 1, 75, 45, 40, 45, 50, 60, 15, 138, 500000, 2);

insert into habilidad (HID, nombre, descripcion)
values (99, 'Indefenso', 'Todos los movimientos por o contra el poseedor nunca fallen');

insert into movimiento (IDmov, nombre, IDtipo, potencia, precisionMov, efecto)
values (162, 'Zumbido', 3, 90, 100, 'Movimiento que causa daño y tiene una probabilidad del 10% de bajar defensa especial');

insert into tieneTipo (PID, IDtipo, dobleTipo)
values (588, 3, false);

insert into evoluciona (PIDevolucion, método, nivel, PIDevolucionado, descripcion)
values (589,'CAMBIOS', 1, 588, 'Evoluciona a Escavalier al ser intercambiado por un Shelmet.');

insert into aprendeMovimiento (PID, IDmov, nivel, aprendeMT)
values (588, 162, 44, true);

insert into adquiereHabilidad (PID, HID, esOculta)
values (588, 99, true);

insert into pokemon (PID, nombre, altura, peso, fechaObtenido, fechaIntroducido, EO, cintas, ataque, defensa, ataqueEsp, defensaEsp, psalud, velocidad, IV, EV, exp, IDgrupo)
values (148, 'Dragonair', 4, 16,'1996-2-27', '1996-3-30', '10 ANIV', 1, 84, 65, 70, 70, 61, 70, 31, 252, 8);

insert into habilidad (HID, nombre, descripcion)
values (63, 'Escama Especial', 'Aumenta la defensa del poseedor en u 50%')

insert into movimiento (IDmov, nombre, IDtipo, potencia, precisionMov, efecto)
values (407, 'Carga Dragon', 4, 100, 75, 'Tiene una probabilidad del 20% de hacer retroceder al rival'):

insert into tieneTipo (PID, IDtipo, dobleTipo)
values (148, 4, false);

insert into evoluciona (PIDevolucion, método, nivel, PIDevolucionado, descripcion)
values (149, 'NIVELES', 55, 148, 'Evoluciona al subir al nivel 55 o superior.');

insert into aprendeMovimiento (PID, IDmov, nivel, aprendeMT)
values (148, 407, 47, true);

insert into adquiereHabilidad (PID, HID, esOculta)
values (148, 63, true);
select  eficaz  from tipo where IDtipo = 2;
