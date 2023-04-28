CREATE DATABASE IF NOT EXISTS reproductor1;
use reproductor1;
#-------------------Creando tablas--------------------#
CREATE TABLE IF NOT EXISTS artista(
id_artista INT NOT NULL,
nombre Varchar(50),
PRIMARY KEY(id_artista)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS genero(
id_genero INT NOT NULL,
nombre Varchar(50), 
PRIMARY KEY(id_genero)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS album(
id_album INT NOT NULL,
nombreAlbum Varchar(50),
id_artista INT NOT NULL,
PRIMARY KEY(id_album),
FOREIGN KEY(id_artista)
REFERENCES artista(id_artista)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS sencillo(
id_sencillo INT NOT NULL,
nombre Varchar(50),
duracion FLOAT NOT NULL,
PRIMARY KEY(id_sencillo)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS asignarSencillo(
id_asignarS INT NOT NULL,
id_genero INT NOT NULL,
id_sencillo INT NOT NULL,
PRIMARY KEY(id_asignarS),
FOREIGN KEY(id_genero)
REFERENCES genero(id_genero),
FOREIGN KEY(id_sencillo)
REFERENCES sencillo(id_sencillo)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS asignarAlbum(
id_asignarA INT NOT NULL,
id_genero INT NOT NULL,
id_album INT NOT NULL,
PRIMARY KEY(id_asignarA),
FOREIGN KEY(id_genero)
REFERENCES genero(id_genero),
FOREIGN KEY(id_album)
REFERENCES album(id_album)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS usuarios(
id_usuarios INT NOT NULL,
nombre Varchar(50),
pais Varchar(50),
usuario Varchar(50),
clave Varchar(50),
fecha_nacimiento DATE,
PRIMARY KEY(id_usuarios)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS formasPago(
id_formasP INT NOT NULL,
nombre Varchar(50),
PRIMARY KEY(id_formasP)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS planesPago(
id_planes INT NOT NULL,
nombre Varchar(50),
precio INT NOT NULL,
duracion Varchar(50),
PRIMARY KEY(id_planes)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS asignacionPagos(
id_pago INT NOT NULL,
id_usuarios INT NOT NULL,
id_planes INT NOT NULL,
id_formasP INT NOT NULL,
PRIMARY KEY(id_pago),
FOREIGN KEY(id_usuarios)
REFERENCES usuarios(id_usuarios),
FOREIGN KEY(id_planes)
REFERENCES planesPago(id_planes),
FOREIGN KEY(id_formasP)
REFERENCES formasPago(id_formasP)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS asignacion_sencillo_album(
id_asignar INT NOT NULL,
id_sencillo INT NOT NULL,
id_album INT NOT NULL,
PRIMARY KEY (id_asignar),
FOREIGN KEY(id_sencillo)
REFERENCES sencillo(id_sencillo),
FOREIGN KEY (id_album)
REFERENCES album(id_album)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS listaReproduccion(
id_lista INT NOT NULL,
id_usuarios INT NOT NULL,
id_sencillo INT NOT NULL,
reproducciones INT NOT NULL,
PRIMARY KEY(id_lista),
FOREIGN KEY(id_usuarios)
REFERENCES usuarios(id_usuarios),
FOREIGN KEY(id_sencillo)
REFERENCES sencillo(id_sencillo)
)ENGINE=INNODB;

# - - - - - - Creando Datos - - - - - - #

#ARTISTA
insert into artista(id_artista, nombre)
values(1, 'Eladio Carrion');
insert into artista(id_artista, nombre)
values(2, 'Bad Bunny');
insert into artista(id_artista, nombre)
values(3, 'Maluma');
insert into artista(id_artista, nombre)
values(4, 'Vicente Fernandez');
insert into artista(id_artista, nombre)
values(5, 'Nicky Minaj');

#GENERO
insert into genero(id_genero, nombre)
values(1, 'Metal');
insert into genero(id_genero, nombre)
values(2, 'Rock');
insert into genero(id_genero, nombre)
values(3, 'Reggaeton');
insert into genero(id_genero, nombre)
values(4, 'K Pop');
insert into genero(id_genero, nombre)
values(5, 'Electronica');


#ALBUM
insert into album(id_album, nombreAlbum, id_artista)
values(1, 'Enamorada de ti', 1);
insert into album(id_album, nombreAlbum, id_artista)
values(2, 'Monarca', 3);
insert into album(id_album, nombreAlbum, id_artista)
values(3, 'YHLQMDLG', 2);
insert into album(id_album, nombreAlbum, id_artista)
values(4, 'Ultimo tour al mundo', 4);
insert into album(id_album, nombreAlbum, id_artista)
values(5, 'Timelezz', 5);

#SENCILLO
insert into sencillo(id_sencillo, nombre, duracion)
values(1, 'Soy peor', 2.14);
insert into sencillo(id_sencillo, nombre, duracion)
values(2, 'Como un Bebe', 2.23);
insert into sencillo(id_sencillo, nombre, duracion)
values(3, 'Bailando', 3.55);
insert into sencillo(id_sencillo, nombre, duracion)
values(4, 'Need To Know', 2.45);
insert into sencillo(id_sencillo, nombre, duracion)
values(5, 'Yonaguni', 3.23);
insert into sencillo(id_sencillo, nombre, duracion)
values(6, 'Cuando vea a tu mama', 3.32);
insert into sencillo(id_sencillo, nombre, duracion)
values(7, '4 Am', 2.22);
insert into sencillo(id_sencillo, nombre, duracion)
values(8, 'Soy uno mas', 1.32 );
insert into sencillo(id_sencillo, nombre, duracion)
values(9, 'Futbol y Rumba', 3.33);
insert into sencillo(id_sencillo, nombre, duracion)
values(10, 'Hazmelo', 2.33);
insert into sencillo(id_sencillo, nombre, duracion)
values(11, 'Jugaste y Sufri', 2.22);
insert into sencillo(id_sencillo, nombre, duracion)
values(12, 'Thinkin', 3.25);
insert into sencillo(id_sencillo, nombre, duracion)
values(13, 'Beggin', 4.32);
insert into sencillo(id_sencillo, nombre, duracion)
values(14, 'Humanos a marte', 3.21);
insert into sencillo(id_sencillo, nombre, duracion)
values(15, 'AL CAPONE', 2.54);

#ASIGNAR SENCILLO
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(1, 1, 15);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(2, 5, 14);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(3, 1, 13);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(4, 4, 12);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(5, 3, 11);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(6, 5, 10);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(7, 1, 9);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(8, 5, 8);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(9, 1, 7);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(10, 2, 6);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(11, 2, 5);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(12, 1, 4);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(13, 3, 3);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(14, 1, 2);
insert into asignarSencillo(id_asignarS, id_genero, id_sencillo)
values(15, 2, 1);

#ASIGNAR SENCILLO
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(1, 1, 5);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(2, 15, 4);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(3, 14, 3);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(4, 4, 2);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(5, 13, 1);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(6, 5, 1);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(7, 12, 2);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(8, 11, 3);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(9, 10, 4);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(10, 2, 5);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(11, 12, 2);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(12, 1, 1);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(13, 9, 3);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(14, 7, 4);
insert into asignacion_sencillo_album(id_asignar, id_sencillo, id_album)
values(15, 5, 2);

#ASIGNAR ALBUM
insert into asignarAlbum(id_asignarA, id_genero, id_album)
values(1, 1, 1);
insert into asignarAlbum(id_asignarA, id_genero, id_album)
values(2, 2, 3);
insert into asignarAlbum(id_asignarA, id_genero, id_album)
values(3, 5, 2);
insert into asignarAlbum(id_asignarA, id_genero, id_album)
values(4, 3, 4);
insert into asignarAlbum(id_asignarA, id_genero, id_album)
values(5, 4, 5);

#USUARIOS
insert into usuarios(id_usuarios, nombre, pais, usuario, clave, fecha_nacimiento)
values(1, 'Angel', 'Guatemala', 'AngelepD1502', 'Angel1214', '2004-12-14');
insert into usuarios(id_usuarios, nombre, pais, usuario, clave, fecha_nacimiento)
values(2, 'Luis', 'Brasil', 'Luiss12', '931293', '2001-12-14');
insert into usuarios(id_usuarios, nombre, pais, usuario, clave, fecha_nacimiento)
values(3, 'Miguel', 'Ecuador', 'Mike12', 'Mike99', '1998-04-21');
insert into usuarios(id_usuarios, nombre, pais, usuario, clave, fecha_nacimiento)
values(4, 'David', 'Francia', 'Davi02', 'D1234', '2001-10-12');
insert into usuarios(id_usuarios, nombre, pais, usuario, clave, fecha_nacimiento)
values(5, 'Jose Miguel', 'España', 'JoseM23', '1234', '2000-12-08');

#FORMAS DE PAGO
insert into formasPago(id_formasP, nombre)
values(1, 'Pay Pal');
insert into formasPago(id_formasP, nombre)
values(2, 'BitCoins');
insert into formasPago(id_formasP, nombre)
values(3, 'Tarjeta');

#PLANES DE PAGO
insert into planesPago(id_planes, nombre, precio, duracion)
values(1, 'Platino', '50.00', '1 meses');
insert into planesPago(id_planes, nombre, precio, duracion)
values(2, 'Premium', '100.00', '3 meses');
insert into planesPago(id_planes, nombre, precio, duracion)
values(3, 'Gold', '150.00', '7 meses');
insert into planesPago(id_planes, nombre, precio, duracion)
values(4, 'Familiar', '300.00', '10 meses');
insert into planesPago(id_planes, nombre, precio, duracion)
values(5, 'Duo', '500.00', '12 meses');
insert into planesPago(id_planes, nombre, precio, duracion)
values(6, 'Individual', '350.00', '12 meses');

#ASIGNACION PAGOS
insert into asignacionPagos(id_pago, id_usuarios, id_planes, id_formasP)
values(1, 5, 4, 1);
insert into asignacionPagos(id_pago, id_usuarios, id_planes, id_formasP)
values(2, 4, 2, 3);
insert into asignacionPagos(id_pago, id_usuarios, id_planes, id_formasP)
values(3, 3, 3, 1);
insert into asignacionPagos(id_pago, id_usuarios, id_planes, id_formasP)
values(4, 2, 1, 2);
insert into asignacionPagos(id_pago, id_usuarios, id_planes, id_formasP)
values(5, 1, 4, 3);

#LISTA REPRODUCCION
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(1, 5, 2, '12');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(2, 5, 1, '8');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(3, 5, 15, '6');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(4, 4, 12, '4');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(5, 4, 10, '16');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(6, 4, 6, '13');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(7, 3, 2, '12');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(8, 3, 9, '14');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(9, 3, 4, '32');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(10, 2, 2, '21');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(11, 2, 12, '14');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(12, 2, 7, '16');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(13, 1, 3, '12');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(14, 1, 11, '14');
insert into listaReproduccion(id_lista, id_usuarios, id_sencillo, reproducciones)
values(15, 1, 8, '17');

#-----------------Consultas------------------#

