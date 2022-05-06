SELECT nombrees
FROM estudiante NATURAL JOIN trabajap NATURAL JOIN proyecto NATURAL JOIN profesor NATURAL JOIN diriged
UNION
SELECT nombrees
FROM estudiante NATURAL JOIN trabajap NATURAL JOIN asesora NATURAL JOIN profesor NATURAL JOIN diriged;