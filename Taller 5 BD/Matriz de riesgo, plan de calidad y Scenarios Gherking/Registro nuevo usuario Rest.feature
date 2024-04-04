Feature: Registro nuevo usuario usando el servicio REST

yo como usuario de la página web de House Man Barberia
quiero registrarme usando los servicios REST de la barberia
para poder acceder a los servicios ofrecidos de la pagina web

Background:
 Given el usuario esta en Postman con los servicios de la barberia agregados

 
Scenario: Registro de usuario Exitoso

   When Llena los campos del servicio correctamente
   And hace la peticion de POST del servicio

   Then deberia recibir un codigo 201 con un mensaje con la informacion
   And la informacion del usuario deberia estar en la Base de Datos

Scenario: Registro de usuario Fallido sin contraseña

  When Llena los campos del servicio correctamente
  And hace la peticion de POST del servicio
  
  Then deberia recibir un codigo 400 con un mensaje de error que falta contraseña

 