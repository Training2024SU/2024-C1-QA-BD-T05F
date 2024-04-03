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
    
 -- 2 Consultar qué veterinario diseñó determinada dieta   
Select
	f.ID as "ID factura",
    f.Valor as "Valor (cop)",
    f.Estado as "Estado"    
From
	factura as f;
    
-- 3 Consultar qué dosis de alimento tiene cada animal
Select
	a.ID as "ID animal",
    a.nombre as "Nombre",
    a.Clasificacion as "Clasificación",
    al.nombre as "Alimento",
    d.ID as "ID dieta",
    d.Dosis as "Dosis"	
From
	dieta as d
		left join
	alimento as al on d.ID_alimento = al.ID
		left join
	animales as a on al.ID_animal = a.ID;
    
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
    o.Cantidad as "Cantidad (kg)",
    o.ID as "ID orden"
    
From
	proveedor as p
		left join
	orden_de_compra as o on p.ID = o.ID_proveedor
		left join
	pedido as pe on o.ID = pe.ID_orden
		left join
	alimento as a on pe.ID_alimento = a.ID;

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
		INNER JOIN 
	Especialidad_empleado ee ON e.ID = ee.Id_empleado
WHERE ee.especialidad = 'Veterinario';

-- 8 Consultar cuantos animales hay por clasificación
SELECT 
	Clasificacion, COUNT(*) AS Cantidad
		FROM 
	Animales
GROUP BY Clasificacion;

-- 9 Consultar la cantidad de comida suministrada por cada proveedor

SELECT 
	p.Nombre AS Proveedor, COUNT(c.ID_alimento) AS Cantidad_Comida
FROM 
	Proveedor p
		LEFT JOIN
	Alimento a ON p.ID = a.ID_proveedor
		LEFT JOIN
	Comida c ON a.ID = c.ID_alimento
GROUP BY p.Nombre;

-- 10 Consultar la cantidad de empleados por cargo
SELECT 
	cargo, COUNT(*) AS Cantidad_Personas
FROM 
	Empleado
GROUP BY cargo;


    
    
    