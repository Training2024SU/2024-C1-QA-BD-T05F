-- Clientes
INSERT INTO Clientes (id, cedula, nombres, apellidos, direccion, telefono, codigo_postal, email, contrasenia) VALUES
(1, '1003920497', 'Juan', 'Hernandez', 'Carrera 10 #25-30', '3119049820', '110111', 'juan.hernandez@gmail.com', 'contraseña1'),
(2, '1067038518', 'María', 'Consa', 'Calle 20 #15-45', '3223432978', '220222', 'maria.consa@gmail.com', 'contraseña2'),
(3, '1003059648', 'Carlos', 'Vertel', 'Avenida 5 #8-12', '3136983097', '330333', 'carlos.vertel@gmail.com', 'contraseña3'),
(4, '90549392', 'Dina', 'Martínez', 'Calle 15 #30-18', '3142984509', '440444', 'dina.martinez@gmail.com', 'contraseña4'),
(5, '56079368', 'Luis', 'Velazques', 'Carrera 25 #12-10', '3164389870', '550555', 'luis.velazques@gmail.com', 'contraseña5'),
(6, '1003048327', 'Laura', 'Perdomo', 'Calle 30 #5-25', '3172370976', '660666', 'laura.perdomo@gmail.com', 'contraseña6'),
(7, '96069378', 'Daniel', 'Hernández', 'Avenida 10 #40-30', '3175489038', '770777', 'daniel.hernandez@gmail.com', 'contraseña7'),
(8, '89308194', 'Natalia', 'Buitrago', 'Carrera 20 #18-22', '3194098327', '880888', 'Natalia.buitrago@gmail.com', 'contraseña8'),
(9, '902085890', 'Jesus', 'Laverde', 'Calle 12 #6-14', '3229295955', '990999', 'jesus.laverde@gmail.com', 'contraseña9'),
(10, '1003049382', 'Marta', 'Torres', 'Avenida 35 #25-40', '3001268947', '001010', 'marta.torres@gmail.com', 'contraseña10'),
(11, '1067039278', 'Andrés', 'Chaparro', 'Carrera 30 #10-5', '3110794738', '110121', 'andres.chaparro@gmail.com', 'contraseña11'),
(12, '29378569', 'Milena', 'Uribe', 'Calle 22 #15-28', '3222907895', '220232', 'milena.uribe@gmail.com', 'contraseña12'),
(13, '34509873', 'maria', 'Portillo', 'Avenida 15 #20-35', '3235249807', '330343', 'maria.portillo@gmail.com', 'contraseña13'),
(14, '45098072', 'Valentina', 'Arias', 'Calle 8 #12-30', '3240872937', '440454', 'valentina.arias@gmail.com', 'contraseña14'),
(15, '50987073', 'Miguel angel', 'Paes', 'Carrera 12 #25-15', '3190347856', '550565', 'miguel.paes@gmail.com', 'contraseña15'),
(16, '1003049780', 'Camilo', 'Sandobal', 'Avenida 25 #30-20', '3164906738', '660676', 'camila.sandobal@gmail.com', 'contraseña16'),
(17, '982376590', 'Diego', 'Ortiz', 'Calle 18 #8-40', '3170478327', '770787', 'diego.ortiz@gmail.com', 'contraseña17');

-- Almacenistas
INSERT INTO Almacenistas (id, nombre) VALUES
(1, 'Juan Pérez'),
(2, 'María García'),
(3, 'Luis Martínez'),
(4, 'Ana Rodríguez'),
(5, 'Pedro López'),
(6, 'Laura González'),
(7, 'Carlos Sánchez'),
(8, 'Sofía Hernández'),
(9, 'Pablo Díaz'),
(10, 'Elena Ruiz');

-- Repartidores
INSERT INTO Repartidores (id, nombre, matricula_furgoneta) VALUES
(1, 'Marlon Buendia', '123ABC'),
(2, 'Ismael Arsuaga', '456DEF'),
(3, 'Leonel Perez', '789GHI'),
(4, 'Jesus daniel Lozano', '101JKL'),
(5, 'Ahi Landero', '112MNO'),
(6, 'Rosiris Puente', '131PQR'),
(7, 'Rodrigo Marangoni', '415STU'),
(8, 'Hernan Sifuentes', '161VWX'),
(9, 'Diogenes Vertel', '718YZA'),
(10, 'Pablo Ruiz', '192BCD');

-- Categorias
INSERT INTO Categorias (nombre, condicion_almacenaje, observaciones) VALUES
('Alimentos', 'Seco', 'Categoría principal para alimentos no perecederos'),
('Lácteos', 'Frio', 'Productos lácteos que necesitan refrigeración'),
('Congelados', 'Congelado', 'Productos congelados que requieren almacenamiento a temperaturas muy bajas'),
('Frutas y Verduras', 'Frio', 'Frutas y verduras frescas que necesitan refrigeración'),
('Carnes', 'Frio', 'Productos cárnicos que necesitan refrigeración'),
('Bebidas', 'Seco', 'Bebidas no alcohólicas y refrescos'),
('Limpieza', 'Seco', 'Productos de limpieza para el hogar'),
('Higiene', 'Seco', 'Productos de higiene personal'),
('Cuidado del Hogar', 'Seco', 'Productos para el cuidado del hogar'),
('Electrodomésticos', 'Seco', 'Electrodomésticos y artículos para el hogar');

-- Almacenista_areas
INSERT INTO almacenistas_areas (id_almacenista, area) VALUES
(1, 'recepcion y control'),
(1, 'Almacenaje'),
(2, 'Preparacion de pedido'),
(3, 'Carga y descarga'),
(4, 'salida y verificacion de pedido'),
(5, 'Preparacion de pedido'),
(5, 'Carga y descarga'),
(6, 'salida y verificacion de pedido'),
(7, 'Almacenaje'),
(7, 'Preparacion de pedido');


-- Pedidos
INSERT INTO Pedidos (id, direccion, numero_tarjeta, vencimiento_tarjeta, estado, fecha_solicitud, fecha_servido, fecha_entregado, id_repartidor, id_almacenista, id_cliente) VALUES
(1, 'Carrera 10 #25-30', '1234567812345678', '2025-01-01', 'En proceso', '2024-04-02 10:00:00', NULL, NULL, 1, 1, 1),
(2, 'Avenida 456 # 15-67', '2345678923456789', '2025-02-01', 'En tránsito', '2024-04-02 11:30:00', NULL, NULL, 2, 2, 2),
(3, 'Avenida 5 #8-12', '3456789034567890', '2025-03-01', 'Entregado', '2024-04-02 13:45:00', '2024-04-02 15:30:00', '2024-04-02 16:15:00', 3, 3, 3),
(4, 'Calle 15 #30-18', '4567890145678901', '2025-04-01', 'En proceso', '2024-04-02 09:15:00', NULL, NULL, 4, 4, 4),
(5, 'calle 16 # 24-19', '5678901256789012', '2025-05-01', 'Entregado', '2024-04-02 10:45:00', '2024-04-02 12:30:00', '2024-04-02 13:00:00', 5, 5, 5),
(6, 'Calle 456 # 29-56', '6789012367890123', '2025-06-01', 'En proceso', '2024-04-02 14:20:00', NULL, NULL, 4, 6, 6),
(7, 'Plaza del Sol calle 76', '7890123478901234', '2025-07-01', 'En tránsito', '2024-04-02 16:00:00', NULL, NULL, 7, 7, 7),
(8, 'Avenida 78 calle 34', '8901234589012345', '2025-08-01', 'Entregado', '2024-04-02 17:10:00', '2024-04-02 19:00:00', '2024-04-02 19:30:00', 8, 8, 8),
(9, 'Manzana 45 lote 18', '9012345690123456', '2025-09-01', 'En proceso', '2024-04-02 08:00:00', NULL, NULL, 9, 9, 9),
(10, 'Diagonal 19 tranversal 6', '0123456701234567', '2025-10-01', 'Entregado', '2024-04-02 12:20:00', '2024-04-02 13:45:00', '2024-04-02 14:15:00', 10, 10, 10);



-- Productos
INSERT INTO Productos (id, nombre, marca, origen, volumen, peso, fotografia, precio, stock, nombre_categoria) VALUES
(1, 'Arroz', 'Diana', 'Colombia', '1 kg', '1 kg', 'arroz.jpg', 5000, 100, 'Alimentos'),
(2, 'Leche', 'Alquería', 'Colombia', '1 litro', '1 litro', 'leche.jpg', 3000, 200, 'Alimentos'),
(3, 'Pan', 'Bimbo', 'Colombia', '500 g', '500 g', 'pan.jpg', 2000, 150, 'Alimentos'),
(4, 'Azúcar', 'Incauca', 'Colombia', '1 kg', '1 kg', 'azucar.jpg', 4000, 80, 'Alimentos'),
(5, 'Aceite', 'Doñarepa', 'Colombia', '500 ml', '500 ml', 'aceite.jpg', 6000, 120, 'Alimentos'),
(6, 'Jabón', 'Protex', 'Colombia', '100 g', '100 g', 'jabon.jpg', 1500, 300, 'Higiene'),
(7, 'Shampoo', 'Sedal', 'Colombia', '400 ml', '400 ml', 'shampoo.jpg', 4000, 100, 'Higiene'),
(8, 'Cepillo de dientes', 'Colgate', 'Colombia', '1 unidad', '50 g', 'cepillo_dientes.jpg', 2500, 200, 'Higiene'),
(9, 'Papel higiénico', 'Scott', 'Colombia', '4 rollos', '100 g', 'papel_higienico.jpg', 6000, 150, 'Higiene'),
(10, 'Desodorante', 'Axe', 'Colombia', '150 ml', '150 ml', 'desodorante.jpg', 4500, 80, 'Higiene');



-- Repartidores_codigos_postales
 INSERT INTO repartidores_codigos_postales (id_repartidor, codigo_postal) VALUES
(1, '110111'),
(1, '220222'),
(2, '330333'),
(2, '440444'),
(3, '550555'),
(3, '660666'),
(4, '770777'),
(4, '001010'),
(5, '110121'),
(5, '220232');


-- Pedidos_productos
INSERT INTO pedidos_productos (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 5000),
(1, 3, 1, 7000),
(2, 5, 1, 6000),
(2, 7, 2, 3500),
(3, 9, 3, 2800),
(3, 4, 1, 5500),
(4, 8, 2, 2800),
(4, 10, 1, 2000),
(5, 1, 2, 3500),
(5, 9, 1, 3000);