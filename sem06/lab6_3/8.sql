SELECT nombrep AS nombre 
FROM proyecto NATURAL JOIN profesor NATURAL JOIN trabajad NATURAL JOIN departamento 
WHERE nombred='Ciencia de la Computación' 
UNION 
SELECT nombrep AS nombre 
FROM asesora NATURAL JOIN profesor NATURAL JOIN trabajad NATURAL JOIN departamento 
WHERE nombred='Ciencia de la Computación'
UNION 
SELECT nombrees AS nombre
FROM estudiante NATURAL JOIN pertenece NATURAL JOIN departamento NATURAL JOIN trabajap
WHERE nombred='Ciencia de la Computación';