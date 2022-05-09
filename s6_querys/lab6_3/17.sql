SELECT nombred, codigod, cuenta
FROM (SELECT codigod, COUNT(codigop) AS cuenta
FROM profesor NATURAL JOIN proyecto NATURAL JOIN trabajad NATURAL JOIN departamento
GROUP BY codigod
HAVING COUNT(codigop) > (SELECT AVG(cuenta) AS promedio
                         FROM (SELECT codigod, COUNT(codigop) AS cuenta
                               FROM profesor NATURAL JOIN proyecto NATURAL JOIN trabajad NATURAL JOIN departamento
                               GROUP BY codigod) as A)
ORDER BY cuenta DESC
LIMIT 3) as B NATURAL JOIN departamento;