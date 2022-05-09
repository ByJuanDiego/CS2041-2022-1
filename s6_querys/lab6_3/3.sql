SELECT nombrep 
FROM profesor 
EXCEPT 
SELECT nombrep 
FROM proyecto 
JOIN profesor ON proyecto.dnip=profesor.dnip;