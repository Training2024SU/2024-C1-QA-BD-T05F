-- Crear una tabla para almacenar los cambios en la dieta
CREATE TABLE RegistroCambiosDieta (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TipoCambio VARCHAR(10), -- Puede ser 'INSERT', 'DELETE' o 'UPDATE'
    FechaCambios TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Detalles VARCHAR(255)
);

-- Trigger para registrar inserciones en la tabla de dieta
DELIMITER $$
CREATE TRIGGER tr_insertar_dieta
AFTER INSERT ON Dieta
FOR EACH ROW
BEGIN
    INSERT INTO RegistroCambiosDieta (TipoCambio, Detalles)
    VALUES ('INSERT', CONCAT('Se agregó la dieta con ID ', NEW.ID));
END$$
DELIMITER ;

-- Trigger para registrar eliminaciones en la tabla de dieta
DELIMITER $$
CREATE TRIGGER tr_eliminar_dieta
AFTER DELETE ON Dieta
FOR EACH ROW
BEGIN
    INSERT INTO RegistroCambiosDieta (TipoCambio, Detalles)
    VALUES ('DELETE', CONCAT('Se eliminó la dieta con ID ', OLD.ID));
END$$
DELIMITER ;

-- Trigger para registrar actualizaciones en la tabla de dieta
DELIMITER $$
CREATE TRIGGER tr_actualizar_dieta
AFTER UPDATE ON Dieta
FOR EACH ROW
BEGIN
    INSERT INTO RegistroCambiosDieta (TipoCambio, Detalles)
    VALUES ('UPDATE', CONCAT('Se actualizó la dieta con ID ', NEW.ID));
END$$
DELIMITER ;
