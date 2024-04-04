-- 1. Consultar total de comida por especie
SELECT a.especie, SUM(ali.dosis) AS total_comida
FROM zoo_santafe.animal a
JOIN zoo_santafe.dieta d ON a.id_dieta = d.id
JOIN zoo_santafe.alimento ali ON d.id_alimento = ali.id
GROUP BY a.especie
ORDER BY a.especie;

-- 2. Consultar total de comida por animal
SELECT a.nombre AS nombre_animal, SUM(ali.dosis) AS total_comida
FROM zoo_santafe.animal a
JOIN zoo_santafe.dieta d ON a.id_dieta = d.id
JOIN zoo_santafe.alimento ali ON d.id_alimento = ali.id
GROUP BY a.nombre
ORDER BY nombre_animal;

-- 3. Total de facturas pagadas
SELECT COUNT(DISTINCT f.id) AS total_facturas_pagadas
FROM zoo_santafe.factura f
INNER JOIN zoo_santafe.pago p ON f.id = p.id_factura;

-- 4. Especies de animales asociados a su dieta asignada
SELECT a.especie, d.horario, d.fecha, ali.nombre AS nombre_alimento, ali.dosis AS dosis_en_gramos, ali.tipo
FROM zoo_santafe.animal a
JOIN zoo_santafe.dieta d ON a.id_dieta = d.id
JOIN zoo_santafe.alimento ali ON d.id_alimento = ali.id;

-- 5. Listar los empleados junto con su nombre y rol
SELECT cedula, nombre, rol 
FROM zoo_santafe.empleado;

-- 6. Listar consultas asociadas a un veterinario específico
SELECT * FROM zoo_santafe.consulta
WHERE id_empleado = 'id_veterinario_especifico';

-- 7. Listar los empleados que pertenezcan a una especialidad específica
SELECT e.nombre, ee.especialidad
FROM zoo_santafe.empleado e
JOIN zoo_santafe.especialidad_empleado ee ON e.cedula = ee.dni_empleado
WHERE ee.especialidad = 'especialidad_especifica';

-- 8. Listar los proveedores y la cantidad total facturada en cada factura
SELECT p.nombre AS proveedor, f.id AS factura_id, f.total
FROM zoo_santafe.proveedor p
JOIN zoo_santafe.factura f ON p.id = f.id_proveedor;

-- 9. Devuelve el nombre del empleado que registró el peso del animal junto con el ID del animal
SELECT e.nombre AS nombre_empleado, p.peso AS peso_animal, a.nombre AS nombre_animal
FROM zoo_santafe.empleado e
JOIN zoo_santafe.peso p ON e.cedula = p.empleado_id
JOIN zoo_santafe.animal a ON p.animal_id = a.id;

-- 10. Esta consulta devuelve el nombre del veterinario asociado al animal que se consultó, con el ID especificado del animal.
SELECT e.nombre AS "nombre empleado", e.cedula, a.nombre AS "nombre animal", a.id AS "id animal"
FROM consulta c
JOIN zoo_santafe.animal a ON a.id = c.id_animal
JOIN zoo_santafe.empleado e ON e.cedula = c.id_empleado
WHERE c.id_empleado IN (SELECT cedula FROM zoo_santafe.empleado WHERE rol = 'veterinario');
