    SELECT codigod, COUNT(codigoes) AS cuenta
    FROM epregrado NATURAL JOIN trabajap NATURAL JOIN profesor NATURAL JOIN diriged
    GROUP BY codigod
    ORDER BY cuenta
    LIMIT 2;