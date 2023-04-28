CREATE DATABASE banca_Electronica;
USE banca_Electronica;

CREATE TABLE cliente (
codigoCliente INT AUTO_INCREMENT NOT NULL,
nombreCliente VARCHAR (50) NOT NULL,
apellidoCliente VARCHAR (50) NOT NULL,
sexoCliente VARCHAR (9) NOT NULL,
nacionalidadCliente VARCHAR (50) NOT NULL,
identificacionCliente BIGINT NOT NULL,
tipoIdentificacion VARCHAR (10) NOT NULL,
PRIMARY KEY (codigoCliente)
);

CREATE TABLE cuentasBancarias(
idCuenta BIGINT AUTO_INCREMENT NOT NULL,
propietarioCuenta INT NOT NULL,
tipoCuenta VARCHAR (50) NOT NULL,
monedaCuenta VARCHAR (25) NOT NULL,
saldoCuenta BIGINT NOT NULL,
PRIMARY KEY (idCuenta),
FOREIGN KEY (propietarioCuenta) REFERENCES cliente (codigoCliente)
);

CREATE TABLE historialTransacciones(
idTransaccion INT AUTO_INCREMENT NOT NULL,
fechaTransaccion DATE NOT NULL,
montoTransaccion BIGINT NOT NULL,
cuentaProveedora BIGINT NOT NULL,
cuentaAcreedora BIGINT,
monedaTransaccion VARCHAR (25) NOT NULL,
motivoTransaccion VARCHAR (50) NOT NULL,
pagado VARCHAR (50) NOT NULL,
PRIMARY KEY (idTransaccion),
FOREIGN KEY (cuentaProveedora) REFERENCES cuentasBancarias (idCuenta),
FOREIGN KEY (cuentaAcreedora) REFERENCES cuentasBancarias (idCuenta)
);


CREATE TABLE usuario(
idUsuario INT AUTO_INCREMENT NOT NULL,
propietarioUsuario INT NOT NULL,
cuentaAsociada BIGINT NOT NULL,
contraseñaUsuario VARCHAR (35) NOT NULL,
nombreUsuario VARCHAR (15) NOT NULL,
estadoUsuario VARCHAR (30) NOT NULL,
fechaCreacion DATE NOT NULL,
PRIMARY KEY (idUsuario),
FOREIGN KEY (propietarioUsuario) REFERENCES cliente (codigoCliente),
FOREIGN KEY (cuentaAsociada) REFERENCES cuentasBancarias (idCuenta)
);
