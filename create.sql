CREATE DATABASE IF NOT EXISTS galeria_arte;
USE galeria_arte;

DROP TABLE IF EXISTS cliente_tema;
DROP TABLE IF EXISTS cliente_artista;
DROP TABLE IF EXISTS obra_tema;
DROP TABLE IF EXISTS artista_estilo;
DROP TABLE IF EXISTS obra;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS tema;
DROP TABLE IF EXISTS estilo;
DROP TABLE IF EXISTS artista;

CREATE TABLE artista (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artistico VARCHAR(100) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL,
    edad INT NOT NULL,
    localidad_residencia VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL
);

CREATE TABLE estilo (
    id_estilo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE artista_estilo (
    id_artista INT NOT NULL,
    id_estilo INT NOT NULL,
    PRIMARY KEY (id_artista, id_estilo),
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_estilo) REFERENCES estilo(id_estilo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE obra (
    id_obra INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL UNIQUE,
    anio_creacion INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE tema (
    id_tema INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NOT NULL
);

CREATE TABLE obra_tema (
    id_obra INT NOT NULL,
    id_tema INT NOT NULL,
    PRIMARY KEY (id_obra, id_tema),
    FOREIGN KEY (id_obra) REFERENCES obra(id_obra)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_tema) REFERENCES tema(id_tema)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE cliente (
    dni VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    localidad VARCHAR(100) NOT NULL,
    calle VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    dinero_total_gastado DECIMAL(10,2) NOT NULL DEFAULT 0
);

CREATE TABLE cliente_artista (
    dni_cliente VARCHAR(9) NOT NULL,
    id_artista INT NOT NULL,
    PRIMARY KEY (dni_cliente, id_artista),
    FOREIGN KEY (dni_cliente) REFERENCES cliente(dni)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE cliente_tema (
    dni_cliente VARCHAR(9) NOT NULL,
    id_tema INT NOT NULL,
    PRIMARY KEY (dni_cliente, id_tema),
    FOREIGN KEY (dni_cliente) REFERENCES cliente(dni)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_tema) REFERENCES tema(id_tema)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
