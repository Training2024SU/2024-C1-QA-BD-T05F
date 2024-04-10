-- Triggers supermercado
USE supermercado;

-- historial de precios productos
CREATE TABLE IF NOT EXISTS historial_precios (
    id_producto INT,
    precio_anterior BIGINT,
    precio_nuevo BIGINT,
    fecha TIMESTAMP,
    actualizado_por VARCHAR(50)
) ENGINE = INNODB;

CREATE 
    TRIGGER  precios_registro
 AFTER UPDATE ON Productos FOR EACH ROW 
    INSERT INTO historial_precios VALUES (NEW.id , OLD.precio , NEW.precio , NOW() , CURRENT_USER());

-- Guardar productos borrados en una tabla de respaldo
CREATE TABLE IF NOT EXISTS productos_archivo LIKE Productos;

CREATE 
    TRIGGER  delete_logger
 AFTER DELETE ON Productos FOR EACH ROW 
    INSERT INTO productos_archivo VALUES
		(OLD.id , OLD.nombre , OLD.marca , OLD.origen , OLD.volumen , OLD.peso , OLD.fotografia , OLD.precio , OLD.stock , OLD.nombre_categoria);

-- Ejemplos:
-- SELECT * FROM Productos;
-- INSERT INTO Productos VALUES (123,'Producto de preuba', 'blanca', 'Nacional', '1', '2', 'foto.jpg', 3000, 5, 'congelados');
-- UPDATE Productos p SET precio = 1000 WHERE p.id = 123;
-- SELECT * FROM historial_precios;
-- DELETE FROM Productos p WHERE p.id = 123;
-- SELECT * FROM productos_archivo;


-- -- Registrar la inserción del nuevo cliente en el historial de clientes
CREATE TABLE IF NOT EXISTS historial_clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha TIMESTAMP,
    accion VARCHAR(100)
) ENGINE=INNODB;

DELIMITER $$
CREATE TRIGGER after_insert_cliente
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    -- Registrar la inserción del nuevo cliente en el historial de clientes
    INSERT INTO historial_clientes (id_cliente, fecha, accion)
    VALUES (NEW.id, NOW(), 'Nuevo cliente registrado');
END $$
    
-- Registrar la eliminacion de un cliente en el historial de clientes
CREATE TRIGGER after_delete_cliente
AFTER DELETE ON Clientes
FOR EACH ROW
BEGIN
    -- Registrar la eliminación del cliente en el historial de clientes
    INSERT INTO historial_clientes (id_cliente, fecha, accion)
    VALUES (OLD.id, NOW(), 'Cliente eliminado');
END $$
DELIMITER ;

-- Ejemplos:
-- INSERT INTO Clientes VALUES (99, '9999', 'Pedro', 'Pedrez', 'Carrera 1', 'telefono', '110111', 'a@a', '1234');
-- DELETE FROM Clientes WHERE id = 99;
-- SELECT * FROM historial_clientes;