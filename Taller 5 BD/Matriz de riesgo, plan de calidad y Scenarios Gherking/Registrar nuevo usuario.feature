Feature: crear Usuario nuevo

Como usuario de la página web de House Man Barberia
Quiero poder crear un usuario en la web
Para poder tener acceso a las funcionalidades de la web

Background: 
Given el usuario se encuentra en el módulo de registro sin sesion iniciada

@finalFeliz
Escenario: crear una cuenta con datos validos exitosa

    When llena los campos de registro con datos validos y acepta terminos y condiciones

    Then deberia aparacer un pop up con un captcha para verificar que es humano

    And  deberia tener sesion iniciada en el area de servicios

    And deberia quedar un registro en la base de datos de la barberia

@finalFeliz
Escenario: Crear una cuenta con solo llenar campos requeridos

    When llena los campos solo que se marcan como requeridos ignorando el resto y acepta terminos y condiciones

    Then deberia aparacer un pop up con un captcha para verificar que es humano

    And  deberia tener sesion iniciada en el area de servicios

    And deberia quedar un registro en la base de datos de la barberia

@finalTriste
Escenario: Crear una cuenta con datos no validos

    When llena los campos de registro con datos no validos y acepta terminos y condiciones

    Then se veria un mensaje de error que los datos verificables no son reales


@finalTriste
Escenario: Crear una cuenta con datos no validos pero con correo valido

    When llena los campos de registro con datos no validos excepto por el correo electronico y acepta terminos y condiciones

    Then Deberia de dar un error al no usar datos verificables reales

