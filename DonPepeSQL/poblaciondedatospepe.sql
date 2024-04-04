-- Insersion de datos

USE tienda_don_pepe;

-- Insertar clientes
INSERT INTO Cliente (cliente_id, nombre, email, telefono, cedula, password) 
VALUES 
(1, 'Juan Perez', 'juan@example.com', '123456789', '1234567890', 'password1'),
(2, 'María López', 'maria@example.com', '987654321', '0987654321', 'password2'),
(3, 'Carlos García', 'carlos@example.com', '555555555', '5678901234', 'password3'),
(4, 'Ana Martínez', 'ana@example.com', '333333333', '9876543210', 'password4'),
(5, 'Luisa Rodríguez', 'luisa@example.com', '777777777', '4567890123', 'password5'),
(6, 'Pedro Gómez', 'pedro@example.com', '111111111', '3456789012', 'password6'),
(7, 'Sofía Díaz', 'sofia@example.com', '444444444', '2345678901', 'password7'),
(8, 'Jorge Hernández', 'jorge@example.com', '888888888', '6789012345', 'password8'),
(9, 'Carolina Sánchez', 'carolina@example.com', '999999999', '7890123456', 'password9'),
(10, 'Daniel Vargas', 'daniel@example.com', '222222222', '8901234567', 'password10'),
(11, 'Elena Castro', 'elena@example.com', '666666666', '9012345678', 'password11'),
(12, 'Francisco Morales', 'francisco@example.com', '555555555', '0123456789', 'password12'),
(13, 'Alejandra Ortiz', 'alejandra@example.com', '333333333', '5432109876', 'password13'),
(14, 'Gabriel Cruz', 'gabriel@example.com', '111111111', '6543210987', 'password14'),
(15, 'Valentina Reyes', 'valentina@example.com', '777777777', '7654321098', 'password15'),
(16, 'Andrea Núñez', 'andrea@example.com', '888888888', '8765432109', 'password16'),
(17, 'Miguel Silva', 'miguel@example.com', '444444444', '9876543210', 'password17'),
(18, 'Lucía Ramos', 'lucia@example.com', '999999999', '0987654321', 'password18'),
(19, 'Roberto Torres', 'roberto@example.com', '222222222', '1098765432', 'password19'),
(20, 'Laura Gutiérrez', 'laura@example.com', '333333333', '2109876543', 'password20');

-- Insertar direccion_cliente
INSERT INTO DireccionCliente (id, cliente_id, direccion) 
VALUES 
(1, 1, 'Calle 123, Ciudad'),
(2, 2, 'Avenida XYZ, Pueblo'),
(3, 3, 'Carrera 456, Villa'),
(4, 4, 'Calle Principal, Ciudad'),
(5, 5, 'Avenida Central, Pueblo'),
(6, 6, 'Calle Secundaria, Villa'),
(7, 7, 'Calle 789, Ciudad'),
(8, 8, 'Avenida ABC, Pueblo'),
(9, 9, 'Carrera 012, Villa'),
(10, 10, 'Calle 321, Ciudad'),
(11, 11, 'Avenida 123, Pueblo'),
(12, 12, 'Carrera 789, Villa'),
(13, 13, 'Calle 456, Ciudad'),
(14, 14, 'Avenida 567, Pueblo'),
(15, 15, 'Carrera 234, Villa'),
(16, 16, 'Calle 890, Ciudad'),
(17, 17, 'Avenida 901, Pueblo'),
(18, 18, 'Carrera 345, Villa'),
(19, 19, 'Calle 678, Ciudad'),
(20, 20, 'Avenida 234, Pueblo');

-- Insertar Zona

INSERT INTO Zona (zona_id, codigo_postal, descripcion, costo_entrega) 
VALUES 
(1, 'CP001', 'Zona Residencial', 5.00),
(2, 'CP002', 'Zona Comercial', 7.50),
(3, 'CP003', 'Zona Industrial', 10.00),
(4, 'CP004', 'Zona Turística', 8.00),
(5, 'CP005', 'Zona Rural', 6.00),
(6, 'CP006', 'Zona Urbana', 5.50),
(7, 'CP007', 'Zona Costera', 9.00),
(8, 'CP008', 'Zona de Oficinas', 7.00),
(9, 'CP009', 'Zona Cultural', 6.50),
(10, 'CP010', 'Zona de Restaurantes', 8.50),
(11, 'CP011', 'Zona de Entretenimiento', 9.50),
(12, 'CP012', 'Zona Residencial', 5.00),
(13, 'CP013', 'Zona Comercial', 7.50),
(14, 'CP014', 'Zona Industrial', 10.00),
(15, 'CP015', 'Zona Turística', 8.00),
(16, 'CP016', 'Zona Rural', 6.00),
(17, 'CP017', 'Zona Urbana', 5.50),
(18, 'CP018', 'Zona Costera', 9.00),
(19, 'CP019', 'Zona de Oficinas', 7.00),
(20, 'CP020', 'Zona Cultural', 6.50);

-- Inserta cliente zona
INSERT INTO Cliente_Zona (cliente_id, zona_id)
VALUES
(1, 1),  -- Juan Perez a Zona Residencial
(2, 2),  -- María López a Zona Comercial
(3, 3),  -- Carlos García a Zona Industrial
(4, 4),  -- Ana Martínez a Zona Turística
(5, 5),  -- Luisa Rodríguez a Zona Rural
(6, 6),  -- Pedro Gómez a Zona Urbana
(7, 7),  -- Sofía Díaz a Zona Costera
(8, 8),  -- Jorge Hernández a Zona de Oficinas
(9, 9),  -- Carolina Sánchez a Zona Cultural
(10, 10),  -- Daniel Vargas a Zona de Restaurantes
(11, 11),  -- Elena Castro a Zona de Entretenimiento
(12, 12),  -- Francisco Morales a Zona Residencial
(13, 13),  -- Alejandra Ortiz a Zona Comercial
(14, 14),  -- Gabriel Cruz a Zona Industrial
(15, 15),  -- Valentina Reyes a Zona Turística
(16, 16),  -- Andrea Núñez a Zona Rural
(17, 17),  -- Miguel Silva a Zona Urbana
(18, 18),  -- Lucía Ramos a Zona Costera
(19, 19),  -- Roberto Torres a Zona de Oficinas
(20, 20); -- Laura Gutiérrez a Zona Cultural

-- Insertar almacen
INSERT INTO Almacen (almacen_id, nombre, capacidad, ubicacion) 
VALUES 
(1, 'Almacen Central', 1000, 'Calle Principal 123, Ciudad'),
(2, 'Almacen Norte', 800, 'Avenida Central 456, Ciudad'),
(3, 'Almacen Sur', 1200, 'Carrera 789, Ciudad'),
(4, 'Almacen Este', 700, 'Calle Secundaria 234, Ciudad'),
(5, 'Almacen Oeste', 900, 'Avenida Periférica 567, Ciudad'),
(6, 'Almacen 24/7', 600, 'Calle Principal 890, Ciudad'),
(7, 'Almacen Express', 1500, 'Avenida Central 901, Ciudad'),
(8, 'Almacen Deluxe', 500, 'Carrera 234, Ciudad'),
(9, 'Almacen Mega', 2000, 'Calle Secundaria 345, Ciudad'),
(10, 'Almacen Super', 1800, 'Avenida Principal 678, Ciudad'),
(11, 'Almacen Total', 3000, 'Carrera 901, Ciudad'),
(12, 'Almacen Prime', 2500, 'Calle Central 123, Ciudad'),
(13, 'Almacen Plus', 400, 'Avenida Central 234, Ciudad'),
(14, 'Almacen Gold', 350, 'Carrera 567, Ciudad'),
(15, 'Almacen Silver', 600, 'Calle Secundaria 678, Ciudad'),
(16, 'Almacen Premium', 900, 'Avenida Periférica 789, Ciudad'),
(17, 'Almacen Fast', 1200, 'Carrera Principal 890, Ciudad'),
(18, 'Almacen Quick', 700, 'Calle Principal 901, Ciudad'),
(19, 'Almacen Rapid', 800, 'Avenida Central 012, Ciudad'),
(20, 'Almacen Speed', 1100, 'Carrera Secundaria 123, Ciudad');

-- Insertar carrito compras
INSERT INTO CarritoCompra (carrito_id, cliente_id, fecha_creacion, cant_productos, num_tarjeta, fecha_caducidad) 
VALUES 
(1, 1, '2024-04-04 10:00:00', 3, '1234567890123456', '2026-12-31'),
(2, 2, '2024-04-04 11:00:00', 2, '2345678901234567', '2025-12-31'),
(3, 3, '2024-04-04 12:00:00', 1, '3456789012345678', '2024-12-31'),
(4, 4, '2024-04-04 13:00:00', 4, '4567890123456789', '2027-12-31'),
(5, 5, '2024-04-04 14:00:00', 2, '5678901234567890', '2028-12-31'),
(6, 6, '2024-04-04 15:00:00', 3, '6789012345678901', '2029-12-31'),
(7, 7, '2024-04-04 16:00:00', 1, '7890123456789012', '2030-12-31'),
(8, 8, '2024-04-04 17:00:00', 2, '8901234567890123', '2023-12-31'),
(9, 9, '2024-04-04 18:00:00', 3, '9012345678901234', '2022-12-31'),
(10, 10, '2024-04-04 19:00:00', 1, '0123456789012345', '2021-12-31'),
(11, 11, '2024-04-04 20:00:00', 4, '1234567890123456', '2026-12-31'),
(12, 12, '2024-04-04 21:00:00', 2, '2345678901234567', '2025-12-31'),
(13, 13, '2024-04-04 22:00:00', 3, '3456789012345678', '2024-12-31'),
(14, 14, '2024-04-04 23:00:00', 1, '4567890123456789', '2027-12-31'),
(15, 15, '2024-04-04 00:00:00', 2, '5678901234567890', '2028-12-31'),
(16, 16, '2024-04-04 01:00:00', 3, '6789012345678901', '2029-12-31'),
(17, 17, '2024-04-04 02:00:00', 1, '7890123456789012', '2030-12-31'),
(18, 18, '2024-04-04 03:00:00', 2, '8901234567890123', '2023-12-31'),
(19, 19, '2024-04-04 04:00:00', 3, '9012345678901234', '2022-12-31'),
(20, 20, '2024-04-04 05:00:00', 1, '0123456789012345', '2021-12-31');

-- Insertar Productos
INSERT INTO Producto (producto_id, nombre, precio, volumen, peso, origen, marca, imagen, almacen_id, carrito_id) 
VALUES 
(1, 'Arroz', 2.99, 1.0, 1.0, 'Perú', 'MarcaFamosa', 'arroz.jpg', 1, 1),
(2, 'Frijoles', 1.99, 0.8, 0.5, 'México', 'BuenaCalidad', 'frijoles.jpg', 2, 2),
(3, 'Aceite de Oliva', 5.50, 0.5, 0.7, 'España', 'AceitunasDorado', 'aceite.jpg', 3, 3),
(4, 'Leche', 3.25, 1.0, 1.2, 'Estados Unidos', 'LecheFresca', 'leche.jpg', 4, 4),
(5, 'Huevos', 2.99, 0.5, 0.3, 'Granja Feliz', 'HuevoSano', 'huevos.jpg', 5, 5),
(6, 'Pan', 1.50, 0.3, 0.2, 'Panadería El Buen Sabor', 'PanArtesanal', 'pan.jpg', 6, 6),
(7, 'Pasta', 1.75, 0.5, 0.4, 'Italia', 'PastaPremium', 'pasta.jpg', 7, 7),
(8, 'Salsa de Tomate', 2.25, 0.4, 0.3, 'Italia', 'SaborReal', 'salsa.jpg', 8, 8),
(9, 'Cereal', 3.99, 0.8, 0.6, 'Estados Unidos', 'CerealNutritivo', 'cereal.jpg', 9, 9),
(10, 'Galletas', 1.99, 0.3, 0.2, 'Marca Popular', 'GalletasDelicia', 'galletas.jpg', 10, 10),
(11, 'Café', 4.50, 0.2, 0.1, 'Colombia', 'CaféAromático', 'cafe.jpg', 11, 11),
(12, 'Azúcar', 1.75, 0.5, 0.3, 'Brasil', 'AzúcarDulce', 'azucar.jpg', 12, 12),
(13, 'Sal', 0.99, 0.3, 0.2, 'México', 'SalMarina', 'sal.jpg', 13, 13),
(14, 'Condimentos', 2.25, 0.2, 0.1, 'Varios', 'SaborReal', 'condimentos.jpg', 14, 14),
(15, 'Refresco', 1.50, 1.0, 1.2, 'Varios', 'Refrescante', 'refresco.jpg', 15, 15),
(16, 'Agua embotellada', 0.99, 1.5, 1.2, 'Varios', 'AguaPura', 'agua.jpg', 16, 16),
(17, 'Frutas', 3.99, 2.0, 1.5, 'Varios', 'FrutasFrescas', 'frutas.jpg', 17, 17),
(18, 'Verduras', 2.50, 1.5, 1.0, 'Varios', 'VerdurasOrgánicas', 'verduras.jpg', 18, 18),
(19, 'Carne', 7.99, 2.0, 1.8, 'Varios', 'CarneFresca', 'carne.jpg', 19, 19),
(20, 'Pescado', 6.99, 1.5, 1.2, 'Varios', 'PescadoDelMar', 'pescado.jpg', 20, 20);



-- Insertar DisponiblidadProducto

INSERT INTO DisponibilidadProducto (almacen_id, producto_id, unidades_disponible) 
VALUES 
(1, 1, 100),
(2, 2, 80),
(3, 3, 120),
(4, 4, 70),
(5, 5, 90),
(6, 6, 60),
(7, 7, 150),
(8, 8, 50),
(9, 9, 130),
(10, 10, 110),
(11, 11, 40),
(12, 12, 70),
(13, 13, 30),
(14, 14, 80),
(15, 15, 120),
(16, 16, 150),
(17, 17, 100),
(18, 18, 90),
(19, 19, 110),
(20, 20, 80);


-- Insertar categorias
-- Insertar datos de categorías
INSERT INTO Categoria (categoria_id, nombre, descripcion) 
VALUES 
(1, 'Frutas y Verduras', 'Productos frescos de frutas y verduras'),
(2, 'Carnes', 'Productos cárnicos como carne de res, pollo y cerdo'),
(3, 'Lácteos', 'Productos lácteos como leche, queso y yogur'),
(4, 'Bebidas', 'Bebidas no alcohólicas como agua, refrescos y jugos'),
(5, 'Panadería', 'Productos horneados como pan y pasteles'),
(6, 'Cuidado Personal', 'Productos para el cuidado personal como champú y jabón'),
(7, 'Limpieza del Hogar', 'Productos de limpieza para el hogar como detergente y desinfectante'),
(8, 'Congelados', 'Alimentos congelados como verduras y pizzas'),
(9, 'Hogar y Cocina', 'Artículos para el hogar y la cocina como utensilios de cocina y muebles'),
(10, 'Snacks', 'Bocadillos y aperitivos como papas fritas y palomitas de maíz'),
(11, 'Dulces', 'Productos dulces como chocolate y caramelos'),
(12, 'Cereales y Granos', 'Cereales y granos como arroz, maíz y trigo'),
(13, 'Aceites y Condimentos', 'Aceites de cocina y condimentos como sal, pimienta y especias'),
(14, 'Productos Orgánicos', 'Productos orgánicos certificados'),
(15, 'Productos Sin Gluten', 'Productos sin gluten para personas con intolerancia al gluten'),
(16, 'Productos Veganos', 'Productos libres de ingredientes de origen animal'),
(17, 'Bebidas Alcohólicas', 'Bebidas alcohólicas como vino, cerveza y licores'),
(18, 'Productos de Higiene', 'Productos de higiene personal como papel higiénico y toallas sanitarias'),
(19, 'Artículos para Mascotas', 'Productos para mascotas como comida para perros y juguetes'),
(20, 'Artículos de Oficina', 'Suministros de oficina como papel, bolígrafos y carpetas');

-- Actualizar datos en la tabla Categoria para agregar la columna condicion
UPDATE Categoria
SET condicion = 
    CASE 
        WHEN nombre IN ('Frutas y Verduras', 'Carnes', 'Lácteos') THEN 'Frio'
        WHEN nombre IN ('Bebidas', 'Panadería', 'Cuidado Personal', 'Limpieza del Hogar', 'Hogar y Cocina', 'Snacks', 'Dulces', 'Cereales y Granos', 'Aceites y Condimentos', 'Productos Orgánicos', 'Productos Sin Gluten', 'Productos Veganos', 'Bebidas Alcohólicas', 'Productos de Higiene', 'Artículos para Mascotas', 'Artículos de Oficina') THEN 'Seco'
        WHEN nombre = 'Congelados' THEN 'Congelado'
    END
WHERE categoria_id BETWEEN 1 AND 20;



-- Insertar datos en la tabla Producto_Categoria
INSERT INTO Producto_Categoria (producto_id, categoria_id) 
VALUES 
(1, 1),  -- Producto 1 pertenece a la categoría 1 (Frutas y Verduras)
(2, 2),  -- Producto 2 pertenece a la categoría 2 (Carnes)
(3, 3),  -- Producto 3 pertenece a la categoría 3 (Lácteos)
(4, 4),  -- Producto 4 pertenece a la categoría 4 (Bebidas)
(5, 5),  -- Producto 5 pertenece a la categoría 5 (Panadería)
(6, 6),  -- Producto 6 pertenece a la categoría 6 (Cuidado Personal)
(7, 7),  -- Producto 7 pertenece a la categoría 7 (Limpieza del Hogar)
(8, 8),  -- Producto 8 pertenece a la categoría 8 (Congelados)
(9, 9),  -- Producto 9 pertenece a la categoría 9 (Hogar y Cocina)
(10, 10),-- Producto 10 pertenece a la categoría 10 (Snacks)
(11, 11),-- Producto 11 pertenece a la categoría 11 (Dulces)
(12, 12),-- Producto 12 pertenece a la categoría 12 (Cereales y Granos)
(13, 13),-- Producto 13 pertenece a la categoría 13 (Aceites y Condimentos)
(14, 14),-- Producto 14 pertenece a la categoría 14 (Productos Orgánicos)
(15, 15),-- Producto 15 pertenece a la categoría 15 (Productos Sin Gluten)
(16, 16),-- Producto 16 pertenece a la categoría 16 (Productos Veganos)
(17, 17),-- Producto 17 pertenece a la categoría 17 (Bebidas Alcohólicas)
(18, 18),-- Producto 18 pertenece a la categoría 18 (Productos de Higiene)
(19, 19),-- Producto 19 pertenece a la categoría 19 (Artículos para Mascotas)
(20, 20);-- Producto 20 pertenece a la categoría 20 (Artículos de Oficina)


-- Insertar SeccionAlmacen
INSERT INTO SeccionAlmacen (almacen_id, seccion) 
VALUES 
(1, 'Frutas y Verduras'),
(2, 'Carnicería'),
(3, 'Lácteos'),
(4, 'Bebidas'),
(5, 'Panadería'),
(6, 'Cuidado Personal'),
(7, 'Limpieza'),
(8, 'Congelados'),
(9, 'Hogar y Cocina'),
(10, 'Snacks'),
(11, 'Dulces'),
(12, 'Cereales y Granos'),
(13, 'Aceites y Condimentos'),
(14, 'Productos Orgánicos'),
(15, 'Productos Sin Gluten'),
(16, 'Productos Veganos'),
(17, 'Bebidas Alcohólicas'),
(18, 'Productos de Higiene'),
(19, 'Artículos para Mascotas'),
(20, 'Artículos de Oficina');


-- Agregar 20 registros a la tabla Compra
INSERT INTO Compra (compra_id, carrito_id, estado) 
VALUES 
(1, 1, TRUE),
(2, 2, TRUE),
(3, 3, TRUE),
(4, 4, TRUE),
(5, 5, TRUE),
(6, 6, TRUE),
(7, 7, TRUE),
(8, 8, TRUE),
(9, 9, TRUE),
(10, 10, TRUE),
(11, 11, TRUE),
(12, 12, TRUE),
(13, 13, TRUE),
(14, 14, TRUE),
(15, 15, TRUE),
(16, 16, TRUE),
(17, 17, TRUE),
(18, 18, TRUE),
(19, 19, TRUE),
(20, 20, TRUE);


-- Insertar domicilarios
INSERT INTO Domiciliario (domiciliario_id, nombre, placa) 
VALUES 
(1, 'Wojciech Nowak', 'ABC123'),
(2, 'Katarzyna Wiśniewska', 'DEF456'),
(3, 'Andrzej Kowalski', 'GHI789'),
(4, 'Anna Dąbrowska', 'JKL012'),
(5, 'Piotr Woźniak', 'MNO345'),
(6, 'Małgorzata Lewandowska', 'PQR678'),
(7, 'Krzysztof Wójcik', 'STU901'),
(8, 'Barbara Kamińska', 'VWX234'),
(9, 'Michał Kowalczyk', 'YZA567'),
(10, 'Elżbieta Zielińska', 'BCD890'),
(11, 'Rafał Szymański', 'EFG123'),
(12, 'Maria Kozłowska', 'HIJ456'),
(13, 'Tomasz Jankowski', 'KLM789'),
(14, 'Magdalena Wojciechowska', 'NOP012'),
(15, 'Marek Grabowski', 'QRS345'),
(16, 'Agnieszka Nowakowska', 'TUV678'),
(17, 'Grzegorz Pawlak', 'WXY901'),
(18, 'Anna Wiśniewska', 'ZAB234'),
(19, 'Marcin Kaczmarek', 'CDE567'),
(20, 'Katarzyna Grabowska', 'FGH890');


-- Agregar registros a la tabla Pedido
INSERT INTO Pedido (pedido_id, compra_id, direccion_entrega_id, fecha_emision, fecha_entrega, estado, importe_total, id_domiciliario) 
VALUES 
(1, 1, 1, '2024-04-01 10:00:00', '2024-04-02 14:00:00', 'Entregado', 50.00, 1),
(2, 2, 2, '2024-04-01 11:00:00', '2024-04-02 15:00:00', 'Entregado', 60.00, 2),
(3, 3, 3, '2024-04-01 12:00:00', '2024-04-02 16:00:00', 'En tránsito', 70.00, 3),
(4, 4, 4, '2024-04-01 13:00:00', '2024-04-02 17:00:00', 'En tránsito', 80.00, 4),
(5, 5, 5, '2024-04-01 14:00:00', '2024-04-02 18:00:00', 'Pendiente', 90.00, 5),
(6, 6, 6, '2024-04-01 15:00:00', '2024-04-02 19:00:00', 'Pendiente', 100.00, 6),
(7, 7, 7, '2024-04-01 16:00:00', '2024-04-02 20:00:00', 'Entregado', 110.00, 7),
(8, 8, 8, '2024-04-01 17:00:00', '2024-04-02 21:00:00', 'Entregado', 120.00, 8),
(9, 9, 9, '2024-04-01 18:00:00', '2024-04-02 22:00:00', 'En tránsito', 130.00, 9),
(10, 10, 10, '2024-04-01 19:00:00', '2024-04-02 23:00:00', 'En tránsito', 140.00, 10),
(11, 11, 11, '2024-04-01 20:00:00', '2024-04-03 10:00:00', 'Pendiente', 150.00, 11),
(12, 12, 12, '2024-04-01 21:00:00', '2024-04-03 11:00:00', 'Pendiente', 160.00, 12),
(13, 13, 13, '2024-04-01 22:00:00', '2024-04-03 12:00:00', 'Entregado', 170.00, 13),
(14, 14, 14, '2024-04-01 23:00:00', '2024-04-03 13:00:00', 'Entregado', 180.00, 14),
(15, 15, 15, '2024-04-02 00:00:00', '2024-04-03 14:00:00', 'En tránsito', 190.00, 15),
(16, 16, 16, '2024-04-02 01:00:00', '2024-04-03 15:00:00', 'En tránsito', 200.00, 16),
(17, 17, 17, '2024-04-02 02:00:00', '2024-04-03 16:00:00', 'Pendiente', 210.00, 17),
(18, 18, 18, '2024-04-02 03:00:00', '2024-04-03 17:00:00', 'Pendiente', 220.00, 18),
(19, 19, 19, '2024-04-02 04:00:00', '2024-04-03 18:00:00', 'Entregado', 230.00, 19),
(20, 20, 20, '2024-04-02 05:00:00', '2024-04-03 19:00:00', 'Entregado', 240.00, 20);


-- Agregar registros a la tabla Domiciliario_Zona
INSERT INTO Domiciliario_Zona (domiciliario_id, zona_id) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);
