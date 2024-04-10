-- Vistas supermercado
USE supermercado;

-- DROP VIEW pedidos_con_productos;
-- Listado de pedidos con sus productos
CREATE VIEW pedidos_con_productos AS
    SELECT 
        pe.*, pp.id_producto, p.nombre AS `producto`, p.marca, pp.precio_unitario, pp.cantidad
    FROM
        Pedidos pe
            LEFT JOIN
        pedidos_productos pp ON pp.id_pedido = pe.id
            LEFT JOIN
        Productos p ON pp.id_producto = p.id;
        
SELECT * FROM pedidos_con_productos;

-- Listado de pedidos con su repartidor
CREATE VIEW pedidos_con_repartidor AS
    SELECT 
        pe.*, r.nombre AS `repartidor`
    FROM
        Pedidos pe
            LEFT JOIN
        Repartidores r ON pe.id_repartidor = r.id;
SELECT * FROM pedidos_con_repartidor;

-- Listado de pedidos con su almacenista
CREATE VIEW pedidos_con_almacenista AS
    SELECT 
        pe.*, a.nombre AS `almacenista`
    FROM
        Pedidos pe
            LEFT JOIN
        Repartidores r ON pe.id_almacenista = a.id;
        
SELECT * FROM pedidos_con_almacenista;

-- productos mas vendidos
CREATE VIEW productos_mas_vendidos AS
SELECT 
    p.id AS id_producto,
    p.nombre AS nombre_producto,
    p.marca AS marca_producto,
    SUM(pp.cantidad) AS total_vendido
FROM
    Productos p
        INNER JOIN
    pedidos_productos pp ON p.id = pp.id_producto
GROUP BY p.id
ORDER BY total_vendido DESC;

