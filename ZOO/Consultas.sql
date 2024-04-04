use zoologico;

-- 1 Consultar qué veterinario diseñó determinada dieta
Select
	d.ID as "ID dieta",
    d.Descripcion,
    d.Dosis,
    e.nombre as "Veterinario"
From
	dieta as d
		Left join
	empleado as e on d.ID_veterinario = e.ID;
    
 -- 2 Consultar estado de facturas 
Select
	f.ID as "ID factura",
    f.Valor as "Valor (cop)",
    f.Estado as "Estado"    
From
	factura as f;
    
-- 3 Consultar qué dosis de alimento tiene cada animal
SELECT 
	A.Nombre AS Nombre_Animal, 
	AL.Nombre AS Nombre_Alimento, 
    D.Dosis
FROM 
	animales A
JOIN 
	dieta D ON A.ID = D.ID_animal
JOIN 
	alimento AL ON D.ID_alimento = AL.ID;

    
-- 4 Consultar los alimentos asociados a cada orden de compra
SELECT
	O.ID AS ID_Orden,
    A.ID AS ID_Alimento,
    A.Nombre AS Nombre_Alimento,
    A.Tipo AS Tipo_Alimento,
    A.Descripcion AS Descripcion_Alimento
FROM 
	Orden_de_compra O
	INNER JOIN 
    productos P ON O.ID = P.ID_orden
	INNER JOIN 
    Alimento A ON P.ID_alimento = A.ID;



-- 5 Consultar la cantidad de alimento ordenada a los proveedores
Select
	p.ID as "ID proveedor",
    p.nombre as "Nombre proveedor",
    a.nombre as "Alimento",
    pr.Cantidad as "Cantidad (kg)",
    o.ID as "ID orden"
    
From
	proveedor as p
		left join
	orden_de_compra as o on p.ID = o.ID_proveedor
		left join
	productos as pr on o.ID = pr.ID_orden
		left join
	alimento as a on pr.ID_alimento = a.ID;

-- 6 Consultar que empleado pesó al animal

Select
	e.nombre as "Nombre empleado",
    a.Nombre as "Animal",
    a.ID as "ID del animal",
    a.Peso as "Peso del animal"
From
	empleado as e
		left join
	animales as a on e.ID=a.ID_entrenador;
    
-- 7 Consultar que empleados son veterinarios
SELECT 
	e.*
FROM 
	Empleado e
WHERE e.cargo = 'Veterinario' OR e.cargo = 'Veterinaria';

-- 8 Consultar cuantos animales hay por clasificación
SELECT 
	Clasificacion, COUNT(*) AS Cantidad
		FROM 
	Animales
GROUP BY Clasificacion;

-- 9 Consultar la cantidad de comida suministrada por cada proveedor

SELECT 
    p.Nombre AS Proveedor, 
    COUNT(c.ID_alimento) AS Cantidad_Comida
FROM 
    Proveedor p
LEFT JOIN
    Alimento a ON p.ID = a.ID_proveedor
LEFT JOIN
    Comida c ON a.ID = c.ID_alimento
GROUP BY   
    p.Nombre
ORDER BY 
    Cantidad_Comida DESC;


-- 10 Consultar la cantidad de empleados por cargo
SELECT 
	cargo, COUNT(*) AS Cantidad_Personas
FROM 
	Empleado
GROUP BY cargo;


    
    
    