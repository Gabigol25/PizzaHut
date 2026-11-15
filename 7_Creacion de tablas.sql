
--Punto 7--

CREATE DATABASE PizzaHutDB;
GO

USE PizzaHutDB;
GO

-- TABLA 1: CANAL DE ATENCION
CREATE TABLE CanalAtencion (
    IdCanal INT PRIMARY KEY,
    Descripcion VARCHAR(100)
);

-- TABLA 2: SUCURSAL
CREATE TABLE Sucursal (
    IdSucursal INT PRIMARY KEY,
    NombreSucursal VARCHAR(100),
    Telefono VARCHAR(20),
    Direccion VARCHAR(200)
);

-- TABLA 3: CLIENTE
CREATE TABLE Cliente (
    IdCliente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(20),
    Direccion VARCHAR(200),
    Email VARCHAR(100)
);

-- TABLA 4: PRODUCTO
CREATE TABLE Producto (
    IdProducto INT PRIMARY KEY,
    NombreProducto VARCHAR(100),
    PrecioBase DECIMAL(10,2),
    DetalleProducto VARCHAR(200)
);

-- TABLA 5: INSUMO
CREATE TABLE Insumo (
    IdInsumo INT PRIMARY KEY,
    NombreInsumo VARCHAR(100),
    StockActual DECIMAL(10,2),
    UnidadMedida VARCHAR(30),
    StockMinimo DECIMAL(10,2)
);

-- TABLA 6: EMPLEADO
CREATE TABLE Empleado (
    IdEmpleado INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Rol VARCHAR(50),
    Dni VARCHAR(8)
);

-- TABLA 7: PEDIDO
CREATE TABLE Pedido (
    IdPedido INT PRIMARY KEY,
    IdCliente INT,
    IdSucursal INT,
    IdCanal INT,
    IdEmpleado INT,
    MontoTotal DECIMAL(10,2),
    TipoConsumo VARCHAR(30),
    FechaHora DATETIME,

    FOREIGN KEY (IdCliente)
        REFERENCES Cliente(IdCliente),

    FOREIGN KEY (IdSucursal)
        REFERENCES Sucursal(IdSucursal),

    FOREIGN KEY (IdCanal)
        REFERENCES CanalAtencion(IdCanal),

    FOREIGN KEY (IdEmpleado)
        REFERENCES Empleado(IdEmpleado)
);

-- TABLA 8: HISTORIAL DE ESTADO DEL PEDIDO
CREATE TABLE HistorialEstadoPedido (
    IdHistorial INT PRIMARY KEY,
    FechaHoraCambio DATETIME,
    Estado VARCHAR(50),
    IdPedido INT,

    FOREIGN KEY (IdPedido)
        REFERENCES Pedido(IdPedido)
);

-- TABLA 9: PAGO
CREATE TABLE Pago (
    IdPago INT PRIMARY KEY,
    MetodoPago VARCHAR(50),
    FechaHoraPago DATETIME,
    Monto DECIMAL(10,2),
    IdPedido INT,

    FOREIGN KEY (IdPedido)
        REFERENCES Pedido(IdPedido)
);

-- TABLA 10: COMPUESTO POR
CREATE TABLE CompuestoPor (
    IdProducto INT,
    IdInsumo INT,
    CantidadRequerida DECIMAL(10,2),

    PRIMARY KEY (IdProducto, IdInsumo),

    FOREIGN KEY (IdProducto)
        REFERENCES Producto(IdProducto),

    FOREIGN KEY (IdInsumo)
        REFERENCES Insumo(IdInsumo)
);

-- TABLA 11: CONTIENE
CREATE TABLE Contiene (
    IdProducto INT,
    IdPedido INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),

    PRIMARY KEY (IdProducto, IdPedido),

    FOREIGN KEY (IdProducto)
        REFERENCES Producto(IdProducto),

    FOREIGN KEY (IdPedido)
        REFERENCES Pedido(IdPedido)
);
GO
