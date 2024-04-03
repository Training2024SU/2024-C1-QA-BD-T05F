use zoologico;

/* Esta vista es importante porque proporciona información sobre cuánto se está 
consumiendo de cada tipo de alimento por cada clasifiación en el zoológico. Esto es 
esencial para monitorear la dieta de los animales y también para tener en cuenta
estos consumos para registros de gastos, ordenes de compra, ETC.
*/
CREATE VIEW Consumo_Alimentos AS
SELECT 
	A.Clasificacion AS Clasificacion_Animal,
    AL.Tipo AS Tipo_Alimento,
    COUNT(*) AS Cantidad
FROM
	Animales A
	INNER JOIN 
    Dieta D ON A.ID = D.ID_animal
	INNER JOIN 
    Alimento AL ON D.ID_alimento = AL.ID
GROUP BY A.Clasificacion, AL.Tipo;

-- ---------------------------------------------------
/* Esta vista es crucial para el proceso de gestión de alimentos del zoológico. 
Permite rastrear cuántas veces se solicita alimento a cada proveedor, lo que ayuda 
a evaluar la eficacia de  los proveedores y a gestionar adecuadamente los niveles
de existencias de alimentos en el zoológico.
*/
CREATE VIEW Solicitudes_Proveedores AS
SELECT 
	P.Nombre AS Nombre_Proveedor,
       COUNT(*) AS Solicitudes
FROM 
	Orden_de_compra OC
	INNER JOIN 
    Proveedor P ON OC.ID_proveedor = P.ID
GROUP BY P.Nombre;

-- ---------------------------------------------------
/* Esta vista proporciona una visión integrada de la actividad de los veterinarios
en el zoológico, mostrando la cantidad de consultas realizadas y las dietas diseñadas
por cada veterinario. Permite evaluar la carga de trabajo de los veterinarios y su
contribución al cuidado y bienestar de los animales.
*/
CREATE VIEW Actividad_Veterinarios AS
SELECT 
	E.nombre AS Nombre_Veterinario,
	COUNT(C.ID) AS Consultas_Realizadas,
    COUNT(D.ID) AS Dietas_Diseñadas
FROM 
	Empleado E
	LEFT JOIN 
    Consulta C ON E.ID = C.ID_empleado
	LEFT JOIN 
    Dieta D ON E.ID = D.ID_veterinario
WHERE E.cargo = 'Veterinario'
GROUP BY E.nombre;

-- ---------------------------------------------------
/* Esta vista muestra todas las facturas que están en estado "Por pagar". 
Es útil para el gerente del zoológico tener una visión clara de las facturas
pendientes de pago y proceder con este.
*/ 
CREATE VIEW Facturas_Por_Pagar AS
SELECT *
FROM 
	Factura
WHERE Estado = 'Por pagar';

-- ---------------------------------------------------
/* Esta vista es importante para monitorear la salud y el desarrollo de las 
especies en el zoológico. Proporciona información sobre el peso promedio de
cada especie, lo que ayuda a los entrenadores y veterinarios a evaluar su 
estado de salud y detectar cualquier cambio significativo en su peso que 
pueda indicar problemas de salud o bienestar.*/
CREATE VIEW Peso_Promedio_Especies AS
SELECT 
	Animales.Clasificacion AS Especie,
    AVG(CAST(Animales.Peso AS DECIMAL(10, 2))) AS Peso_Promedio
FROM 
	Animales
GROUP BY Animales.Clasificacion;





