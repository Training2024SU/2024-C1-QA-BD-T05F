CREATE Schema if not exists zoologico;
use zoologico;

-- Se crean tablas sin llaves foraneas
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS EMPLEADO(
ID varchar(10) NOT NULL,
nombre varchar(40) NOT NULL,
fecha_nac date NOT NULL,
salario Integer NOT NULL,
cargo varchar(20) NOT NULL,
direccion varchar(40) NOT NULL,
telefono varchar(15) NOT NULL,
email varchar(40) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE IF NOT EXISTS Proveedor (
    ID VARCHAR(10) NOT NULL,
    Nombre VARCHAR(40) NOT NULL,
    Especialidad VARCHAR(20) NOT NULL,
    Descripcion VARCHAR(40) NOT NULL,
    PRIMARY KEY (ID)
);

-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS Especialidad_empleado(
Id_empleado varchar(10) NOT NULL,
especialidad varchar(20) NOT NULL,
FOREIGN KEY (Id_empleado) REFERENCES Empleado (ID)
);



CREATE TABLE Habitat (
    ID VARCHAR(10) NOT NULL,
    Ecosistema VARCHAR(40) NOT NULL,
    ID_empleado VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_empleado) REFERENCES Empleado(ID)
);

CREATE TABLE IF NOT EXISTS Animales (
    ID VARCHAR(10) NOT NULL,
    Nombre VARCHAR(40) NOT NULL,
    Clasificacion VARCHAR(10) NOT NULL,
    Peso VARCHAR(10) NOT NULL,
    ID_entrenador VARCHAR(10) NOT NULL,
    ID_habitat VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_entrenador) REFERENCES Empleado(ID),
    FOREIGN KEY (ID_habitat) REFERENCES Habitat(ID)
);

CREATE TABLE IF NOT EXISTS Alimento (
    ID VARCHAR(10) NOT NULL,
    Nombre VARCHAR(40),
    Tipo VARCHAR(40),
    Descripcion VARCHAR(80),
    ID_proveedor varchar(10),
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_proveedor) REFERENCES Proveedor(ID)
);

CREATE TABLE IF NOT EXISTS Dieta (
    ID VARCHAR(10) NOT NULL,
    Descripcion VARCHAR(40),
    Dosis VARCHAR(10),
    ID_veterinario VARCHAR(10),
    ID_animal VARCHAR(10),
    ID_alimento VARCHAR(10),
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_veterinario) REFERENCES Empleado(ID),
    FOREIGN KEY (ID_animal) REFERENCES Animales(ID),
    FOREIGN KEY (ID_alimento) REFERENCES Alimento(ID)
);

CREATE TABLE IF NOT EXISTS Comida (
    ID_animal VARCHAR(10) NOT NULL,
    ID_alimento VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID_animal, ID_alimento),
    FOREIGN KEY (ID_animal) REFERENCES Animales(ID),
    FOREIGN KEY (ID_alimento) REFERENCES Alimento(ID)
);


CREATE TABLE IF NOT EXISTS Consulta (
	ID VARCHAR(10) NOT NULL, 
    ID_animal VARCHAR(10) NOT NULL,
    ID_empleado VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_animal) REFERENCES Animales(ID),
    FOREIGN KEY (ID_empleado) REFERENCES Empleado(ID)
);

CREATE TABLE IF NOT EXISTS Orden_de_compra (
    ID VARCHAR(10) NOT NULL,
    Fecha DATE,
    Producto VARCHAR(10),
    Cantidad int,
    ID_empleado VARCHAR(10),
    ID_proveedor VARCHAR(10),
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_empleado) REFERENCES Empleado(ID),
    FOREIGN KEY (ID_proveedor) REFERENCES Proveedor(ID)
);

CREATE TABLE IF NOT EXISTS Factura (
    ID VARCHAR(10) NOT NULL,
    Valor INT,
    Fecha DATE,
    Estado VARCHAR(10),
    ID_empleado VARCHAR(10),
    ID_proveedor VARCHAR(10),
    ID_orden VARCHAR(10),
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_empleado) REFERENCES Empleado(ID),
    FOREIGN KEY (ID_proveedor) REFERENCES Proveedor(ID),
    FOREIGN KEY (ID_orden) REFERENCES Orden_de_compra(ID)
);

Create table if not exists pedido (
	ID_orden Varchar (10),
    ID_alimento Varchar (10),
    PRIMARY KEY (ID_orden,ID_alimento),
    FOREIGN KEY (ID_orden) REFERENCES orden_de_compra(ID),
    FOREIGN KEY (ID_alimento) REFERENCES alimento(ID)
);
    