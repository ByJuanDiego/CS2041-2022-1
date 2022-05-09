SELECT nombrep
FROM asesora NATURAL JOIN profesor 
INTERSECT 
SELECT nombrep 
FROM proyecto 
JOIN profesor ON proyecto.dnip=profesor.dnip;