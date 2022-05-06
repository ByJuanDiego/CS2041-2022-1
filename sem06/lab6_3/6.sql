SELECT nombrep, cuenta
FROM (SELECT nombrep, COUNT(nombrep) AS cuenta
	  FROM asesora NATURAL JOIN profesor
	  GROUP BY nombrep) C
WHERE cuenta = (SELECT MAX(C.cuenta)
				FROM (SELECT nombrep, COUNT(nombrep) AS cuenta
					  FROM asesora NATURAL JOIN profesor
					  GROUP BY nombrep) C);