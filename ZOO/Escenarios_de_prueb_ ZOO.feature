Feature Yo como administrador quiero crear, leer, actualizar y borrar la base
de datos de los empleados, animales y alimentos para conocer la situacion del zoologico.

@EP1
Scenario: Listar Empleados Registrados en el Sistema
 Given El usuario con rol de administrador esta en la pagina de gestion de empleados
 When selecciona la opcion para listar todos los empleados registrados
 Then El sistema deberia muestra una lista completa de empleados con sus respectivos detalles
 And La lista incluye informacion como nombre completo, cargo, correo correo electronico y numero de telefono

@E2
Scenario: Mostrar Detalles de un Animal unico en el Sistema
 Given El usuario con rol de cuidador esta en la pagina de detalles de animales
 And Existe un animal unico registrado en el sistema con el codigo 2
 When busca el animal con codigo 2 en el sistema
 Then El sistema deberia muestrar los detalles completos del animal con codigo 2
 And Los detalles incluyen informacion como especie, estado de salud, alimento

@E3
Scenario: Buscar Detalles de un Animal unico No Encontrado en el Sistema
 Given El usuario con rol de cuidador esta en la pagina de detalles de animales
 And No existe un animal registrado en el sistema con el codigo 23
 When intenta buscar el animal con codigo 23 en el sistema
 Then Deberia ver un mensaje indicando que el animal no fue encontrado
 
@E4
Scenario: Crear un Empleado Mediante Solicitud POST
 Given El usuario con rol de administrador crea un usuario nuevo esta en la pagina de gestion de empleados
 When El usuario envia una solicitud POST con los datos del nuevo empleado
 Then Deberia procesarse la solicitud y crea exitosamente el nuevo empleado
 And mostrar un codigo de estado HTTP 201 que incica el exito de la solicitud

@E5Scenario: Actualizar Cargo de un Empleado Mediante Solicitud PUT
 Given El usuario con rol de administrador esta en la pagina de gestion de empleados
 And Existe un empleado registrado en el sistema con el ID 2 y el cargo Cuidador
 When El usuario envia una solicitud PUT para actualizar el cargo del empleado con el ID 2
 Then El sistema deberia procesar la solicitud y actualiza exitosamente el cargo del empleado con el ID 2
 And Devolver un codigo de estado HTTP 200 que significa que todo salio bien

@E6
Scenario: Eliminar un Proveedor Mediante Solicitud DELETE
 Given El usuario con rol de administrador esta en la pagina de gestion de proveedores
 And Existe un proveedor registrado en el sistema con el ID 5 y el nombre Tierragro
 When Envia una solicitud DELETE para eliminar el proveedor con el ID 5
 Then El sistema deberia procesar la solicitud y eliminar exitosamente el proveedor con el ID 5
 And Edeberia devuelver un codigo de estado HTTP 204 que signidica exitoso la eliminacion
   
@E7
Scenario: Intentar Eliminar un Proveedor No Existente Mediante Solicitud DELETE
 Given El usuario con rol de administrador esta en la pagina de gestion de proveedores
 And No existe un proveedor registrado en el sistema con el ID 10
 When Envia una solicitud DELETE para eliminar el proveedor con el ID 10
 Then Se deberia procesar la solicitud y no encontrar el proveedor con el ID 10 para eliminarlo
 And Deberia verse un codigo de estado HTTP 404 que significa no encontrado

@E8
 Scenario: Intentar Crear un Empleado con Datos Incompletos Mediante Solicitud POST
 Given El usuario con rol de administrador esta en la pagina de gestion de empleados
 When Envia una solicitud POST con datos incompletos para crear un nuevo empleado:
 Then Se deberia no poder crear el nuevo empleado debido a datos incompletos
 And Deberia devuelver un codigo de estado HTTP 400 solicitud incompleta

@E9
Scenario: Intentar Actualizar un Empleado con Datos Incorrectos Mediante Solicitud PUT
 Given El usuario con rol de administrador esta en la pagina de gestion de empleados
 And Existe un empleado registrado en el sistema con el ID 1 y el cargo Cuidador
 When Envia una solicitud PUT para actualizar el cargo del empleado con el ID 1 con datos incorrectos
 Then El sistema no deberia poder actualizar el cargo del empleado debido a datos incorrectos
 And Deberia devolver un codigo de estado HTTP 400 significa solicitud incorrecta
 
@E10
Scenario: Intentar Eliminar un Proveedor con ID invalido Mediante Solicitud DELETE
 Given El usuario con rol de administrador esta en la pagina de gestion de proveedores
 When Hace una solicitud DELETE para eliminar el proveedor con un ID invalido abc
 Then Deberia el sistema no encontrar el proveedor con el ID abc para eliminarlo
 And se deberia mostar un codigo de estado HTTP 400 que significa incorrecto




