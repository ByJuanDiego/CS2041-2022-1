SELECT nombred
FROM departamento
WHERE nombred IN (SELECT nombred 
			 	  FROM (SELECT nombred, COUNT(codigop) AS cuenta
				   		FROM epostgrado NATURAL JOIN pertenece NATURAL JOIN departamento NATURAL JOIN trabajap
				   		GROUP BY nombred) A
				  WHERE cuenta = (SELECT MIN(cuenta)
			 					  FROM (SELECT nombred, COUNT(codigop) AS cuenta
				   						FROM epostgrado NATURAL JOIN pertenece NATURAL JOIN departamento NATURAL JOIN trabajap
				   						GROUP BY nombred) n_proj));