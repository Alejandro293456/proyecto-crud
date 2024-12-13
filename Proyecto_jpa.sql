drop database proyecto_jpa;
CREATE DATABASE proyecto_jpa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE proyecto_jpa;

-- Tabla Usuario
CREATE TABLE Usuario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    rol VARCHAR(50) NOT NULL
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(255),
    direccion VARCHAR(255)
);

-- Tabla Mercadería
CREATE TABLE Mercaderia (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad_disponible INT NOT NULL,
    proveedor_id BIGINT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedor(id) ON DELETE SET NULL
);

-- Tabla Factura
CREATE TABLE Factura (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT NOT NULL,
    mercaderia_id BIGINT NOT NULL,
    fecha_emision TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cantidad INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (mercaderia_id) REFERENCES Mercaderia(id) ON DELETE CASCADE
);

-- Usuarios
INSERT INTO Usuario (nombre, email, contraseña, rol) VALUES
('Admin', 'admin@example.com', 'admin123', 'Admin'),
('Juan Perez', 'juan@example.com', 'password', 'Cliente');

-- Proveedores
INSERT INTO Proveedor (nombre, telefono, email, direccion) VALUES
('Proveedor 1', '123456789', 'proveedor1@example.com', 'Calle 123'),
('Proveedor 2', '987654321', 'proveedor2@example.com', 'Avenida 456');

-- Mercaderías
INSERT INTO Mercaderia (nombre, precio, cantidad_disponible, proveedor_id) VALUES
('Producto 1', 50.00, 100, 1),
('Producto 2', 75.50, 50, 2);

-- Facturas
INSERT INTO Factura (usuario_id, mercaderia_id, cantidad, total) VALUES
(2, 1, 2, 100.00),
(2, 2, 1, 75.50);

