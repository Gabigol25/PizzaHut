
USE PizzaHutDB;
GO

-- 1. Validar el monto total del pedido
ALTER TABLE Pedido
ADD CONSTRAINT CK_Pedido_MontoTotal
CHECK (MontoTotal >= 0);

-- 2. Validar el tipo de consumo
ALTER TABLE Pedido
ADD CONSTRAINT CK_Pedido_TipoConsumo
CHECK (TipoConsumo IN ('Local', 'Para llevar', 'Delivery'));

-- 3. Validar los estados del pedido
ALTER TABLE HistorialEstadoPedido
ADD CONSTRAINT CK_Historial_Estado
CHECK (Estado IN (
    'Registrado',
    'Confirmado',
    'En Preparación',
    'En Horno',
    'Empaquetado',
    'En Tránsito',
    'Entregado',
    'Cancelado'
));

-- 4. Validar el precio base de los productos
ALTER TABLE Producto
ADD CONSTRAINT CK_Producto_PrecioBase
CHECK (PrecioBase >= 0);

-- 5. Validar los valores del inventario
ALTER TABLE Insumo
ADD CONSTRAINT CK_Insumo_StockActual
CHECK (StockActual >= 0);

ALTER TABLE Insumo
ADD CONSTRAINT CK_Insumo_StockMinimo
CHECK (StockMinimo >= 0);

-- 6. Validar el monto del pago
ALTER TABLE Pago
ADD CONSTRAINT CK_Pago_Monto
CHECK (Monto >= 0);

-- 7. Validar la cantidad de productos por pedido
ALTER TABLE Contiene
ADD CONSTRAINT CK_Contiene_Cantidad
CHECK (Cantidad > 0);

-- 8. Validar el precio unitario
ALTER TABLE Contiene
ADD CONSTRAINT CK_Contiene_PrecioUnitario
CHECK (PrecioUnitario >= 0);

-- 9. Validar la cantidad de insumos requeridos
ALTER TABLE CompuestoPor
ADD CONSTRAINT CK_CompuestoPor_CantidadRequerida
CHECK (CantidadRequerida > 0);
GO
