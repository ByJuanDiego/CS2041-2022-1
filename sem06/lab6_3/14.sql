SELECT nombrep, edad 
FROM (SELECT nombrep, (EXTRACT(YEAR from CURRENT_DATE) - EXTRACT(YEAR from fnacimiento)) AS edad
	  FROM trabajap NATURAL JOIN epregrado NATURAL JOIN proyecto NATURAL JOIN profesor NATURAL JOIN pertenece NATURAL JOIN departamento
	  WHERE nombred = 'Ciencia de la Computación') DirigenProyectos
WHERE edad BETWEEN 30 AND 34;