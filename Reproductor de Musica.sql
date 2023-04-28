CREATE DATABASE IF NOT EXISTS reproductor2;
use reproductor2;
#-------------------Creando tablas--------------------#
delimiter $$
create procedure artista_tabla()
begin
	CREATE TABLE IF NOT EXISTS artista(
	id_artista INT NOT NULL,
	nombre Varchar(50),
	PRIMARY KEY(id_artista)
	)ENGINE=INNODB;
end $$
delimiter ;
call artista_tabla();

delimiter $$
create procedure genero_tabla()
begin
	CREATE TABLE IF NOT EXISTS genero(
	id_genero INT NOT NULL,
	nombre Varchar(50), 
	PRIMARY KEY(id_genero)
	)ENGINE=INNODB;
end $$
delimiter ;
call genero_tabla();

delimiter $$
create procedure album_tabla()
begin
	CREATE TABLE IF NOT EXISTS album(
	id_album INT NOT NULL,
	nombreAlbum Varchar(50),
	id_artista INT NOT NULL,
	PRIMARY KEY(id_album),
	FOREIGN KEY(id_artista)
	REFERENCES artista(id_artista)
	)ENGINE=INNODB;
end $$
delimiter ;
call album_tabla();

delimiter $$
create procedure sencillo_tabla()
begin
	CREATE TABLE IF NOT EXISTS sencillo(
	id_sencillo INT NOT NULL,
	nombre Varchar(50),
	duracion FLOAT NOT NULL,
	PRIMARY KEY(id_sencillo)
	)ENGINE=INNODB;
end $$
delimiter ;
call sencillo_tabla();

delimiter $$
create procedure asignarSencillo_tabla()
begin
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
end $$
delimiter ;
call asignarSencillo_tabla();

delimiter $$
create procedure asignarAlbum_tabla()
begin
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
end $$
delimiter ;
call asignarAlbum_tabla();

delimiter $$
create procedure usuarios_tabla()
begin
	CREATE TABLE IF NOT EXISTS usuarios(
	id_usuarios INT NOT NULL,
	nombre Varchar(50),
	usuario Varchar(50),
	clave Varchar(50),
	fecha_nacimiento DATE,
	PRIMARY KEY(id_usuarios),
	pais Varchar(50)
	)ENGINE=INNODB;
end $$
delimiter ;
call usuarios_tabla();

delimiter $$
create procedure formasPago_tabla()
begin
	CREATE TABLE IF NOT EXISTS formasPago(
	id_formasP INT NOT NULL,
	nombre Varchar(50),
	PRIMARY KEY(id_formasP)
	)ENGINE=INNODB;
end $$
delimiter ;
call formasPago_tabla();

delimiter $$

create procedure planesPago_tabla()
begin
	CREATE TABLE IF NOT EXISTS planesPago(
	id_planes INT NOT NULL,
	nombre Varchar(50),
	precio INT NOT NULL,
	duracion Varchar(50),
	PRIMARY KEY(id_planes)
	)ENGINE=INNODB;
end $$
delimiter ;
call planesPago_tabla();

delimiter $$
create procedure asignacionPagos_tabla()
begin
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
end $$
delimiter ;
call asignacionPagos_tabla();

delimiter $$
create procedure asignacion_sencillo_album_tabla()
begin
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
end $$
delimiter ;
call asignacion_sencillo_album_tabla();

delimiter $$
create procedure listaReproduccion_tabla()
begin
	CREATE TABLE IF NOT EXISTS listaReproduccion(
	id_lista INT NOT NULL,
	id_album INT NOT NULL,
	id_sencillos INT NOT NULL,
	id_usuarios INT NOT NULL,
	id_artista INT NOT NULL,
	reproducciones INT NOT NULL,
	PRIMARY KEY(id_lista),
	FOREIGN KEY(id_usuarios)
	REFERENCES usuarios(id_usuarios),
	FOREIGN KEY(id_album)
	REFERENCES album(id_album),
	FOREIGN KEY (id_sencillos)
	REFERENCES sencillo(id_sencillo),
	FOREIGN KEY (id_artista)
	REFERENCES artista(id_artista)
	)ENGINE=INNODB;
end $$
delimiter ;
call listaReproduccion_tabla();

# - - - - - - Creando Datos - - - - - - #
#ARTISTA
delimiter $$
create procedure artista(id_artista INT, nombre Varchar(50))
begin
	insert into artista 
    values(id_artista, nombre);
end $$
delimiter ;
call artista(1, "Eladio Carrion");
call artista(2, "Bad Bunny");
call artista(3, "Maluma");
call artista(4, "Vicente Fernandez");
call artista(5, "Nicky Minaj");
call artista(6, "WOS");

delimiter $$
create procedure genero(id_genero INT, nombre Varchar(50))
begin
	insert into genero 
    values(id_genero, nombre);
end $$
delimiter ;
call genero(1, "Metal");
call genero(2, "Rock");
call genero(3, "Reggaeton");
call genero(4, "K Pop");
call genero(5, "Electronica");
call genero(6, "Electronica Clasica");

delimiter $$
create procedure album(id_genero INT, nombre Varchar(50), id_artista INT)
begin
	insert into album 
    values(id_genero, nombre, id_artista);
end $$
delimiter ;
call album(1, "Enamorada de ti", 1);
call album(2, "Monarca", 3);
call album(3, "YHLQMDLG", 2);
call album(4, "Ultimo tour al mundo", 4);
call album(5, "Timelezz", 5);

delimiter $$
create procedure sencillo(id_sencillo INT, nombre Varchar(50), duracion INT)
begin
	insert into sencillo 
    values(id_sencillo, nombre, duracion);
end $$
delimiter ;
call sencillo(1, 'Soy peor', 2.14);
call sencillo(2, 'Como un Bebe', 2.23);
call sencillo(3, 'Bailando', 3.55);
call sencillo(4, 'Need To Know', 2.45);
call sencillo(5, 'Yonaguni', 3.23);
call sencillo(6, 'Cuando vea a tu mama', 3.32);
call sencillo(7, '4 Am', 2.22);
call sencillo(8, 'Soy uno mas', 1.32 );
call sencillo(9, 'Futbol y Rumba', 3.33);
call sencillo(10, 'Hazmelo', 2.33);
call sencillo(11, 'Jugaste y Sufri', 2.22);
call sencillo(12, 'Thinkin', 3.25);
call sencillo(13, 'Beggin', 4.32);
call sencillo(14, 'Humanos a marte', 3.21);
call sencillo(15, 'AL CAPONE', 2.54);

delimiter $$
create procedure asignarSencillo(id_asignarS INT, id_genero INT, id_sencillo INT)
begin
	insert into asignarSencillo 
    values(id_asignarS, id_genero, id_sencillo);
end $$
delimiter ;
call asignarSencillo(1, 1, 15);
call asignarSencillo(2, 5, 14);
call asignarSencillo(3, 1, 13);
call asignarSencillo(4, 4, 12);
call asignarSencillo(5, 3, 11);
call asignarSencillo(6, 5, 10);
call asignarSencillo(7, 1, 9);
call asignarSencillo(8, 5, 8);
call asignarSencillo(9, 1, 7);
call asignarSencillo(10, 2, 6);
call asignarSencillo(11, 2, 5);
call asignarSencillo(12, 1, 4);
call asignarSencillo(13, 3, 3);
call asignarSencillo(14, 1, 2);
call asignarSencillo(15, 2, 1);

delimiter $$
create procedure asignacion_sencillo_album(id_asignar INT, id_sencillo INT, id_album INT)
begin
	insert into asignacion_sencillo_album 
    values(id_asignar, id_sencillo, id_album);
end $$
delimiter ;
call asignacion_sencillo_album(1, 1, 5);
call asignacion_sencillo_album(2, 15, 4);
call asignacion_sencillo_album(3, 14, 3);
call asignacion_sencillo_album(4, 4, 2);
call asignacion_sencillo_album(5, 13, 1);
call asignacion_sencillo_album(6, 5, 1);
call asignacion_sencillo_album(7, 12, 2);
call asignacion_sencillo_album(8, 11, 3);
call asignacion_sencillo_album(9, 10, 4);
call asignacion_sencillo_album(10, 2, 5);
call asignacion_sencillo_album(11, 12, 2);
call asignacion_sencillo_album(12, 1, 1);
call asignacion_sencillo_album(13, 9, 3);
call asignacion_sencillo_album(14, 7, 4);
call asignacion_sencillo_album(15, 5, 2);

delimiter $$
create procedure asignarAlbum(id_asignarA INT, id_genero INT, id_album INT)
begin
	insert into asignarAlbum 
    values(id_asignarA, id_genero, id_album);
end $$
delimiter ;
call asignarAlbum(1, 1, 1);
call asignarAlbum(2, 2, 3);
call asignarAlbum(3, 5, 2);
call asignarAlbum(4, 3, 4);
call asignarAlbum(5, 4, 5);

delimiter $$
create procedure usuarios(id_usuarios INT, nombre Varchar(50), usuario Varchar(50), clave Varchar(50), fecha_nacimiento DATE, pais Varchar(50))
begin
	insert into usuarios 
    values(id_usuarios, nombre, usuario, clave, fecha_nacimiento, pais);
end $$
delimiter ;
call usuarios(1, 'Angel','AngelepD1502', 'Angel1214', '2004-12-14', "Guatemala");
call usuarios(2, 'Luis', 'Luiss12', '931293', '2001-12-14', "Brasil");
call usuarios(3, 'Miguel', 'Mike12', 'Mike99', '1998-04-21',"Ecuador");
call usuarios(4, 'David','Davi02', 'D1234', '2001-10-12',"Francia");
call usuarios(5, 'Jose Miguel', 'JoseM23', '1234', '2000-12-08',"España");
call usuarios(6, 'Jose Ernesto', 'ErneJM', '5556', '1999-12-12',"Guatemala");

delimiter $$
create procedure formasPago(id_formasP INT, nombre Varchar(50))
begin
	insert into formasPago 
    values(id_formasP, nombre);
end $$
delimiter ;
call formasPago(1, 'Pay Pal');
call formasPago(2, 'BitCoins');
call formasPago(3, 'Tarjeta');

delimiter $$
create procedure planesPago(id_planes INT, nombre Varchar(50), precio INT, duracion Varchar(50))
begin
	insert into planesPago 
    values(id_planes, nombre, precio, duracion);
end $$
delimiter ;
call planesPago(1, 'Platino', '50.00', '1 meses');
call planesPago(2, 'Premium', '100.00', '3 meses');
call planesPago(3, 'Gold', '150.00', '7 meses');
call planesPago(4, 'Familiar', '300.00', '10 meses');
call planesPago(5, 'Duo', '500.00', '12 meses');
call planesPago(6, 'Individual', '350.00', '12 meses');

delimiter $$
create procedure asignacionPagos(id_pago INT, id_usuarios INT, id_planes INT, id_formasP INT)
begin
	insert into asignacionPagos 
    values(id_planes, id_usuarios, id_planes, id_formasP);
end $$
delimiter ;
call asignacionPagos(1, 5, 4, 1);
call asignacionPagos(2, 4, 2, 3);
call asignacionPagos(3, 3, 3, 1);
call asignacionPagos(4, 2, 1, 2);
call asignacionPagos(5, 1, 5, 3);

delimiter $$
create procedure listaReproduccion(id_lista INT, id_usuarios INT, id_album INT, id_sencillos INT, id_artista INT, reproducciones INT)
begin
	insert into listaReproduccion 
    values(id_lista, id_usuarios, id_album, id_sencillos, id_artista, reproducciones);
end $$
delimiter ;
call listaReproduccion(1, 5, 7, 5, 3 ,12);
call listaReproduccion(2, 3, 11, 4, 2, 8);
call listaReproduccion(3, 5, 5, 5, 4, 6);
call listaReproduccion(4, 1, 2, 6, 5, 4);
call listaReproduccion(5, 4, 13, 3, 1, 16);
call listaReproduccion(6, 4, 3, 2, 2, 13);
call listaReproduccion(7, 3, 4, 3, 4, 12);
call listaReproduccion(8, 3, 5, 4, 5, 14);
call listaReproduccion(9, 3, 11, 2, 3, 32);
call listaReproduccion(10, 2, 12, 6, 2, 21);
call listaReproduccion(11, 2, 15, 4, 3, 14);
call listaReproduccion(12, 2, 13, 3, 5, 16);
call listaReproduccion(13, 1, 14, 2, 4, 12);
call listaReproduccion(14, 1, 14, 3, 3, 14);
call listaReproduccion(15, 1, 9, 1, 2, 17);

#---------------------------------Consultas--------------------------------#
#----Mostrar todos los albumes de un usuario utilizando su nombre----#
delimiter $$
create procedure albumes_usuario(busca Varchar(50))
	begin
        select usuarios.nombre as Nombre_usuario, album.nombreAlbum as Nombre_album, 
		listaReproduccion.reproducciones as Reproducciones from album, listaReproduccion, usuarios
		where usuarios.nombre=busca and usuarios.id_usuarios=listaReproduccion.id_usuarios 
		and listaReproduccion.id_album=album.id_album order by listaReproduccion.reproducciones;
end$$
delimiter ;
call albumes_usuario("Angel");

#----Mostrar en orden las canciones mas escuchadas----#
delimiter $$
create procedure orden_por_Reproduccion(busca Varchar(50))
	begin
        select usuarios.nombre as Nombre_Usuario, sencillo.nombre as Sencillo_nombre
		, listaReproduccion.reproducciones as Reproducciones from usuarios,sencillo, listaReproduccion 
		where usuarios.nombre=busca and usuarios.id_usuarios=listaReproduccion.id_usuarios 
		and listaReproduccion.id_sencillos=sencillo.id_sencillo order by 
		listaReproduccion.reproducciones;
end$$
delimiter ;
call orden_por_Reproduccion("Angel");


#----Mostrar cantidad de sencillos----#
delimiter $$
create procedure mostrar_Sencillos(busca Varchar(50))
	begin
        select count(asignarSencillo.id_sencillo) as Cantidad_sencillos from sencillo, asignarSencillo,
		genero where genero.nombre=busca and asignarSencillo.id_sencillo=sencillo.id_sencillo and
		asignarSencillo.id_genero=genero.id_genero;
end$$
delimiter ;
call mostrar_Sencillos("Rock");

#----Mostrar el nombre de cada album por el nombre----#
delimiter $$
create procedure album_por_nombre(busca Varchar (50))
	begin
     select album.nombreAlbum as Nombre_Album, artista.nombre as Nombre_artista
	from album, artista, genero, asignarAlbum where genero.nombre=busca and 
	album.id_artista=artista.id_artista and asignarAlbum.id_album=album.id_album and 
	asignarAlbum.id_genero=genero.id_genero;
end$$
delimiter ;
call album_por_nombre("Metal");

#----------Mostrar la cantidad de artistas que están en la base de datos-------------
delimiter $$
create procedure mostrar_Artistas()
	begin
        select count(id_artista)as Artistas from artista;

end$$
delimiter ;
call mostrar_Artistas();

#----------Mostrar la información de un artista ingresando su id como parámetro----------
delimiter $$
create procedure info_Artistas(buscador int)
	begin
        select * from artista where id_artista=buscador;

end$$
delimiter ;
call info_Artistas(1);

#Mostrar la cantidad de artistas que tiene un usuario en su lista de reproducción, utilizando el id del usuario, este dato se debe ingresar como parámetro.
delimiter $$
create procedure info_Lista(buscador int)
	begin
        select count(id_artista) as Conteo_Artista from listaReproduccion where id_usuarios=buscador;

end$$
delimiter ;
call info_Lista(1);
#Ordenar de forma ascendente la lista de reproducción de un usuario, utilizando su id como parámetro.
delimiter $$
create procedure orden_Lista(buscador int)
	begin
        select listaReproduccion.id_usuarios as ID_USUARIO, usuarios.nombre as NOMBRE_USUARIO
        ,listaReproduccion.id_lista as ID_LISTA, artista.nombre as NOMBRE_ARTISTA
        , sencillo.nombre as NOMBRE_SENCILLO from 
        listaReproduccion, sencillo, artista, usuarios where 
        listaReproduccion.id_usuarios=usuarios.id_usuarios and listaReproduccion.id_artista=
        artista.id_artista and listaReproduccion.id_sencillos=sencillo.id_sencillo and 
        usuarios.id_usuarios=buscador order by listaReproduccion.id_lista;


end$$
delimiter ;
call orden_Lista(3);

#Mostrar el país que mas usuarios tiene en nuestro reproductor musical.
delimiter $$
create procedure pais_Mas()
	begin
        select  MAX(usuarios.pais) AS Pais_con_mas_usuarios from usuarios;
end$$
delimiter ;
call pais_Mas();

#Mostrar todos los artistas que pertenecen a un mismo género musical, utilizando el nombre del genero musical para hacer la búsqueda.
delimiter $$
create procedure artistas_genero(nombre Varchar(30))
	begin
        select artista.nombre, genero.nombre from artista, genero, album, asignarAlbum where
		genero.nombre=nombre and 
		album.id_artista=artista.id_artista and asignarAlbum.id_album=album.id_album and 
		asignarAlbum.id_genero=genero.id_genero;
end$$
delimiter ;
call artistas_genero("Metal");

#Mostrar todos los usuarios que tiene el mismo método de pago. Ingresando el nombre del método de pago como parámetro de búsqueda.
delimiter $$
create procedure metodo_pago(nombre Varchar(30))
	begin
        select usuarios.nombre, usuarios.usuario, formasPago.nombre from usuarios, formasPago,
        asignacionPagos where formasPago.nombre=nombre and asignacionPagos.id_usuarios=usuarios.
        id_usuarios and asignacionPagos.id_formasP=formasPago.id_formasP;
end$$
delimiter ;
call metodo_pago("Bitcoin");

