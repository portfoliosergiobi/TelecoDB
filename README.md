# TelecoDB

-- Crear tabla de Clientes
CREATE TABLE Clientes (
    IDCliente INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Direccion VARCHAR(100),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100),
    FechaRegistro DATE
);


-- Crear tabla de Servicios
CREATE TABLE Servicios (
    IDServicio INT PRIMARY KEY,
    TipoServicio VARCHAR(50),
    Velocidad INT,
    FechaActivacion DATE,
    Estado VARCHAR(20)
);

-- Crear tabla de Equipos
CREATE TABLE Equipos (
    IDEquipo INT PRIMARY KEY,
    TipoEquipo VARCHAR(50),
    NumeroSerie VARCHAR(50),
    Estado VARCHAR(20),
    FechaAdquisicion DATE
);

-- Crear tabla de Facturas
CREATE TABLE Facturas (
    IDFactura INT PRIMARY KEY,
    IDCliente INT,
    FechaEmision DATE,
    MontoTotal DECIMAL(10, 2),
    EstadoPago VARCHAR(20),
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
);

-- Crear tabla de Empleados
CREATE TABLE Empleados (
    IDEmpleado INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Cargo VARCHAR(50),
    FechaContratacion DATE,
    NumeroTelefono VARCHAR(15),
    CorreoElectronico VARCHAR(100)
);

-- Crear tabla de Transacciones
CREATE TABLE Transacciones (
    IDTransaccion INT PRIMARY KEY,
    IDCliente INT,
    TipoTransaccion VARCHAR(50),
    Monto DECIMAL(10, 2),
    FechaTransaccion DATE,
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
);

-- Crear tabla de Zonas de Cobertura
CREATE TABLE ZonasCobertura (
    IDZona INT PRIMARY KEY,
    NombreZona VARCHAR(50),
    UbicacionGeografica VARCHAR(100),
    ServiciosDisponibles VARCHAR(100)
);
