SET search_path TO pre_pc2;

CREATE TABLE IF NOT EXISTS profesor (
    dni VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    especialidad VARCHAR(50) NOT NULL
);

ALTER TABLE programa ADD COLUMN dni_profesor VARCHAR(8);
ALTER TABLE programa ADD CONSTRAINT dni_profesor_fk FOREIGN KEY (dni_profesor) REFERENCES profesor(dni);

INSERT INTO profesor VALUES
('00000000', 'Profesor Nulo', 'Nula');

UPDATE programa SET dni_profesor = '00000000' WHERE programa.dni_profesor IS NULL;
ALTER TABLE programa ALTER COLUMN dni_profesor SET NOT NULL;


-- ALTER TABLE asistencia ADD CONSTRAINT aforo_maximo CHECK ( (SELECT COUNT(dni) FROM asistencia GROUP BY pid) < 10);

CREATE OR REPLACE FUNCTION aforo_maximo() RETURNS TRIGGER AS $$
    begin
        IF ((SELECT COUNT(dni) FROM asistencia WHERE pid = NEW.pid GROUP BY pid) < 10) THEN
            RETURN NEW;
        ELSE
            RETURN NULL;
        END IF;
    end;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER verificar_aforo_maximo
BEFORE INSERT ON asistencia
FOR EACH ROW EXECUTE PROCEDURE aforo_maximo();


INSERT INTO asistencia VALUES
(5,'192928789','2019-01-10 08:47:00.000000'),
(5,'192928790','2019-01-10 08:47:00.000000'),
(5,'192928791','2019-01-10 08:47:00.000000'),
(5,'192928792','2019-01-10 08:47:00.000000'),
(5,'192928793','2019-01-10 08:47:00.000000'),
(5,'192928794','2019-01-10 08:47:00.000000'),
(5,'192928795','2019-01-10 08:47:00.000000'),
(5,'192928796','2019-01-10 08:47:00.000000'),
(5,'192928797','2019-01-10 08:47:00.000000'),
(5,'192928798','2019-01-10 08:47:00.000000');

insert into asistencia values
(5,'52527899','2019-01-10 08:47:00.000000');

SELECT pid, count(dni) from asistencia group by (pid)
ORDER BY pid;


SELECT p.actividad, p.horario, count(dni)
FROM programa p NATURAL JOIN asistencia a
WHERE p.actividad = 'RoboRally'
GROUP BY (p.actividad, p.horario);


-- con except
SELECT DNI, Nombre FROM Interesado EXCEPT (
    SELECT DNI, Nombre FROM Interesado NATURAL JOIN Asistencia NATURAL JOIN Programa
    WHERE Programa.Carrera = 'Ciencia Computacion'
)
ORDER BY Nombre;

-- sin except
SELECT I.Nombre
FROM Interesado I WHERE I.DNI NOT IN (
    SELECT A.DNI
    FROM Asistencia A
    WHERE A.Pid IN (
        SELECT P.Pid
        FROM Programa P
        Where p.Carrera='Ciencia Computacion'
    )
) ORDER BY Nombre;

SELECT nombre
FROM (asistencia NATURAL JOIN interesado NATURAL JOIN programa)
WHERE actividad = 'RoboRally'
INTERSECT
SELECT nombre
FROM (asistencia NATURAL JOIN interesado NATURAL JOIN programa)
WHERE actividad = 'Pensamiento Computacional';


SELECT * FROM (
    SELECT nombre, dni, count(actividad) AS asistencia_cs
    FROM (SELECT * FROM programa WHERE carrera = 'Ciencia Computacion') P NATURAL JOIN asistencia A NATURAL JOIN interesado I
        GROUP BY (nombre, dni)
    ) R1
    WHERE asistencia_cs = (
        SELECT count(actividad)
        FROM programa
        WHERE carrera = 'Ciencia Computacion'
    );
