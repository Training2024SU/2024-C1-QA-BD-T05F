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

CREATE TABLE IF NOT EXISTS productos_archivo LIKE Productos;

CREATE 
    TRIGGER  precios_registro
 AFTER UPDATE ON Productos FOR EACH ROW 
    INSERT INTO historial_precios VALUES (NEW.id , OLD.precio , NEW.precio , NOW() , CURRENT_USER());

CREATE 
    TRIGGER  delete_logger
 AFTER DELETE ON Productos FOR EACH ROW 
    INSERT INTO productos_archivo VALUES
		(NEW.id , NEW.nombre , NEW.marca , NEW.origen , NEW.volumen , NEW.peso , NEW.fotografia , NEW.precio , NEW.stock , NEW.nombre_categoria);

-- SELECT * FROM Productos;
-- INSERT INTO libro VALUES (123,'Producto de preuba', 'blanca', 'Nacional', '1', '2', 'foto.jpg', 3000, 5, 'congelados');
-- UPDATE Productos p SET precio = 1000 WHERE p.id = 123;
-- SELECT * FROM historial_precios;
-- DELETE FROM Productos p WHERE p.id = 123;
-- SELECT * FROM productos_archivo;