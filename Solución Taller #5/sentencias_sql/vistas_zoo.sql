-- Crear vista total comida por especie --
CREATE VIEW total_comida_por_especie AS
SELECT a.especie, SUM(ali.dosis) AS total_comida
FROM zoo_santafe.animal a
JOIN zoo_santafe.dieta d ON a.id_dieta = d.id
JOIN zoo_santafe.alimento ali ON d.id_alimento = ali.id
GROUP BY a.especie
ORDER BY a.especie;

-- Crear vista total comida por animal --
CREATE VIEW total_comida_por_animal AS
SELECT a.nombre AS nombre_animal, SUM(ali.dosis) AS total_comida
FROM zoo_santafe.animal a
JOIN zoo_santafe.dieta d ON a.id_dieta = d.id
JOIN zoo_santafe.alimento ali ON d.id_alimento = ali.id
GROUP BY a.nombre
ORDER BY nombre_animal;

-- Crear vista para obtener el nombre del veterinario que hizo una consulta con el nombre del animal y su ID --
CREATE VIEW consulta_veterinario AS
SELECT 
    e.nombre AS "nombre empleado", 
    e.cedula, 
    a.nombre AS "nombre animal", 
    a.id AS "id animal" 
FROM 
    zoo_santafe.consulta c
JOIN 
    zoo_santafe.animal a ON a.id = c.id_animal
JOIN 
    zoo_santafe.empleado e ON e.cedula = c.id_empleado
WHERE 
    c.id_empleado IN (SELECT cedula FROM zoo_santafe.empleado WHERE rol = 'veterinario');

-- Crear vista para listar los proveedores y la cantidad total facturada en cada factura --
CREATE VIEW facturas_proveedores AS
SELECT p.nombre AS proveedor, f.id AS factura_id, f.total
FROM zoo_santafe.proveedor p
JOIN zoo_santafe.factura f ON p.id = f.id_proveedor;

-- Crear vista para listar las especies de animales asociadas a su dieta asignada --
CREATE VIEW dieta_animales AS
SELECT a.especie, d.horario, d.fecha, ali.nombre AS nombre_alimento, ali.dosis AS dosis_en_gramos, ali.tipo
FROM zoo_santafe.animal a
JOIN zoo_santafe.dieta d ON a.id_dieta = d.id
JOIN zoo_santafe.alimento ali ON d.id_alimento = ali.id;

-- Crear vista para obtener el nombre del empleado que registró el peso del animal junto con el ID del animal --
CREATE VIEW peso_animal_empleado AS
SELECT e.nombre AS nombre_empleado, p.peso AS peso_animal, a.nombre AS nombre_animal
FROM zoo_santafe.empleado e
JOIN zoo_santafe.peso p ON e.cedula = p.empleado_id
JOIN zoo_santafe.animal a ON p.animal_id = a.id;
