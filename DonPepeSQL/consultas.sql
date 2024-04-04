-- Consulta: El producto más vendido
SELECT p.nombre AS Producto, SUM(dp.unidades_disponible) AS Total_Vendido
FROM Producto p
JOIN DisponibilidadProducto dp ON p.producto_id = dp.producto_id
GROUP BY p.nombre
ORDER BY SUM(dp.unidades_disponible) DESC
LIMIT 1;

-- Consulta: Categoría más vendida
SELECT c.nombre AS Categoria, SUM(dp.unidades_disponible) AS Total_Vendido
FROM Producto p
JOIN DisponibilidadProducto dp ON p.producto_id = dp.producto_id
JOIN Producto_Categoria pc ON p.producto_id = pc.producto_id
JOIN Categoria c ON pc.categoria_id = c.categoria_id
GROUP BY c.nombre
ORDER BY SUM(dp.unidades_disponible) DESC
LIMIT 1;

-- Consulta: Promedio de consumo que tiene un cliente
SELECT AVG(cc.cant_productos) AS Promedio_Consumo
FROM CarritoCompra cc;

-- Consulta: Promedio costo de domicilios
SELECT AVG(c.costo_entrega) AS Promedio_Costo_Domicilio
FROM Zona c;

-- Consulta: Existencias en almacén
SELECT a.nombre AS Almacen, SUM(dp.unidades_disponible) AS Stock_Disponible
FROM Almacen a
JOIN DisponibilidadProducto dp ON a.almacen_id = dp.almacen_id
GROUP BY a.nombre;

-- Consulta: Cual es la marca que más vendo
SELECT p.marca AS Marca, SUM(dp.unidades_disponible) AS Total_Vendido
FROM Producto p
JOIN DisponibilidadProducto dp ON p.producto_id = dp.producto_id
GROUP BY p.marca
ORDER BY SUM(dp.unidades_disponible) DESC
LIMIT 1;

-- Consulta: Unidades restantes de un producto
SELECT p.nombre AS Producto, dp.unidades_disponible AS Unidades_Restantes
FROM Producto p
JOIN DisponibilidadProducto dp ON p.producto_id = dp.producto_id
WHERE p.nombre = 'Arroz';

-- Consulta: A qué zona pertenecen mis clientes
SELECT z.descripcion AS Zona, COUNT(cz.cliente_id) AS Numero_de_Clientes
FROM Zona z
JOIN Cliente_Zona cz ON z.zona_id = cz.zona_id
GROUP BY z.descripcion;

-- Consulta: De dónde vienen mis productos
SELECT p.nombre AS Producto, p.origen AS Procedencia
FROM Producto p;

-- Consulta: Clientes registrados
SELECT COUNT(*) AS Total_Clientes_Registrados
FROM Cliente;

-- Consulta: Condiciones de almacenamiento
SELECT p.nombre AS Producto, c.condicion AS Condiciones_Almacenamiento
FROM Producto p
JOIN Producto_Categoria pc ON p.producto_id = pc.producto_id
JOIN Categoria c ON pc.categoria_id = c.categoria_id;