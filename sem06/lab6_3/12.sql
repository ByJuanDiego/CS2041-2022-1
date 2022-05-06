SELECT A1.carrera, A2.carrera
FROM (SELECT carrera, COUNT(codigoes) AS cuenta
FROM epregrado NATURAL JOIN trabajap NATURAL JOIN proyecto
GROUP BY carrera) A1 CROSS JOIN (SELECT carrera, COUNT(codigoes) AS cuenta
FROM epregrado NATURAL JOIN trabajap NATURAL JOIN proyecto
GROUP BY carrera) A2
WHERE A1.cuenta = A2.cuenta
AND A1.carrera != A2.carrera;