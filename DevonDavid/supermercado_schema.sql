-- DROP DATABASE IF EXISTS supermercado;
CREATE DATABASE IF NOT EXISTS supermercado;

USE supermercado;

-- Crear las tablas independientes
CREATE TABLE IF NOT EXISTS Clientes (
    id INT NOT NULL PRIMARY KEY,
    cedula VARCHAR(20),
    nombres VARCHAR(40),
    apellidos VARCHAR(40),
    direccion VARCHAR(50),
    telefono VARCHAR(20),
    codigo_postal VARCHAR(20),
    email VARCHAR(100),
    contrasenia VARCHAR(100)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Categorias (
    nombre VARCHAR(40) PRIMARY KEY,
    condicion_almacenaje VARCHAR(40),
    observaciones VARCHAR(255)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Almacenistas (
    id INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Repartidores (
    id INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50),
    matricula_furgoneta VARCHAR(10)
)  ENGINE=INNODB;

-- Crear tablas de entidades con atributos multivaluados
CREATE TABLE IF NOT EXISTS repartidores_codigos_postales (
    id_repartidor INT NOT NULL,
    codigo_postal VARCHAR(20),
    FOREIGN KEY (id_repartidor)
        REFERENCES Repartidores (id),
    PRIMARY KEY (id_repartidor , codigo_postal)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS almacenistas_areas (
    id_almacenista INT NOT NULL,
    area VARCHAR(50),
    FOREIGN KEY (id_almacenista)
        REFERENCES Almacenistas (id),
    PRIMARY KEY (id_almacenista , area)
)  ENGINE=INNODB;

-- Crear tabla con llaves foraneas
CREATE TABLE IF NOT EXISTS Productos (
    id INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50),
    marca VARCHAR(40),
    origen VARCHAR(40),
    volumen VARCHAR(20),
    peso VARCHAR(20),
    fotografia VARCHAR(255),
    precio BIGINT,
    stock BIGINT DEFAULT 0,
    nombre_categoria VARCHAR(40) NOT NULL,
    FOREIGN KEY (nombre_categoria)
        REFERENCES Categorias (nombre)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Pedidos (
    id INT NOT NULL PRIMARY KEY,
    direccion VARCHAR(50),
    numero_tarjeta VARCHAR(20),
    vencimiento_tarjeta DATE,
    estado VARCHAR(20),
    fecha_solicitud TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_servido TIMESTAMP,
    fecha_entregado TIMESTAMP,
    id_repartidor INT,
    id_almacenista INT,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_repartidor)
        REFERENCES Repartidores (id),
    FOREIGN KEY (id_almacenista)
        REFERENCES Almacenistas (id),
    FOREIGN KEY (id_cliente)
        REFERENCES Clientes (id)
)  ENGINE=INNODB;

-- Crear tablas intermedias de relaciones muchos a muchos
CREATE TABLE IF NOT EXISTS pedidos_productos (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario BIGINT NOT NULL,
    FOREIGN KEY (id_pedido)
        REFERENCES Pedidos (id),
    FOREIGN KEY (id_producto)
        REFERENCES Productos (id),
    PRIMARY KEY (id_pedido , id_producto)
)  ENGINE=INNODB;
