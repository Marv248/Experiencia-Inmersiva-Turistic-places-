CREATE DATABASE IF NOT EXISTS turismo_db;
USE turismo_db;

-- 1. Tabla de Usuarios (Dueños de negocios)
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, -- Recomendado para guardar hashes
    ciudad VARCHAR(50)
);

-- 2. Tabla de Lugares Turísticos
CREATE TABLE lugar_turistico (
    id_lugar INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    ciudad VARCHAR(50),
    costo_ingreso DECIMAL(10, 2) DEFAULT 0.00
);

-- 3. Tabla de Negocios (Relacionada con Usuario y Lugar)
CREATE TABLE negocio (
    id_negocio INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_lugar INT, -- El lugar turístico más cercano
    nombre_negocio VARCHAR(100) NOT NULL,
    categoria ENUM('Restaurante', 'Souvenirs', 'Tours', 'Hospedaje', 'Otro'),
    precio_promedio DECIMAL(10, 2),
    descripcion TEXT,
    -- Relaciones (Llaves Foráneas)
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_lugar FOREIGN KEY (id_lugar) REFERENCES lugar_turistico(id_lugar) ON DELETE SET NULL
);