-- Trigger para validar disponibilidad de domiciliario en la zona
DELIMITER //
CREATE TRIGGER validar_disponibilidad_domiciliario
BEFORE INSERT ON CarritoCompra
FOR EACH ROW
BEGIN
    DECLARE domiciliario_disponible INT;

    -- Verificar si hay un domiciliario disponible en la zona
    SELECT COUNT(*) INTO domiciliario_disponible
    FROM Domiciliario_Zona
    WHERE zona_id IN (SELECT zona_id FROM Cliente_Zona WHERE cliente_id = NEW.cliente_id);

    -- Si no hay domiciliario disponible, cancelar la inserción
    IF domiciliario_disponible = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No hay domiciliario disponible en esta zona. Por favor, inténtelo más tarde.';
    END IF;
END//
DELIMITER 

-- Trigger para restringir productos vendidos
DELIMITER //
CREATE TRIGGER restriccion_productos_vendidos
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    DECLARE producto_vendido INT;

    -- Verificar si el producto ya ha sido vendido anteriormente
    SELECT COUNT(*) INTO producto_vendido
    FROM Compra
    JOIN CarritoCompra ON Compra.carrito_id = CarritoCompra.carrito_id
    JOIN Producto ON CarritoCompra.carrito_id = Producto.carrito_id
    WHERE Producto.producto_id = NEW.producto_id;

    -- Si el producto ha sido vendido, cancelar la inserción
    IF producto_vendido > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Este producto ya ha sido vendido y no está disponible actualmente.';
    END IF;
END//
DELIMITER ;