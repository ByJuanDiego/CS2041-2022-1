CREATE TABLE planeta(
    nombre varchar(20) primary key,
    dist FLOAT,
    radio FLOAT,
    grav FLOAT,
    días FLOAT,
    años FLOAT,
    temp INT,
    anillo BOOLEAN
);

CREATE TABLE satélite(
    nombre varchar(20) primary key,
    planeta varchar(20),
    descubridor varchar(50),
    año INT
);

CREATE TABLE aterrizaje(
      nave varchar(25) primary key,
      planeta varchar(25),
      país varchar(25),
      año INT
);

INSERT INTO planeta("nombre", "dist", "radio", "grav", "días", "años", "temp", "anillo") VALUES
('Mercurio', 0.39, 0.38, 2.8, 58.646, 0.241, 440, false),
('Venus', 0.72, 0.95, 8.9, -243.019, 0.615, 730, false),
('Tierra', 1.00, 1.00, 9.8, 0.997, 1.000, 288, false),
('Marte', 1.52, 0.53, 3.7, 1.026, 1.880, 186, false),
('Júpiter', 5.20, 10.97, 22.9, 0.414, 11.862, 152, true),
('Saturno', 9.54, 9.14, 9.1, 0.444, 29.447, 134, true),
('Urano', 19.19, 3.98, 7.8, -0.719, 84.017, 76, true),
('Neptuno', 30.07, 3.86, 11.0, 0.671, 164.791, 53, true);

INSERT INTO satélite("nombre", "planeta", "descubridor", "año") VALUES
('Luna', 'Tierra', NULL, NULL),
('Ganímedes', 'Júpiter', 'Galileo Galilei', 1610),
('Calisto', 'Júpiter', 'Galileo Galilei', 1610),
('Europa', 'Júpiter', 'Galileo Galilei', 1610),
('Ío', 'Júpiter', 'Galileo Galilei', 1610),
('Titán', 'Saturno', 'Christiaan Huygens',1655),
('Tritón', 'Neptuno', 'William Lassell', 1846);

INSERT INTO aterrizaje("nave", "planeta", "país", "año") VALUES ('Messenger', 'Mercurio', 'EEUU', 2015),
('Venera 3', 'Venus', 'URRS', 1966),
('Pioneer', 'Venus', 'EEUU', 1978),
('Mars 2 lander', 'Marte', 'URRS', 1971),
('Viking 1', 'Marte', 'EEUU', 1976),
('Beagle 2', 'Marte', 'ESA', 2003),
('Galileo', 'Júpiter', 'EEUU', 2003);


/*---------- Mostrar atributos que cumplan una condicion ----------*/
SELECT nombre, dist
FROM Planeta
WHERE (
    (radio > 1) AND (anillo = false)
);

/*---------------- Mostrar atributos no repetidos -----------------*/
SELECT DISTINCT nombre
FROM Planeta;

/*------------------ Mostrar atributos ordenados ------------------*/
SELECT DISTINCT planeta
FROM Aterrizaje
ORDER BY (planeta) DESC;

/*--------------------- Reunir tablas (JOIN) ----------------------*/
SELECT nombre, año, nave
FROM Planeta, Aterrizaje
WHERE (
    (nombre = Aterrizaje.planeta) AND (dist > 1.0) AND (año > 2000)
);

/*------------------- Renombrar atributos (AS) --------------------*/
SELECT S.planeta as splaneta
FROM Satélite S, Aterrizaje A
WHERE (
    S.planeta = A.planeta
);

/*------------------------ Alias de tablas ------------------------*/
SELECT s1.nombre AS nombre1, s2.nombre AS nombre2
FROM Satélite s1, satélite s2
WHERE (
    (s1.año = s2.año) AND (s1.nombre < s2.nombre)
)
ORDER BY nombre1 ASC, nombre2 ASC;

/*-------------------- Unión (Distinta): UNION --------------------*/
SELECT nombre
FROM Planeta
UNION
SELECT nombre
FROM Satélite;

/*------------------ Unión con Alias: UNION + AS ------------------*/
SELECT nombre AS planeta
FROM Planeta
UNION
SELECT planeta
FROM Satélite;

/*------------------ Unión bruta: UNION ALL ------------------*/
SELECT nombre AS planeta
FROM Planeta
UNION ALL (
    SELECT planeta
    FROM Satélite
) ORDER BY planeta DESC;

/*-------------------- Diferencia: EXCEPT --------------------*/
SELECT nombre as planeta
FROM Planeta
WHERE (
    dist > 1.00
)
EXCEPT (
    SELECT planeta
    FROM Satélite
);

/*----------------- Intersección: INTERSECT ------------------*/
SELECT nombre AS planeta
FROM Planeta
WHERE (
    dist > 1.00
)
INTERSECT (
    SELECT planeta
    FROM Satélite
);

/*------------------ Patrones simples: LIKE ------------------*/
SELECT nombre
FROM Planeta
WHERE (
    nombre LIKE 'M%'
);

/*---------------- Patrones simples: NOT LIKE ----------------*/
SELECT nombre
FROM Planeta
WHERE (
    (nombre NOT LIKE '%no') AND (dist > 1.00)
);

/*---------------------- Abreviatura: IN ---------------------*/
SELECT planeta
FROM Aterrizaje
WHERE (
    país IN ('EEUU', 'ESA')
);

/*---------------------- Abreviatura: BETWEEN ---------------------*/
SELECT planeta
FROM Aterrizaje
WHERE (
    año BETWEEN 1971 AND 1978
);


/*

 MÁS TIPOS DE JOIN

*/


/*---------------------- Cruz: CROSS JOIN ---------------------*/
SELECT nombre, S.planeta, nave
FROM (
    Satélite S CROSS JOIN Aterrizaje a
);

SELECT nombre, S.planeta, nave
FROM Satélite S, Aterrizaje a;

/*---------------------- Cruzar tablas: JOIN ---------------------*/
SELECT nombre, año, nave
FROM Planeta, aterrizaje
WHERE (
    (nombre = planeta) AND (dist > 1.00) AND (año >= 2000)
);

/*------------------- Cruzar tablas: EQUI JOIN -------------------*/
SELECT a.nave, nombre, dist, a.año
FROM Planeta JOIN Aterrizaje a
ON (
    nombre = a.planeta
);

/*------------------ Cruzar tablas: JOIN USING -------------------*/
-- Se puede usar JOIN USING cuando todos los atributos del JOIN tengan el mismo nombre
SELECT nombre, planeta
FROM (
    Satélite JOIN Aterrizaje USING (planeta)
);

/*----------------- Cruzar tablas: NATURAL JOIN ------------------*/
-- Un EQUI-JOIN sobre los atributos que las tablas comparten (por pareja con AND).
SELECT nombre, planeta
FROM (
    Satélite NATURAL JOIN Aterrizaje
);

SELECT nombre, planeta
FROM (
    Satélite JOIN Aterrizaje USING (planeta, año)
);

/*------------------- Cruzar tablas: SELF JOIN -------------------*/
SELECT *
FROM (
    Aterrizaje A1 JOIN Aterrizaje A2 ON (
        A1.año = A2.año AND A1.planeta <> A2.planeta
    )
);

/*------------------ Cruzar tablas: INNER JOIN -------------------*/
SELECT nave, nombre, dist, año
FROM Planeta INNER JOIN Aterrizaje ON (
    nombre = planeta
);

/*-------------- Joins Externos: LEFT [OUTER] JOIN ---------------*/
SELECT nave, nombre, dist, año
FROM Planeta LEFT OUTER JOIN Aterrizaje ON (
    nombre = planeta
);

/*-------------- Joins Externos: RIGHT [OUTER] JOIN --------------*/
SELECT nave, nombre, dist, año
FROM Planeta RIGHT OUTER JOIN Aterrizaje ON (
    nombre = planeta
);

/*-------------- Joins Externos: FULL [OUTER] JOIN ---------------*/
SELECT planeta, nave, nombre as satélite
FROM Satélite FULL OUTER JOIN Aterrizaje
USING (
    planeta
);

/*

 VALORES NULOS

*/


/*------------------------ NULOS: IS NULL ------------------------*/
SELECT nombre
FROM Satélite
WHERE descubridor IS NULL;

/*---------------------- NULOS: IS NOT NULL ----------------------*/
SELECT nombre
FROM Satélite
WHERE descubridor IS NOT NULL;

/*----------------------- NULOS: COALSECE -----------------------*/
-- Elegir que el primer valor no sea NULL
SELECT nombre, COALESCE(año, 0) AS _año
FROM Satélite
ORDER BY _año;

/*

CONSULTAS ANIDADAS

*/

/*------------------------ WHERE/IN ------------------------*/
SELECT nave, planeta
FROM Aterrizaje
WHERE planeta IN(
    SELECT nombre       --
    FROM Planeta        -- Subconsulta
    WHERE grav > 9.8    --
)
AND año > 2000;

/*---------------------- WHERE/NOT IN ----------------------*/
SELECT nave, planeta
FROM Aterrizaje
WHERE planeta NOT IN(
    SELECT nombre
    FROM Planeta
    WHERE grav > 9.8
)
AND año > 2000;

SELECT nave, planeta
FROM Aterrizaje
WHERE planeta NOT IN(
    SELECT nombre
    FROM Planeta
    WHERE grav > 9.8 OR planeta IN (
        SELECT planeta
        FROM Aterrizaje
        WHERE país = 'ESA'
    )
)
AND año > 2000;

/*---------------------- WHERE/EXISTS ----------------------*/
SELECT nombre, dist
FROM Planeta
WHERE EXISTS(
    SELECT *
    FROM Aterrizaje
    WHERE año >= 2000 AND nombre = planeta -- La subconsulta depende de la consulta exterior
)
ORDER BY dist DESC;
