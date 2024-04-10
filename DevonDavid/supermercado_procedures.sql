-- Stored procedures supermercado
USE supermercado;

-- DROP PROCEDURE eliminar_producto;
-- DROP PROCEDURE insertar_producto;
-- DROP PROCEDURE productos_en_categoria;
-- DROP PROCEDURE pedido_con_valor;

DELIMITER $$
-- ------------------------------------------
-- Listado de productos por categoría
-- ------------------------------------------
CREATE PROCEDURE productos_en_categoria(IN nombre_categoria VARCHAR(40))
BEGIN
	SELECT * FROM Productos p WHERE p.nombre_categoria = nombre_categoria;
END $$
DELIMITER ;
-- Ejemplo:
CALL productos_en_categoria("higiene");

-- ---------------------------------------------
-- Insertar un nuevo producto
-- ---------------------------------------------
DELIMITER $$
CREATE PROCEDURE insertar_producto(
	IN id INT,
    IN nombre_producto VARCHAR(50),
    IN marca_producto VARCHAR(40),
    IN origen_producto VARCHAR(40),
    IN volumen_producto VARCHAR(20),
    IN peso_producto VARCHAR(20),
    IN fotografia_producto VARCHAR(255),
    IN precio_producto BIGINT,
    IN stock_producto BIGINT,
    IN categoria_producto VARCHAR(40)
)
BEGIN
    INSERT INTO Productos (id,nombre, marca, origen, volumen, peso, fotografia, precio, stock, nombre_categoria)
    VALUES (id,nombre_producto, marca_producto, origen_producto, volumen_producto, peso_producto, fotografia_producto, precio_producto, stock_producto, categoria_producto);
END $$
DELIMITER ;
-- Ejemplo:
-- CALL insertar_producto('12','botella de Agua','Brisa','Colombia','20ml','200g','botella_de_agua.jpg','1500','30','Bebidas');

DELIMITER $$
-- ----------------------------------------------------
-- Detalles de pedido con importe total
-- --------------------------------------------------
CREATE PROCEDURE pedido_con_valor(IN id_pedido INT)
BEGIN
    SELECT 
    p.*,
    CONCAT(c.nombres, ' ', c.apellidos) AS `cliente`,
    SUM(pp.precio_unitario * pp.cantidad) AS `importe_total`
	FROM
		(SELECT * FROM Pedidos p WHERE p.id = id_pedido) AS p
	LEFT JOIN
		pedidos_productos pp ON pp.id_pedido = p.id
	LEFT JOIN
		Clientes c ON p.id_cliente = c.id
	GROUP BY p.id;
END $$
DELIMITER ;
-- Ejemplo:
CALL pedido_con_valor(1);

-- -----------------------------------------------------------
-- eliminar producto de la tabla productos
-- -----------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE eliminar_producto(
    IN id_producto INT
)
BEGIN
    DELETE FROM Productos
    WHERE id = id_producto;
END $$
DELIMITER ;
-- Ejemplo:
-- CALL eliminar_producto(12);

-- eliminar producto de la tabla productos
DELIMITER $$
CREATE PROCEDURE crear_almacenista_con_area (IN id INT, IN nombre VARCHAR(50), IN area VARCHAR(20))
BEGIN
	INSERT INTO Almacenistas VALUES (id, nombre);
    INSERT INTO almacenistas_areas VALUES (id, area);
END $$
DELIMITER ;
-- Ejemplo:
-- CALL crear_almacenista_con_area(99, 'Pablo', 'Neveras');
