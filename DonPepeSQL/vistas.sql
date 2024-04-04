-- Nota de entrega - Terminada
CREATE VIEW NotaDeEntrega_Pedido AS
SELECT P.pedido_id, P.compra_id, P.fecha_emision, P.estado, D.nombre AS domiciliario, DC.direccion AS direccion_entrega, C.nombre AS cliente, 
       CP.nombre AS producto, CP.precio, CC.cant_productos AS cantidad
FROM Pedido P
JOIN Domiciliario D ON P.id_domiciliario = D.domiciliario_id
JOIN DireccionCliente DC ON P.direccion_entrega_id = DC.id
JOIN Compra CO ON P.compra_id = CO.compra_id
JOIN CarritoCompra CC ON CO.carrito_id = CC.carrito_id
JOIN Cliente C ON CC.cliente_id = C.cliente_id
JOIN Producto CP ON CC.carrito_id = CP.carrito_id;

-- Domiciliarios disponibles en una zona - Terminada
CREATE VIEW DomiciliariosDisponibles AS
SELECT D.domiciliario_id, D.nombre, D.placa, DZ.zona_id
FROM Domiciliario D
JOIN Domiciliario_Zona DZ ON D.domiciliario_id = DZ.domiciliario_id;

-- Consulta carrito de compras - Terminada
CREATE VIEW CarritoDeCompras AS
SELECT CC.carrito_id, C.cliente_id, C.nombre AS cliente, P.producto_id, P.nombre AS producto, P.precio, CP.unidades_disponible AS cantidad
FROM CarritoCompra CC
JOIN Cliente C ON CC.cliente_id = C.cliente_id
JOIN Producto P ON CC.carrito_id = P.carrito_id
JOIN DisponibilidadProducto CP ON P.producto_id = CP.producto_id;


-- Historial de compras de un cliente - Terminada
CREATE VIEW HistorialComprasCliente AS
SELECT CC.carrito_id, C.cliente_id, C.nombre AS cliente, P.producto_id, P.nombre AS producto, P.precio, CP.unidades_disponible AS cantidad, CO.fecha_compra
FROM CarritoCompra CC
JOIN Cliente C ON CC.cliente_id = C.cliente_id
JOIN Producto P ON CC.carrito_id = P.carrito_id
JOIN DisponibilidadProducto CP ON P.producto_id = CP.producto_id
JOIN Compra CO ON CC.carrito_id = CO.carrito_id
WHERE CO.estado = true;


-- Pedidos sin despachar - Terminado
CREATE VIEW PedidosSinDespachar AS
SELECT P.pedido_id, P.compra_id, P.fecha_emision, P.estado, D.nombre AS domiciliario, DC.direccion AS direccion_entrega, C.nombre AS cliente, CP.nombre AS producto, CP.precio, CC.cant_productos AS cantidad
FROM Pedido P
JOIN Domiciliario D ON P.id_domiciliario = D.domiciliario_id
JOIN DireccionCliente DC ON P.direccion_entrega_id = DC.id
JOIN Compra CO ON P.compra_id = CO.compra_id
JOIN CarritoCompra CC ON CO.carrito_id = CC.carrito_id
JOIN Cliente C ON CC.cliente_id = C.cliente_id
JOIN Producto CP ON CC.carrito_id = CP.carrito_id
WHERE P.estado = 'Pendiente';


-- Productos con las categorías a las que corresponden - Terminado
CREATE VIEW ProductosConCategorias AS
SELECT P.producto_id, P.nombre AS producto, C.nombre AS categoria
FROM Producto P
JOIN Producto_Categoria PC ON P.producto_id = PC.producto_id
JOIN Categoria C ON PC.categoria_id = C.categoria_id;


-- Nota de entrega - Pedido
SELECT * FROM NotaDeEntrega_Pedido;

-- Domiciliarios disponibles en una zona
SELECT * FROM DomiciliariosDisponibles;

-- Consulta carrito de compras
SELECT * FROM CarritoDeCompras;

-- Historial de compras de un cliente
SELECT * FROM HistorialComprasCliente;

-- Pedidos sin despachar
SELECT * FROM PedidosSinDespachar;

-- Productos con las categorías a las que corresponden
SELECT * FROM ProductosConCategorias;

