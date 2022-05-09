SELECT nombre, (ffin - finicio) AS duracion
FROM proyecto
ORDER BY duracion DESC
LIMIT 1;