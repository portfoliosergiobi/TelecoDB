USE TelecoDB

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
    Estado VARCHAR(20),
	IDCliente INT, -- Clave foránea
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
);

-- Crear tabla de Equipos
CREATE TABLE Equipos (
    IDEquipo INT PRIMARY KEY,
    TipoEquipo VARCHAR(50),
    NumeroSerie VARCHAR(50),
    Estado VARCHAR(20),
    FechaAdquisicion DATE,
	IDServicio INT, -- Clave foránea
    FOREIGN KEY (IDServicio) REFERENCES Servicios(IDServicio)
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
	IDEmpleado INT,
    TipoTransaccion VARCHAR(50),
    Monto DECIMAL(10, 2),
    FechaTransaccion DATE,
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente),
	FOREIGN KEY (IDEmpleado) REFERENCES Empleados(IDEmpleado)
);

-- Crear tabla de Zonas de Cobertura
CREATE TABLE ZonasCobertura (
    IDZona INT PRIMARY KEY,
    NombreZona VARCHAR(50),
    UbicacionGeografica VARCHAR(100),
    ServiciosDisponibles VARCHAR(100),
	IDServicio INT, -- Clave foránea
    FOREIGN KEY (IDServicio) REFERENCES Servicios(IDServicio)
);

-- Insertar datos en la tabla Equipos
INSERT INTO Equipos (IDEquipo, TipoEquipo, NumeroSerie, Estado, FechaAdquisicion, IDServicio)
VALUES
    (201, 'Router', 'ABC123', 'En uso', '2022-05-20', 101),
    (202, 'Modem', 'XYZ789', 'Almacenado', '2022-06-10', 102);

-- Insertar datos en la tabla Facturas
INSERT INTO Facturas (IDFactura, IDCliente, FechaEmision, MontoTotal, EstadoPago)
VALUES
    (301, 1, '2022-07-01', 75.99, 'Pagada'),
    (302, 2, '2022-07-05', 120.50, 'Pendiente');

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (IDEmpleado, Nombre, Cargo, FechaContratacion, NumeroTelefono, CorreoElectronico)
VALUES
    (501, 'Ana Martínez', 'Técnico de Redes', '2020-03-15', '555-9876', 'ana.martinez@example.com'),
    (502, 'Carlos López', 'Asistente de Soporte', '2021-05-20', '555-1234', 'carlos.lopez@example.com'),
	(601, 'Laura Rodríguez', 'Analista de Ventas', '2021-08-10', '555-7890', 'laura.rodriguez@example.com'),
    (602, 'Pedro Sánchez', 'Técnico de Soporte', '2021-09-05', '555-4321', 'pedro.sanchez@example.com');

-- Insertar datos en las tablas de Clientes
INSERT INTO Clientes (IDCliente, Nombre, Apellido, Direccion, Telefono, CorreoElectronico, FechaRegistro)
VALUES
    (1, 'Juan', 'Pérez', 'Calle Principal 123', '555-1234', 'juan.perez@example.com', '2022-01-01'),
    (2, 'María', 'Gómez', 'Avenida Secundaria 456', '555-5678', 'maria.gomez@example.com', '2022-02-01');

-- Insertar datos en la tabla Transacciones
INSERT INTO Transacciones (IDTransaccion, IDCliente, IDEmpleado, TipoTransaccion, Monto, FechaTransaccion)
VALUES
    (701, 1, 601, 'Venta', 120.50, '2022-03-15'),
    (702, 2, 602, 'Pago', 50.00, '2022-04-10');

-- Insertar datos en la tabla Servicios
INSERT INTO Servicios (IDServicio, TipoServicio, Velocidad, FechaActivacion, Estado, IDCliente)
VALUES
    (801, 'Internet Residencial', 50, '2022-03-15', 'Activo', 1),
    (802, 'Fibra Óptica Empresarial', 100, '2022-04-10', 'Inactivo', 2);

-- Insertar datos en la tabla ZonasCobertura
INSERT INTO ZonasCobertura (IDZona, NombreZona, UbicacionGeografica, ServiciosDisponibles, IDServicio)
VALUES
    (901, 'Zona A', 'Coordenadas XYZ', 'Internet Residencial, TV por Cable', 801),
    (902, 'Zona B', 'Coordenadas ABC', 'Fibra Óptica Empresarial', 802);