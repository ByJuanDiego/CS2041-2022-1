SELECT nombred, COUNT(codigoes) AS cuenta
FROM estudiante NATURAL JOIN trabajap NATURAL JOIN pertenece NATURAL JOIN departamento
WHERE fecha = '2020-1'
GROUP BY nombred
ORDER BY cuenta;