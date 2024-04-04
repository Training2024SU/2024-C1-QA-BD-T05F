DELIMITER //

-- Procedimiento para insertar un nuevo animal con su nueva dieta y hábitat si no existe el hábitat --
CREATE PROCEDURE InsertarAnimalDietaHabitat (
    IN animal_id VARCHAR(30),
    IN habitat_id VARCHAR(45),
    IN dieta_id VARCHAR(45),
    IN animal_nombre VARCHAR(45),
    IN animal_especie VARCHAR(45),
    IN animal_sexo VARCHAR(45),
    IN animal_edad VARCHAR(45),
    IN animal_tamano VARCHAR(45),
    IN alimento_id VARCHAR(45),
    IN dieta_horario VARCHAR(45),
    IN dieta_fecha VARCHAR(45),
    IN dieta_objetivo VARCHAR(45),
    IN habitat_nombre VARCHAR(45),
    IN habitat_ubicacion VARCHAR(45),
    IN habitat_clima VARCHAR(45),
    IN habitat_tipo VARCHAR(45)
)
BEGIN
    -- Insertar el nuevo hábitat si no existe
    INSERT INTO habitat (id, nombre, ubicacion, clima, tipo)
    SELECT habitat_id, habitat_nombre, habitat_ubicacion, habitat_clima, habitat_tipo
    FROM dual
    WHERE NOT EXISTS (SELECT 1 FROM habitat WHERE id = habitat_id);

    -- Insertar la nueva dieta si no existe
    INSERT INTO dieta (id, id_alimento, horario, fecha, objetivo)
    SELECT dieta_id, alimento_id, dieta_horario, dieta_fecha, dieta_objetivo
    FROM dual
    WHERE NOT EXISTS (SELECT 1 FROM dieta WHERE id = dieta_id);

    -- Insertar el nuevo animal
    INSERT INTO animal (id, id_habitat, id_dieta, nombre, especie, sexo, edad, tamano)
    VALUES (animal_id, habitat_id, dieta_id, animal_nombre, animal_especie, animal_sexo, animal_edad, animal_tamano);

END//

-- Procedimiento para consultar información de un animal, su hábitat y su dieta a través de su ID --
CREATE PROCEDURE ConsultarAnimalDietaHabitat (
    IN animal_id VARCHAR(30)
)
BEGIN
    -- Declarar variables para almacenar los resultados
    DECLARE animal_nombre VARCHAR(45);
    DECLARE animal_especie VARCHAR(45);
    DECLARE animal_sexo VARCHAR(45);
    DECLARE animal_edad VARCHAR(45);
    DECLARE animal_tamaño VARCHAR(45);
    DECLARE habitat_nombre VARCHAR(45);
    DECLARE habitat_ubicacion VARCHAR(45);
    DECLARE habitat_clima VARCHAR(45);
    DECLARE habitat_tipo VARCHAR(45);
    DECLARE dieta_horario VARCHAR(45);
    DECLARE dieta_fecha VARCHAR(45);
    DECLARE dieta_objetivo VARCHAR(45);
    
    -- Obtener información del animal, hábitat y dieta
    SELECT a.nombre, a.especie, a.sexo, a.edad, a.tamaño,
           h.nombre, h.ubicacion, h.clima, h.tipo,
           d.horario, d.fecha, d.objetivo
    INTO animal_nombre, animal_especie, animal_sexo, animal_edad, animal_tamaño,
         habitat_nombre, habitat_ubicacion, habitat_clima, habitat_tipo,
         dieta_horario, dieta_fecha, dieta_objetivo
    FROM animal a
    JOIN habitat h ON a.id_habitat = h.id
    JOIN dieta d ON a.id_dieta = d.id
    WHERE a.id = animal_id;
    
    -- Devolver los resultados
    SELECT animal_nombre, animal_especie, animal_sexo, animal_edad, animal_tamaño,
           habitat_nombre, habitat_ubicacion, habitat_clima, habitat_tipo,
           dieta_horario, dieta_fecha, dieta_objetivo;
END//

-- Procedimiento para eliminar un animal de la base de datos a través de su ID --
CREATE PROCEDURE EliminarAnimal (
    IN animal_id VARCHAR(30)
)
BEGIN
    -- Eliminar animal
    DELETE FROM animal WHERE id = animal_id;
END//

//
DELIMITER ;
