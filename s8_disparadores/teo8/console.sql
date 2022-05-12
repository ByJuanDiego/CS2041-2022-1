CREATE SCHEMA vistas_disparadores;
SET search_path TO vistas_disparadores;

CREATE TABLE Artista (
  nombre varchar(255) PRIMARY KEY,
  pais varchar(255),
  retirado boolean
);

CREATE TABLE Album (
  nombre varchar(255) PRIMARY KEY,
  artista varchar(255) ,
  anhio integer ,
  pm integer ,
  FOREIGN KEY (artista) REFERENCES Artista(nombre)
);

CREATE TABLE Evaluacion (
  album varchar(255) ,
  artista varchar(255) ,
  fuente varchar(255) ,
  eval integer ,
  FOREIGN KEY (album) REFERENCES Album(nombre) ,
  FOREIGN KEY (artista) REFERENCES Artista(nombre)
);

INSERT INTO Artista (nombre, pais, retirado) VALUES ('Leonard Cohen','Canada',false),('Lady Gaga','EE.UU.',false),('David Bowie','G.B.',true),('Justin Bieber','Canada',false);


INSERT INTO Album (nombre, artista, anhio, pm) VALUES ('Old Ideas','Leonard Cohen',2012,85),('Dear Heather','Leonard Cohen',2004,74),('You Want It Darker','Leonard Cohen',2016,892),('Popular Problems','Leonard Cohen',2014,61);
INSERT INTO Album (nombre, artista, anhio, pm) VALUES ('ARTPOP','Lady Gaga',2013,65),('Born This Way','Lady Gaga',2011,95),('Cheek To Cheek','Lady Gaga',2014,74);
INSERT INTO Album (nombre, artista, anhio, pm) VALUES ('Ziggy Stardust','David Bowie',1972,98),('Aladdin Sane','David Bowie',1973,80),('Lets Dance','David Bowie',1983,90),('Blackstar','David Bowie',2016,75);
INSERT INTO Album (nombre, artista, anhio, pm) VALUES ('Never Say Never','Justin Bieber',2011,73),('Believe','Justin Bieber',2012,67);


INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Popular Problems','Leonard Cohen','The Guardian',80),('Popular Problems','Leonard Cohen','The Observer',80),('Popular Problems','Leonard Cohen','Uncut',90);
INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('You Want It Darker','Leonard Cohen','The Observer',100),('You Want It Darker','Leonard Cohen','Uncut',90),('You Want It Darker','Leonard Cohen','Rolling Stone',80),('You Want It Darker','Leonard Cohen','The Guardian',100),('You Want It Darker','Leonard Cohen','Mojo',100);
INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Dear Heather','Leonard Cohen','The Guardian',60),('Popular Problems','Leonard Cohen','Uncut',100),('Popular Problems','Leonard Cohen','Rolling Stone',70);
INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Old Ideas','Leonard Cohen','Rolling Stone',90),('Popular Problems','Leonard Cohen','Uncut',80);

INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('ARTPOP','Lady Gaga','Rolling Stone',60),('ARTPOP','Lady Gaga','The Guardian',80),('ARTPOP','Lady Gaga','Uncut',60);
INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Born This Way','Lady Gaga','The Guardian',90),('Born This Way','Lady Gaga','The Observer',100),('Born This Way','Lady Gaga','Uncut',100),('Born This Way','Lady Gaga','Mojo',90);
INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Cheek To Cheek','Lady Gaga','The Observer',80),('ARTPOP','Lady Gaga','Rolling Stone',80),('ARTPOP','Lady Gaga','Uncut',70);

INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Ziggy Stardust','David Bowie','Rolling Stone',100),('Ziggy Stardust','David Bowie','The Guardian',100),('Ziggy Stardust','David Bowie','The Observer',90);
INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Aladdin Sane','David Bowie','Rolling Stone',80),('Aladdin Sane','David Bowie','The Observer',80);
INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Lets Dance','David Bowie','The Observer',90),('Lets Dance','David Bowie','The Guardian',90),('Lets Dance','David Bowie','Rolling Stone',90);
INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Blackstar','David Bowie','Uncut',70),('Blackstar','David Bowie','Mojo',70),('Blackstar','David Bowie','The Observer',80),('Blackstar','David Bowie','Rolling Stone',90);

INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Never Say Never','Justin Bieber','The Observer',70),('Never Say Never','Justin Bieber','Mojo',80),('Never Say Never','Justin Bieber','Uncut',70);
INSERT INTO Evaluacion (album, artista, fuente, eval) VALUES ('Believe','Justin Bieber','The Guardian',70),('Believe','Justin Bieber','Rolling Stone',60),('Believe','Justin Bieber','Mojo',70);

CREATE VIEW AlbumEval AS
SELECT album,artista, FLOOR(AVG(eval)) AS pm, count(eval) num
FROM evaluacion
GROUP BY album, artista;

-- DROP VIEW AlbumEval;



CREATE VIEW EvaluacionGuardian AS
SELECT * FROM Evaluacion
WHERE fuente = 'The Guardian';
-- La vista inserta una tupla en EvaluacionGuardian y en Evaluacion
INSERT INTO EvaluacionGuardian VALUES('Believe','Justin Bieber','The Guardian',60);


-- Las vistas materializadas no se actualizan directamente al insertar valores en las tablas que las generan
CREATE MATERIALIZED VIEW AlbumEvalvm AS
SELECT album,artista, FLOOR(AVG(eval)) AS pm, count(eval) num
FROM Evaluacion
GROUP BY album, artista;

SELECT * FROM AlbumEvalvm
WHERE album ='You Want It Darker' AND artista ='Leonard Cohen';

REFRESH MATERIALIZED VIEW AlbumEvalvm;

-- Stores Procedure

-- Es ineficiente porque actualizara toda la vista materializada
CREATE FUNCTION updateVMPm() RETURNS TRIGGER AS $$
BEGIN
    REFRESH MATERIALIZED VIEW AlbumEvalvm;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- drop function updateVMPm;

-- Es mas eficiente porque actualizara solo el album que cambio
CREATE TABLE AlbumEval1 as
SELECT album,artista, FLOOR(AVG(eval)) as pm, count(eval) num
FROM Evaluacion
GROUP BY album, artista;

CREATE OR REPLACE FUNCTION updatePM() RETURNS TRIGGER AS $$
BEGIN
	IF EXISTS(
			SELECT * FROM AlbumEval1 A
				WHERE A.album = NEW.album
					AND A.artista = NEW.artista
				)
	THEN
	UPDATE AlbumEval1
		SET pm = P.pmn , num =P.numn
		FROM (SELECT
			 	AVG(E.eval) AS pmn, COUNT(E.eval) AS numn
			  FROM Evaluacion E
			  WHERE E.album = NEW.album AND
			  		E.artista = NEW.artista
			  GROUP BY E.album, E.artista
			  ) P
		WHERE 	album = NEW.album AND
				artista = NEW.artista;

	ELSE
		INSERT INTO AlbumEval1
			(album, artista, pm,num)
			SELECT E.album, E.artista,
					AVG(E.eval) as pmn,
					COUNT(E.eval) as numn
			FROM Evaluacion E
			WHERE   E.album = NEW.album AND
			  		E.artista = NEW.artista
			GROUP BY E.album, E.artista;

	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Triggers
CREATE TRIGGER ActualizarVmPM
    AFTER INSERT OR UPDATE ON Evaluacion
    FOR EACH ROW EXECUTE PROCEDURE updateVMPm();

CREATE TRIGGER ActualizarPM
    AFTER INSERT OR UPDATE ON Evaluacion
    FOR EACH ROW EXECUTE PROCEDURE updatePM();

INSERT INTO Evaluacion (album, artista, fuente, eval)
VALUES ('Popular Problems','Leonard Cohen','Uncut', 4);
INSERT INTO Evaluacion (album, artista, fuente, eval)
VALUES ('Popular Problems','Leonard Cohen','Rolling Stone', 50);

SELECT * FROM AlbumEvalvm;
SELECT * FROM AlbumEval1;
