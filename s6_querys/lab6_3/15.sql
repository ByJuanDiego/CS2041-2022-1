SELECT nombrees, (proyecto.ffin - proyecto.finicio) AS duracion
FROM epregrado
    JOIN estudiante ON (epregrado.codigoes = estudiante.codigoes)
    JOIN trabajap ON (estudiante.codigoes = trabajap.codigoes)
    JOIN proyecto ON (trabajap.codigop = proyecto.codigop)
WHERE fecha = '2017-2'
ORDER BY duracion DESC;