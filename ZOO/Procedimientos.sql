use zoologico;
DELIMITER //

CREATE PROCEDURE AgregarDieta(
    IN descripcion_dieta VARCHAR(40),
    IN dosis_dieta VARCHAR(10),
    IN ID_veterinario VARCHAR(10),
    IN ID_animal VARCHAR(10),
    IN ID_alimento VARCHAR(10)
)
BEGIN
    -- Insertar nueva dieta en la tabla Dieta
    INSERT INTO Dieta (Descripcion, Dosis, ID_veterinario, ID_animal, ID_alimento)
    VALUES (descripcion_dieta, dosis_dieta, id_veterinario_dieta, id_animal_dieta, id_alimento_dieta);
END//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE CrearOrdenCompra(
    IN fecha_orden DATE,
    IN id_empleado VARCHAR(10),
    IN id_proveedor VARCHAR(10),
    IN productos_lista TEXT,
    IN cantidades_lista TEXT
)
BEGIN
    DECLARE productos_array TEXT DEFAULT productos_lista;
    DECLARE cantidades_array TEXT DEFAULT cantidades_lista;
    DECLARE productos_count INT;
    DECLARE i INT DEFAULT 1;
    DECLARE producto_id VARCHAR(10);
    DECLARE cantidad VARCHAR(20);
    
    -- Insertar nueva orden de compra en la tabla Orden_de_compra
    INSERT INTO Orden_de_compra (Fecha, ID_empleado, ID_proveedor)
    VALUES (fecha_orden, id_empleado, id_proveedor);
    
    -- Obtener la cantidad de productos en la lista
    SET productos_count = JSON_LENGTH(productos_array);
    
    -- Insertar cada producto en la tabla productos asociado a la orden de compra
    WHILE i <= productos_count DO
        -- Obtener el ID del producto y la cantidad desde las listas
        SET producto_id = JSON_UNQUOTE(JSON_EXTRACT(productos_array, CONCAT('$[', i - 1, ']')));
        SET cantidad = JSON_UNQUOTE(JSON_EXTRACT(cantidades_array, CONCAT('$[', i - 1, ']')));
        
        -- Insertar el producto en la tabla productos asociado a la orden de compra
        INSERT INTO productos (ID_orden, ID_alimento, Cantidad)
        VALUES ((SELECT LAST_INSERT_ID()), producto_id, cantidad);
        
        SET i = i + 1;
    END WHILE;
END//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE AlimentarAnimal(
    IN id_animal VARCHAR(10),
    IN id_alimento VARCHAR(10),
    IN cantidad_alimento INT,
    IN fecha_alimentacion DATE
)
BEGIN
    -- Insertar registro en la tabla Comida para registrar la alimentación del animal
    INSERT INTO Comida (ID_animal, ID_alimento)
    VALUES (id_animal, id_alimento);
    
    -- Actualizar la tabla Dieta si es necesario
    UPDATE Dieta
    SET Dosis = CONCAT(Dosis, ', ', cantidad_alimento)
    WHERE ID_animal = id_animal AND ID_alimento = id_alimento;
    
    -- Registrar la fecha de alimentación en la tabla de registro de alimentación del animal
    INSERT INTO Registro_Alimentacion (ID_animal, ID_alimento, Cantidad, Fecha)
    VALUES (id_animal, id_alimento, cantidad_alimento, fecha_alimentacion);
END//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE PagarFactura(
    IN id_factura VARCHAR(10)
)
BEGIN
    -- Actualizar el estado de la factura a "Pagado"
    UPDATE Factura
    SET Estado = 'Pagado'
    WHERE ID = id_factura;
END//

DELIMITER ;

