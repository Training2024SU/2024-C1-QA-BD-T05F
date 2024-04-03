Feature Yo como administrador quiero crear, leer, actualizar y borrar la base
de datos de los empleados, animales y alimentos para conocer la situacion del zoologico.

@EP1
  Scenario: Listar Empleados Registrados en el Sistema
    Given El usuario con rol de administrador está en la página de gestión de empleados
    When El usuario selecciona la opción para listar todos los empleados registrados
    Then El sistema muestra una lista completa de empleados con sus respectivos detalles
    And La lista incluye información como nombre completo, cargo, correo electrónico y número de teléfono

@E2
  Scenario: Mostrar Detalles de un Animal Único en el Sistema
    Given El usuario con rol de cuidador está en la página de detalles de animales
    And Existe un animal único registrado en el sistema con el codigo 2
    When El usuario busca el animal con codigo 2 en el sistema
    Then El sistema muestra los detalles completos del animal con codigo 2
    And Los detalles incluyen información como especie, estado de salud, alimento
    And El sistema proporciona opciones para editar, actualizar o eliminar la información del animal codigo 2

@E3
  Scenario: Buscar Detalles de un Animal Único No Encontrado en el Sistema
    Given El usuario con rol de cuidador está en la página de detalles de animales
    And No existe un animal registrado en el sistema con el código 23
    When El usuario intenta buscar el animal con código 23 en el sistema
    Then El sistema muestra un mensaje indicando que el animal no fue encontrado
    And que se puede identificar tambien con el codigo HTTP 404

@E4
    Scenario: Crear un Empleado Mediante Solicitud POST
    Given El usuario con rol de administrador está en la página de gestión de empleados
    And El usuario tiene acceso al servicio REST para crear un nuevo empleado
    When El usuario envía una solicitud POST con los datos del nuevo empleado:
      | Nombre     | Jorge Rodriguez  |
      | Cargo      | Cuidador         |
    Then El sistema procesa la solicitud y crea exitosamente el nuevo empleado
    And El sistema muestra un código de estado HTTP 201 que incica el exito

@E5
  Scenario: Actualizar Cargo de un Empleado Mediante Solicitud PUT
    Given El usuario con rol de administrador está en la página de gestión de empleados
    And Existe un empleado registrado en el sistema con el ID 2 y el cargo Cuidador
    When El usuario envía una solicitud PUT para actualizar el cargo del empleado con el ID 2 con los datos:
      | Cargo  | Veterinario |
    Then El sistema procesa la solicitud y actualiza exitosamente el cargo del empleado con el ID 2
    And El sistema devuelve un código de estado HTTP 200 que significa que todo salio bien
    And El sistema actualiza el cargo del empleado con el ID 2 a Veterinario

@E6
  Scenario: Eliminar un Proveedor Mediante Solicitud DELETE
    Given El usuario con rol de administrador está en la página de gestión de proveedores
    And Existe un proveedor registrado en el sistema con el ID 5 y el nombre Tierragro
    When El usuario envía una solicitud DELETE para eliminar el proveedor con el ID 5
    Then El sistema procesa la solicitud y elimina exitosamente el proveedor con el ID 5
    And El sistema devuelve un código de estado HTTP 204 que signidica exitoso la eliminacion
    And El proveedor con el ID 5 y el nombre Tierragro ya no aparece en la lista de proveedores registrados

@E7
Scenario: Intentar Eliminar un Proveedor No Existente Mediante Solicitud DELETE
 Given El usuario con rol de administrador está en la página de gestión de proveedores
 And No existe un proveedor registrado en el sistema con el ID 10
 When El usuario envía una solicitud DELETE para eliminar el proveedor con el ID 10
 Then El sistema procesa la solicitud y no puede encontrar el proveedor con el ID 10 para eliminarlo
 And El sistema devuelve un código de estado HTTP 404 que significa no encontrado
 And La lista de proveedores registrados permanece sin cambios

@E8
 Scenario: Intentar Crear un Empleado con Datos Incompletos Mediante Solicitud POST
 Given El usuario con rol de administrador está en la página de gestión de empleados
 When El usuario envía una solicitud POST con datos incompletos para crear un nuevo empleado:
      | Nombre     | Juan Jose  |
      | Cargo      |            |
      | Correo     |            |
      | Teléfono   | 1234567890 |
 Then El sistema procesa la solicitud y no puede crear el nuevo empleado debido a datos incompletos
 And El sistema devuelve un código de estado HTTP 400 solicitud incompleta
 And La lista de empleados registrados permanece sin cambios

@E9
Scenario: Intentar Actualizar un Empleado con Datos Incorrectos Mediante Solicitud PUT
 Given El usuario con rol de administrador está en la página de gestión de empleados
 And Existe un empleado registrado en el sistema con el ID 1 y el cargo Cuidador
 When El usuario envía una solicitud PUT para actualizar el cargo del empleado con el ID 1 con datos incorrectos:
      | Cargo  | 12345     |
 Then El sistema procesa la solicitud y no puede actualizar el cargo del empleado debido a datos incorrectos
 And El sistema devuelve un código de estado HTTP 400 significa solicitud incorrecta
 And El cargo del empleado con el ID 1 permanece sin cambios
 
@E10
Scenario: Intentar Eliminar un Proveedor con ID Inválido Mediante Solicitud DELETE
 Given El usuario con rol de administrador está en la página de gestión de proveedores
 When El usuario envía una solicitud DELETE para eliminar el proveedor con un ID inválido abc
 Then El sistema procesa la solicitud y no puede encontrar el proveedor con el ID abc para eliminarlo
 And El sistema devuelve un código de estado HTTP 400 que significa incorrecto
 And La lista de proveedores registrados permanece sin cambios



