SELECT nombrep, fnacimiento, (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM fnacimiento)) AS edad
FROM profesor
WHERE dnip IN (SELECT dnip 
			   FROM (SELECT dnip, COUNT(codigop) AS cuenta 
					 FROM asesora GROUP BY dnip) A 
			  		 WHERE cuenta = (SELECT MAX(cuenta) 
								     FROM (SELECT dnip, COUNT(codigop) AS cuenta 
									       FROM asesora GROUP BY dnip) B));