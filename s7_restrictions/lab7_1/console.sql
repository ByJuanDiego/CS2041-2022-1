-- a)
set search_path to openday202010062;

---Creando Programa
CREATE TABLE Programa(
    Pid       integer       ,
    Actividad varchar(50)   ,
    Carrera   varchar(50)   ,
    Lugar     varchar (255) ,
    Horario   varchar(255)
);
---Creando Interesado
CREATE TABLE Interesado(
    DNI     varchar (50) ,
    Nombre  varchar (50) ,
    Email   varchar (50) ,
    Edad    integer      ,
    Sexo    varchar (1)  ,
    Colegio varchar (255)
);
---Creando Asistencia
CREATE TABLE Asistencia(
    Pid integer     ,
    DNI varchar (50),
    Hora timestamp
);

-- b)

-- Añadiendo las llaves primarias de las tablas
ALTER TABLE Programa   ADD CONSTRAINT programa_pk_id       PRIMARY KEY (Pid);
ALTER TABLE Interesado ADD CONSTRAINT interesado_pk_dni    PRIMARY KEY (DNI);
ALTER TABLE Asistencia ADD CONSTRAINT asistencia_pk_id_dni PRIMARY KEY (Pid, DNI);

-- Añadiendo las llaves foránenas de la tabla Asistencia
ALTER TABLE Asistencia ADD CONSTRAINT asistencia_fk_id  FOREIGN KEY (Pid) REFERENCES Programa(Pid);
ALTER TABLE Asistencia ADD CONSTRAINT asistencia_fk_dni FOREIGN KEY (DNI) REFERENCES Interesado(DNI);

-- c)

-- Añadiendo las restricciones consideradas
ALTER TABLE Interesado ADD CONSTRAINT interesado_email_unique UNIQUE (Email);
ALTER TABLE Interesado ALTER COLUMN Colegio SET NOT NULL;
ALTER TABLE Interesado ALTER COLUMN Nombre  SET NOT NULL;
ALTER TABLE Interesado ADD CONSTRAINT interesado_edad_check CHECK ( Edad >= 12 AND Edad <= 85);

-- Añadiendo restricciones adicionales
ALTER TABLE Interesado ADD CONSTRAINT interesado_sexo_m_f CHECK ( UPPER(Sexo)='M' OR UPPER(Sexo)='F' );

-- d)

-- Para que se autogeneren los valores de Programa.Pid:
ALTER TABLE Programa ALTER COLUMN Pid ADD GENERATED ALWAYS AS IDENTITY (START WITH 1);

-- Insertando dos interesados
INSERT INTO Programa (Actividad, Carrera, Lugar, Horario) VALUES
('RoboRally'                , 'Ciencia Computacion','Piso 5','10:00 a 11:00'),
('RoboRally'                , 'Ciencia Computacion','Piso 5','13:00 a 14:00'),
('Robots Biomédicos'        , 'Bioingeniería'      ,'Piso 1','12:00 a 14:00'),
('Reality Space'            , 'Ciencia Computacion','Piso 5','10:40 a 11:25'),
('Pensamiento Computacional', 'Ciencia Computacion','Piso 8','14:40 a 15:25');

INSERT INTO Interesado (DNI, Nombre, Email, Edad, Sexo, Colegio) VALUES
('92436099' ,'Madaline Henson','et.euismod.et@cursus.edu'                   ,18,'M','Phasellus In Consulting'        ),
('52527899' ,'Ignatius Walsh' ,'sem.molestie@Duisatlacus.net'               ,19,'M','Risus Quisque Inc.'             ),
('120571899','Alyssa Massey'  ,'erat@aliquetmolestie.org'                   ,18,'F','Euismod Urna Nullam Corporation'),
('152666099','Uriel Callahan' ,'Aliquam.vulputate@Nullam.ca'                ,19,'M','Tincidunt Dui Institute'        ),
('151856699','Jeanette Prince','ullamcorper.eu.euismod@accumsaninterdum.edu',19,'F','Pede LLC'                       ),
('103092199','Ashton Dudley'  ,'in.hendrerit@ullamcorperviverraMaecenas.org',19,'F','Arcu Imperdiet Limited'         ),
('152075299','Colt Turner'    ,'vestibulum@Donec.net'                       ,16,'F','Congue Incorporated'            ),
('121824399','Amanda Stout'   ,'Curabitur@nonjustoProin.edu'                ,19,'F','Ac Feugiat Non Associates'      ),
('181055499','Brian Potter'   ,'sed.dui@mauris.ca'                          ,17,'M','Mauris LLC'                     ),
('192928799','Dolan Mullen'   ,'adipiscing@tellus.net'                      ,18,'M','Odio Tristique Pharetra Limited');

INSERT INTO Asistencia (Pid, DNI, Hora) VALUES
(1,'181055499','1/10/2019 08:00:00'),
(2,'152666099','1/10/2019 08:00:00'),
(3,'152666099','1/10/2019 08:10:00'),
(4,'152075299','1/10/2019 08:12:00'),
(1,'192928799','1/10/2019 08:15:00'),
(2,'103092199','1/10/2019 08:30:00'),
(2,'121824399','1/10/2019 08:33:00'),
(3,'181055499','1/10/2019 08:35:00'),
(5,'181055499','1/10/2019 08:45:00'),
(4,'192928799','1/10/2019 08:47:00');

-- e)

CREATE ROLE usr_202010062_1 PASSWORD 'pass_202010062_1';
GRANT CONNECT ON DATABASE bd_group5_1 TO usr1_202010062;
GRANT SELECT  ON Asistencia, Programa, Interesado TO usr_202010062_1;
-- psql -h 194.163.147.223 -p 5432 -U usr_202010062_1 -d bd_group5_1
-- Password for user usr_202010062_1: pass_202010062_1

CREATE ROLE usr_202010062_2 PASSWORD 'pass_202010062_2';
GRANT CONNECT ON DATABASE bd_group5_1 TO usr_202010062_2;
GRANT SELECT, DELETE, INSERT, UPDATE ON Asistencia TO usr_202010062_2;
-- psql -h 194.163.147.223 -p 5432 -U usr_202010062_2 -d bd_group5_1
-- Password for user usr_202010062_1: pass_202010062_2

CREATE ROLE usr_202010062_3 PASSWORD 'pass_202010062_3';
GRANT CONNECT ON DATABASE bd_group5_1 TO usr_202010062_3;
-- psql -h 194.163.147.223 -p 5432 -U usr_202010062_3 -d bd_group5_1
-- Password for user usr_202010062_1: pass_202010062_3

-- f)
SELECT (Programa.Pid), (Programa.Actividad), count(DNI) AS asistentes
FROM Asistencia NATURAL JOIN Programa
WHERE Programa.Actividad = 'RoboRally'
GROUP BY Programa.Pid, Programa.Actividad;

-- g)

SELECT DNI, Nombre FROM Interesado EXCEPT (
    SELECT DNI, Nombre FROM Interesado NATURAL JOIN Asistencia NATURAL JOIN Programa
    WHERE Programa.Carrera = 'Ciencia Computacion'
)
ORDER BY Nombre;

SELECT I.DNI,I.Nombre
FROM Interesado I WHERE I.DNI NOT IN (
    SELECT A.DNI
    FROM Asistencia A
    WHERE A.Pid IN (
        SELECT P.Pid
        FROM Programa P
        Where p.Carrera='Ciencia Computacion'
    )
) ORDER BY Nombre;

