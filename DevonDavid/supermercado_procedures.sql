-- Stored procedures supermercado
USE supermercado;

-- DROP PROCEDURE pendientes_repartidor;
-- DROP PROCEDURE productos_en_categoria;
-- DROP PROCEDURE pedido_con_valor;

DELIMITER $$

-- Listado de productos por categoría
CREATE PROCEDURE productos_en_categoria(IN nombre_categoria VARCHAR(40))
BEGIN
	SELECT * FROM Productos p WHERE p.nombre_categoria = nombre_categoria;
END $$
-- Ejemplo:
CALL productos_en_categoria("congelados") $$

-- Listado de pedidos de un repartidor pendientes por repartir
CREATE PROCEDURE pendientes_repartidor(IN id_repartidor INT)
BEGIN

END $$

-- Detalles de pedido con importe total
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
CALL pedido_con_valor(1) $$

-- Crear almacenista con una area
CREATE PROCEDURE crear_almacenista_con_area (IN id INT, IN nombre VARCHAR(50), IN area VARCHAR(20))
BEGIN
	INSERT INTO Almacenistas VALUES (id, nombre);
    INSERT INTO almacenistas_areas VALUES (id, area);
END $$


DELIMITER ;

