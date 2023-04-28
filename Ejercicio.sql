CREATE DATABASE IF NOT EXISTS ejercicio;
USE ejercicio;
CREATE TABLE IF NOT EXISTS cliente(
id_cliente INT NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
direccion VARCHAR(200),
telefono INT,
nit INT NOT NULL,
PRIMARY KEY (id_cliente)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS factura(
id_factura INT NOT NULL,
total_de_productos INT,
monto_a_pagar FLOAT NOT NULL,
cambio_del_pago INT,
PRIMARY KEY (id_factura),
cliente_id_cliente INT NOT NULL,
FOREIGN KEY (cliente_id_cliente)
References cliente(id_cliente),
producto_id_producto INT NOT NULL,
FOREIGN KEY (producto_id_producto)
References producto(id_producto)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS producto(
id_producto INT NOT NULL,
nombre_producto VARCHAR(100) NOT NULL,
descripcion VARCHAR(250),
marca VARCHAR(50),
costo FLOAT NOT NULL,
cantidad INT NOT NULL,
precio FLOAT NOT NULL,
fecha_de_vencimiento date,
fecha_de_entrada date,
PRIMARY KEY (id_producto)
)ENGINE=INNODB;