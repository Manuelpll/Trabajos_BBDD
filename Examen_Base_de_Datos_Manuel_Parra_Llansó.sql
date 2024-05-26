create database bbddfy;
use bbddfy;
-- Ejercicio 1: Creacion de tablas
create  table artista(ID_artista int primary key, nombre varchar (100) not null , genero varchar (50) not null );
create  table usuario(ID_usuario int primary key , nombre varchar(100) , Email varchar (40)  unique , passwor char(20) not null , plan char not null , constraint CHK_plan check ( plan in ('FREE','PREMIUM')) , constraint not_null_Email not null (Email) );
create  table album ( ID_album int primary key , titulo varchar(100) , Fecha_lanzamiento date not null , artista int , foreign key (artista) references artista (ID_artista) );
create  table cancion (ID_cancion int primary key , titulo varchar(100) , duracion decimal (2,2) not null  constraint  duracion_minima check ( duracion < 1.20 and duracion > 20.00) , album int , artista int , foreign  key (album) references album (ID_album) on delete cascade , foreign key (artista) references artista (ID_artista));
create table playlist (ID_lista char(9) primary key , nombre varchar(50) not null , usuario int , foreign key (usuario) references usuario (ID_usuario) on update cascade );
create table cancion_playlist ( cancion int , lista char(9), foreign key (cancion) references cancion(ID_cancion) on delete cascade on update cascade, foreign key (lista) references playlist(ID_lista) on delete cascade on update cascade , constraint ID primary key (cancion,lista) );
-- c) El orden adecuado para borar las tablas sería : cancion_playlist , playlist , cancion ,album , artista , usuario

-- Ejercicio 2: Insercion de datos
insert into usuario (ID_usuario,nombre,Email, passwor, plan) values (1,"user1","user1@educa.madrid.org","BBDD","PREMIUM") , (2,"user2","user2@educa.madrid.org","BBDD","PREMIUM") , (3,"user3","user3@educa.madrid.org","BBDD","PREMIUM") ,(4,"user4","user4@educa.madrid.org","BBDD","PREMIUM") , (5,"user5","user5@educa.madrid.org","BBDD","FREE") ,(6,"user6","user6@educa.madrid.org","BBDD","PREMIUM") ,(7,"user7","user7@educa.madrid.org","BBDD","PREMIUM") ,(8,"user8","user8@educa.madrid.org","BBDD","PREMIUM");
insert into  cancion (ID_cancion , titulo, artista,album, duracion) values (1,"Copilotos","Arde Bogotá","Cowboys de la A3", 2.33) ,(2,"La salvación","Arde Bogotá","Cowboys de la A3", 4.24) , (3,"El bien","Viva Suecia","El amor de la clase que sea", 3.27) , (4,"Copenhage","Vetusta Morla","Un día en el mundo", 5.03) , (5,"Tu le das y no va","Auron Play","El botón que funciona (o no)", 2.33);
insert  into album (ID_album, titulo , artista , Fecha_lanzamiento) values (1, "Cowboys de la A3",1,"2023-05-05"),(2,"El amor de la clase que sea",2,"2022-10-07"),(3,"Un día en el mundo",3,"2008-04-19"), (4, "El botón que funciona (o no)",4,"2024-02-15");
insert into artista (nombre , ID_artista , genero) values  ("Arde Bogotá",1,"rock") , ("Vida Suecia",2,"Indie") , ("Vetusta Morla", 3,"Indie") , ("Auron Play",4,"Podcast/Humor");
insert into playlist ( usuario , ID_lista , nombre) values (1, "playlist1","User1PlayList") , (2,"playlist2","User2PlayList") ,(3,"playlist2","User3PlayList");
insert into cancion_playlist (lista , cancion) values ("playlist1",1) ,("playlist1",3) ,("playlist2",1) , ("playlist2",2) ,("playlist2",4) ,("playlist3",2) ,("playlist3",5);
-- Ejercicio 3: Modificación de datos
-- a)
update cancion set duracion= 4.50 where ID_cancion= 2;
-- Fin de a)

-- b)
update usuarios set "-ORG" in Email ;
-- Fin de b)

-- c) En este caso para aplicarle la integridad referencial actualizare la ultima cancion a otra y  añadire un nuevo artista:
update cancion set titulo="Goteo" where titulo="Tu le das y no va";
insert  into artista (ID_artista,nombre, genero) values (5,"Duki","Urbano");
update cancion set artista=5 where artista=4;
-- Fin del c)

-- d)
delete usuario where ID_usuarios= 6,7,8;
-- Fin d)

-- e)
insert into usuario (ID_usuario,nombre,Email,passwor,plan) values (6,"user6","user6@educamadrid.org","BBDD","FREE");
insert into usuario values (6,"User7","use7@educamadrid.org","BBDD","FREE");
insert into usuario (Email, nombre , plan ,ID_usuario ,passwor) values ("user8@educamadrid.org","user8","PREMIUM",8,"BBDD");
-- Fin e)

-- f) Si daría error ya que al borrar el registro del nuevo artista en la tabla cancion ya no tendría un artista selecionado la cancion "GOTEO"
delete artista where nombre="Duki";
-- Fin de f)

-- h)
update cancion set duracion*1.20 where duracion =< 3.27 ;
-- Fin de h)

-- i)
update artista set ID_artista= 13 where ID_artista= 3;
-- Fin i)
 
-- j)
 update album set Fecha_lanzamiento = STR_TO_DATE('20/4/2008', '%d/%m/%Y') where ID_album = 3;
 update album set Fecha_lanzamiento = STR_TO_DATE('17/10/2022', '%d/%m/%Y') where ID_album = 2;
-- Fin de j)
     
-- k)
update cancion set duracion=5.18 where titulo = "C";
-- Fin k)

-- Ejercicio 4 : Modificación de tablas

-- a) La nomenclatura adecuada es utilizar el add constraint con una sentecia alter per tambien se podría utilizar el modify pero sería menos adecuado
alter table cancion add constraint titulo_unico unique (titulo) ;
-- Fin a)

-- b)
alter table usuario add column fecha_registro date;
-- Fin b)

-- c)
update usuario set fecha_registro="2024-01-01";
-- Fin c)

-- d)
alter table usuario modify fecha_registro date not null
-- Fin d)

-- e)
alter table usuario rename fecha_registro to registro_fecha;
-- Fin e)

-- f)
alter table usuario drop column registro_fecha;
-- Fin f)

-- g)
rename canciones_playlist to user_playlist;
-- Fin g)

-- h)
alter table cancion drop constraint titulo_unico;
-- Fin h)

-- i)
alter table cancion modify duracion decimal(3,2);
-- Fin i)

-- j)
alter table album add constraint no_inferior_1 check( artista < 1);
-- Fin j)