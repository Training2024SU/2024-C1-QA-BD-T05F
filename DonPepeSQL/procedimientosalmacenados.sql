DELIMITER //

CREATE PROCEDURE ActualizarProductosEnInventario(
    IN ProductoID INT,
    IN NuevaCantidad INT,
    IN NuevoPrecio DECIMAL(10, 2)
)
BEGIN
    UPDATE Producto
    SET precio = NuevoPrecio,
        volumen = NuevaCantidad
    WHERE producto_id = ProductoID;
END //

DELIMITER //

CREATE PROCEDURE EliminarProducto(
    IN ProductoID INT
)
BEGIN
    DELETE FROM Producto_Categoria WHERE producto_id = ProductoID;
    DELETE FROM DisponibilidadProducto WHERE producto_id = ProductoID;
    DELETE FROM Producto WHERE producto_id = ProductoID;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ActualizarOrigenProducto(
    IN ProductoID INT,
    IN NuevoOrigen VARCHAR(100)
)
BEGIN
    UPDATE Producto
    SET origen = NuevoOrigen
    WHERE producto_id = ProductoID;
END //

DELIMITER ;


-- Procedimiento Almacenado: Actualizar Categoría
DELIMITER //

CREATE PROCEDURE ActualizarCategoria(
    IN ProductoID INT,
    IN NuevaCategoriaID INT
)
BEGIN
    DELETE FROM Producto_Categoria WHERE producto_id = ProductoID;
    INSERT INTO Producto_Categoria (producto_id, categoria_id)
    VALUES (ProductoID, NuevaCategoriaID);
END //

DELIMITER ;

-- Procedimiento Almacenado: Agregar Categoría
DELIMITER //

CREATE PROCEDURE AgregarCategoria(
    IN NombreCategoria VARCHAR(100),
    IN DescripcionCategoria TEXT,
    IN CondicionCategoria VARCHAR(45)
)
BEGIN
    INSERT INTO Categoria (nombre, descripcion, condicion)
    VALUES (NombreCategoria, DescripcionCategoria, CondicionCategoria);
END //

DELIMITER ;

