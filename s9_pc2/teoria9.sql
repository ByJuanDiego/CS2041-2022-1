set search_path to pc2;
set datestyle = dmy;

CREATE TABLE Usuario(
	username varchar(255) NOT NULL,  --no se si esta bien
	nombre varchar(255) NOT NULL,
	link varchar(255) NOT NULL --no se si esta bien
);


CREATE TABLE Corporativo(
	username varchar(255) NOT NULL,
	correo varchar(255) NOT NULL,
	direccion varchar(255) NOT NULL,
	telefono varchar(15) NOT NULL
);

CREATE TABLE Personal(
	username varchar(255) NOT NULL,
	privado varchar(255) NOT NULL --no entiendo privado
);

CREATE TABLE Publicacion(
	username varchar(255) NOT NULL,
	fecha date NOT NULL,
	ubicacion varchar(255),
	descripcion varchar(255)
);

CREATE TABLE Multimedia(
	username varchar(255) NOT NULL,
	fecha date NOT NULL,
	numerodearchivo varchar(255) NOT NULL, --no se si esta bien
	archivo varchar(255) NOT NULL --no se si esta bien
);

CREATE TABLE Foto(
		username varchar(255) NOT NULL,
		fecha date NOT NULL,
		numerodearchivo varchar(255) NOT NULL --no se si esta bien
);

CREATE TABLE Video(
	username varchar(255) NOT NULL,
	fecha date NOT NULL,
	numerodearchivo varchar(255) NOT NULL, --no se si esta bien
	duracion float NOT NULL
);

CREATE TABLE Sigue(
	username_seguidor varchar(255) NOT NULL,
	username_seguido varchar(255) NOT NULL
);

CREATE TABLE Likee(
	username_usuario varchar(255) NOT NULL,
	username_publicacion varchar(255) NOT NULL,
	fecha date NOT NULL
);

CREATE TABLE Comentario(
	username_usuario varchar(255) NOT NULL,
	username_publicacion varchar(255) NOT NULL,
	fecha_publicacion date NOT NULL,
	likes integer NOT NULL,
	texto varchar(255) NOT NULL,
	fecha date NOT NULL
);

CREATE TABLE Tag(
	username_usuario varchar(255) NOT NULL,
	username_multimedia varchar(255) NOT NULL,
	fecha date NOT NULL,
	numerodearchivo varchar(255) NOT NULL --no se si esta bien
);

--Las PRIMARY KEYS
ALTER TABLE Usuario ADD CONSTRAINT username_pk_id PRIMARY KEY (username);

ALTER TABLE Corporativo ADD CONSTRAINT corporativo_pk_id PRIMARY KEY (username);

ALTER TABLE Personal ADD CONSTRAINT personal_pk_id PRIMARY KEY (username);

ALTER TABLE Publicacion ADD CONSTRAINT publicacion_pk_ids PRIMARY KEY (username, fecha);

ALTER TABLE Multimedia ADD CONSTRAINT multimedia_pk_id PRIMARY KEY (username, fecha, numerodearchivo);

ALTER TABLE Foto ADD CONSTRAINT foto_pk_ids PRIMARY KEY (username, fecha, numerodearchivo);

ALTER TABLE Video ADD CONSTRAINT video_pk_ids PRIMARY KEY (username, fecha, numerodearchivo);

ALTER TABLE Sigue ADD CONSTRAINT sigue_pk_ids PRIMARY KEY (username_seguidor, username_seguido);

ALTER TABLE Likee ADD CONSTRAINT like_pk_ids PRIMARY KEY (username_usuario, username_publicacion, fecha);

ALTER TABLE Comentario ADD CONSTRAINT comentario_pk_ids PRIMARY KEY (username_usuario, username_publicacion, fecha_publicacion);

ALTER TABLE Tag ADD CONSTRAINT tag_pk_ids PRIMARY KEY (username_usuario, username_multimedia, fecha, numerodearchivo);

-- LAS FOREIGN KEYS

ALTER TABLE Corporativo ADD CONSTRAINT usuario_fk_id FOREIGN KEY (username) REFERENCES Usuario (username);

ALTER TABLE Personal ADD CONSTRAINT usuario_fk_id FOREIGN KEY (username) REFERENCES Usuario (username);

ALTER TABLE Publicacion ADD CONSTRAINT usuario_fk_id FOREIGN KEY (username) REFERENCES Usuario (username);

ALTER TABLE Multimedia ADD CONSTRAINT publicacion_fk_ids FOREIGN KEY (username, fecha) REFERENCES Publicacion (username, fecha);

ALTER TABLE Foto ADD CONSTRAINT multimedia_fk_ids FOREIGN KEY (username, fecha, numerodearchivo) REFERENCES Multimedia (username, fecha, numerodearchivo);

ALTER TABLE Video ADD CONSTRAINT multimedia_fk_ids FOREIGN KEY (username, fecha, numerodearchivo) REFERENCES Multimedia (username, fecha, numerodearchivo);

ALTER TABLE Likee ADD CONSTRAINT usuario_fk_id FOREIGN KEY (username_usuario) REFERENCES Usuario (username);
ALTER TABLE Likee ADD CONSTRAINT publicacion_fk_ids FOREIGN KEY (username_publicacion, fecha) REFERENCES Publicacion (username, fecha);

ALTER TABLE Comentario ADD CONSTRAINT publicacion_fk_ids FOREIGN KEY (username_publicacion, fecha_publicacion) REFERENCES Publicacion (username, fecha);
ALTER TABLE Comentario ADD CONSTRAINT usuario_fk_id FOREIGN KEY (username_usuario) REFERENCES Usuario (username);

ALTER TABLE Tag ADD CONSTRAINT usuario_fk_id FOREIGN KEY (username_usuario) REFERENCES Usuario (username);
ALTER TABLE Tag ADD CONSTRAINT multimedia_fk_ids FOREIGN KEY (username_multimedia, fecha, numerodearchivo) REFERENCES Multimedia (username, fecha, numerodearchivo);



INSERT INTO usuario(username,nombre,link) VALUES
('Juani06821','Juanito Torres','mypage.com/Juani06821'),
('Contreras068','Javier Contreras','mypage.com/Contreras068'),
('LuisC21','Luis Cervera','mypage.com/LuisC21'),
('AFlor59','Angela Flor','mypage.com/AFlor59'),
('FuentesA0597','Angel Fuentes','mypage.com/FuentesA0597'),
('IvWat','Ivana Watkins','mypage.com/IvWat'),
('KionaO','Kiona Oneil','mypage.com/KionaO'),
('Clementien','Clementine Wells','mypage.com/Clementien'),
('WCardenas','Walter Cardenas','mypage.com/WCardenas'),
('Badbunny','Benito Martinez','mypage.com/Badbunny'),
('Paoloav','Paolo Armas','mypage.com/Paoloav'),
('DiegoG','Diego Guera','mypage.com/DiegoG');


INSERT INTO corporativo(username,correo,direccion,telefono) VALUES
('Juani06821','Juani06821@mypage.com','Urb. Catalina Villalpando # 8 Piso 20','1-254-128-6440'),
('Contreras068','Contreras068@mypage.com','Urb. Ivanna Batista # 14 Piso 2','1-992-331-9035'),
('LuisC21','LuisC21@mypage.com','Urb. Ivanna Batista # 14 Piso 2','(617) 626-4947'),
('AFlor59','AFlor59@mypage.com','Cl. Aitana Caserez # 6766','(617) 255-7660'),
('FuentesA0597','FuentesA0597@mypage.com','Urb. Ivanna Batista # 14 Piso 2','(189) 840-4811'),
('IvWat','IvWat@mypage.com','Urb. Ivanna Batista # 14 Piso 2','(543) 436-4225'),
('KionaO','KionaO@mypage.com','Urb. Ivanna Batista # 14 Piso 2','(420) 524-7915'),
('Clementien','Clementien@mypage.com','Cl. Aitana Caserez # 6766','(784) 594-2526'),
('WCardenas','WCardenas@mypage.com','Jr. Dylan Guevara # 539','1-877-122-5793'),
('Badbunny','Badbunny@mypage.com','Urb. Ivanna Batista # 14 Piso 2','1-430-171-8730'),
('Paoloav','Paoloav@mypage.com','Jr. Dylan Guevara # 539','1-688-837-2839'),
('DiegoG','DiegoG@mypage.com','Cl. Eduardo Arevalo # 1','(270) 127-6222');


INSERT INTO personal (username,privado) VALUES
('Juani06821','True'),
('Contreras068','False'),
('LuisC21','False'),
('AFlor59','False'),
('FuentesA0597','True'),
('IvWat','False'),
('KionaO','False'),
('Clementien','False'),
('WCardenas','True'),
('Badbunny','False'),
('Paoloav','False'),
('DiegoG','False');


INSERT INTO publicacion (username,fecha,ubicacion,descripcion) VALUES
('Juani06821','25/11/2020','Cl. Aitana Caserez # 6766','Holaa'),
('Contreras068','9/5/2020','Cl. Mariana Armenta # 4474 Piso 9','Holaa'),
('LuisC21','27/5/2020','Cl. Aitana Caserez # 6766','Holaa'),
('AFlor59','23/11/2020','Jr. Dylan Guevara # 539','Holaa'),
('FuentesA0597','1/1/2020','Urb. Ivanna Batista # 14 Piso 2','Holaa'),
('IvWat','12/10/2020','Cl. Aitana Caserez # 6766','Holaa'),
('KionaO','6/2/2020','Cl. Mariana Armenta # 4474 Piso 9','Holaa'),
('Clementien','13/10/2020','Cl. Mariana Armenta # 4474 Piso 9','Holaa'),
('WCardenas','25/1/2020','Cl. Aitana Caserez # 6766','Holaa'),
('Badbunny','19/7/2020','Urb. Catalina Villalpando # 8 Piso 20','Holaa'),
('Paoloav','21/4/2020','Jr. Dylan Guevara # 539','Holaa'),
('DiegoG','22/11/2020','Cl. Eduardo Arevalo # 1','Holaa'),
('Juani06821','27/2/2020','Urb. Ivanna Batista # 14 Piso 2','Holaa'),
('Contreras068','2/4/2020','Cl. Aitana Caserez # 6766','Holaa'),
('LuisC21','16/11/2020','Cl. Mariana Armenta # 4474 Piso 9','Holaa'),
('AFlor59','3/1/2020','Urb. Catalina Villalpando # 8 Piso 20','Holaa'),
('FuentesA0597','18/2/2020','Cl. Eduardo Arevalo # 1','Holaa'),
('IvWat','20/9/2020','Cl. Eduardo Arevalo # 1','Holaa'),
('KionaO','18/9/2020','Urb. Catalina Villalpando # 8 Piso 20','Holaa'),
('Clementien','4/4/2020','Jr. Dylan Guevara # 539','Holaa'),
('WCardenas','16/8/2020','Jr. Dylan Guevara # 539','Holaa'),
('Badbunny','9/3/2020','Cl. Mariana Armenta # 4474 Piso 9','Holaa'),
('Paoloav','8/6/2020','Cl. Mariana Armenta # 4474 Piso 9','Holaa'),
('DiegoG','19/1/2020','Cl. Aitana Caserez # 6766','Holaa'),
('Juani06821','10/2/2020','Cl. Aitana Caserez # 6766','Holaa');


INSERT INTO multimedia (username,fecha,numerodearchivo,archivo) VALUES
('Contreras068','9/5/2020','1','1.png'),
('Contreras068','9/5/2020','2','2.png'),
('LuisC21','27/5/2020','3','3.png'),
('LuisC21','27/5/2020','4','4.png'),
('FuentesA0597','1/1/2020','5','5.png'),
('FuentesA0597','1/1/2020','6','6.png'),
('FuentesA0597','1/1/2020','7','7.png'),
('IvWat','12/10/2020','8','8.png'),
('IvWat','12/10/2020','9','9.png'),
('Clementien','13/10/2020','10','10.png'),
('Clementien','13/10/2020','11','11.png'),
('Clementien','13/10/2020','12','12.png'),
('Clementien','13/10/2020','13','13.png'),
('WCardenas','25/1/2020','14','14.png'),
('WCardenas','25/1/2020','15','15.png'),
('Badbunny','19/7/2020','16','16.png'),
('Badbunny','19/7/2020','17','17.png'),
('Badbunny','19/7/2020','18','18.png'),
('Paoloav','21/4/2020','19','19.png'),
('Paoloav','21/4/2020','20','20.png'),
('Paoloav','21/4/2020','21','21.png'),
('Paoloav','21/4/2020','22','22.png'),
('DiegoG','22/11/2020','23','23.png'),
('Contreras068','2/4/2020','24','24.png'),
('Contreras068','2/4/2020','25','25.png'),
('Contreras068','2/4/2020','26','26.png'),
('Contreras068','2/4/2020','27','27.png'),
('AFlor59','3/1/2020','28','28.png'),
('AFlor59','3/1/2020','29','29.png'),
('AFlor59','3/1/2020','30','30.png'),
('AFlor59','3/1/2020','31','31.png'),
('FuentesA0597','18/2/2020','32','32.png'),
('IvWat','20/9/2020','33','33.png'),
('IvWat','20/9/2020','34','34.png'),
('KionaO','18/9/2020','35','35.png'),
('KionaO','18/9/2020','36','36.png'),
('KionaO','18/9/2020','37','37.png'),
('KionaO','18/9/2020','38','38.png'),
('Clementien','4/4/2020','39','39.png'),
('WCardenas','16/8/2020','40','40.png'),
('WCardenas','16/8/2020','41','41.png'),
('WCardenas','16/8/2020','42','42.png'),
('WCardenas','16/8/2020','43','43.png'),
('Badbunny','9/3/2020','44','44.png'),
('Paoloav','8/6/2020','45','45.png'),
('Paoloav','8/6/2020','46','46.png'),
('DiegoG','19/1/2020','47','47.png'),
('Juani06821','10/2/2020','48','48.png'),
('Juani06821','10/2/2020','49','49.png'),
('Juani06821','10/2/2020','50','50.png'),
('Juani06821','10/2/2020','51','51.png');


INSERT INTO foto (username,fecha,numerodearchivo) VALUES
('Contreras068','9/5/2020','2'),
('LuisC21','27/5/2020','4'),
('IvWat','12/10/2020','9'),
('Clementien','13/10/2020','11'),
('Clementien','13/10/2020','12'),
('Clementien','13/10/2020','13'),
('Badbunny','19/7/2020','17'),
('Badbunny','19/7/2020','18'),
('Paoloav','21/4/2020','20'),
('Paoloav','21/4/2020','22'),
('Contreras068','2/4/2020','25'),
('Contreras068','2/4/2020','26'),
('Contreras068','2/4/2020','27'),
('AFlor59','3/1/2020','29'),
('AFlor59','3/1/2020','30'),
('AFlor59','3/1/2020','31'),
('IvWat','20/9/2020','34'),
('KionaO','18/9/2020','36'),
('KionaO','18/9/2020','38'),
('Paoloav','8/6/2020','46');


INSERT INTO video (username,fecha,numerodearchivo,duracion) VALUES
('Contreras068','9/5/2020','1','0'),
('LuisC21','27/5/2020','3','2'),
('FuentesA0597','1/1/2020','5','4'),
('FuentesA0597','1/1/2020','6','3'),
('FuentesA0597','1/1/2020','7','2'),
('IvWat','12/10/2020','8','3'),
('Clementien','13/10/2020','10','0'),
('WCardenas','25/1/2020','14','0'),
('WCardenas','25/1/2020','15','0'),
('Badbunny','19/7/2020','16','4'),
('Paoloav','21/4/2020','19','1'),
('Paoloav','21/4/2020','21','0'),
('DiegoG','22/11/2020','23','0'),
('Contreras068','2/4/2020','24','4'),
('AFlor59','3/1/2020','28','0'),
('FuentesA0597','18/2/2020','32','1'),
('IvWat','20/9/2020','33','2'),
('KionaO','18/9/2020','35','0'),
('KionaO','18/9/2020','37','2'),
('Clementien','4/4/2020','39','0'),
('WCardenas','16/8/2020','40','0'),
('WCardenas','16/8/2020','41','2'),
('WCardenas','16/8/2020','42','0'),
('WCardenas','16/8/2020','43','1'),
('Badbunny','9/3/2020','44','2'),
('Paoloav','8/6/2020','45','2'),
('DiegoG','19/1/2020','47','1'),
('Juani06821','10/2/2020','48','4'),
('Juani06821','10/2/2020','49','1'),
('Juani06821','10/2/2020','50','1'),
('Juani06821','10/2/2020','51','2');


INSERT INTO sigue (username_seguidor,username_seguido) VALUES
('Juani06821','KionaO'),
('Contreras068','FuentesA0597'),
('LuisC21','Juani06821'),
('AFlor59','Badbunny'),
('FuentesA0597','WCardenas'),
('IvWat','Clementien'),
('Clementien','FuentesA0597'),
('WCardenas','Contreras068'),
('Badbunny','Juani06821'),
('Paoloav','DiegoG'),
('DiegoG','AFlor59');


INSERT INTO likee (username_usuario,username_publicacion,fecha) VALUES
('Juani06821','Contreras068','9/5/2020'),
('Contreras068','IvWat','12/10/2020'),
('FuentesA0597','Clementien','13/10/2020'),
('IvWat','Juani06821','10/2/2020'),
('KionaO','DiegoG','22/11/2020'),
('Clementien','Badbunny','9/3/2020'),
('WCardenas','AFlor59','3/1/2020'),
('Badbunny','Paoloav','21/4/2020'),
('Paoloav','KionaO','6/2/2020'),
('DiegoG','AFlor59','3/1/2020');


INSERT INTO comentario (username_usuario,username_publicacion,fecha_publicacion,likes,texto,fecha) VALUES
('Juani06821','Contreras068','9/5/2020','0','Holaaa','1/5/2020'),
('Contreras068','Juani06821','25/11/2020','10','Holaaa','3/9/2020'),
('LuisC21','KionaO','6/2/2020','11','Holaaa','6/1/2020'),
('AFlor59','LuisC21','16/11/2020','8','Holaaa','28/1/2020'),
('FuentesA0597','Paoloav','8/6/2020','9','Holaaa','8/7/2020'),
('KionaO','FuentesA0597','1/1/2020','3','Holaaa','10/3/2020'),
('Clementien','FuentesA0597','1/1/2020','8','Holaaa','4/8/2020'),
('WCardenas','FuentesA0597','1/1/2020','0','Holaaa','28/2/2020'),
('Badbunny','FuentesA0597','1/1/2020','7','Holaaa','4/8/2020'),
('Paoloav','Juani06821','27/2/2020','5','Holaaa','21/11/2020'),
('DiegoG','IvWat','12/10/2020','5','Holaaa','5/1/2020');


INSERT INTO tag (username_usuario,username_multimedia,fecha,numerodearchivo) VALUES
('LuisC21','Contreras068','9/5/2020','2'),
('Badbunny','LuisC21','27/5/2020','4'),
('Clementien','IvWat','12/10/2020','9'),
('LuisC21','Clementien','13/10/2020','11'),
('DiegoG','Clementien','13/10/2020','12'),
('WCardenas','Clementien','13/10/2020','13'),
('Contreras068','Badbunny','19/7/2020','17'),
('IvWat','Badbunny','19/7/2020','18'),
('DiegoG','Paoloav','21/4/2020','20'),
('Contreras068','Paoloav','21/4/2020','22'),
('WCardenas','Contreras068','2/4/2020','25'),
('AFlor59','Contreras068','2/4/2020','26');

-- P1)
SELECT username, fecha, ubicacion, descripcion
FROM publicacion
EXCEPT
SELECT p1.username, p1.fecha, p1.ubicacion, p1.descripcion
FROM publicacion p1, publicacion p2
WHERE p1.fecha > p2.fecha;

SELECT username, fecha, ubicacion, descripcion FROM publicacion
EXCEPT
SELECT p1.username, p1.fecha, p1.ubicacion, p1.descripcion
FROM publicacion p1 JOIN publicacion p2 ON p1.fecha > p2.fecha;

-- P2)
SELECT username, fecha, numerodearchivo
FROM Foto
EXCEPT
SELECT username, fecha, numerodearchivo
FROM Foto NATURAL JOIN Tag;

-- P3)
SELECT U1.link
FROM Usuario U1 NATURAL JOIN Personal P
WHERE P.privado = 'True';

-- P4)
SELECT *
FROM Comentario C1 JOIN (
        SELECT username, fecha
        FROM Publicacion
        WHERE username = 'FuentesA0597'
    ) P1 ON C1.username_publicacion = P1.username AND C1.fecha_publicacion = P1.fecha
WHERE C1.username_usuario = 'Clementien';

-- P5)
SELECT S1.username_seguido, S1.username_seguidor
FROM sigue S1 JOIN sigue S2
    ON S1.username_seguido = S2.username_seguidor
       AND S1.username_seguidor = S2.username_seguido;

-- P6)
SELECT username FROM usuario
EXCEPT
SELECT username_usuario FROM likee;

SELECT username FROM usuario
WHERE username NOT IN (
    SELECT username_usuario FROM likee
);

SELECT U.username
FROM usuario U
WHERE NOT EXISTS (
    SELECT L.username_usuario
    FROM likee L
    WHERE L.username_usuario = U.username
);

-- P7)
SELECT DISTINCT T1.username_usuario
FROM tag T1, publicacion P1
WHERE P1.ubicacion = 'Cl. Mariana Armenta # 4474 Piso 9' AND T1.fecha = P1.fecha AND T1.username_multimedia = P1.username;

-- P8)
SELECT *
FROM Comentario C JOIN (SELECT username, privado FROM personal WHERE privado = 'True') P on C.username_usuario = P.username
WHERE C.likes > 10;


