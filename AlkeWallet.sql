-- =========================================================================
-- PROYECTO: ALKE WALLET - SCRIPT DDL y DML COMPLETO
-- =========================================================================



-- 1. Crear la Base de Datos y seleccionarla
CREATE DATABASE IF NOT EXISTS AlkeWallet
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE AlkeWallet;

-- 2. Creación de Entidades (Tablas)
-- Tabla Moneda (Creada primero para que la tabla transaccion pueda referenciarla)
CREATE TABLE moneda (
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    currency_name VARCHAR(50) NOT NULL,
    currency_symbol VARCHAR(10) NOT NULL
);

-- Tabla Usuario
CREATE TABLE usuario (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    saldo DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Transacción (Relacionada con Usuario y Moneda)
CREATE TABLE transaccion (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_user_id INT NOT NULL,
    receiver_user_id INT NOT NULL,
    importe DECIMAL(12, 2) NOT NULL,
    currency_id INT NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender FOREIGN KEY (sender_user_id) REFERENCES usuario(user_id),
    CONSTRAINT fk_receiver FOREIGN KEY (receiver_user_id) REFERENCES usuario(user_id),
    CONSTRAINT fk_currency FOREIGN KEY (currency_id) REFERENCES moneda(currency_id)
);

-- Índices compuestos para optimizar búsquedas frecuentes
CREATE INDEX idx_transaccion_usuarios ON transaccion(sender_user_id, receiver_user_id);


-- =========================================================================
-- 3. INSERCIÓN DE DATOS DE PRUEBA (DML)
-- =========================================================================

-- Insertar Monedas
INSERT INTO moneda (currency_name, currency_symbol) VALUES 
('Peso Chileno', '$'),
('Dólar Estadounidense', 'US$'),
('Euro', '€');

-- Insertar Usuarios 
INSERT INTO usuario (nombre, correo_electronico, contrasena, saldo) VALUES 
('Evelyn Sepúlveda', 'evelynsepulveda@email.com', 'pass1234', 500000.00),
('Betty Varela', 'bettyvarela@email.com', 'pass5678', 250000.00),
('Camila Sepúlveda', 'Camila.svarela@email.com', 'pass9012', 1200000.00),
('Juan Sepúlveda Maureira', 'juan.sepulveda@email.com', 'pass3456', 350000.00),
('Amy Varela Contreras', 'amy.varela@email.com', 'pass7890', 450000.00),
('Victoria Paz Jara', 'victoria.paz@email.com', 'pass1357', 600000.00);

-- Insertar Transacciones (Incluyendo transacciones para los nuevos usuarios)
INSERT INTO transaccion (sender_user_id, receiver_user_id, importe, currency_id) VALUES 
(1, 2, 25000.00, 1),
(2, 3, 50000.00, 1),
(3, 1, 100000.00, 1),
(4, 5, 15000.00, 1),
(5, 6, 30000.00, 1);


-- =========================================================================
-- 4. CONSULTAS REQUERIDAS (SELECT, JOIN, VISTAS)
-- =========================================================================

-- A. Consulta para obtener el nombre de la moneda elegida por un usuario específico (ej: user_id = 1)ACÁ
SELECT DISTINCT u.nombre AS usuario, m.currency_name AS moneda_utilizada
FROM usuario u
JOIN transaccion t ON u.user_id = t.receiver_user_id
JOIN moneda m ON t.currency_id = m.currency_id
WHERE u.user_id = 1;

-- B. Consulta para obtener todas las transacciones registradas
SELECT * FROM transaccion;


-- C. Consulta para obtener todas las transacciones realizadas por un usuario específico (ej: que envía, user_id = 2)
SELECT * FROM transaccion 
WHERE sender_user_id = 2 OR receiver_user_id = 2;

-- D. Detalle completo de las transacciones: muestra el nombre del remitente, 
-- el nombre del destinatario, el importe y el nombre/símbolo de la moneda utilizada.
SELECT 
    t.transaction_id AS id_transaccion,
    u_sender.nombre AS remitente,
    u_receiver.nombre AS destinatario,
    t.importe,
    m.currency_name AS moneda,
    m.currency_symbol AS simbolo,
    t.transaction_date AS fecha
FROM transaccion t
JOIN usuario u_sender ON t.sender_user_id = u_sender.user_id
JOIN usuario u_receiver ON t.receiver_user_id = u_receiver.user_id
JOIN moneda m ON t.currency_id = m.currency_id;


-- E. Listado de usuarios que han realizado transacciones (tanto enviando como recibiendo)
-- utilizando LEFT JOIN para asegurar que aparezcan todos los usuarios y su moneda favorita/más usada,
-- combinando usuario, transacciones y monedas.

SELECT DISTINCT
    u.user_id,
    u.nombre,
    u.correo_electronico,
    u.saldo,
    m.currency_name AS ultima_moneda_operada
FROM usuario u
LEFT JOIN transaccion t ON u.user_id = t.sender_user_id OR u.user_id = t.receiver_user_id
LEFT JOIN moneda m ON t.currency_id = m.currency_id;


-- =========================================================================
-- 5. MANIPULACIÓN DE DATOS (DML: UPDATE y DELETE)
-- =========================================================================

-- A. Sentencia DML para modificar el correo electrónico de un usuario específico
UPDATE usuario 
SET correo_electronico = 'camilasepulveda@email.com' 
WHERE user_id = 3;

-- B. Sentencia para eliminar los datos de una transacción específica (fila completa)
DELETE FROM transaccion 
WHERE transaction_id = 3;

SELECT * FROM transaccion;

-- =========================================================================
-- 6. TAREAS PLUS / AVANZADAS REQUERIDAS EN EL PROYECTO
-- =========================================================================

-- A. Transacción controlada (ACID: START TRANSACTION, COMMIT / ROLLBACK)
START TRANSACTION;
-- Simula una transferencia restando y sumando saldos y registrando la transacción
UPDATE usuario SET saldo = saldo - 10000 WHERE user_id = 1;
UPDATE usuario SET saldo = saldo + 10000 WHERE user_id = 2;
INSERT INTO transaccion (sender_user_id, receiver_user_id, importe, currency_id) VALUES (1, 2, 10000.00, 1);
COMMIT; -- Si todo sale bien, se confirman los cambios permanentemente.

SELECT * FROM transaccion;

-- B. Creación de una Vista que muestre el top de usuarios con mayor saldo
CREATE VIEW vw_top_usuarios_saldo AS
SELECT user_id, nombre, correo_electronico, saldo
FROM usuario
ORDER BY saldo DESC;

-- Consultar la vista creada:
SELECT * FROM vw_top_usuarios_saldo;