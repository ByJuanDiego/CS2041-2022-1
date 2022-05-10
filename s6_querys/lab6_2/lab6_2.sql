SET search_path TO lab6_2a;

-- 1)
SELECT * FROM
pelicula
ORDER BY pelicula.calificacion DESC
LIMIT 10;

-- 2)
SELECT DISTINCT a.nombre
FROM actor a JOIN personaje pr ON a.nombre = pr.a_nombre JOIN (
    SELECT nombre FROM pelicula
    ORDER BY pelicula.calificacion DESC
    LIMIT 10
    ) pl  ON pr.p_nombre = pl.nombre
WHERE genero = 'F';

-- 3)
SELECT count(actor.nombre)
FROM actor;

-- 4)
SELECT count(DISTINCT anho)
FROM pelicula;

-- 5)
SELECT a_nombre, count(a_nombre)
from personaje
GROUP BY a_nombre
HAVING count(a_nombre) > 1
ORDER BY count(a_nombre) DESC;


-- 6)
SELECT avg(calificacion) AS promedio, anho
FROM pelicula
GROUP BY anho
HAVING every(calificacion > 8)
ORDER BY promedio DESC;

-- 7)
SELECT count(pelicula) AS peliculas , (anho / 10) * 10 AS decada
FROM pelicula
GROUP BY decada
ORDER BY peliculas DESC;

-- 8)

SELECT DISTINCT p1.a_nombre AS "Terminator 1", p2.a_nombre AS "Terminator 2" FROM
    (SELECT a_nombre FROM personaje WHERE p_nombre = 'Terminator') p1
        FULL OUTER JOIN
    (SELECT a_nombre FROM personaje WHERE p_nombre = 'Terminator 2: Judgement Day') p2 ON p1.a_nombre = p2.a_nombre;

-- 9)

SELECT * FROM (
    SELECT DISTINCT p1.a_nombre AS "Terminator 1", p2.a_nombre AS "Terminator 2" FROM
        (SELECT a_nombre FROM personaje WHERE p_nombre = 'Terminator') p1
            FULL OUTER JOIN
        (SELECT a_nombre FROM personaje WHERE p_nombre = 'Terminator 2: Judgement Day') p2 ON p1.a_nombre = p2.a_nombre
) A
WHERE A."Terminator 1" IS NULL OR A."Terminator 2" IS NULL;

-- 10)
