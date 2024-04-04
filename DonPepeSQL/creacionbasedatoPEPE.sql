CREATE DATABASE tienda_don_pepe;

USE tienda_don_pepe;

-- Tabla Cliente
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20),
    cedula VARCHAR(20),
    password VARCHAR(100)
);

-- Tabla DireccionCliente 
CREATE TABLE DireccionCliente (
    id INT PRIMARY KEY,
    cliente_id INT,
    direccion VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabla Zona
CREATE TABLE Zona (
    zona_id INT PRIMARY KEY,
    codigo_postal VARCHAR(20),
    descripcion TEXT,
    costo_entrega DECIMAL(10, 2)
);

-- Tabla Cliente_Zona (relación muchos a muchos entre Cliente y Zona)
CREATE TABLE Cliente_Zona (
    cliente_id INT,
    zona_id INT,
    PRIMARY KEY (cliente_id, zona_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (zona_id) REFERENCES Zona(zona_id)
);

-- Tabla Almacen
CREATE TABLE Almacen (
    almacen_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    capacidad INT,
    ubicacion VARCHAR(255)
);

-- Tabla CarritoCompra
CREATE TABLE CarritoCompra (
    carrito_id INT PRIMARY KEY,
    cliente_id INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cant_productos INT, 
    num_tarjeta VARCHAR(20),
    fecha_caducidad DATE,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabla Producto
CREATE TABLE Producto (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    volumen DECIMAL(10, 2),
    peso DECIMAL(10, 2),
    origen VARCHAR(100),
    marca VARCHAR(100),
    imagen VARCHAR(255),
    almacen_id INT,
    carrito_id INT,
    FOREIGN KEY (almacen_id) REFERENCES Almacen(almacen_id),
    FOREIGN KEY (carrito_id) REFERENCES CarritoCompra(carrito_id)
);

CREATE TABLE DisponibilidadProducto (
    almacen_id INT,
    producto_id INT,
    unidades_disponible INT,
    PRIMARY KEY (almacen_id, producto_id),
    FOREIGN KEY (almacen_id) REFERENCES Almacen(almacen_id),
    FOREIGN KEY (producto_id) REFERENCES Producto(producto_id)
);


-- Tabla Categoria
CREATE TABLE Categoria (
    categoria_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    condicion VARCHAR(45)
);

-- Tabla Producto_Categoria (relación muchos a muchos entre Producto y Categoria)
CREATE TABLE Producto_Categoria (
    producto_id INT,
    categoria_id INT,
    PRIMARY KEY (producto_id, categoria_id),
    FOREIGN KEY (producto_id) REFERENCES Producto(producto_id),
    FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id)
);

-- Tabla SeccionAlmacen (relación muchos a muchos entre Almacen y Seccion)
CREATE TABLE SeccionAlmacen (
    almacen_id INT,
    seccion VARCHAR(100),
    PRIMARY KEY (almacen_id, seccion),
    FOREIGN KEY (almacen_id) REFERENCES Almacen(almacen_id)
);

-- Tabla Compra
CREATE TABLE Compra (
    compra_id INT PRIMARY KEY,
    carrito_id INT,
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado BOOLEAN, 
    FOREIGN KEY (carrito_id) REFERENCES CarritoCompra(carrito_id)
);

-- Tabla Domiciliario
CREATE TABLE Domiciliario (
    domiciliario_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    placa VARCHAR(20)
);

-- Tabla Pedido
CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY,
    compra_id INT,
    direccion_entrega_id INT,
    fecha_emision TIMESTAMP,
    fecha_entrega TIMESTAMP,
    estado VARCHAR(100),
    importe_total DECIMAL(10, 2),
    id_domiciliario INT,
    FOREIGN KEY (compra_id) REFERENCES Compra(compra_id),
    FOREIGN KEY (direccion_entrega_id) REFERENCES DireccionCliente(id),
    FOREIGN KEY (id_domiciliario) REFERENCES Domiciliario(domiciliario_id)
);

-- Tabla Domiciliario_Zona (relación muchos a muchos entre Domiciliario y Zona)
CREATE TABLE Domiciliario_Zona (
    domiciliario_id INT,
    zona_id INT,
    PRIMARY KEY (domiciliario_id, zona_id),
    FOREIGN KEY (domiciliario_id) REFERENCES Domiciliario(domiciliario_id),
    FOREIGN KEY (zona_id) REFERENCES Zona(zona_id)
);



