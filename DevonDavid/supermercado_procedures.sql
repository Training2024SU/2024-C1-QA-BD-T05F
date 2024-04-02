-- Stored procedures supermercado
USE supermercado;

-- DROP PROCEDURE eliminar_producto;
-- DROP PROCEDURE insertar_producto;
-- DROP PROCEDURE productos_en_categoria;
-- DROP PROCEDURE pedido_con_valor;

DELIMITER $$

-- Listado de productos por categoría
CREATE PROCEDURE productos_en_categoria(IN nombre_categoria VARCHAR(40))
BEGIN
	SELECT * FROM Productos p WHERE p.nombre_categoria = nombre_categoria;
END $$
-- Ejemplo:
CALL productos_en_categoria("alimentos") $$

-- ---------------------------------------------
-- Insertar un nuevo producto
-- ---------------------------------------------
DELIMITER //
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
END //
DELIMITER ;

CALL insertar_producto('12','botella de Agua','Brisa','Colombia','20ml','200g','botella_de_agua.jpg','1500','30','Bebidas');

DELIMITER //
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
DELIMITER ;

CALL pedido_con_valor(1);

-- -----------------------------------------------------------
-- eliminar producto de la tabla productos
-- -----------------------------------------------------------
DELIMITER //
CREATE PROCEDURE eliminar_producto(
    IN id_producto INT
)
BEGIN
    DELETE FROM Productos
    WHERE id = id_producto;
END //
DELIMITER ;

CALL eliminar_producto(12);

