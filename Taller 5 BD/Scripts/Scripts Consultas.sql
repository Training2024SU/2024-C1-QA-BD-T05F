-- Mostrar todos los servicios que presta la barberia:
SELECT nombre_servicio FROM servicio;

-- Mostrar el contenido de la tabla producto:
SELECT * FROM producto;

-- Mostrar toda la información completa de los clientes incluyendo teléfono:
SELECT c.*, tc.telefono
FROM cliente c
JOIN telefono_cliente tc ON c.id_cliente = tc.id_cliente;

-- Mostrar el contenido de la tabla registro venta incluyendo el empleado:
SELECT rv.*, emp.nombre_empleado
FROM registro_venta rv
JOIN empleado emp ON rv.id_empleado = emp.id_empleado;

-- Mostrar el total de ventas realizadas en un rango de fechas:
SELECT SUM(total) AS total_ventas
FROM registro_venta
WHERE DATE(fecha_y_hora) BETWEEN '2024-04-01' AND '2024-04-30';

-- Mostrar todas las citas, incluyendo información del empleado, cliente y servicio:
SELECT c.*, emp.nombre_empleado, cli.nombre_cliente, s.nombre_servicio
FROM cita c
JOIN empleado emp ON c.id_empleado = emp.id_empleado
JOIN cliente cli ON c.id_cliente = cli.id_cliente
JOIN servicio s ON c.id_servicio = s.id_servicio;

-- Mostrar todo el historial de servicios, incluyendo información del empleado y cliente:
SELECT hs.*, emp.nombre_empleado, cli.nombre_cliente
FROM historial_servicios hs
JOIN empleado emp ON hs.id_empleado = emp.id_empleado
JOIN cliente cli ON hs.id_cliente = cli.id_cliente;

-- Mostrar todos los productos vendidos en cada registro de venta:
SELECT rvp.*, rv.fecha_y_hora
FROM registro_venta_producto rvp
JOIN registro_venta rv ON rvp.id_registro = rv.id_registro;

-- Mostrar los servicios realizados por un empleado en particular (por ejemplo, empleado con ID 1):
SELECT c.*, s.nombre_servicio
FROM cita c
JOIN servicio s ON c.id_servicio = s.id_servicio
WHERE c.id_empleado = 1;

-- Mostrar el total de ventas por empleado:
SELECT r.id_empleado, SUM(r.total) AS total_ventas
FROM registro_venta r
GROUP BY r.id_empleado;