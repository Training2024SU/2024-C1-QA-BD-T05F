-- Trigger para registrar la adición de un nuevo animal en la tabla animal --
CREATE DEFINER=`root`@`localhost` TRIGGER `registrar_animal_agregado`
AFTER INSERT ON `animal`
FOR EACH ROW
BEGIN
    INSERT INTO control_de_cambios_zoo (usuario, accion, fecha)
    VALUES (USER(), 'Agregado nuevo animal', NOW());
END;

-- Trigger para registrar la eliminación de un animal de la tabla animal --
CREATE DEFINER=`root`@`localhost` TRIGGER `registrar_eliminacion`
AFTER DELETE ON `animal`
FOR EACH ROW
BEGIN
    INSERT INTO control_de_cambios_zoo (usuario, accion, fecha)
    VALUES (USER(), 'Eliminado animal', NOW());
END;
