select nombred, COUNT(nombred) as cuenta
from asesora JOIN trabajad ON asesora.dnip=trabajad.dnip JOIN departamento ON trabajad.codigod=departamento.codigod 
GROUP BY nombred
ORDER BY cuenta;