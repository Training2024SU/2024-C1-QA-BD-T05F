-- TABLA CLIENTES-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`cliente` (`cedula_cliente`, `nombre_cliente`, `apellido_cliente`, `profesion`, `correo`, `fecha_nacimiento`, `edad`, `direccion`)
VALUES
('1234567890', 'Juan', 'Pérez', 'Ingeniero', 'juanperez@example.com', '1990-05-15', 31, 'Calle Principal 123'),
('2345678901', 'María', 'González', 'Doctora', 'mariagonzalez@example.com', '1985-10-20', 36, 'Avenida Central 456'),
('3456789012', 'Carlos', 'López', 'Abogado', 'carloslopez@example.com', '1988-02-12', 33, 'Plaza Mayor 789'),
('4567890123', 'Ana', 'Martínez', 'Contadora', 'anamartinez@example.com', '1995-07-30', 26, 'Calle Secundaria 234'),
('5678901234', 'Pedro', 'Sánchez', 'Arquitecto', 'pedrosanchez@example.com', '1980-12-05', 41, 'Avenida Norte 567'),
('6789012345', 'Laura', 'Hernández', 'Profesora', 'laurahernandez@example.com', '1992-09-18', 29, 'Calle Sur 890'),
('7890123456', 'David', 'Rodríguez', 'Ingeniero', 'davidrodriguez@example.com', '1987-04-25', 34, 'Paseo Este 123'),
('8901234567', 'Sofía', 'Díaz', 'Médico', 'sofiadiaz@example.com', '1998-03-10', 23, 'Paseo Oeste 456'),
('9012345678', 'Elena', 'Gómez', 'Diseñadora', 'elenagomez@example.com', '1983-08-22', 38, 'Calle Este 789'),
('0123456789', 'Javier', 'Fernández', 'Ingeniero', 'javierfernandez@example.com', '1976-11-28', 47, 'Avenida Oeste 012'),
('1234509876', 'Lucía', 'Paz', 'Contadora', 'luciapaz@example.com', '1991-06-17', 30, 'Calle Norte 345'),
('2345098765', 'Alejandro', 'Ríos', 'Músico', 'alejandrorios@example.com', '1982-01-03', 39, 'Plaza Principal 678'),
('3450987654', 'Valentina', 'Vargas', 'Artista', 'valentinavargas@example.com', '1993-04-08', 28, 'Calle Central 901'),
('4509876543', 'Gabriel', 'Torres', 'Ingeniero', 'gabrieltorres@example.com', '1986-12-12', 35, 'Avenida Secundaria 234'),
('5098765432', 'Adriana', 'Suárez', 'Abogada', 'adrianasuarez@example.com', '1979-09-05', 44, 'Plaza Mayor 567'),
('0987654321', 'Fernando', 'Lara', 'Artista', 'fernandolara@example.com', '1996-02-20', 25, 'Calle Secundaria 890'),
('9876543210', 'Camila', 'Gutiérrez', 'Médico', 'camilagutierrez@example.com', '1981-07-14', 42, 'Avenida Norte 123'),
('8765432109', 'Martín', 'Molina', 'Diseñador', 'martinmolina@example.com', '1994-08-30', 27, 'Calle Sur 456'),
('7654321098', 'Paula', 'Aguilar', 'Arquitecta', 'paulaaguilar@example.com', '1984-03-25', 37, 'Paseo Este 789'),
('6543210987', 'Diego', 'Ramírez', 'Médico', 'diegoramirez@example.com', '1977-06-10', 46, 'Paseo Oeste 012'),
('5432109876', 'Andrea', 'Ortega', 'Ingeniera', 'andreaortega@example.com', '1997-11-05', 24, 'Calle Este 345'),
('4321098765', 'Roberto', 'García', 'Chef', 'robertogarcia@example.com', '1980-04-18', 41, 'Avenida Oeste 678'),
('3210987654', 'Julia', 'Flores', 'Periodista', 'juliaflores@example.com', '1990-01-15', 31, 'Calle Norte 901'),
('2109876543', 'Gabriela', 'Benítez', 'Actriz', 'gabrielabenitez@example.com', '1989-10-20', 32, 'Plaza Principal 234'),
('1098765432', 'Mateo', 'Castro', 'Ingeniero', 'mateocastro@example.com', '1986-07-30', 35, 'Calle Central 567'),
('0987654321', 'Lucas', 'Herrera', 'Músico', 'lucasherrera@example.com', '1995-04-05', 26, 'Avenida Secundaria 890'),
('9876543210', 'Mariana', 'Álvarez', 'Profesora', 'marianaalvarez@example.com', '1981-11-20', 42, 'Plaza Mayor 123'),
('8765432109', 'Cristian', 'Reyes', 'Ingeniero', 'cristianreyes@example.com', '1978-08-15', 43, 'Calle Principal 456'),
('7654321098', 'Carolina', 'Luna', 'Diseñadora', 'carolinaluna@example.com', '1993-05-10', 28, 'Avenida Central 789');

-- TABLA telefono_cliente-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`telefono_cliente` (`id_cliente`, `telefono`)
VALUES
(1, '3191234567'),
(2, '3102345678'),
(3, '3143456789'),
(4, '3204567890'),
(5, '3155678901'),
(6, '3136789012'),
(7, '3197890123'),
(8, '3108901234'),
(9, '3149012345'),
(10, '3200123456'),
(11, '3151234509'),
(12, '3132345098'),
(13, '3193450987'),
(14, '3104509876'),
(15, '3145098765'),
(16, '3200987654'),
(17, '3159876543'),
(18, '3138765432'),
(19, '3190987654'),
(20, '3109876543'),
(21, '3148765432'),
(22, '3207654321'),
(23, '3156543210'),
(24, '3135432109'),
(25, '3194321098'),
(26, '3103210987'),
(27, '3142109876'),
(28, '3201098765'),
(29, '3150987654');

-- TABLA Especialidad-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`especialidad` (`nombre_especialidad`)
VALUES
('Corte de Pelo'),
('Manicura'),
('Planchado de Cabello'),
('Afeitado Clásico'),
('Peinados de Fiesta'),
('Barba Diseñada'),
('Tinte de Barba'),
('Diseño de Cejas'),
('Corte de Barba'),
('Tratamiento Capilar'),
('Masaje Capilar'),
('Tratamiento Facial'),
('Depilación con Cera'),
('Pedicura'),
('Maquillaje'),
('Recorte de Patillas'),
('Exfoliación Facial'),
('Lavado de Cabello'),
('Tratamiento de Keratina'),
('Afeitado de Cabeza');

-- TABLA Eempleado-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`empleado` (`cedula_empleado`, `nombre_empleado`, `apellido_empleado`, `id_especialidad`)
VALUES
('123456789012345', 'Juan', 'Martínez', 1),
('234567890123456', 'María', 'López', 2),
('345678901234567', 'Carlos', 'García', 3),
('456789012345678', 'Ana', 'Hernández', 4),
('567890123456789', 'Pedro', 'Pérez', 5),
('678901234567890', 'Laura', 'González', 6),
('789012345678901', 'David', 'Rodríguez', 7),
('890123456789012', 'Sofía', 'Díaz', 8),
('901234567890123', 'Elena', 'Sánchez', 9),
('012345678901234', 'Javier', 'Martín', 10),
('123450987654321', 'Lucía', 'Gómez', 11),
('234509876543210', 'Alejandro', 'Fernández', 12),
('345098765432109', 'Valentina', 'Ruiz', 13),
('450987654321098', 'Gabriel', 'Torres', 14),
('509876543210987', 'Adriana', 'Suárez', 15),
('098765432109876', 'Fernando', 'López', 16),
('987654321098765', 'Camila', 'Gutiérrez', 17),
('876543210987654', 'Martín', 'Hernández', 18),
('765432109876543', 'Paula', 'García', 19),
('654321098765432', 'Diego', 'Pérez', 20);

-- TABLA Historial Servicios-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`historial_servicios` (`producto_consumido`, `fecha_y_hora`, `duracion_procedimiento`, `id_empleado`, `id_cliente`)
VALUES
('Corte de Pelo Clásico', '2024-03-01 09:30:00', '00:30:00', 1, 1),
('Manicura Básica', '2024-03-02 10:15:00', '00:45:00', 2, 2),
('Planchado de Cabello', '2024-03-03 11:00:00', '01:00:00', 3, 3),
('Afeitado Clásico', '2024-03-04 12:00:00', '00:45:00', 4, 4),
('Peinado Elegante', '2024-03-05 13:30:00', '00:45:00', 5, 5),
('Diseño de Barba', '2024-03-06 14:00:00', '00:30:00', 6, 6),
('Tinte de Barba', '2024-03-07 15:00:00', '01:15:00', 7, 7),
('Diseño de Cejas', '2024-03-08 16:30:00', '00:30:00', 8, 8),
('Corte de Barba Moderno', '2024-03-09 17:00:00', '00:45:00', 9, 9),
('Tratamiento Capilar', '2024-03-10 09:00:00', '01:30:00', 10, 10),
('Masaje Capilar', '2024-03-11 10:30:00', '00:45:00', 11, 11),
('Tratamiento Facial', '2024-03-12 11:45:00', '01:00:00', 12, 12),
('Depilación con Cera', '2024-03-13 12:30:00', '00:45:00', 13, 13),
('Pedicura de Lujo', '2024-03-14 13:45:00', '01:15:00', 14, 14),
('Maquillaje Profesional', '2024-03-15 14:00:00', '01:30:00', 15, 15),
('Recorte de Patillas', '2024-03-16 15:30:00', '00:30:00', 16, 16),
('Exfoliación Facial', '2024-03-17 16:00:00', '00:45:00', 17, 17),
('Lavado de Cabello', '2024-03-18 17:00:00', '00:45:00', 18, 18),
('Tratamiento de Keratina', '2024-03-19 10:00:00', '01:30:00', 19, 19),
('Afeitado de Cabeza', '2024-03-20 11:30:00', '00:45:00', 20, 20),
('Corte de Pelo Moderno', '2024-03-21 12:45:00', '01:00:00', 1, 21),
('Peinado Creativo', '2024-03-22 13:30:00', '01:15:00', 2, 22),
('Barba a la Moda', '2024-03-23 14:45:00', '00:30:00', 3, 23),
('Tinte de Cabello', '2024-03-24 15:15:00', '01:30:00', 4, 24),
('Tratamiento de Piel', '2024-03-25 16:45:00', '00:45:00', 5, 25),
('Masaje Relajante', '2024-03-26 17:30:00', '01:00:00', 6, 26),
('Corte de Barba Vintage', '2024-03-27 09:45:00', '00:45:00', 7, 27),
('Depilación Corporal', '2024-03-28 10:45:00', '01:15:00', 8, 28),
('Pedicura Spa', '2024-03-29 11:30:00', '01:30:00', 9, 29);

-- TABLA Servicios-----------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO `barberia_house_man`.`servicio` (`nombre_servicio`)
VALUES
('Corte de Pelo'),
('Afeitado Clásico'),
('Manicura'),
('Planchado de Cabello'),
('Peinado de Fiesta'),
('Barba Diseñada'),
('Tinte de Barba'),
('Diseño de Cejas'),
('Corte de Barba'),
('Tratamiento Capilar'),
('Masaje Capilar'),
('Tratamiento Facial'),
('Depilación con Cera'),
('Pedicura'),
('Maquillaje'),
('Recorte de Patillas'),
('Exfoliación Facial'),
('Lavado de Cabello'),
('Tratamiento de Keratina'),
('Afeitado de Cabeza');

-- TABLA Cita-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`cita` (`id_empleado`, `id_cliente`, `fecha_y_hora`, `id_servicio`)
VALUES
(1, 1, '2024-04-01 09:00:00', 1),
(2, 2, '2024-04-01 09:30:00', 2),
(3, 3, '2024-04-01 10:00:00', 3),
(4, 4, '2024-04-01 10:30:00', 4),
(5, 5, '2024-04-01 11:00:00', 5),
(6, 6, '2024-04-01 11:30:00', 6),
(7, 7, '2024-04-01 12:00:00', 7),
(8, 8, '2024-04-01 12:30:00', 8),
(9, 9, '2024-04-01 13:00:00', 9),
(10, 10, '2024-04-01 13:30:00', 10),
(11, 11, '2024-04-02 09:00:00', 11),
(12, 12, '2024-04-02 09:30:00', 12),
(13, 13, '2024-04-02 10:00:00', 13),
(14, 14, '2024-04-02 10:30:00', 14),
(15, 15, '2024-04-02 11:00:00', 15),
(16, 16, '2024-04-02 11:30:00', 16),
(17, 17, '2024-04-02 12:00:00', 17),
(18, 18, '2024-04-02 12:30:00', 18),
(19, 19, '2024-04-02 13:00:00', 19),
(20, 20, '2024-04-02 13:30:00', 20),
(1, 21, '2024-04-03 09:00:00', 1),
(2, 22, '2024-04-03 09:30:00', 2),
(3, 23, '2024-04-03 10:00:00', 3),
(4, 24, '2024-04-03 10:30:00', 4),
(5, 25, '2024-04-03 11:00:00', 5),
(6, 26, '2024-04-03 11:30:00', 6),
(7, 27, '2024-04-03 12:00:00', 7),
(8, 28, '2024-04-03 12:30:00', 8),
(9, 29, '2024-04-03 13:00:00', 9),
(1, 1, '2024-04-04 09:00:00', 11),
(2, 2, '2024-04-04 09:30:00', 12),
(3, 3, '2024-04-04 10:00:00', 13),
(4, 4, '2024-04-04 10:30:00', 14),
(5, 5, '2024-04-04 11:00:00', 15),
(6, 6, '2024-04-04 11:30:00', 16),
(7, 7, '2024-04-04 12:00:00', 17),
(8, 8, '2024-04-04 12:30:00', 18),
(9, 9, '2024-04-04 13:00:00', 19),
(10, 10, '2024-04-04 13:30:00', 20);

-- TABLA Registro_venta-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`registro_venta` (`fecha_y_hora`, `total`, `ganancia_ocasional`, `id_empleado`)
VALUES
('2024-04-01 14:00:00', 50000, 5000, 1),
('2024-04-02 15:30:00', 70000, 7000, 2),
('2024-04-03 16:45:00', 60000, 6000, 3),
('2024-04-04 17:20:00', 90000, 9000, 4),
('2024-04-05 18:10:00', 80000, 8000, 5),
('2024-04-06 14:30:00', 55000, 5500, 6),
('2024-04-07 15:15:00', 75000, 7500, 7),
('2024-04-08 16:00:00', 65000, 6500, 8),
('2024-04-09 17:00:00', 95000, 9500, 9),
('2024-04-10 17:45:00', 85000, 8500, 10),
('2024-04-11 14:20:00', 60000, 6000, 11),
('2024-04-12 15:00:00', 70000, 7000, 12),
('2024-04-13 16:30:00', 50000, 5000, 13),
('2024-04-14 17:10:00', 80000, 8000, 14),
('2024-04-15 18:00:00', 75000, 7500, 15),
('2024-04-16 14:45:00', 65000, 6500, 16),
('2024-04-17 15:20:00', 90000, 9000, 17),
('2024-04-18 16:15:00', 85000, 8500, 18),
('2024-04-19 17:30:00', 55000, 5500, 19),
('2024-04-20 18:05:00', 70000, 7000, 20),
('2024-04-21 14:10:00', 60000, 6000, 1),
('2024-04-22 15:00:00', 80000, 8000, 2),
('2024-04-23 16:20:00', 70000, 7000, 3),
('2024-04-24 17:15:00', 95000, 9500, 4),
('2024-04-25 18:30:00', 85000, 8500, 5),
('2024-04-26 14:40:00', 50000, 5000, 6),
('2024-04-27 15:25:00', 75000, 7500, 7),
('2024-04-28 16:10:00', 65000, 6500, 8),
('2024-04-29 17:40:00', 90000, 9000, 9),
('2024-04-30 18:15:00', 80000, 8000, 10);

-- TABLA Proveedor-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`proveedor` (`id_proveedor`, `nombre_proveedor`, `correo`, `direccion`)
VALUES
('1', 'Juan', 'juan@gmail.com', 'Calle 23 #1, Bogotá'),
('2', 'Pedro', 'pedro@hotmail.com', 'Avenida 22, Cali'),
('3', 'María', 'maria@gmail.com', 'Carrera 34 #7, Medellín'),
('4', 'José', 'jose@hotmail.com', 'Calle 45, Barranquilla'),
('5', 'Ana', 'ana@gmail.com', 'Carrera 56 #9, Cartagena'),
('6', 'Luis', 'luis@hotmail.com', 'Avenida 67, Bucaramanga'),
('7', 'Laura', 'laura@gmail.com', 'Calle 78, Pereira'),
('8', 'Carlos', 'carlos@hotmail.com', 'Carrera 91 #11, Manizales'),
('9', 'Andrea', 'andrea@gmail.com', 'Avenida 10, Cúcuta'),
('10', 'David', 'david@hotmail.com', 'Calle 12 #15, Villavicencio'),
('11', 'Sandra', 'sandra@gmail.com', 'Carrera 13, Ibagué'),
('12', 'Oscar', 'oscar@hotmail.com', 'Calle 14 #17, Santa Marta'),
('13', 'Daniela', 'daniela@gmail.com', 'Avenida 15, Pasto'),
('14', 'Juanita', 'juanita@hotmail.com', 'Carrera 16 #19, Montería'),
('15', 'Santiago', 'santiago@gmail.com', 'Calle 17, Neiva'),
('16', 'Valentina', 'valentina@hotmail.com', 'Avenida 18 #21, Tunja'),
('17', 'Andrés', 'andres@gmail.com', 'Carrera 19, Armenia'),
('18', 'Camila', 'camila@hotmail.com', 'Calle 20 #23, Popayán'),
('19', 'Mateo', 'mateo@gmail.com', 'Avenida 21, Sincelejo'),
('20', 'Paula', 'paula@hotmail.com', 'Carrera 22 #25, Florencia');

-- TABLA telefono proveedor-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`telefono_proveedor` (`id_proveedor`, `telefono`) VALUES
('1', '3191234567'),
('2', '3102345678'),
('3', '3143456789'),
('4', '3204567890'),
('5', '3155678901'),
('6', '3136789012'),
('7', '3197890123'),
('8', '3108901234'),
('9', '3149012345'),
('10', '3200123456'),
('11', '3151234509'),
('12', '3132345098'),
('13', '3193450987'),
('14', '3104509876'),
('15', '3145098765'),
('16', '3200987654'),
('17', '3159876543'),
('18', '3138765432'),
('19', '3190987654'),
('20', '3109876543');

-- TABLA producto-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`producto` (`ref_producto`, `nombre_producto`, `cantidad`, `precio`, `id_proveedor`) VALUES
('REF001', 'Tijeras de corte', 50, 15000, '1'),
('REF002', 'Cepillo para barba', 30, 10000, '2'),
('REF003', 'Maquina de afeitar', 20, 250000, '3'),
('REF004', 'Gel para cabello', 100, 8000, '4'),
('REF005', 'Navaja de afeitar', 25, 20000, '5'),
('REF006', 'Capa de corte', 40, 12000, '6'),
('REF007', 'Tijeras de entresacar', 35, 18000, '7'),
('REF008', 'Peine de peluquería', 60, 5000, '8'),
('REF009', 'Máquina de cortar cabello', 15, 300000, '9'),
('REF010', 'Secador de pelo', 10, 350000, '10'),
('REF011', 'Crema hidratante facial', 80, 7000, '11'),
('REF012', 'Loción para barba', 40, 12000, '12'),
('REF013', 'Aceite para barba', 50, 15000, '13'),
('REF014', 'Cera para cabello', 30, 10000, '14'),
('REF015', 'Tijeras para nariz', 25, 20000, '15'),
('REF016', 'Peine para barba', 45, 6000, '16'),
('REF017', 'Cepillo para cabello', 70, 4000, '17'),
('REF018', 'Gel para barba', 55, 17000, '18'),
('REF019', 'Cuchilla de afeitar', 20, 25000, '19'),
('REF020', 'Aceite para cabello', 40, 12000, '20');

-- TABLA Compra Producto-----------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO `barberia_house_man`.`compra_producto` (`id_cliente`, `ref_producto`) VALUES
(1, 'REF001'),
(2, 'REF018'),
(3, 'REF005'),
(4, 'REF016'),
(5, 'REF013'),
(6, 'REF020'),
(7, 'REF012'),
(8, 'REF009'),
(9, 'REF015'),
(10, 'REF011'),
(11, 'REF004'),
(12, 'REF003'),
(13, 'REF007'),
(14, 'REF019'),
(15, 'REF010'),
(16, 'REF008'),
(17, 'REF006'),
(18, 'REF014'),
(19, 'REF017'),
(20, 'REF002');

-- TABLA registro venta producto -----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `barberia_house_man`.`registro_venta_producto` (`id_registro`, `ref_producto`) VALUES
(1, 'REF012'),
(2, 'REF020'),
(3, 'REF005'),
(4, 'REF017'),
(5, 'REF010'),
(6, 'REF006'),
(7, 'REF001'),
(8, 'REF019'),
(9, 'REF013'),
(10, 'REF015'),
(11, 'REF008'),
(12, 'REF016'),
(13, 'REF011'),
(14, 'REF014'),
(15, 'REF009'),
(16, 'REF002'),
(17, 'REF007'),
(18, 'REF004'),
(19, 'REF018'),
(20, 'REF003');