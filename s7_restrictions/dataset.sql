CREATE ROLE usr_1 LOGIN PASSWORD 'pass_1';
CREATE ROLE usr_2 LOGIN PASSWORD 'pass_2';

CREATE SCHEMA SistemaSolar;

-- sólo lectura
GRANT USAGE ON SCHEMA SistemaSolar TO usr_1;
-- todos los privilegios
GRANT ALL PRIVILEGES ON SCHEMA SistemaSolar TO usr_2;

-- Ejemplo de uso una vez creado el usr:

-- ┌[juandiegocastropadilla☮MacBook-Pro-de-Juan.local]-(~)
-- └> psql -U usr_1 -d Planetas
-- Password for user usr_1: pass_1
--
--                                List of databases
--      Name      |  Owner   | Encoding | Collate | Ctype |   Access privileges
-- ---------------+----------+----------+---------+-------+-----------------------
--  Planetas      | postgres | UTF8     | C       | C     |
--
-- Planetas=> set search_path to Planetas;

SET search_path TO SistemaSolar;

-- Crear tabla
CREATE TABLE Aterrizaje(
    nave VARCHAR(255),
    planeta  VARCHAR(255),
    país  VARCHAR(255),
    año  SMALLINT
);

-- GRANT INSERT, UPDATE, DELETE ON SistemaSolar.Aterrizaje TO usr_2;

-- Insertar valores
INSERT INTO Aterrizaje (nave, planeta, país, año) VALUES
('Messenger'    , 'Mercurio', 'EEUU', 2015),
('Venera 3'     , 'Venus'   , 'URRS', 1966),
('Pioneer'      , 'Venus'   , 'EEUU', 1978),
('Mars 2 lander', 'Marte'   , 'URRS', 1971);

CREATE TABLE AterrizajeEEUU(
    nave VARCHAR(255),
    planeta  VARCHAR(255),
    país  VARCHAR(255),
    año  SMALLINT
);

INSERT INTO AterrizajeEEUU (
    SELECT * FROM Aterrizaje WHERE país='EEUU'
);

-- Editar tuplas
UPDATE Aterrizaje SET año=1971, país='URRS' WHERE nave='Mars 2 lander';

-- Borrar tuplas
DELETE FROM AterrizajeEEUU WHERE año IS NULL;

-- Borrar columnas
ALTER TABLE AterrizajeEEUU DROP COLUMN país;

-- Agregar columnas
ALTER TABLE AterrizajeEEUU ADD COLUMN despegue DATE;

-- Editar el tipo de dato de una columna
ALTER TABLE AterrizajeEEUU ALTER COLUMN despegue TYPE VARCHAR(255);

------------------------------ RESTRICCIONES ------------------------------
CREATE TABLE Cuenta(
    numero    BIGINT PRIMARY KEY,
    rut       VARCHAR(12)      NOT NULL,
    tipo      VARCHAR(12)      NOT NULL,
    saldo_clp BIGINT           NOT NULL DEFAULT 0,
    saldo_usd DOUBLE PRECISION NOT NULL DEFAULT 0
);

INSERT INTO Cuenta(numero, rut, tipo, saldo_clp, saldo_usd) VALUES
(7873698669, '32.000.273-K', 'Estacional', 225000, 344.94);

-- Valores por defecto
INSERT INTO Cuenta(numero, rut, tipo) VALUES
(7273697679, '28.923.123-7', 'Estacional');

-- Unique
CREATE TABLE Cuenta(
    numero    BIGINT PRIMARY KEY,
    rut       VARCHAR(12)      NOT NULL,
    tipo      VARCHAR(12)      NOT NULL,
    saldo_clp BIGINT           NOT NULL DEFAULT 0,
    saldo_usd DOUBLE PRECISION NOT NULL DEFAULT 0,
    -- No pueden existir dos rut con el mismo numero y tipo
    UNIQUE (rut, tipo)
);

-- Nombrar restricciones
CREATE TABLE Cuenta(
    numero    BIGINT,
    rut       VARCHAR(12)      NOT NULL,
    tipo      VARCHAR(12)      NOT NULL,
    saldo_clp BIGINT           NOT NULL DEFAULT 0,
    saldo_usd DOUBLE PRECISION NOT NULL DEFAULT 0,
    -- No pueden existir dos rut con el mismo numero y tipo
    CONSTRAINT Cuenta_uni_rt UNIQUE (rut, tipo),
    CONSTRAINT Cuenta_pk PRIMARY KEY (numero)
);

-- Borrar restricciones
ALTER TABLE Cuenta DROP CONSTRAINT Cuenta_uni_rt;

-- Llaves Foraneas
CREATE TABLE Ingreso(
    -- El atributo cuenta hace referencia al atributo numero de la tabla Cuenta
    cuenta BIGINT REFERENCES Cuenta(numero),
    comentario VARCHAR(255),
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    monto BIGINT NOT NULL,
    saldo INT NOT NULL,
    id VARCHAR(12) PRIMARY KEY
);

-- Llaves Compuestas
CREATE TABLE Divisa(
    d1 VARCHAR(3),
    d2 VARCHAR(3),
    valor DOUBLE PRECISION,
    PRIMARY KEY (d1, d2)
);

INSERT INTO Divisa(d1, d2, valor) VALUES
('CLP', 'USD', 0.0001533),
('USD', 'CLP', 652.27500000),
('CLP', 'EUR', 0.0001498),
('EUR', 'CLP', 735.97000000);

CREATE TABLE Cambio(
    id VARCHAR(12),
    venta VARCHAR(3),
    compra VARCHAR(3),
    monto DOUBLE PRECISION,
    FOREIGN KEY (venta, compra) REFERENCES Divisa (d1, d2),
    -- Llaves Compuestas
    PRIMARY KEY (id, venta, compra)
);

-- Restricciones sobre varias columnas (CHECK)
CREATE TABLE Cuenta(
    numero    BIGINT PRIMARY KEY ,
    rut       VARCHAR(12)      NOT NULL,
    tipo      VARCHAR(12)      NOT NULL,
    saldo_clp BIGINT           NOT NULL,
    saldo_usd DOUBLE PRECISION NOT NULL,

    CHECK (
        -- Verifica si los saldos coinciden con el tipo de cambio
        round((saldo_clp/saldo_usd)::NUMERIC - (SELECT valor FROM Divisa WHERE d1='USD' AND d2='CLP'), 1) = 0
    )
);

-- Crear dominios VARCHAR
CREATE DOMAIN tr_str VARCHAR(12)
CHECK (VALUE LIKE 'TRC%');

CREATE TABLE Ingreso(
    -- ...,
    id tr_str PRIMARY KEY
);


