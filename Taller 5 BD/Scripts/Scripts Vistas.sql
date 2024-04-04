-- Vista de servicios programados para el día de hoy:
CREATE VIEW vista_servicios_hoy AS
SELECT c.*, s.nombre_servicio, emp.nombre_empleado
FROM cita c
JOIN servicio s ON c.id_servicio = s.id_servicio
JOIN empleado emp ON c.id_empleado = emp.id_empleado
WHERE DATE(c.fecha_y_hora) = CURDATE();

SELECT * FROM vista_servicios_hoy;


-- Vista de productos con una existencia de 10 unidades o menos:
CREATE VIEW vista_productos_poca_existencia AS
SELECT ref_producto, nombre_producto, cantidad
FROM producto
WHERE cantidad <= 10;

SELECT * FROM vista_productos_poca_existencia;


-- Vista de servicios realizados por empleado:
CREATE VIEW vista_servicios_por_empleado AS
SELECT emp.nombre_empleado, COUNT(c.id_servicio) AS total_servicios_realizados
FROM empleado emp
JOIN cita c ON emp.id_empleado = c.id_empleado
GROUP BY emp.nombre_empleado;

SELECT * FROM vista_servicios_por_empleado;


-- Vista de total de ventas por mes:
CREATE VIEW vista_total_ventas_mes AS
SELECT MONTH(fecha_y_hora) AS mes, SUM(total) AS total_ventas
FROM registro_venta
GROUP BY mes;

SELECT * FROM vista_total_ventas_mes;


-- Vista de empleados y sus especialidades:
CREATE VIEW vista_empleados_especialidades AS
SELECT emp.nombre_empleado, esp.nombre_especialidad
FROM empleado emp
JOIN especialidad esp ON emp.id_especialidad = esp.id_especialidad;

SELECT * FROM vista_empleados_especialidades;


-- Vista información completa de proveedores:
CREATE VIEW vista_proveedores_telefonos AS
SELECT pr.*, tp.telefono
FROM proveedor pr
JOIN telefono_proveedor tp ON pr.id_proveedor = tp.id_proveedor;

SELECT * FROM vista_proveedores_telefonos;