-- Consultas supermercado
USE supermercado;

-- Listado de todos los clientes
SELECT * FROM Clientes;

-- Listado de todos los productos
SELECT * FROM Productos;

-- Listado de todas las categorías
SELECT * FROM Categorias;

-- Listado de todos los pedidos
SELECT * FROM Pedidos;

-- Listado de todos los repartidores
SELECT * FROM Repartidores;

-- Listado de todos los almacenistas
SELECT * FROM Almacenistas;


-- Listado de productos sin stock
SELECT * FROM Productos p WHERE p.stock = 0;

-- Listado de productos con categoría
SELECT 
    p.*, c.condicion_almacenaje, c.observaciones
FROM
    Productos p
        LEFT JOIN
    Categorias c ON p.nombre_categoria = c.nombre;
    
-- Listado ordenado de repartidores que más pedidos entregan
SELECT r.*, count(p.id) as `cantidad_pedidos` FROM Repartidores r LEFT JOIN Pedidos p on p.repartidor_id = r.id;

-- Listado ordenado de almacenistas que más pedidos preparan 
SELECT a.*, count(p.id) as `cantidad_pedidos` FROM Almacenistas a LEFT JOIN Pedidos p on p.almacenista_id = a.id;

-- Listado de pedidos cancelados
SELECT * FROM Pedidos pe WHERE pe.estado = "Cancelado";

-- Listado de pedidos pendientes por entregar
SELECT * FROM pedidos_con_repartidor pr WHERE pr.estado = "Pendiente entrega";

-- Listado de pedidos pendientes por entregar sin repartidor asignado
SELECT * FROM pedidos_con_repartidor pr WHERE pr.estado = "Pendiente entrega" AND pr.id_repartidor IS NULL;

-- Listado de pedidos entregados con su repartidor
SELECT * FROM pedidos_con_repartidor pr WHERE pr.estado = 'Entregado';
        
-- Listado de pedidos pendientes por preparar
SELECT * FROM pedidos_con_almacenista pr WHERE pr.estado = "En preparación";

-- Listado de pedidos pendientes por entregar sin almacenista asignado
SELECT * FROM pedidos_con_almacenista pr WHERE pr.estado = "En preparación" AND pr.id_repartidor IS NULL;

-- Listado de pedidos ya preparados con su almacenista
SELECT * FROM pedidos_con_almacenista pr WHERE pr.estado = "Pendiente entrega";
        
-- Clientes frequentes ordenado por valor de compra
SELECT 
    c.*,
    COUNT(pcp.id) `cantidad_pedidos`,
    SUM(pcp.precio_unitario * pcp.cantidad) `total_comprado`
FROM
    Clientes c
        LEFT JOIN
    pedidos_con_productos pcp ON pcp.id_cliente
GROUP BY c.id
ORDER BY total_comprado DESC , cantidad_pedidos DESC;

-- Listado ordenado de productos más vendidos 
SELECT 
    pcp.id_producto,
    pcp.producto,
    SUM(pcp.cantidad) AS `cantidad_vendidos`
FROM
    pedidos_con_productos pcp
GROUP BY pcp.id_producto
ORDER BY cantidad_vendidos DESC;


-- Estas queries ya no van
-- 
-- Listado de zonas con más clientes en orden
SELECT 
    rcp.codigo_postal, COUNT(c.id) AS `cantidad_clientes`
FROM
    repartidores_codigos_postales rcp
        LEFT JOIN
    Clientes c ON c.codigo_postal = rcp.codigo_postal
GROUP BY rcp.codigo_postal
ORDER BY cantidad_clientes;

-- Listado de clientes fuera de zona de entregas
SELECT 
    c.*, rcp.id_repartidor
FROM
    Clientes c
        LEFT JOIN
    repartidores_codigos_postales rcp ON c.codigo_postal = rcp.codigo_postal
WHERE
    rcp.codigo_postal IS NULL;
    
-- Listado de zonas asignadas a repartidores, pero sin clientes 
SELECT 
    rcp.*, c.id AS `id_cliente`
FROM
    Clientes c
        RIGHT JOIN
    repartidores_codigos_postales rcp ON c.codigo_postal = rcp.codigo_postal
WHERE
    c.codigo_postal IS NULL;
