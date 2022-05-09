SELECT EXTRACT(year FROM ffin) AS anio, COUNT(EXTRACT(year FROM ffin))
FROM proyecto
GROUP BY anio;