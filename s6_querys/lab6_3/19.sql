SELECT carrera, COUNT(codigoes) AS cantidad_estudiantes
FROM epregrado NATURAL JOIN trabajap NATURAL JOIN proyecto
WHERE fecha = '2020-1'
AND presupuesto < (
    SELECT AVG(P.presupuesto)
    FROM proyecto P
    )
GROUP BY carrera;