SELECT codigop, COUNT(codigoes) AS cuenta
FROM proyecto NATURAL JOIN trabajap
GROUP BY codigop
ORDER BY cuenta DESC
LIMIT 2;