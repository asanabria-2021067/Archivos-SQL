CREATE DATABASE IF NOT EXISTS peliculas;
USE peliculas;
CREATE TABLE IF NOT EXISTS pelicula(
id_pelicula INT NOT NULL,
titulo VARCHAR(100) NOT NULL,
año INT NOT NULL,
nacionalidad VARCHAR(150) NOT NULL,
idioma VARCHAR(100) NOT NULL,
PRIMARY KEY (id_pelicula)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS autor(
id_autor INT NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
año_de_nacimiento INT NOT NULL,
nacionalidad VARCHAR(150) NOT NULL,
idioma VARCHAR(100) NOT NULL,
PRIMARY KEY (id_autor),
peliculas_id_pelicula INT NOT NULL,
CONSTRAINT fkautor_peliculas
FOREIGN KEY(peliculas_id_pelicula)
REFERENCES pelicula(id_pelicula)
)ENGINE=INNODB;