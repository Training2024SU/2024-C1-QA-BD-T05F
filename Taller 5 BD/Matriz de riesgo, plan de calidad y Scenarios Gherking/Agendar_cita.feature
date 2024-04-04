Feature: Agendar Cita

Como usuario registrado de la página web de House Man Barberia
Quiero poder crear usar el módulo de agendar servicio en la web
Para poder tener acceso a los servicios de la Barberia

Background: 
Given el usuario se encuentra con sesion iniciada en el módulo de reservas

@finalFeliz
Scenario: Agendar Cita Exitosamente con cuenta incompleta
  When Seleccion el servicio que desea usar

  And selecciona el dia, hora y barbero

  And Diligencia datos faltantes de la cuenta 

  Then se daria un mensaje de que su cita ha sido agendada y un correo electronico

  And deberia quedar un registro en la base de datos de la barberia

@finalFeliz
Scenario: Agendar Cita Exitosamente con cuenta completa
  When Seleccion el servicio que desea usar

  And selecciona el dia, hora y barbero

  And Confirma los datos en pantalla
  
  Then se daria un mensaje de que su cita ha sido agendada y un correo electronico 

  And deberia quedar un registro en la base de datos de la barberia
  
@finalTriste
Scenario: Agendar Cita fallida datos faltantes
  When Seleccion el servicio que desea usar

  And selecciona el dia, hora y barbero

  And deja en blanco los datos a confirmar

  Then se daria error y mostraria los campos obligatorios a llenar

@finalFeliz
Scenario: Sin confirmar la preferencia de Barbero
  When Seleccion el servicio que desea usar

  And selecciona el dia, hora y no selecciona el barbero si hay opcion

  Then se daria error y mostraria los campos obligatorios a llenar