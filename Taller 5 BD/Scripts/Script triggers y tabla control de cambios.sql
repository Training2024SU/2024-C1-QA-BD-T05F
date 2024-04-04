-- Crear tabla control de cambios --------------------------------------------------------------------------------------


CREATE TABLE IF NOT EXISTS `barberia_house_man`.`control_de_cambios_Barberia` (
  `id_registro` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `accion` VARCHAR(100) NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- Trigger para tabla cliente al insertar nueva informacion --------------------------------------------------------------------

DELIMITER //

CREATE TRIGGER Trigger_insertar_informacion_cliente
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO control_de_cambios_Barberia (usuario, accion, fecha) VALUES (USER(), 'Insertó un registro en la tabla cliente', NOW());
END;
//

DELIMITER ;

-- Trigger para tabla cliente al borrar informacion --------------------------------------------------------------------

DELIMITER //

CREATE TRIGGER borrar_informacion_cliente
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO control_de_cambios_Barberia (usuario, accion, fecha) VALUES (USER(), 'Eliminó un registro en la tabla cliente', NOW());
END;
//

DELIMITER ;

