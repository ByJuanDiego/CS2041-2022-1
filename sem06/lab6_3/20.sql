SELECT nombrep, area
FROM (SELECT codigod
        FROM pertenece
        GROUP BY codigod
        HAVING COUNT(codigoes) = (SELECT MIN(cantidad_estudiantes)
                                    FROM (SELECT codigod, COUNT(codigoes) AS cantidad_estudiantes
                                            FROM pertenece
                                            GROUP BY codigod) as estudiantespordepartamento)) as departamentoscumplen
        NATURAL JOIN trabajad NATURAL JOIN profesor NATURAL JOIN asesora NATURAL JOIN proyecto
WHERE presupuesto > 5000
UNION
SELECT nombrep, area
FROM (SELECT codigod
        FROM pertenece
        GROUP BY codigod
        HAVING COUNT(codigoes) = (SELECT MIN(cantidad_estudiantes)
                                    FROM (SELECT codigod, COUNT(codigoes) AS cantidad_estudiantes
                                            FROM pertenece
                                            GROUP BY codigod) as estudiantespordepartamento)) as departamentoscumplen
        NATURAL JOIN trabajad NATURAL JOIN profesor NATURAL JOIN proyecto
WHERE presupuesto > 5000;