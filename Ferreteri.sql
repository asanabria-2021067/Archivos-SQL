CREATE DATABASE IF NOT EXISTS ferreteria;
Use ferreteria;

CREATE TABLE IF NOT EXISTS zona(
id_zona INT NOT NULL AUTO_INCREMENT,
nombre Varchar(50) NOT NULL,
PRIMARY KEY (id_zona)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS colonia(
id_colonia INT NOT NULL AUTO_INCREMENT,
nombre Varchar(50) NOT NULL,
PRIMARY KEY (id_colonia)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS municipio(
id_municipio INT NOT NULL AUTO_INCREMENT,
nombre Varchar(50) NOT NULL,
PRIMARY KEY (id_municipio)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS departamento(
id_departamento INT NOT NULL AUTO_INCREMENT,
nombre Varchar(50) NOT NULL,
PRIMARY KEY (id_departamento)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS cliente(
id_cliente INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
direccion VARCHAR(200) NOT NULL,
edad INT NOT NULL,
telefono INT,
PRIMARY KEY (id_cliente),
id_zona INT NOT NULL,
id_municipio INT NOT NULL,
id_departamento INT NOT NULL,
id_colonia INT NOT NULL,
FOREIGN KEY(id_zona)
REFERENCES zona(id_zona),
FOREIGN KEY(id_municipio)
REFERENCES municipio(id_municipio),
FOREIGN KEY(id_departamento)
REFERENCES departamento(id_departamento),
FOREIGN KEY(id_colonia)
REFERENCES colonia(id_colonia)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS herramienta(
id_herramienta INT NOT NULL AUTO_INCREMENT,
nombre Varchar(100) NOT NULL,
descripcion Varchar(100) NOT NULL,
PRIMARY KEY (id_herramienta)
)ENGINE= INNODB;

CREATE TABLE IF NOT EXISTS marca(
id_marca INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
PRIMARY KEY (id_marca)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS inventario(
id_inventario INT NOT NULL AUTO_INCREMENT,
cantidad INT NOT NULL,
costo INT NOT NULL,
precio INT NOT NULL,
total INT NOT NULL,
PRIMARY KEY (id_inventario),
id_marca INT NOT NULL,
id_herramientas INT NOT NULL,
FOREIGN KEY(id_marca)
REFERENCES marca(id_marca),
FOREIGN KEY(id_herramientas)
REFERENCES herramienta(id_herramienta)
)ENGINE= INNODB;

CREATE TABLE IF NOT EXISTS puestos_de_trabajo(
id_puestos INT NOT NULL AUTO_INCREMENT,
nombre_puesto Varchar(100) NOT NULL,
entrada Time,
salida Time,
PRIMARY KEY(id_puestos)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS colaboradores(
id_colaborador INT NOT NULL AUTO_INCREMENT,
nombre Varchar(100) NOT NULL,
direccion Varchar(100) NOT NULL,
telefono INT NOT NULL,
PRIMARY KEY(id_colaborador),
id_puestodetrabajo INT NOT NULL,
FOREIGN KEY(id_puestodetrabajo)
REFERENCES puestos_de_trabajo(id_puestos)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS facturacion(
id_facturacion INT NOT NULL AUTO_INCREMENT,
serie_factura INT NOT NULL,
PRIMARY KEY(id_facturacion),
id_inventario INT NOT NULL,
id_colaboradores INT NOT NULL,
id_clientes INT NOT NULL,
FOREIGN KEY(id_inventario)
REFERENCES inventario(id_inventario),
FOREIGN KEY(id_colaboradores)
REFERENCES colaboradores(id_colaborador),
FOREIGN KEY(id_clientes)
REFERENCES cliente(id_cliente)
)ENGINE= INNODB;

#------------------------------Añadiendo datos---------------------------------------#
#Datos de ubicacion
insert into zona(id_zona,nombre)
values(0,"Zona 2");
insert into zona(id_zona,nombre)
values(0,"Zona 2");
insert into zona(id_zona,nombre)
values(0,"Zona 2");
insert into zona(id_zona,nombre)
values(0,"Zona 2");
insert into zona(id_zona,nombre)
values(0,"Zona 2");

insert into municipio(id_municipio,nombre)
values(0,"Santa vista");
insert into municipio(id_municipio,nombre)
values(0,"Santa vista");
insert into municipio(id_municipio,nombre)
values(0,"Santa vista");
insert into municipio(id_municipio,nombre)
values(0,"Santa vista");
insert into municipio(id_municipio,nombre)
values(0,"Santa vista");

insert into departamento(id_departamento,nombre)
values(0,"Izabal");
insert into departamento(id_departamento,nombre)
values(0,"Chiquimula");
insert into departamento(id_departamento,nombre)
values(0,"Zacapa");
insert into departamento(id_departamento,nombre)
values(0,"Peten");
insert into departamento(id_departamento,nombre)
values(0,"Guatemala");

insert into colonia(id_colonia,nombre)
values(0,"San Miguel Petapa");
insert into colonia(id_colonia,nombre)
values(0,"San Jose Villa Nueva");
insert into colonia(id_colonia,nombre)
values(0,"Vista Hermosa");
insert into colonia(id_colonia,nombre)
values(0,"Las charcas");
insert into colonia(id_colonia,nombre)
values(0,"El carmen");

#Datos Cliente
insert into cliente(id_cliente,nombre,direccion,edad,telefono,id_zona,id_municipio,id_departamento,id_colonia)
values(0,"Angel","29 Calle 5ta Avenida",19,55203912,1,1,1,1);
insert into cliente(id_cliente,nombre,direccion,edad,telefono,id_zona,id_municipio,id_departamento,id_colonia)
values(0,"Mateo","9na Calle",19,88832938,4,3,2,1);
insert into cliente(id_cliente,nombre,direccion,edad,telefono,id_zona,id_municipio,id_departamento,id_colonia)
values(0,"Miguel","Avenida Principal, 6ta Calle",19,1231242353,2,4,1,2);
insert into cliente(id_cliente,nombre,direccion,edad,telefono,id_zona,id_municipio,id_departamento,id_colonia)
values(0,"Enrique","40 Calle 2da Avenida",19,6575645,3,2,1,1);
insert into cliente(id_cliente,nombre,direccion,edad,telefono,id_zona,id_municipio,id_departamento,id_colonia)
values(0,"Luis","25 Calle 3ra Avenida",19,3457568,3,5,3,1);

#Datos Herramienta
insert into herramienta(id_herramienta,nombre,descripcion)
values(0,"Martillo","Buena marca y sin usar");
insert into herramienta(id_herramienta,nombre,descripcion)
values(0,"Palanca","Usada, pero re pintada");
insert into herramienta(id_herramienta,nombre,descripcion)
values(0,"Llave Inglesa","Oxidada pero en buen estado");
insert into herramienta(id_herramienta,nombre,descripcion)
values(0,"Tuercas","6 paquetes de 15 tuercas");
insert into herramienta(id_herramienta,nombre,descripcion)
values(0,"Clavos","Clavos de nuevo ingreso tamaño 7 milimetros");

#Datos Marca
insert into marca(id_marca,nombre)
values(0,"RGB");
insert into marca(id_marca,nombre)
values(0,"LG");
insert into marca(id_marca,nombre)
values(0,"Tuxon");
insert into marca(id_marca,nombre)
values(0,"Patito");
insert into marca(id_marca,nombre)
values(0,"Roble");

#Datos Inventario
insert into inventario(id_inventario,cantidad,costo,precio,total,id_marca,id_herramientas)
values(0,5,60.00,75.00,5*75,1,1);
insert into inventario(id_inventario,cantidad,costo,precio,total,id_marca,id_herramientas)
values(0,2,30.00,50.00,2*50,3,2);
insert into inventario(id_inventario,cantidad,costo,precio,total,id_marca,id_herramientas)
values(0,1,640.00,752.00,1*752,3,4);
insert into inventario(id_inventario,cantidad,costo,precio,total,id_marca,id_herramientas)
values(0,3,90.00,102.00,3*102,5,4);
insert into inventario(id_inventario,cantidad,costo,precio,total,id_marca,id_herramientas)
values(0,2,30.00,75.00,2*75,1,4);

#Datos Puestos de trabajo
insert into puestos_de_trabajo(id_puestos,nombre_puesto,entrada,salida)
values(0,"Recepcionista", "05:00:00", "12:30:00");
insert into puestos_de_trabajo(id_puestos,nombre_puesto,entrada,salida)
values(0,"Conserje", "12:00:00", "19:30:00");
insert into puestos_de_trabajo(id_puestos,nombre_puesto,entrada,salida)
values(0,"Encargado", "06:00:00", "16:30:00");
insert into puestos_de_trabajo(id_puestos,nombre_puesto,entrada,salida)
values(0,"Caja", "08:00:00", "14:30:00");
insert into puestos_de_trabajo(id_puestos,nombre_puesto,entrada,salida)
values(0,"Vendedor", "07:00:00", "14:30:00");

#Datos Colaboradores
insert into colaboradores(id_colaborador,nombre,direccion,telefono,id_puestodetrabajo)
values(0,"Mateo", "35 Calle 3ra Avenida Villa Lobos",54609988,1);
insert into colaboradores(id_colaborador,nombre,direccion,telefono,id_puestodetrabajo)
values(0,"Enrique", "Vista Hermosa 5ta Avenida",66360891,3);
insert into colaboradores(id_colaborador,nombre,direccion,telefono,id_puestodetrabajo)
values(0,"Jose Pablo", "San Jose Pinula lote 34",5539102,4);
insert into colaboradores(id_colaborador,nombre,direccion,telefono,id_puestodetrabajo)
values(0,"Jimena", "Mixco 12 calle 5a Avenida",9123034,2);
insert into colaboradores(id_colaborador,nombre,direccion,telefono,id_puestodetrabajo)
values(0,"Rocio", "35 Calle El Carmen",9811234,5);

#Datos Facturacion
insert into facturacion(id_facturacion,serie_factura,id_inventario,id_colaboradores,id_clientes)
values(0,230,5,2,2);
insert into facturacion(id_facturacion,serie_factura,id_inventario,id_colaboradores,id_clientes)
values(0,590,3,4,4);
insert into facturacion(id_facturacion,serie_factura,id_inventario,id_colaboradores,id_clientes)
values(0,890,2,3,2);
insert into facturacion(id_facturacion,serie_factura,id_inventario,id_colaboradores,id_clientes)
values(0,360,4,4,4);
insert into facturacion(id_facturacion,serie_factura,id_inventario,id_colaboradores,id_clientes)
values(0,120,5,2,2);
#-----------------------------------------------------------------------------------
#									Ejercicios en clase
#-----------------------------------------------------------------------------------
#									  Mostrar clientes
select * from cliente;
#-----------------------------------------------------------------------------------
#					Mostrar el nombre del cliente donde su id es igual a 1
select nombre from cliente where id_cliente=1;
#-----------------------------------------------------------------------------------
#					Mostrar todos los clientes que sean mayores de 18
select * from cliente where edad>= 18;
#-----------------------------------------------------------------------------------
#			Mostrar todos los clientes que sean mayores de 18 y su id sea 1
select * from cliente where edad>= 18 and id_cliente=1;
#-----------------------------------------------------------------------------------
#						Mostrar clientes de edad entre 10 y 18
select * from cliente where edad between 10 and 18;
#------ COUNT ------#
#-----------------------------------------------------------------------------------
#						Mostrar cuantos clientes son menores de edad
select count(edad) from cliente where edad<18;
#-----------------------------------------------------------------------------------
#						Mostrar productos del inventario
select count(id_herramientas)from inventario where id_herramientas=1;
select count(id_herramientas)from inventario where id_herramientas=2;
select count(id_herramientas)from inventario where id_herramientas=3;
select count(id_herramientas)from inventario where id_herramientas=4;
select count(id_herramientas)from inventario where id_herramientas=5;
#-----------------------------------------------------------------------------------
#						   	Conteo de personas por zonas
select count(id_zona) from cliente where id_zona=1;
select count(id_zona) from cliente where id_zona=2;
select count(id_zona) from cliente where id_zona=3;
select count(id_zona) from cliente where id_zona=4;
select count(id_zona) from cliente where id_zona=5;
#-----------------------------------------------------------------------------------
#						 	 Conteo de personas por departamentos
select count(id_departamento) from cliente where id_departamento=1;
select count(id_departamento) from cliente where id_departamento=2;
select count(id_departamento) from cliente where id_departamento=3;
select count(id_departamento) from cliente where id_departamento=4;
select count(id_departamento) from cliente where id_departamento=5;
#-----------------------------------------------------------------------------------
#						    Mostrar cantidad de marcas en el inventario
select count(id_marca) from inventario where id_marca=1;
select count(id_marca) from inventario where id_marca=2;
select count(id_marca) from inventario where id_marca=3;
select count(id_marca) from inventario where id_marca=4;
select count(id_marca) from inventario where id_marca=5;
#-----------------------------------------------------------------------------------
#					 	    Mostrar cantidad de productos por marca
select count(id_herramientas),sum(id_herramientas) from inventario where id_marca=1;
select count(id_herramientas),sum(id_herramientas) from inventario where id_marca=2;
select count(id_herramientas),sum(id_herramientas) from inventario where id_marca=3;
select count(id_herramientas),sum(id_herramientas) from inventario where id_marca=4;
select count(id_herramientas),sum(id_herramientas) from inventario where id_marca=5;
#-----------------------------------------------------------------------------------
#					 		Mostrar los productos en el inventario
select * from inventario;
select count(id_herramientas) from inventario where id_herramientas=1;
select count(id_herramientas) from inventario where id_herramientas=2;
select count(id_herramientas) from inventario where id_herramientas=3;
select count(id_herramientas) from inventario where id_herramientas=4;
select count(id_herramientas) from inventario where id_herramientas=5;
#-----------------------------------------------------------------------------------
#									Añadir dato fecha
alter table facturacion add column fecha date;
select * from facturacion;
update facturacion set fecha = "2020-05-21" where id_facturacion=12;
#-----------------------------------------------------------------------------------
#						Conteo y cantidad de facturas por 20 dias
select facturacion.id_facturacion, facturacion.serie_factura,herramienta.nombre, 
marca.nombre, colaboradores.nombre, facturacion.fecha, cliente.nombre from facturacion, 
inventario, herramienta, colaboradores, marca, cliente
where facturacion.id_inventario=inventario.id_inventario and facturacion.id_clientes=cliente.
id_cliente and facturacion.id_colaboradores=colaboradores.id_colaborador and 
inventario.id_herramientas=herramienta.id_herramienta and inventario.id_marca=marca.id_marca 
and fecha between "2020-05-01" and "2020-05-20" order by fecha;


select count(id_facturacion) AS conteo_facturas_por_mes from facturacion where fecha between "2020-05-01" and "2020-05-20";
#-----------------------------------------------------------------------------------
#								Mostrar productos por id
select * from marca;
select inventario.id_herramientas, inventario.id_marca from inventario 
where inventario.id_marca=1;
#-----------------------------------------------------------------------------------
#								Mostrar productos por nombre
select inventario.id_inventario, herramienta.id_herramienta,herramienta.nombre 
As Nombre_herramienta, marca.nombre As Nombre_marca, 
marca.id_marca from inventario, herramienta, marca 
where marca.nombre= "RGB" and marca.id_marca=inventario.id_marca and inventario.
id_herramientas=herramienta.id_herramienta;
select * from marca;
select * from herramienta;
select * from inventario;
#----------------------------------------------------------------------------------
#Order by
select * from herramienta order by id_herramienta;
select * from herramienta order by nombre;
select * from herramienta order by id_herramienta desc;
select * from herramienta order by id_herramienta asc;
#----------------------------------------------------------------------------------
#Like
