CREATE DATABASE IF NOT EXISTS banco;
Use banco;

#-------------------Creando ubicaciones para sucursal--------------------------#
CREATE TABLE IF NOT EXISTS zona(
id_zona INT NOT NULL,
nombre Varchar(50) NOT NULL,
PRIMARY KEY (id_zona)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS colonia(
id_colonia INT NOT NULL,
nombre Varchar(50) NOT NULL,
PRIMARY KEY (id_colonia)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS municipio(
id_municipio INT NOT NULL,
nombre Varchar(50) NOT NULL,
PRIMARY KEY (id_municipio)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS departamento(
id_departamento INT NOT NULL,
nombre Varchar(50) NOT NULL,
PRIMARY KEY (id_departamento)
)ENGINE=INNODB;

#------------------------Creando tipos de cuenta y tarjeta-----------------------#
CREATE TABLE IF NOT EXISTS tipo_cuenta(
id_tipoC INT NOT NULL,
tipo_de_cuenta Varchar(50) NOT NULL,
PRIMARY KEY (id_tipoC)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS tipo_tarjeta(
id_tipoT INT NOT NULL,
tipo_de_tarjeta Varchar(50) NOT NULL,
PRIMARY KEY (id_tipoT)
)ENGINE=INNODB;

#--------------------------Creando cuenta y tarjeta------------------------------#
CREATE TABLE IF NOT EXISTS cuenta(
id_cuenta INT NOT NULL,
agencia Varchar(50) NOT NULL,
codigo INT NOT NULL,
PRIMARY KEY (id_cuenta),
id_tipoC INT NOT NULL,
FOREIGN KEY (id_tipoC)
REFERENCES tipo_cuenta(id_tipoC)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS tarjeta(
id_tarjeta INT NOT NULL,
agencia Varchar(50) NOT NULL,
codigo INT NOT NULL,
PRIMARY KEY (id_tarjeta),
id_tipoT INT NOT NULL,
FOREIGN KEY (id_tipoT)
REFERENCES tipo_tarjeta(id_tipoT)
)ENGINE=INNODB;

#----------------------------------Sucursal---------------------------------------#
CREATE TABLE IF NOT EXISTS sucursal(
id_sucursal INT NOT NULL,
nombre_sucursal Varchar(200) NOT NULL,
PRIMARY KEY (id_sucursal),
id_zona INT NOT NULL,
id_colonia INT NOT NULL,
id_departamento INT NOT NULL,
id_municipio INT NOT NULL,
FOREIGN KEY(id_zona)
REFERENCES zona(id_zona),
FOREIGN KEY(id_municipio)
REFERENCES municipio(id_municipio),
FOREIGN KEY(id_departamento)
REFERENCES departamento(id_departamento),
FOREIGN KEY(id_colonia)
REFERENCES colonia(id_colonia)
)ENGINE=INNODB;

#--------------------------------Trabajador--------------------------------------#
CREATE TABLE IF NOT EXISTS trabajador(
id_trabajador INT NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
direccion VARCHAR(200) NOT NULL,
edad INT NOT NULL,
telefono INT NOT NULL,
PRIMARY KEY(id_trabajador),
id_sucursal INT NOT NULL,
FOREIGN KEY (id_sucursal)
REFERENCES sucursal(id_sucursal)
)ENGINE=INNODB;

#---------------------------------Intereses------------------------------------#
CREATE TABLE IF NOT EXISTS intereses(
id_intereses INT NOT NULL,
porcentaje FLOAT NOT NULL,
PRIMARY KEY(id_intereses),
id_tipoT INT NOT NULL,
FOREIGN KEY (id_tipoT)
REFERENCES tipo_tarjeta(id_tipoT)
)ENGINE=INNODB;

#----------------------------Asignar Cuenta y Tarjeta---------------------------–#
CREATE TABLE IF NOT EXISTS asignar_tarjeta(
id_asignarT INT NOT NULL,
fecha_inicio Date,
fecha_vencimiento Date,
PRIMARY KEY (id_asignarT),
id_sucursal INT NOT NULL,
id_tarjeta INT NOT NULL,
FOREIGN KEY (id_sucursal)
REFERENCES sucursal(id_sucursal),
FOREIGN KEY (id_tarjeta)
REFERENCES tarjeta(id_tarjeta)
)ENGINE= INNODB;

CREATE TABLE IF NOT EXISTS asignar_cuenta(
id_asignarC INT NOT NULL,
codigo_de_cuenta INT NOT NULL,
PRIMARY KEY (id_asignarC),
id_sucursal INT NOT NULL,
id_cuenta INT NOT NULL,
FOREIGN KEY (id_sucursal)
REFERENCES sucursal(id_sucursal),
FOREIGN KEY (id_cuenta)
REFERENCES cuenta(id_cuenta)
)ENGINE= INNODB;

#----------------------------------Cuenta Habiente--------------------------------#
CREATE TABLE IF NOT EXISTS cuenta_habiente(
id_cuentahabiente INT NOT NULL,
nombre Varchar(100) NOT NULL,
apellido Varchar(100) NOT NULL,
edad INT NOT NULL,
telefono INT NOT NULL,
direccion Varchar(150) NOT NULL,
PRIMARY KEY (id_cuentahabiente),
id_asignarC INT NOT NULL,
id_asignarT INT NOT NULL,
id_sucursal INT NOT NULL,
FOREIGN KEY (id_asignarC)
REFERENCES asignar_cuenta(id_asignarC),
FOREIGN KEY (id_asignarT)
REFERENCES asignar_tarjeta(id_asignarT),
FOREIGN KEY (id_sucursal)
REFERENCES sucursal(id_sucursal)
)ENGINE=INNODB;

#-------------------------------Cuenta Mancomunada------------------------------#
CREATE TABLE IF NOT EXISTS cuenta_mancomunada(
id_cuentaM INT NOT NULL,
propietarios INT NOT NULL,
PRIMARY KEY (id_cuentaM)
)ENGINE=INNODB;

#----------------------------Asignacion de Mancomunada--------------------#
CREATE TABLE IF NOT EXISTS asignacionM(
id_asignacionM INT NOT NULL,
id_cuentahabiente INT NOT NULL,
id_tipoC INT NOT NULL,
id_cuentaM INT NOT NULL,
PRIMARY KEY(id_asignacionM),
FOREIGN KEY (id_cuentahabiente)
REFERENCES cuenta_habiente(id_cuentahabiente),
FOREIGN KEY (id_tipoC)
REFERENCES tipo_cuenta(id_tipoC),
FOREIGN KEY (id_cuentaM)
REFERENCES cuenta_mancomunada(id_cuentaM)
)ENGINE=INNODB;

#------------------------------Tipo de Transaccion-------------------------#
CREATE TABLE IF NOT EXISTS tipo_transaccion(
id_tipo_transaccion INT NOT NULL,
nombre_transaccion Varchar(100) NOT NULL,
PRIMARY KEY(id_tipo_transaccion)
)ENGINE=INNODB;
#----------------------------------Transaccion------------------------------#
CREATE TABLE IF NOT EXISTS transaccion(
id_transaccion INT NOT NULL,
hora TIME,
PRIMARY KEY (id_transaccion),
id_cuentahabiente INT NOT NULL,
id_asignarC INT NOT NULL,
id_asignarT INT NOT NULL,
id_trabajador INT NOT NULL,
id_sucursal INT NOT NULL,
id_tipoTransaccion INT NOT NULL,
FOREIGN KEY (id_cuentahabiente)
REFERENCES cuenta_habiente(id_cuentahabiente),
FOREIGN KEY (id_asignarC)
REFERENCES asignar_cuenta(id_asignarC),
FOREIGN KEY (id_asignarT)
REFERENCES asignar_tarjeta(id_asignarT),
FOREIGN KEY (id_trabajador)
REFERENCES trabajador (id_trabajador),
FOREIGN KEY (id_sucursal)
REFERENCES sucursal (id_sucursal),
FOREIGN KEY (id_tipoTransaccion)
REFERENCES tipo_transaccion(id_tipo_transaccion)
)ENGINE=INNODB;

#--------------------------------INGRESO DE DATOS---------------------------#
#Datos de ubicacion
insert into zona(id_zona,nombre)
values(0,"Zona 5");
insert into zona(id_zona,nombre)
values(1,"Zona 10");
insert into zona(id_zona,nombre)
values(2,"Zona 6");
insert into zona(id_zona,nombre)
values(3,"Zona 7");
insert into zona(id_zona,nombre)
values(4,"Zona 8");
insert into zona(id_zona,nombre)
values(5,"Zona 1");
insert into zona(id_zona,nombre)
values(6,"Zona 11");
insert into zona(id_zona,nombre)
values(7,"Zona 4");
insert into zona(id_zona,nombre)
values(8,"Zona 2");
insert into zona(id_zona,nombre)
values(9,"Zona 3");

insert into municipio(id_municipio,nombre)
values(0,"Santa vista");
insert into municipio(id_municipio,nombre)
values(1,"Santa Monica");
insert into municipio(id_municipio,nombre)
values(2,"Sumpango");
insert into municipio(id_municipio,nombre)
values(3,"Villa Canales");
insert into municipio(id_municipio,nombre)
values(4,"Totonicapan");
insert into municipio(id_municipio,nombre)
values(5,"Villa Nueva");
insert into municipio(id_municipio,nombre)
values(6,"San Jose");
insert into municipio(id_municipio,nombre)
values(7,"San Jose del Golfo");
insert into municipio(id_municipio,nombre)
values(8,"San Jose Pinula");
insert into municipio(id_municipio,nombre)
values(9,"San Jose Villa Nueva");


insert into departamento(id_departamento,nombre)
values(0,"Izabal");
insert into departamento(id_departamento,nombre)
values(1,"Chiquimula");
insert into departamento(id_departamento,nombre)
values(2,"Zacapa");
insert into departamento(id_departamento,nombre)
values(3,"Peten");
insert into departamento(id_departamento,nombre)
values(4,"Guatemala");
insert into departamento(id_departamento,nombre)
values(5,"Alta Verapaz");
insert into departamento(id_departamento,nombre)
values(6,"Baja Verapaz");
insert into departamento(id_departamento,nombre)
values(7,"Jutiapa");
insert into departamento(id_departamento,nombre)
values(8,"Jalapa");
insert into departamento(id_departamento,nombre)
values(9,"San Marcos");

insert into colonia(id_colonia,nombre)
values(0,"San Miguel Petapa");
insert into colonia(id_colonia,nombre)
values(1,"San Jose Villa Nueva");
insert into colonia(id_colonia,nombre)
values(2,"Vista Hermosa");
insert into colonia(id_colonia,nombre)
values(3,"Las charcas");
insert into colonia(id_colonia,nombre)
values(4,"El carmen");
insert into colonia(id_colonia,nombre)
values(5,"Mariscal");
insert into colonia(id_colonia,nombre)
values(6,"Reformita");
insert into colonia(id_colonia,nombre)
values(7,"Monte Maria");
insert into colonia(id_colonia,nombre)
values(8,"Trebol");
insert into colonia(id_colonia,nombre)
values(9,"Javier");

#Tipo de cuenta y tarjeta
insert into tipo_tarjeta(id_tipoT,tipo_de_tarjeta)
values(0,"Premium");
insert into tipo_tarjeta(id_tipoT,tipo_de_tarjeta)
values(1,"Credito");
insert into tipo_tarjeta(id_tipoT,tipo_de_tarjeta)
values(2,"Debito");
insert into tipo_tarjeta(id_tipoT,tipo_de_tarjeta)
values(3,"Diamante");
insert into tipo_tarjeta(id_tipoT,tipo_de_tarjeta)
values(4,"Oro");
insert into tipo_tarjeta(id_tipoT,tipo_de_tarjeta)
values(5,"Estandar");
insert into tipo_tarjeta(id_tipoT,tipo_de_tarjeta)
values(6,"Comun");
insert into tipo_tarjeta(id_tipoT,tipo_de_tarjeta)
values(7,"Epica");
insert into tipo_tarjeta(id_tipoT,tipo_de_tarjeta)
values(8,"Legendaria");
insert into tipo_tarjeta(id_tipoT,tipo_de_tarjeta)
values(9,"Platinum");

insert into tipo_cuenta(id_tipoC,tipo_de_cuenta)
values(0,"Ahorro");
insert into tipo_cuenta(id_tipoC,tipo_de_cuenta)
values(1,"Cheques");
insert into tipo_cuenta(id_tipoC,tipo_de_cuenta)
values(2,"Jubilacion");
insert into tipo_cuenta(id_tipoC,tipo_de_cuenta)
values(3,"Pequeña");
insert into tipo_cuenta(id_tipoC,tipo_de_cuenta)
values(4,"Mancomunada");
insert into tipo_cuenta(id_tipoC,tipo_de_cuenta)
values(5,"Monetaria");
insert into tipo_cuenta(id_tipoC,tipo_de_cuenta)
values(6,"Debito");
insert into tipo_cuenta(id_tipoC,tipo_de_cuenta)
values(7,"Deposito");
insert into tipo_cuenta(id_tipoC,tipo_de_cuenta)
values(8,"Dolares");
insert into tipo_cuenta(id_tipoC,tipo_de_cuenta)
values(9,"Nomina");

#Creando Cuenta y Tarjeta
insert into cuenta(id_cuenta,agencia,codigo,id_tipoC)
values(0,"BI",1234,1);
insert into cuenta(id_cuenta,agencia,codigo,id_tipoC)
values(1,"BAM",5678,0);
insert into cuenta(id_cuenta,agencia,codigo,id_tipoC)
values(2,"BANTRAB",9101,2);
insert into cuenta(id_cuenta,agencia,codigo,id_tipoC)
values(3,"Banco G&T",1357,3);
insert into cuenta(id_cuenta,agencia,codigo,id_tipoC)
values(4,"Scotiabank",0246,4);
insert into cuenta(id_cuenta,agencia,codigo,id_tipoC)
values(5,"Multibank",1234,1);
insert into cuenta(id_cuenta,agencia,codigo,id_tipoC)
values(6,"HSBC",5678,0);
insert into cuenta(id_cuenta,agencia,codigo,id_tipoC)
values(7,"Fedecrédito",9101,2);
insert into cuenta(id_cuenta,agencia,codigo,id_tipoC)
values(8,"Financiera Fama",1357,3);
insert into cuenta(id_cuenta,agencia,codigo,id_tipoC)
values(9,"Óptima Servicios Financieros",0246,4);

insert into tarjeta(id_tarjeta,agencia,codigo,id_tipoT)
values(0,"BI", 002, 1);
insert into tarjeta(id_tarjeta,agencia,codigo,id_tipoT)
values(1,"BAM", 006, 4);
insert into tarjeta(id_tarjeta,agencia,codigo,id_tipoT)
values(2,"Multibank", 009, 2);
insert into tarjeta(id_tarjeta,agencia,codigo,id_tipoT)
values(3,"UPA", 001, 3);
insert into tarjeta(id_tarjeta,agencia,codigo,id_tipoT)
values(4,"Fedecrédito", 003, 4);
insert into tarjeta(id_tarjeta,agencia,codigo,id_tipoT)
values(5,"Banco G&T", 005, 5);
insert into tarjeta(id_tarjeta,agencia,codigo,id_tipoT)
values(6,"Óptima Servicios Financieros", 008, 6);
insert into tarjeta(id_tarjeta,agencia,codigo,id_tipoT)
values(7,"Citybank", 010, 7);
insert into tarjeta(id_tarjeta,agencia,codigo,id_tipoT)
values(8,"Chepe Te Presta", 011, 8);
insert into tarjeta(id_tarjeta,agencia,codigo,id_tipoT)
values(9,"HSBC", 012, 9);

#Sucursal
insert into sucursal(id_sucursal,nombre_sucursal,id_zona,id_colonia,id_departamento,id_municipio)
values(0,"Autoservicio Zona 10", 0, 3,3,1);
insert into sucursal(id_sucursal,nombre_sucursal,id_zona,id_colonia,id_departamento,id_municipio)
values(1,"Autoservicio Zona 5", 3, 2,3,4);
insert into sucursal(id_sucursal,nombre_sucursal,id_zona,id_colonia,id_departamento,id_municipio)
values(2,"Agencia Central", 1, 2,2,4);
insert into sucursal(id_sucursal,nombre_sucursal,id_zona,id_colonia,id_departamento,id_municipio)
values(3,"Autoservicio Zona 7", 3, 4,2,1);
insert into sucursal(id_sucursal,nombre_sucursal,id_zona,id_colonia,id_departamento,id_municipio)
values(4,"Autoservicio Zona 8", 4, 2,3,4);
insert into sucursal(id_sucursal,nombre_sucursal,id_zona,id_colonia,id_departamento,id_municipio)
values(5,"Autoservicio Zona 2", 8, 5,6,7);
insert into sucursal(id_sucursal,nombre_sucursal,id_zona,id_colonia,id_departamento,id_municipio)
values(6,"Autoservicio Zona 3", 9, 3,4,6);
insert into sucursal(id_sucursal,nombre_sucursal,id_zona,id_colonia,id_departamento,id_municipio)
values(7,"Autoservicio Zona 4", 7, 6,8,5);
insert into sucursal(id_sucursal,nombre_sucursal,id_zona,id_colonia,id_departamento,id_municipio)
values(8,"Autoservicio Zona 11", 6, 7,5,8);
insert into sucursal(id_sucursal,nombre_sucursal,id_zona,id_colonia,id_departamento,id_municipio)
values(9,"Autoservicio Zona 21", 4, 9,9,9);

#Trabajador
insert into trabajador(id_trabajador,nombre,apellido,direccion,edad,telefono,id_sucursal)
values(0,"Angel","Sanabria","Villa lobos 1",18,59421231,0);
insert into trabajador(id_trabajador,nombre,apellido,direccion,edad,telefono,id_sucursal)
values(1,"Michael","Quiñonez","Villa Nueva",23,44234212,4);
insert into trabajador(id_trabajador,nombre,apellido,direccion,edad,telefono,id_sucursal)
values(2,"Jose","Salvatierra","Bosques de San Nicolas",20,4645632,3);
insert into trabajador(id_trabajador,nombre,apellido,direccion,edad,telefono,id_sucursal)
values(3,"David","Ambrosio","San Miguel Petapa",21,12335466,2);
insert into trabajador(id_trabajador,nombre,apellido,direccion,edad,telefono,id_sucursal)
values(4,"Jose","Acabal","San Lucas",30,68567452,1);
insert into trabajador(id_trabajador,nombre,apellido,direccion,edad,telefono,id_sucursal)
values(5,"Riquelme","Guillermo","San Tomas",20,68567452,5);
insert into trabajador(id_trabajador,nombre,apellido,direccion,edad,telefono,id_sucursal)
values(6,"Juan","Sanabria","Bosques 1",23,8912492,6);
insert into trabajador(id_trabajador,nombre,apellido,direccion,edad,telefono,id_sucursal)
values(7,"Vivian","Gonzalez","Bosques 2",25,4534512,9);
insert into trabajador(id_trabajador,nombre,apellido,direccion,edad,telefono,id_sucursal)
values(8,"Vanessa","Lopez","Miraflores",20,99182913,7);
insert into trabajador(id_trabajador,nombre,apellido,direccion,edad,telefono,id_sucursal)
values(9,"Melany","Rosales","Reformita",19,56219988,8);


#Intereses
insert into intereses(id_intereses,porcentaje,id_tipoT)
values(0,0.20,0);
insert into intereses(id_intereses,porcentaje,id_tipoT)
values(1,0.25,1);
insert into intereses(id_intereses,porcentaje,id_tipoT)
values(2,0.15,2);
insert into intereses(id_intereses,porcentaje,id_tipoT)
values(3,0.54,3);
insert into intereses(id_intereses,porcentaje,id_tipoT)
values(4,0.33,4);
insert into intereses(id_intereses,porcentaje,id_tipoT)
values(5,0.10,5);
insert into intereses(id_intereses,porcentaje,id_tipoT)
values(6,0.22,6);
insert into intereses(id_intereses,porcentaje,id_tipoT)
values(7,0.19,7);
insert into intereses(id_intereses,porcentaje,id_tipoT)
values(8,0.33,8);
insert into intereses(id_intereses,porcentaje,id_tipoT)
values(9,0.39,9);

#Asignar Cuenta y Tarjeta
insert into asignar_tarjeta(id_asignarT,fecha_inicio,fecha_vencimiento,id_sucursal,id_tarjeta)
values(0,"2021-08-12","2025-08-12",0,2);
insert into asignar_tarjeta(id_asignarT,fecha_inicio,fecha_vencimiento,id_sucursal,id_tarjeta)
values(1,"2021-07-14","2025-07-12",2,4);
insert into asignar_tarjeta(id_asignarT,fecha_inicio,fecha_vencimiento,id_sucursal,id_tarjeta)
values(2,"2021-08-16","2025-08-10",3,2);
insert into asignar_tarjeta(id_asignarT,fecha_inicio,fecha_vencimiento,id_sucursal,id_tarjeta)
values(3,"2021-08-20","2025-05-20",1,2);
insert into asignar_tarjeta(id_asignarT,fecha_inicio,fecha_vencimiento,id_sucursal,id_tarjeta)
values(4,"2021-08-21","2025-06-21",4,0);
insert into asignar_tarjeta(id_asignarT,fecha_inicio,fecha_vencimiento,id_sucursal,id_tarjeta)
values(5,"2020-06-12","2024-06-12",5,4);
insert into asignar_tarjeta(id_asignarT,fecha_inicio,fecha_vencimiento,id_sucursal,id_tarjeta)
values(6,"2021-05-04","2025-07-12",6,5);
insert into asignar_tarjeta(id_asignarT,fecha_inicio,fecha_vencimiento,id_sucursal,id_tarjeta)
values(7,"2021-03-22","2025-08-10",7,8);
insert into asignar_tarjeta(id_asignarT,fecha_inicio,fecha_vencimiento,id_sucursal,id_tarjeta)
values(8,"2021-04-30","2025-05-20",8,7);
insert into asignar_tarjeta(id_asignarT,fecha_inicio,fecha_vencimiento,id_sucursal,id_tarjeta)
values(9,"2021-05-19","2025-06-21",9,9);

insert into asignar_cuenta(id_asignarC,codigo_de_cuenta,id_sucursal,id_cuenta)
values(0,001,4,3);
insert into asignar_cuenta(id_asignarC,codigo_de_cuenta,id_sucursal,id_cuenta)
values(1,002,1,1);
insert into asignar_cuenta(id_asignarC,codigo_de_cuenta,id_sucursal,id_cuenta)
values(2,003,0,2);
insert into asignar_cuenta(id_asignarC,codigo_de_cuenta,id_sucursal,id_cuenta)
values(3,004,3,4);
insert into asignar_cuenta(id_asignarC,codigo_de_cuenta,id_sucursal,id_cuenta)
values(4,005,1,0);
insert into asignar_cuenta(id_asignarC,codigo_de_cuenta,id_sucursal,id_cuenta)
values(5,006,5,8);
insert into asignar_cuenta(id_asignarC,codigo_de_cuenta,id_sucursal,id_cuenta)
values(6,007,6,9);
insert into asignar_cuenta(id_asignarC,codigo_de_cuenta,id_sucursal,id_cuenta)
values(7,008,7,6);
insert into asignar_cuenta(id_asignarC,codigo_de_cuenta,id_sucursal,id_cuenta)
values(8,009,8,7);
insert into asignar_cuenta(id_asignarC,codigo_de_cuenta,id_sucursal,id_cuenta)
values(9,010,9,5);

#Cuenta Habiente
insert into cuenta_habiente(id_cuentahabiente,nombre,apellido,edad,telefono,direccion,id_asignarC,id_asignarT,id_sucursal)
values(0,"Angel", "Morales",20,2352354,"San Lucas",2,1,2);
insert into cuenta_habiente(id_cuentahabiente,nombre,apellido,edad,telefono,direccion,id_asignarC,id_asignarT,id_sucursal)
values(1,"Enrique", "Sipaque",22,56756734,"Villa Canales",0,4,1);
insert into cuenta_habiente(id_cuentahabiente,nombre,apellido,edad,telefono,direccion,id_asignarC,id_asignarT,id_sucursal)
values(2,"Julian", "Atzun",19,5236346,"Florida",1,2,3);
insert into cuenta_habiente(id_cuentahabiente,nombre,apellido,edad,telefono,direccion,id_asignarC,id_asignarT,id_sucursal)
values(3,"Robles", "Muros",18,35236357,"Santa Monica",3,3,1);
insert into cuenta_habiente(id_cuentahabiente,nombre,apellido,edad,telefono,direccion,id_asignarC,id_asignarT,id_sucursal)
values(4,"Cesar", "Lopez",25,23423424,"San Patricio",4,0,0);
insert into cuenta_habiente(id_cuentahabiente,nombre,apellido,edad,telefono,direccion,id_asignarC,id_asignarT,id_sucursal)
values(5,"David", "Quiñonez",24,23653463,"Bosques 1",9,1,2);
insert into cuenta_habiente(id_cuentahabiente,nombre,apellido,edad,telefono,direccion,id_asignarC,id_asignarT,id_sucursal)
values(6,"Michael", "Sipaque",21,75685678,"Bosques 2",5,8,7);
insert into cuenta_habiente(id_cuentahabiente,nombre,apellido,edad,telefono,direccion,id_asignarC,id_asignarT,id_sucursal)
values(7,"Anthony", "Rodriguez",20,123124235,"Miraflores",6,5,9);
insert into cuenta_habiente(id_cuentahabiente,nombre,apellido,edad,telefono,direccion,id_asignarC,id_asignarT,id_sucursal)
values(8,"Marco", "Monroy",19,5347467,"Monte Maria 1",7,9,6);
insert into cuenta_habiente(id_cuentahabiente,nombre,apellido,edad,telefono,direccion,id_asignarC,id_asignarT,id_sucursal)
values(9,"Jorge", "Perez",19,7896785,"Monte Maria 2",8,7,5);

#Valores de mancomunada
insert into cuenta_mancomunada(id_cuentaM,propietarios)
values(0,3);
insert into cuenta_mancomunada(id_cuentaM,propietarios)
values(1,1);
insert into cuenta_mancomunada(id_cuentaM,propietarios)
values(2,1);

#Asignando Cuenta Mancomunada
insert into asignacionM(id_asignacionM,id_cuentahabiente,id_tipoC,id_cuentaM)
values(0,1,4,0);
insert into asignacionM(id_asignacionM,id_cuentahabiente,id_tipoC,id_cuentaM)
values(1,2,4,0);
insert into asignacionM(id_asignacionM,id_cuentahabiente,id_tipoC,id_cuentaM)
values(2,3,4,0);
insert into asignacionM(id_asignacionM,id_cuentahabiente,id_tipoC,id_cuentaM)
values(3,4,4,1);
insert into asignacionM(id_asignacionM,id_cuentahabiente,id_tipoC,id_cuentaM)
values(4,0,4,2);

#Tipo de Transaccion
insert into tipo_transaccion(id_tipo_transaccion,nombre_transaccion)
values(0,"Creacion de cuenta");
insert into tipo_transaccion(id_tipo_transaccion,nombre_transaccion)
values(1,"Retiro de dinero");
insert into tipo_transaccion(id_tipo_transaccion,nombre_transaccion)
values(2,"Cambio de cheques");
insert into tipo_transaccion(id_tipo_transaccion,nombre_transaccion)
values(3,"Deposito");
insert into tipo_transaccion(id_tipo_transaccion,nombre_transaccion)
values(4,"Cambio de tarjetas");
insert into tipo_transaccion(id_tipo_transaccion,nombre_transaccion)
values(5,"Tarjeta");
insert into tipo_transaccion(id_tipo_transaccion,nombre_transaccion)
values(6,"Cheques");
insert into tipo_transaccion(id_tipo_transaccion,nombre_transaccion)
values(7,"Prestamos");
insert into tipo_transaccion(id_tipo_transaccion,nombre_transaccion)
values(8,"Financiamiento");
insert into tipo_transaccion(id_tipo_transaccion,nombre_transaccion)
values(9,"Remesa");

#Transaccion
insert into transaccion(id_transaccion,hora,id_cuentahabiente,id_asignarC,id_asignarT,id_trabajador,id_sucursal,id_tipoTransaccion)
values(0,"08:00:00",0,1,0,1,0,2);
insert into transaccion(id_transaccion,hora,id_cuentahabiente,id_asignarC,id_asignarT,id_trabajador,id_sucursal,id_tipoTransaccion)
values(1,"10:30:00",1,3,1,0,1,4);
insert into transaccion(id_transaccion,hora,id_cuentahabiente,id_asignarC,id_asignarT,id_trabajador,id_sucursal,id_tipoTransaccion)
values(2,"05:33:00",3,2,4,2,3,7);
insert into transaccion(id_transaccion,hora,id_cuentahabiente,id_asignarC,id_asignarT,id_trabajador,id_sucursal,id_tipoTransaccion)
values(3,"09:21:00",4,0,2,3,2,5);
insert into transaccion(id_transaccion,hora,id_cuentahabiente,id_asignarC,id_asignarT,id_trabajador,id_sucursal,id_tipoTransaccion)
values(4,"07:10:00",2,1,3,4,0,1);
insert into transaccion(id_transaccion,hora,id_cuentahabiente,id_asignarC,id_asignarT,id_trabajador,id_sucursal,id_tipoTransaccion)
values(5,"12:00:00",5,9,5,9,5,0);
insert into transaccion(id_transaccion,hora,id_cuentahabiente,id_asignarC,id_asignarT,id_trabajador,id_sucursal,id_tipoTransaccion)
values(6,"04:30:00",6,8,6,6,9,8);
insert into transaccion(id_transaccion,hora,id_cuentahabiente,id_asignarC,id_asignarT,id_trabajador,id_sucursal,id_tipoTransaccion)
values(7,"15:33:00",7,7,7,8,6,3);
insert into transaccion(id_transaccion,hora,id_cuentahabiente,id_asignarC,id_asignarT,id_trabajador,id_sucursal,id_tipoTransaccion)
values(8,"19:21:00",8,6,8,5,7,6);
insert into transaccion(id_transaccion,hora,id_cuentahabiente,id_asignarC,id_asignarT,id_trabajador,id_sucursal,id_tipoTransaccion)
values(9,"16:10:00",9,5,9,6,8,9);

#--------------------------------------Consultas--------------------------------------------#

#Mostrar usuarios de una mancomunada
select asignacionM.id_asignacionM,asignacionM.id_cuentaM, cuenta_habiente.nombre
from asignacionM, cuenta_habiente where id_cuentaM=0 and asignacionM.id_cuentahabiente=
cuenta_habiente.id_cuentahabiente; 

#Mostrar usuarios de una mancomunada
select asignacionM.id_cuentaM as "ID MANCOMUNADA", asignacionM.id_cuentahabiente as "ID CUENTA HABIENTE",
cuenta_habiente.nombre as "PROPIETARIOS", tipo_cuenta.tipo_de_cuenta as "TIPO DE LA CUENTA"
from asignacionM
JOIN cuenta_habiente
ON asignacionM.id_cuentahabiente=cuenta_habiente.id_cuentahabiente
JOIN tipo_cuenta
ON asignacionM.id_tipoC= tipo_cuenta.id_tipoC;

#Mostrar trabajadores en sucursal
select count(id_sucursal) as "Autoservicio Zona 10" from trabajador where id_sucursal=0;
select count(id_sucursal) as "Autoservicio Zona 5" from trabajador where id_sucursal=1;
select count(id_sucursal) as "Agencia Central" from trabajador where id_sucursal=2;
select count(id_sucursal) as "Autoservicio Zona 7" from trabajador where id_sucursal=3;
select count(id_sucursal) as "Autoservicio Zona 8" from trabajador where id_sucursal=4;
select count(id_sucursal) as "Autoservicio Zona 2" from trabajador where id_sucursal=5;
select count(id_sucursal) as "Autoservicio Zona 3" from trabajador where id_sucursal=6;
select count(id_sucursal) as "Autoservicio Zona 4" from trabajador where id_sucursal=7;
select count(id_sucursal) as "Autoservicio Zona 11" from trabajador where id_sucursal=8;
select count(id_sucursal) as "Autoservicio Zona 21" from trabajador where id_sucursal=9;

#Mostrar el nombre de los trabajadores que se encuentran en las sucursales
select trabajador.nombre, trabajador.apellido, sucursal.nombre_sucursal from trabajador
JOIN sucursal
ON trabajador.id_sucursal= sucursal.id_sucursal;

#Mostrar trabajadores por sucursal, ingresando el nombre de la sucursal
select sucursal.id_sucursal,sucursal.nombre_sucursal,trabajador.id_trabajador,trabajador.nombre,
trabajador.apellido from sucursal, trabajador where sucursal.id_sucursal=trabajador.id_sucursal and
sucursal.nombre_sucursal= "Autoservicio Zona 10";

#Cantidad cuenta habientes por sucursal
select count(id_sucursal) as "Autoservicio Zona 10" from cuenta_habiente where id_sucursal=0;
select count(id_sucursal) as "Autoservicio Zona 5" from cuenta_habiente where id_sucursal=1;
select count(id_sucursal) as "Agencia Central" from cuenta_habiente where id_sucursal=2;
select count(id_sucursal) as "Autoservicio Zona 7" from cuenta_habiente where id_sucursal=3;
select count(id_sucursal) as "Autoservicio Zona 8" from cuenta_habiente where id_sucursal=4;
select count(id_sucursal) as "Autoservicio Zona 2" from cuenta_habiente where id_sucursal=5;
select count(id_sucursal) as "Autoservicio Zona 3" from cuenta_habiente where id_sucursal=6;
select count(id_sucursal) as "Autoservicio Zona 4" from cuenta_habiente where id_sucursal=7;
select count(id_sucursal) as "Autoservicio Zona 11" from cuenta_habiente where id_sucursal=8;
select count(id_sucursal) as "Autoservicio Zona 21" from cuenta_habiente where id_sucursal=9;

#Cuentahabiente por sucursal, por nombre ---
select count(cuenta_habiente.id_sucursal) as "CUENTA HABIENTES POR SUCURSAL" 
from cuenta_habiente, sucursal where cuenta_habiente.id_sucursal=sucursal.id_sucursal and
 sucursal.nombre_sucursal="Autoservicio Zona 5";

#Mostrar cuenta habientes por cada sucursal
select sucursal.id_sucursal,sucursal.nombre_sucursal,cuenta_habiente.id_cuentahabiente, 
cuenta_habiente.nombre from sucursal,cuenta_habiente where sucursal.id_sucursal=
cuenta_habiente.id_sucursal and sucursal.nombre_sucursal= "Autoservicio Zona 10";

#Mostrar los datos de un colaborador por orden ascendente y descendente del apellido
select sucursal.id_sucursal,sucursal.nombre_sucursal,trabajador.id_trabajador,trabajador.nombre,
trabajador.apellido from sucursal, trabajador where sucursal.id_sucursal=trabajador.id_sucursal and
sucursal.nombre_sucursal= "Autoservicio Zona 5" order by trabajador.apellido asc;

select sucursal.id_sucursal,sucursal.nombre_sucursal,trabajador.id_trabajador,trabajador.nombre,
trabajador.apellido from sucursal, trabajador where sucursal.id_sucursal=trabajador.id_sucursal and
sucursal.nombre_sucursal= "Autoservicio Zona 5" order by trabajador.apellido desc;

#Mostrar la cantidad de cuenta habientes y el nombre de los cuenta habientes que tiene una cuenta de ahorro
select count(tipo_cuenta.tipo_de_cuenta)AS "CONTEO DE HABIENTES" from cuenta_habiente, 
sucursal, tipo_cuenta, cuenta,asignar_cuenta where tipo_cuenta.id_tipoC= 1 and 
cuenta_habiente.id_asignarC=asignar_cuenta.id_asignarC and asignar_cuenta.id_cuenta=
cuenta.id_cuenta and cuenta.id_tipoC=tipo_cuenta.id_tipoC and cuenta_habiente.id_sucursal=
sucursal.id_sucursal and sucursal.nombre_sucursal= "Autoservicio Zona 10";

#Mostrar la cantidad de tarjetas de credito
select count(tipo_tarjeta.id_tipoT)AS "CONTEO DE TARJETAS" from asignar_tarjeta, tarjeta, 
tipo_tarjeta, sucursal where asignar_tarjeta.id_tarjeta=tarjeta.id_tarjeta and 
tarjeta.id_tipoT=tipo_tarjeta.id_tipoT and tipo_tarjeta.id_tipoT=1 and 
sucursal.nombre_sucursal="Autoservicio Zona 10";