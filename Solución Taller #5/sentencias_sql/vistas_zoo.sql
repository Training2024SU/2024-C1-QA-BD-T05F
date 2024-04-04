-- Crear vista total comida por especie
CREATE VIEW total_comida_por_especie AS
SELECT a.especie, SUM(ali.dosis) AS total_comida
FROM zoo_santafe.animal a
JOIN zoo_santafe.dieta d ON a.id_dieta = d.id
JOIN zoo_santafe.alimento ali ON d.id_alimento = ali.id
GROUP BY a.especie
ORDER BY a.especie;


-- Crear vista total comida por animal
CREATE VIEW total_comida_por_animal AS
SELECT a.nombre AS nombre_animal, SUM(ali.dosis) AS total_comida
FROM zoo_santafe.animal a
JOIN zoo_santafe.dieta d ON a.id_dieta = d.id
JOIN zoo_santafe.alimento ali ON d.id_alimento = ali.id
GROUP BY a.nombre
ORDER BY nombre_animal;

-- Esta vista devolvera el nombre del veterinario que disena la dieta para el animal con el ID especificado del animal.
CREATE VIEW veterinarios_animales AS
SELECT e.nombre AS nombre_veterinario, a.nombre AS nombre_animal, a.id AS id_animal
FROM zoo_santafe.empleado e
JOIN zoo_santafe.especialidad_empleado ee ON e.cedula = ee.dni_empleado
JOIN zoo_santafe.animal a ON ee.especialidad = 'veterinario'
JOIN zoo_santafe.consulta c ON e.cedula = c.id_empleado AND a.id = c.id_animal;

-- Esta vista lista los proveedores y la cantidad total facturada en cada factura
CREATE VIEW facturas_proveedores AS
SELECT p.nombre AS proveedor, f.id AS factura_id, f.total
FROM zoo_santafe.proveedor p
JOIN zoo_santafe.factura f ON p.id = f.id_proveedor;

-- Se crea vista de especies de animales asociados a su dieta asignada
CREATE VIEW dieta_animales AS
SELECT a.especie, d.horario, d.fecha, ali.nombre AS nombre_alimento, ali.dosis AS dosis_en_gramos, ali.tipo
FROM zoo_santafe.animal a
JOIN zoo_santafe.dieta d ON a.id_dieta = d.id
JOIN zoo_santafe.alimento ali ON d.id_alimento = ali.id;

-- Se crea vista que devuelve el nombre del empleado que registro el peso del animal junto con el id del animal
CREATE VIEW peso_animal_empleado AS
SELECT e.nombre AS nombre_empleado, p.peso AS peso_animal, a.nombre AS nombre_animal
FROM zoo_santafe.empleado e
JOIN zoo_santafe.peso p ON e.cedula = p.empleado_id
JOIN zoo_santafe.animal a ON p.animal_id = a.id;
