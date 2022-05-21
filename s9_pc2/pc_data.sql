-- CREATE SCHEMA petrogas;
set search_path to petrogas;
set datestyle=dmy;

CREATE TABLE combustible(
	nombre VARCHAR(20)
);


CREATE TABLE deposito (
	id varchar(4),
	dimension VARCHAR(10),
	capacidad int,
	abastecido int,
	combustible VARCHAR(20)
);
CREATE TABLE proveedor(
    placa VARCHAR(6),
    nrolicencia varchar(15) ,
    razonsocial varchar(255),
    origen varchar(255)
);
CREATE TABLE abastecimiento(
	nro bigint,
	fecha date,
	depositoId VARCHAR(15),
	placa VARCHAR(6),
	nrolicencia VARCHAR(10),
	cantidad DOUBLE PRECISION,
	precio DOUBLE PRECISION
);
CREATE TABLE despachador (
	nrodocumento VARCHAR(15),
	nombre varchar(255),
	sueldo int
);
CREATE TABLE cliente(
    nrodocumento varchar(15),
    nombre varchar(255) ,
    email varchar(255) ,
    phone varchar(100) ,
    direccion varchar(255)
);
CREATE TABLE surtidor (
	nroserie VARCHAR(12),
	lado VARCHAR(1),
	marca VARCHAR(15),
	depositoid varchar(4)
);

CREATE TABLE venta(
	nro bigint,
	nrodocumentocli VARCHAR(15),
	nrodocumentodes VARCHAR(15),
	nroserie VARCHAR(12),
	lado VARCHAR(1),
	fecha date,
	cantidad DOUBLE PRECISION,
	preciounitario DOUBLE PRECISION,
	montototal DOUBLE PRECISION
);

ALTER TABLE combustible ADD CONSTRAINT pk_combustible PRIMARY KEY (nombre);
ALTER TABLE deposito ADD CONSTRAINT pk_deposito PRIMARY KEY (id);
ALTER TABLE proveedor ADD CONSTRAINT pk_proveedor PRIMARY KEY (placa,nrolicencia);
ALTER TABLE abastecimiento ADD CONSTRAINT pk_abastece PRIMARY KEY (nro);
ALTER TABLE despachador ADD CONSTRAINT pk_despachador PRIMARY KEY (nrodocumento);
ALTER TABLE cliente ADD CONSTRAINT pk_cliente PRIMARY KEY (nrodocumento);
ALTER TABLE surtidor ADD CONSTRAINT pk_surtidor PRIMARY KEY (nroserie,lado );
ALTER TABLE venta ADD CONSTRAINT pk_venta PRIMARY KEY (nro);

ALTER TABLE deposito ADD CONSTRAINT fk_deposito_combustible FOREIGN KEY (combustible)
	REFERENCES combustible(nombre);
ALTER TABLE abastecimiento ADD CONSTRAINT fk_abastece_deposito FOREIGN KEY (depositoId)
	REFERENCES deposito(id);
ALTER TABLE abastecimiento ADD CONSTRAINT fk_abastece_proveedor FOREIGN KEY (placa,nrolicencia)
	REFERENCES proveedor(placa,nrolicencia);
ALTER TABLE surtidor ADD CONSTRAINT fk_surtidor_deposito FOREIGN KEY (depositoid)
	REFERENCES deposito(id);
ALTER TABLE venta ADD CONSTRAINT fk_venta_surtidor FOREIGN KEY (nroserie,lado)
	REFERENCES surtidor(nroserie,lado);
ALTER TABLE venta ADD CONSTRAINT fk_venta_cliente FOREIGN KEY (nrodocumentocli)
	REFERENCES cliente(nrodocumento);
ALTER TABLE venta ADD CONSTRAINT fk_venta_despachador FOREIGN KEY (nrodocumentodes)
	REFERENCES despachador(nrodocumento);

INSERT INTO combustible VALUES('GALOSINA 90');
INSERT INTO combustible VALUES('GALOSINA 95');
INSERT INTO combustible VALUES('GALOSINA 97');
INSERT INTO combustible VALUES('GAS GLP');
INSERT INTO combustible VALUES('GAS GNV');
INSERT INTO combustible VALUES('PETROLEO');

INSERT INTO proveedor (placa,nrolicencia,RazonSocial,Origen)
VALUES
  (8146,'29842530-0','Auctor Odio A Industries','Juliaca'),
  (9802,'22883671-0','Vestibulum Associates','Iquitos'),
  (2160,'30851798-5','Fermentum Inc.','Cusco'),
  (1336,'12823415-2','Nunc Limited','Sullana'),
  (9187,'20634470-9','Pellentesque Tellus Ltd','Huaral'),
  (9766,'20546520-0','Congue Associates','Chancay'),
  (9261,'4054348-1','Orci Ut Semper Foundation','Iquitos'),
  (5279,'47719968-2','Pellentesque Ut Ipsum Consulting','Juliaca'),
  (5393,'6141274-3','Urna Inc.','Arequipa'),
  (1756,'24118380-7','Posuere Limited','Talara'),
  (9047,'43951709-3','Sociis Natoque Penatibus Corp.','Iquitos'),
  (8313,'10223515-0','Euismod In PC','Juliaca'),
  (2658,'28862298-1','Nulla Aliquet Institute','Sicuani'),
  (5823,'23801769-6','Ultrices A Auctor Industries','Barranca'),
  (7131,'22434909-2','Iaculis Enim Sit Corp.','Iquitos'),
  (2427,'2129902-2','Laoreet Corporation','Juliaca'),
  (3588,'24313453-6','Morbi Neque Corp.','Puno'),
  (9415,'44377463-7','Aliquam Vulputate Ullamcorper Corp.','Arequipa'),
  (7493,'28407426-2','Dignissim Tempor LLC','Talara'),
  (8377,'47866465-6','Nibh Corp.','Tarma'),
  (6220,'28117217-4','Risus Donec Institute','Jaén'),
  (2793,'36528898-4','Neque Non PC','Juliaca'),
  (6167,'2551956-6','Phasellus Elit Associates','Chimbote'),
  (5737,'30813608-6','Ridiculus Company','Yurimaguas'),
  (8992,'22691980-5','Natoque Penatibus Foundation','Sullana'),
  (8749,'1063621-3','Dolor Dolor Incorporated','Catacaos'),
  (3460,'22508621-4','Nam LLC','Cajamarca'),
  (2957,'27805463-2','Donec Porttitor Tellus PC','Trujillo'),
  (2595,'2190179-2','Blandit Institute','Tarma'),
  (9085,'11565143-9','Ipsum Curabitur Company','Iquitos'),
  (3216,'3950298-4','Mattis Ornare Limited','Jaén'),
  (1772,'2327455-8','Ligula Aenean Ltd','Huancayo'),
  (4426,'25758554-9','Malesuada Industries','Chulucanas'),
  (1505,'49133697-8','Laoreet Libero Limited','Guadalupe'),
  (1635,'1856557-9','Id Inc.','Huacho'),
  (5815,'12904152-8','Quam Vel Associates','Huaraz'),
  (8483,'25185781-4','Vel Venenatis Vel LLC','Iquitos'),
  (3424,'26977993-4','Integer In Magna Associates','Jaén'),
  (2511,'17966331-7','Luctus Foundation','Lima'),
  (2807,'824940-7','Ante Dictum Corp.','San Vicente de Cañete'),
  (4204,'17658755-5','Tellus Faucibus Leo Inc.','San Vicente de Cañete'),
  (4206,'26480276-8','Sem Nulla Corp.','Cusco'),
  (6242,'25938771-K','Iaculis Aliquet Inc.','Lima'),
  (8567,'15550303-3','Bibendum Fermentum Inc.','Huaraz'),
  (2382,'3390920-9','Vel LLP','Barranca'),
  (2642,'45539686-7','Mattis Ornare Foundation','Cusco'),
  (9020,'49658787-1','Placerat Eget Venenatis Ltd','Huancayo'),
  (2795,'17951981-K','Euismod Foundation','Chancay'),
  (2506,'37552431-7','Pede Cras Corp.','Huancayo'),
  (7883,'3168104-9','Egestas Fusce Limited','Sicuani');

INSERT INTO deposito VALUES ('1','10x52x30',10000,0,'GALOSINA 90');
INSERT INTO deposito VALUES ('2','10x52x30',3000,0,'GALOSINA 95');
INSERT INTO deposito VALUES ('3','10x52x30',5000,0,'GALOSINA 97');
INSERT INTO deposito VALUES ('4','10x52x30',5000,0,'GAS GLP');
INSERT INTO deposito VALUES ('5','10x52x30',5000,0,'GAS GNV');
INSERT INTO deposito VALUES ('6','10x52x30',5000,0,'PETROLEO');

INSERT INTO despachador (nrodocumento,nombre,sueldo)
VALUES
  ('42396509-6','Ila Stein',7328),
  ('6183303-K','Daquan Moran',9548),
  ('23819125-4','Lucy Hooper',3771),
  ('24180587-5','Otto Alston',2026),
  ('47232966-9','Gretchen Buck',4315),
  ('14315947-7','Griffin West',6154),
  ('46566450-9','Phyllis Coleman',7353),
  ('29374931-0','Brian Hurley',6544),
  ('18567395-2','Deirdre England',4241),
  ('45421301-7','Gary Wooten',1481),
  ('8402711-1','Keegan Velasquez',4217),
  ('14519212-9','Stewart Benjamin',3581),
  ('32531450-8','Wang Gallegos',2935),
  ('20237862-5','Jason Mitchell',8249),
  ('4810357-K','Kyra Gross',6453);

INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('10617926-3','Fiona Webster','elementum@icloud.org','015-947-7508','Ap #726-1702 Integer Rd.'),
  ('16754787-7','Irene Jensen','egestas@outlook.com','049-231-3150','Ap #765-6615 Donec Ave'),
  ('43658690-6','Tamara Cummings','quisque.purus.sapien@protonmail.org','050-783-5346','839-2637 In St.'),
  ('38573307-0','Nolan Copeland','dictum@protonmail.edu','094-081-4831','517-7624 Vivamus Street'),
  ('20470883-5','Nissim Benjamin','id.risus.quis@hotmail.couk','036-566-1117','4858 Integer Avenue'),
  ('36878394-3','Mira Kelly','et.pede.nunc@outlook.couk','084-390-6022','583-5259 Vestibulum St.'),
  ('41679145-7','Brittany Glass','integer@hotmail.com','079-974-2964','P.O. Box 477, 6827 Et Avenue'),
  ('45418521-8','Hakeem Valentine','et@icloud.org','075-378-3777','8956 Non Rd.'),
  ('21270853-4','Summer Dean','amet.massa@outlook.ca','082-491-8844','Ap #621-6134 Eu St.'),
  ('40710376-9','Kimberly Mullins','metus@hotmail.edu','074-131-8711','Ap #183-7412 Donec Rd.'),
  ('6912960-9','Dante Short','orci@aol.ca','009-485-6171','Ap #466-5798 Pede. Street'),
  ('48137357-3','Calvin Brady','ultricies.sem@outlook.couk','028-208-4841','Ap #447-9905 Eu Avenue'),
  ('45353607-6','Dean Francis','est.mauris@yahoo.net','025-518-8318','P.O. Box 656, 4886 Luctus St.'),
  ('48165122-0','Hanna Mcguire','feugiat.placerat@outlook.edu','027-951-3169','338-8049 Elit, Rd.'),
  ('21306253-0','Debra Keller','egestas.lacinia@aol.couk','097-761-2289','Ap #346-239 Convallis St.'),
  ('27800142-3','Harlan Torres','phasellus.libero.mauris@yahoo.com','056-100-8758','288-1521 Mollis Av.'),
  ('33544200-8','Reed Warner','aliquet.vel.vulputate@yahoo.ca','037-474-5492','Ap #406-8878 Neque Ave'),
  ('43172949-0','Kieran Campos','at.auctor@hotmail.net','044-998-1679','Ap #910-7164 Sed Av.'),
  ('4789885-4','Madeline Morin','lorem.lorem@yahoo.couk','064-540-0851','392-216 Nam Road'),
  ('29714361-1','Calvin Christensen','ut@aol.com','087-627-8635','Ap #492-7880 Dui, Rd.'),
  ('29664964-3','Sylvia Herman','sed.sem@hotmail.edu','026-547-4455','Ap #537-3794 Donec Rd.'),
  ('28254157-2','Jared Booth','nisi.dictum.augue@hotmail.couk','055-946-2866','103-8486 Nec Street'),
  ('16273853-4','Naida Hoffman','nulla.facilisi@aol.org','027-632-3874','Ap #234-7560 Lacinia. Street'),
  ('48210322-7','Whilemina Walsh','vitae.risus@outlook.ca','051-827-8530','Ap #175-4148 Non, Av.'),
  ('6582422-1','Wallace Phillips','ac@google.edu','085-732-8214','522-715 Etiam Road'),
  ('34706394-0','Lisandra Lynn','tellus.phasellus.elit@yahoo.net','003-747-7273','4090 Fames Avenue'),
  ('8787339-0','Jaden Saunders','interdum@aol.ca','095-910-4187','Ap #694-7629 Lorem Avenue'),
  ('47276939-1','Gil Sanchez','diam.dictum@outlook.couk','018-168-3591','458-7908 Tincidunt Street'),
  ('33835374-K','Desiree Bridges','felis.ullamcorper@outlook.org','087-320-1886','P.O. Box 482, 4684 Lorem St.'),
  ('366394-9','Xyla O''connor','sed.hendrerit.a@outlook.edu','058-268-5290','526-5973 Ipsum Rd.'),
  ('17879838-3','William Ryan','in.molestie@hotmail.edu','041-418-3134','Ap #484-4457 Erat Ave'),
  ('14594521-6','Melyssa Carson','lorem.lorem@aol.ca','082-572-6678','P.O. Box 185, 4970 Iaculis Ave'),
  ('29350309-5','Basia Callahan','enim.nec@hotmail.com','031-516-4211','6659 Orci. St.'),
  ('1779629-1','Kirk Riddle','nunc.in@hotmail.net','094-836-1246','P.O. Box 965, 7552 Elit Ave'),
  ('48630823-0','Leandra Hess','leo.morbi.neque@outlook.couk','076-188-6201','5551 Nam St.'),
  ('7533270-K','Yoshio Watson','ornare@outlook.ca','095-328-7462','5130 Mollis. Rd.'),
  ('46162832-K','Lucius Harper','et.netus@outlook.couk','060-860-8373','Ap #628-9630 Blandit Ave'),
  ('43870612-7','Hector Stewart','aliquam.tincidunt@hotmail.ca','024-391-4704','P.O. Box 652, 3163 Nam Rd.'),
  ('31794996-0','Owen Williamson','quisque.imperdiet@google.com','054-429-5725','Ap #451-895 Lobortis Avenue'),
  ('38699872-8','Tate Mathews','eget.ipsum.suspendisse@outlook.couk','039-471-8365','142-5499 Nisi Rd.'),
  ('22948447-8','Ainsley Webb','aliquet.magna.a@yahoo.ca','026-457-3367','Ap #487-3741 Sed Rd.'),
  ('37945101-2','Minerva Strickland','ornare.egestas@google.com','001-112-4151','727-759 Vitae St.'),
  ('3682499-9','Colorado Hernandez','diam.at@outlook.org','020-118-6393','2289 Elit. Road'),
  ('26709845-K','Tanek Carson','ligula.tortor@aol.net','046-977-8734','791-9963 Mauris Avenue'),
  ('22313552-8','Richard Avery','amet.lorem@outlook.couk','035-336-6561','Ap #689-2987 Elit St.'),
  ('35944733-7','Salvador Rutledge','hendrerit.a@outlook.edu','088-468-7245','2247 Proin Rd.'),
  ('28347312-0','Michael Pope','fringilla.cursus@aol.ca','062-280-7884','P.O. Box 958, 3966 Mattis. Ave'),
  ('17567351-2','Jarrod Mccullough','nec.malesuada@icloud.com','080-662-7904','792-7895 Phasellus Ave'),
  ('11597470-K','Emmanuel Oneil','non@yahoo.org','070-221-1364','Ap #980-464 Fringilla. Street'),
  ('26716838-5','Kylynn Conrad','et.nunc@yahoo.edu','001-613-2768','6382 Fames Av.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('4499425-9','Michael Cantu','mauris.ut@hotmail.edu','077-218-4865','Ap #795-2812 Diam. Street'),
  ('19271288-2','Bert Mccray','accumsan.interdum@aol.couk','061-856-6783','P.O. Box 555, 8403 Ridiculus St.'),
  ('5680886-8','Wang Goodwin','mi.enim@yahoo.com','002-834-6542','1907 Posuere Av.'),
  ('4685879-4','Delilah O''brien','ut.ipsum@aol.edu','071-682-3335','Ap #305-241 Lorem Rd.'),
  ('18513792-9','Amanda Cohen','non.luctus@google.net','011-652-6481','5090 Enim. Rd.'),
  ('15663741-6','Rahim Galloway','sed@aol.com','068-181-2414','Ap #215-8764 Fringilla, Av.'),
  ('31772728-3','Baker Garner','libero@icloud.org','077-551-7618','P.O. Box 241, 531 Est Av.'),
  ('22660782-K','Nathan Russo','diam@hotmail.com','096-480-5169','Ap #717-5159 In St.'),
  ('19124581-4','Jack Weber','quis@google.org','004-612-7976','Ap #398-8955 Nunc. St.'),
  ('28178116-2','Devin Stephenson','pellentesque@icloud.ca','016-311-7882','P.O. Box 142, 1503 Nulla Street'),
  ('25633949-8','Wyatt Freeman','pede.et@aol.org','017-472-8248','972-5618 Sem St.'),
  ('49296302-K','Kevin Fleming','maecenas@hotmail.org','078-195-6410','P.O. Box 213, 2629 Risus. Street'),
  ('7664889-1','Colin Lamb','dignissim.lacus.aliquam@icloud.org','085-351-2534','Ap #750-3708 Euismod St.'),
  ('1741449-6','Luke Jarvis','sed.dolor@yahoo.ca','077-638-6247','Ap #118-8912 Sapien Ave'),
  ('2748213-9','Germane Phillips','a.facilisis@protonmail.ca','037-655-0149','P.O. Box 207, 6713 Vestibulum Avenue'),
  ('10826186-2','Amity Mason','sed@aol.edu','042-536-3990','1623 Nunc Road'),
  ('3438400-2','Charde Cantu','sit.amet.risus@icloud.net','044-322-7720','951-3141 Ullamcorper. Avenue'),
  ('9994880-9','Aaron Alvarado','sociis@aol.couk','029-677-9937','7349 Phasellus Ave'),
  ('32865337-0','Maya Chaney','donec.tempus@aol.ca','046-440-3257','9910 At Rd.'),
  ('37849952-6','Leah Lee','diam.dictum@google.com','067-118-2983','Ap #200-2769 Orci, Av.'),
  ('8917582-8','Jermaine Mcpherson','ridiculus.mus@outlook.net','087-154-7454','476-7566 Enim. Av.'),
  ('7992294-3','Jermaine Stephens','dolor.egestas@aol.com','075-671-3259','414-7139 Dignissim Rd.'),
  ('659110-8','September Richards','eu.dolor@outlook.org','021-435-7739','6143 Nullam Av.'),
  ('18766252-4','Mari Holt','ultrices.sit.amet@aol.ca','012-831-4668','Ap #297-2133 Felis Road'),
  ('22305414-5','Jameson Craig','vestibulum.accumsan@aol.net','008-243-2546','135-8689 Arcu. Ave'),
  ('28681326-7','Sade Gomez','magna.lorem@google.edu','069-662-2628','P.O. Box 579, 2370 Semper Rd.'),
  ('12800750-4','Otto Hendricks','lacus.varius@outlook.org','039-848-1747','Ap #432-5142 Congue, St.'),
  ('43509564-K','Cecilia Patrick','id.ante@google.com','051-528-0663','776-6480 Enim St.'),
  ('24176673-K','Lamar Hopkins','accumsan@google.edu','097-952-7338','Ap #561-5306 Mollis Ave'),
  ('9454867-5','Brendan Lindsay','metus@aol.org','032-585-1863','Ap #139-8058 Iaculis Rd.'),
  ('30577989-K','Jonas Matthews','sed.dui@hotmail.edu','011-648-6738','Ap #439-6503 Donec St.'),
  ('26612311-6','Asher Serrano','in.consequat.enim@yahoo.couk','045-323-3347','Ap #543-7728 Donec Rd.'),
  ('38445393-7','Slade Warren','elit.pellentesque@google.couk','040-118-8466','144-9033 Fermentum Ave'),
  ('13282297-2','Lael Alford','ut.molestie@google.ca','081-544-3525','946-7590 Dolor Street'),
  ('1716359-0','Adara Alston','nisl.quisque@aol.couk','043-076-4345','673-9866 In St.'),
  ('20504888-K','Illana Vaughn','egestas.a@aol.net','035-801-8224','Ap #890-4409 Et Street'),
  ('38685858-6','Ralph Baker','sit.amet.ultricies@google.couk','077-555-6281','Ap #593-1532 Odio Av.'),
  ('35669888-6','Kalia Patterson','ac.metus@google.net','045-962-6847','P.O. Box 936, 1302 Rutrum Av.'),
  ('16820896-0','Judith Gallegos','quam.dignissim.pharetra@icloud.org','057-949-1168','Ap #839-6419 Urna Av.'),
  ('77629-7','Tyler Cain','senectus.et@icloud.ca','042-888-1463','P.O. Box 704, 8278 Orci. Ave'),
  ('36787845-2','Kameko Slater','accumsan.convallis@google.com','079-413-6444','Ap #335-8575 A, Avenue'),
  ('44974580-9','Martha Mcintosh','accumsan@aol.net','045-297-5184','P.O. Box 736, 2517 Malesuada St.'),
  ('30936921-1','Jonas Riley','tincidunt.dui@protonmail.edu','051-535-3069','Ap #916-7490 Aliquam Street'),
  ('26810372-4','Rhoda Mathews','erat.sed.nunc@protonmail.org','031-856-5838','Ap #709-3355 Amet, St.'),
  ('49941275-4','Veronica Barry','mi@yahoo.couk','053-436-4421','852-8497 Libero Av.'),
  ('25291221-5','Axel Snider','aliquam.fringilla.cursus@google.com','077-873-4773','728-4882 Malesuada Av.'),
  ('15516900-1','Lillith Beard','semper.egestas@google.couk','075-020-3084','6726 Rutrum, Rd.'),
  ('27774169-5','Sonya Cain','pellentesque.ultricies@hotmail.ca','046-274-8620','P.O. Box 134, 9527 Aliquam Ave'),
  ('27714165-5','Kamal Ratliff','scelerisque.lorem@google.edu','080-010-9619','694-2122 Nascetur Avenue'),
  ('3976702-3','Justina Coleman','et.eros@yahoo.org','017-685-6858','P.O. Box 438, 5270 Curabitur Av.');

INSERT INTO surtidor VALUES('S001','A','DESCONOCIDO','1');
INSERT INTO surtidor VALUES('S001','B','DESCONOCIDO','1');
INSERT INTO surtidor VALUES('S002','A','DESCONOCIDO','2');
INSERT INTO surtidor VALUES('S002','B','DESCONOCIDO','2');
INSERT INTO surtidor VALUES('S003','A','DESCONOCIDO','3');
INSERT INTO surtidor VALUES('S003','B','DESCONOCIDO','3');
INSERT INTO surtidor VALUES('S004','A','DESCONOCIDO','4');
INSERT INTO surtidor VALUES('S004','B','DESCONOCIDO','4');
INSERT INTO surtidor VALUES('S005','A','DESCONOCIDO','5');
INSERT INTO surtidor VALUES('S005','B','DESCONOCIDO','5');

INSERT INTO abastecimiento VALUES (1,'06/12/2020',4,8146,'29842530-0',163,11);
INSERT INTO abastecimiento VALUES (2,'16/04/2020',5,9802,'22883671-0',355,15);
INSERT INTO abastecimiento VALUES (3,'09/03/2020',6,2160,'30851798-5',492,11);
INSERT INTO abastecimiento VALUES (4,'01/03/2020',4,1336,'12823415-2',458,10);
INSERT INTO abastecimiento VALUES (5,'11/06/2021',4,9187,'20634470-9',374,14);
INSERT INTO abastecimiento VALUES (6,'20/03/2021',6,9766,'20546520-0',297,14);
INSERT INTO abastecimiento VALUES (7,'08/07/2021',1,9261,'4054348-1',131,10);
INSERT INTO abastecimiento VALUES (8,'06/11/2020',6,5279,'47719968-2',165,12);
INSERT INTO abastecimiento VALUES (9,'17/10/2021',2,5393,'6141274-3',375,13);
INSERT INTO abastecimiento VALUES (10,'26/10/2020',6,1756,'24118380-7',210,12);
INSERT INTO abastecimiento VALUES (11,'27/03/2020',1,9047,'43951709-3',384,11);
INSERT INTO abastecimiento VALUES (12,'03/02/2021',2,8313,'10223515-0',345,13);
INSERT INTO abastecimiento VALUES (13,'12/10/2021',4,2658,'28862298-1',379,15);
INSERT INTO abastecimiento VALUES (14,'29/06/2021',6,5823,'23801769-6',327,14);
INSERT INTO abastecimiento VALUES (15,'25/11/2020',4,7131,'22434909-2',203,12);
INSERT INTO abastecimiento VALUES (16,'28/07/2021',3,2427,'2129902-2',496,12);
INSERT INTO abastecimiento VALUES (17,'31/10/2021',3,3588,'24313453-6',267,12);
INSERT INTO abastecimiento VALUES (18,'21/02/2021',5,9415,'44377463-7',162,11);
INSERT INTO abastecimiento VALUES (19,'25/07/2021',3,7493,'28407426-2',448,10);
INSERT INTO abastecimiento VALUES (20,'14/12/2020',5,8377,'47866465-6',462,15);
INSERT INTO abastecimiento VALUES (21,'16/07/2021',3,6220,'28117217-4',420,10);
INSERT INTO abastecimiento VALUES (22,'13/10/2020',3,2793,'36528898-4',365,14);
INSERT INTO abastecimiento VALUES (23,'31/08/2021',6,6167,'2551956-6',232,15);
INSERT INTO abastecimiento VALUES (24,'17/03/2021',5,5737,'30813608-6',226,11);
INSERT INTO abastecimiento VALUES (25,'25/05/2020',6,8992,'22691980-5',355,10);
INSERT INTO abastecimiento VALUES (26,'02/09/2021',3,8749,'1063621-3',225,13);
INSERT INTO abastecimiento VALUES (27,'16/11/2020',5,3460,'22508621-4',117,11);
INSERT INTO abastecimiento VALUES (28,'08/10/2021',4,2957,'27805463-2',120,14);
INSERT INTO abastecimiento VALUES (29,'14/05/2021',5,2595,'2190179-2',478,10);
INSERT INTO abastecimiento VALUES (30,'14/08/2020',3,9085,'11565143-9',466,12);
INSERT INTO abastecimiento VALUES (31,'05/04/2020',3,3216,'3950298-4',497,11);
INSERT INTO abastecimiento VALUES (32,'09/06/2020',6,1772,'2327455-8',194,12);
INSERT INTO abastecimiento VALUES (33,'29/01/2020',6,4426,'25758554-9',193,15);
INSERT INTO abastecimiento VALUES (34,'17/10/2021',4,1505,'49133697-8',269,14);
INSERT INTO abastecimiento VALUES (35,'22/01/2020',4,1635,'1856557-9',272,15);
INSERT INTO abastecimiento VALUES (36,'09/08/2021',2,5815,'12904152-8',413,15);
INSERT INTO abastecimiento VALUES (37,'04/09/2020',1,8483,'25185781-4',461,11);
INSERT INTO abastecimiento VALUES (38,'16/01/2021',3,3424,'26977993-4',159,10);
INSERT INTO abastecimiento VALUES (39,'14/07/2021',6,2511,'17966331-7',433,14);
INSERT INTO abastecimiento VALUES (40,'09/05/2021',6,2807,'824940-7',287,10);
INSERT INTO abastecimiento VALUES (41,'29/02/2020',3,4204,'17658755-5',478,10);
INSERT INTO abastecimiento VALUES (42,'16/03/2021',2,4206,'26480276-8',114,13);
INSERT INTO abastecimiento VALUES (43,'10/05/2021',4,6242,'25938771-K',346,15);
INSERT INTO abastecimiento VALUES (44,'27/06/2021',5,8567,'15550303-3',355,11);
INSERT INTO abastecimiento VALUES (45,'02/11/2021',5,2382,'3390920-9',117,10);
INSERT INTO abastecimiento VALUES (46,'13/05/2021',1,2642,'45539686-7',315,15);
INSERT INTO abastecimiento VALUES (47,'04/10/2020',5,9020,'49658787-1',490,15);
INSERT INTO abastecimiento VALUES (48,'28/04/2020',2,2795,'17951981-K',367,15);
INSERT INTO abastecimiento VALUES (49,'11/05/2020',3,2506,'37552431-7',286,13);
INSERT INTO abastecimiento VALUES (50,'22/06/2021',4,7883,'3168104-9',263,11);
INSERT INTO abastecimiento VALUES (51,'19/05/2021',4,8146,'29842530-0',149,14);
INSERT INTO abastecimiento VALUES (52,'17/09/2020',1,9802,'22883671-0',180,10);
INSERT INTO abastecimiento VALUES (53,'03/01/2020',3,2160,'30851798-5',342,10);
INSERT INTO abastecimiento VALUES (54,'06/09/2021',4,1336,'12823415-2',493,10);
INSERT INTO abastecimiento VALUES (55,'25/10/2020',2,9187,'20634470-9',476,12);
INSERT INTO abastecimiento VALUES (56,'05/12/2021',3,9766,'20546520-0',418,15);
INSERT INTO abastecimiento VALUES (57,'21/09/2020',5,9261,'4054348-1',278,15);
INSERT INTO abastecimiento VALUES (58,'03/09/2020',1,5279,'47719968-2',190,11);
INSERT INTO abastecimiento VALUES (59,'06/08/2021',3,5393,'6141274-3',399,14);
INSERT INTO abastecimiento VALUES (60,'23/03/2021',5,1756,'24118380-7',258,12);
INSERT INTO abastecimiento VALUES (61,'31/05/2020',1,9047,'43951709-3',273,13);
INSERT INTO abastecimiento VALUES (62,'10/01/2021',3,8313,'10223515-0',123,11);
INSERT INTO abastecimiento VALUES (63,'24/06/2021',2,2658,'28862298-1',254,10);
INSERT INTO abastecimiento VALUES (64,'10/03/2021',4,5823,'23801769-6',209,14);
INSERT INTO abastecimiento VALUES (65,'13/06/2021',2,7131,'22434909-2',198,13);
INSERT INTO abastecimiento VALUES (66,'25/11/2021',3,2427,'2129902-2',496,11);
INSERT INTO abastecimiento VALUES (67,'29/09/2021',4,3588,'24313453-6',344,12);
INSERT INTO abastecimiento VALUES (68,'09/09/2021',2,9415,'44377463-7',453,13);
INSERT INTO abastecimiento VALUES (69,'22/09/2020',6,7493,'28407426-2',386,10);
INSERT INTO abastecimiento VALUES (70,'10/10/2020',1,8377,'47866465-6',482,15);
INSERT INTO abastecimiento VALUES (71,'26/11/2021',2,6220,'28117217-4',467,11);
INSERT INTO abastecimiento VALUES (72,'08/03/2020',5,2793,'36528898-4',105,15);
INSERT INTO abastecimiento VALUES (73,'01/03/2021',4,6167,'2551956-6',436,15);
INSERT INTO abastecimiento VALUES (74,'08/06/2021',3,5737,'30813608-6',370,14);
INSERT INTO abastecimiento VALUES (75,'05/01/2021',4,8992,'22691980-5',371,12);
INSERT INTO abastecimiento VALUES (76,'23/08/2020',5,8749,'1063621-3',447,11);
INSERT INTO abastecimiento VALUES (77,'06/10/2020',6,3460,'22508621-4',267,14);
INSERT INTO abastecimiento VALUES (78,'02/05/2021',4,2957,'27805463-2',386,10);
INSERT INTO abastecimiento VALUES (79,'02/02/2021',4,2595,'2190179-2',115,12);
INSERT INTO abastecimiento VALUES (80,'12/10/2021',1,9085,'11565143-9',280,11);
INSERT INTO abastecimiento VALUES (81,'22/05/2021',2,3216,'3950298-4',465,13);
INSERT INTO abastecimiento VALUES (82,'19/08/2021',5,1772,'2327455-8',448,15);
INSERT INTO abastecimiento VALUES (83,'03/01/2021',2,4426,'25758554-9',130,10);
INSERT INTO abastecimiento VALUES (84,'09/01/2021',6,1505,'49133697-8',443,13);
INSERT INTO abastecimiento VALUES (85,'20/08/2020',2,1635,'1856557-9',406,10);
INSERT INTO abastecimiento VALUES (86,'05/07/2021',4,5815,'12904152-8',293,11);
INSERT INTO abastecimiento VALUES (87,'19/12/2021',6,8483,'25185781-4',162,13);
INSERT INTO abastecimiento VALUES (88,'29/01/2020',3,3424,'26977993-4',158,13);
INSERT INTO abastecimiento VALUES (89,'29/11/2020',2,2511,'17966331-7',396,10);
INSERT INTO abastecimiento VALUES (90,'22/05/2021',3,2807,'824940-7',102,10);
INSERT INTO abastecimiento VALUES (91,'08/08/2020',5,4204,'17658755-5',159,12);
INSERT INTO abastecimiento VALUES (92,'26/10/2021',3,4206,'26480276-8',106,14);
INSERT INTO abastecimiento VALUES (93,'16/02/2020',2,6242,'25938771-K',421,13);
INSERT INTO abastecimiento VALUES (94,'24/08/2020',5,8567,'15550303-3',343,14);
INSERT INTO abastecimiento VALUES (95,'30/03/2021',6,2382,'3390920-9',361,13);
INSERT INTO abastecimiento VALUES (96,'12/02/2021',5,2642,'45539686-7',365,11);
INSERT INTO abastecimiento VALUES (97,'04/06/2020',1,9020,'49658787-1',461,11);
INSERT INTO abastecimiento VALUES (98,'03/11/2021',4,2795,'17951981-K',222,15);
INSERT INTO abastecimiento VALUES (99,'11/04/2020',4,2506,'37552431-7',366,10);
INSERT INTO abastecimiento VALUES (100,'30/06/2021',1,7883,'3168104-9',426,11);
INSERT INTO abastecimiento VALUES (101,'12/05/2020',5,8146,'29842530-0',379,14);
INSERT INTO abastecimiento VALUES (102,'06/05/2020',4,9802,'22883671-0',212,11);
INSERT INTO abastecimiento VALUES (103,'02/09/2020',5,2160,'30851798-5',375,15);
INSERT INTO abastecimiento VALUES (104,'31/12/2020',5,1336,'12823415-2',438,12);
INSERT INTO abastecimiento VALUES (105,'10/02/2021',5,9187,'20634470-9',280,15);
INSERT INTO abastecimiento VALUES (106,'10/02/2020',2,9766,'20546520-0',462,15);
INSERT INTO abastecimiento VALUES (107,'12/02/2020',1,9261,'4054348-1',366,11);
INSERT INTO abastecimiento VALUES (108,'06/12/2020',1,5279,'47719968-2',407,13);
INSERT INTO abastecimiento VALUES (109,'09/10/2020',5,5393,'6141274-3',190,11);
INSERT INTO abastecimiento VALUES (110,'31/07/2021',1,1756,'24118380-7',367,13);
INSERT INTO abastecimiento VALUES (111,'03/04/2021',6,9047,'43951709-3',438,15);
INSERT INTO abastecimiento VALUES (112,'22/04/2021',3,8313,'10223515-0',380,10);
INSERT INTO abastecimiento VALUES (113,'13/07/2020',2,2658,'28862298-1',489,10);
INSERT INTO abastecimiento VALUES (114,'16/09/2020',3,5823,'23801769-6',190,14);
INSERT INTO abastecimiento VALUES (115,'12/06/2021',3,7131,'22434909-2',485,15);
INSERT INTO abastecimiento VALUES (116,'03/06/2020',6,2427,'2129902-2',362,10);
INSERT INTO abastecimiento VALUES (117,'14/05/2020',5,3588,'24313453-6',197,14);
INSERT INTO abastecimiento VALUES (118,'14/09/2020',4,9415,'44377463-7',136,13);
INSERT INTO abastecimiento VALUES (119,'17/03/2020',6,7493,'28407426-2',416,14);
INSERT INTO abastecimiento VALUES (120,'04/04/2021',3,8377,'47866465-6',359,10);
INSERT INTO abastecimiento VALUES (121,'18/12/2021',2,6220,'28117217-4',493,15);
INSERT INTO abastecimiento VALUES (122,'26/04/2020',6,2793,'36528898-4',362,13);
INSERT INTO abastecimiento VALUES (123,'08/12/2020',3,6167,'2551956-6',354,15);
INSERT INTO abastecimiento VALUES (124,'03/03/2021',1,5737,'30813608-6',312,15);
INSERT INTO abastecimiento VALUES (125,'16/10/2021',5,8992,'22691980-5',389,15);
INSERT INTO abastecimiento VALUES (126,'10/07/2020',1,8749,'1063621-3',462,14);
INSERT INTO abastecimiento VALUES (127,'20/05/2021',1,3460,'22508621-4',200,15);
INSERT INTO abastecimiento VALUES (128,'09/08/2021',5,2957,'27805463-2',188,13);
INSERT INTO abastecimiento VALUES (129,'17/05/2021',6,2595,'2190179-2',426,15);
INSERT INTO abastecimiento VALUES (130,'29/06/2020',3,9085,'11565143-9',484,12);
INSERT INTO abastecimiento VALUES (131,'13/05/2020',1,3216,'3950298-4',363,10);
INSERT INTO abastecimiento VALUES (132,'08/07/2021',5,1772,'2327455-8',352,12);
INSERT INTO abastecimiento VALUES (133,'09/01/2021',1,4426,'25758554-9',375,10);
INSERT INTO abastecimiento VALUES (134,'04/03/2021',1,1505,'49133697-8',173,13);
INSERT INTO abastecimiento VALUES (135,'23/06/2020',1,1635,'1856557-9',416,13);
INSERT INTO abastecimiento VALUES (136,'17/03/2021',6,5815,'12904152-8',230,15);
INSERT INTO abastecimiento VALUES (137,'12/10/2021',5,8483,'25185781-4',329,12);
INSERT INTO abastecimiento VALUES (138,'06/12/2020',6,3424,'26977993-4',381,14);
INSERT INTO abastecimiento VALUES (139,'13/07/2021',2,2511,'17966331-7',143,14);
INSERT INTO abastecimiento VALUES (140,'26/10/2020',2,2807,'824940-7',419,14);
INSERT INTO abastecimiento VALUES (141,'25/03/2021',2,4204,'17658755-5',457,10);
INSERT INTO abastecimiento VALUES (142,'02/07/2021',5,4206,'26480276-8',213,10);
INSERT INTO abastecimiento VALUES (143,'26/04/2020',1,6242,'25938771-K',151,14);
INSERT INTO abastecimiento VALUES (144,'29/05/2021',6,8567,'15550303-3',325,10);
INSERT INTO abastecimiento VALUES (145,'08/12/2020',1,2382,'3390920-9',243,14);
INSERT INTO abastecimiento VALUES (146,'30/11/2021',2,2642,'45539686-7',294,10);
INSERT INTO abastecimiento VALUES (147,'22/11/2021',6,9020,'49658787-1',217,13);
INSERT INTO abastecimiento VALUES (148,'27/07/2020',6,2795,'17951981-K',113,15);
INSERT INTO abastecimiento VALUES (149,'15/11/2020',1,2506,'37552431-7',349,15);
INSERT INTO abastecimiento VALUES (150,'07/08/2021',2,7883,'3168104-9',167,10);
INSERT INTO abastecimiento VALUES (151,'27/11/2021',6,8146,'29842530-0',371,14);
INSERT INTO abastecimiento VALUES (152,'10/03/2020',3,9802,'22883671-0',292,13);
INSERT INTO abastecimiento VALUES (153,'16/03/2021',3,2160,'30851798-5',398,10);
INSERT INTO abastecimiento VALUES (154,'01/05/2021',1,1336,'12823415-2',293,12);
INSERT INTO abastecimiento VALUES (155,'02/06/2020',5,9187,'20634470-9',101,12);
INSERT INTO abastecimiento VALUES (156,'08/12/2020',4,9766,'20546520-0',103,14);
INSERT INTO abastecimiento VALUES (157,'14/12/2021',1,9261,'4054348-1',184,11);
INSERT INTO abastecimiento VALUES (158,'20/03/2021',1,5279,'47719968-2',194,13);
INSERT INTO abastecimiento VALUES (159,'01/03/2020',4,5393,'6141274-3',104,13);
INSERT INTO abastecimiento VALUES (160,'17/06/2021',2,1756,'24118380-7',406,12);
INSERT INTO abastecimiento VALUES (161,'08/12/2021',2,9047,'43951709-3',362,10);
INSERT INTO abastecimiento VALUES (162,'18/08/2021',6,8313,'10223515-0',220,15);
INSERT INTO abastecimiento VALUES (163,'05/01/2020',1,2658,'28862298-1',332,10);
INSERT INTO abastecimiento VALUES (164,'11/06/2021',5,5823,'23801769-6',393,14);
INSERT INTO abastecimiento VALUES (165,'15/03/2021',1,7131,'22434909-2',475,14);
INSERT INTO abastecimiento VALUES (166,'24/10/2021',6,2427,'2129902-2',351,15);
INSERT INTO abastecimiento VALUES (167,'09/04/2020',5,3588,'24313453-6',286,13);
INSERT INTO abastecimiento VALUES (168,'17/07/2020',1,9415,'44377463-7',384,13);
INSERT INTO abastecimiento VALUES (169,'05/10/2020',6,7493,'28407426-2',169,11);
INSERT INTO abastecimiento VALUES (170,'08/05/2021',2,8377,'47866465-6',246,14);
INSERT INTO abastecimiento VALUES (171,'27/07/2020',5,6220,'28117217-4',398,14);
INSERT INTO abastecimiento VALUES (172,'29/09/2021',5,2793,'36528898-4',428,10);
INSERT INTO abastecimiento VALUES (173,'17/03/2020',4,6167,'2551956-6',496,13);
INSERT INTO abastecimiento VALUES (174,'06/06/2020',4,5737,'30813608-6',209,12);
INSERT INTO abastecimiento VALUES (175,'21/11/2021',3,8992,'22691980-5',141,10);
INSERT INTO abastecimiento VALUES (176,'16/04/2021',3,8749,'1063621-3',267,12);
INSERT INTO abastecimiento VALUES (177,'26/03/2020',3,3460,'22508621-4',407,11);
INSERT INTO abastecimiento VALUES (178,'14/04/2021',2,2957,'27805463-2',258,15);
INSERT INTO abastecimiento VALUES (179,'09/02/2020',1,2595,'2190179-2',209,12);
INSERT INTO abastecimiento VALUES (180,'11/07/2020',3,9085,'11565143-9',456,13);
INSERT INTO abastecimiento VALUES (181,'05/12/2021',4,3216,'3950298-4',150,11);
INSERT INTO abastecimiento VALUES (182,'03/11/2020',1,1772,'2327455-8',440,10);
INSERT INTO abastecimiento VALUES (183,'24/05/2020',4,4426,'25758554-9',401,14);
INSERT INTO abastecimiento VALUES (184,'05/11/2020',2,1505,'49133697-8',418,14);
INSERT INTO abastecimiento VALUES (185,'26/03/2020',3,1635,'1856557-9',269,11);
INSERT INTO abastecimiento VALUES (186,'25/05/2021',6,5815,'12904152-8',321,14);
INSERT INTO abastecimiento VALUES (187,'13/02/2020',4,8483,'25185781-4',462,11);
INSERT INTO abastecimiento VALUES (188,'02/03/2020',2,3424,'26977993-4',395,13);
INSERT INTO abastecimiento VALUES (189,'01/10/2021',6,2511,'17966331-7',192,14);
INSERT INTO abastecimiento VALUES (190,'23/01/2021',3,2807,'824940-7',112,13);
INSERT INTO abastecimiento VALUES (191,'19/09/2020',3,4204,'17658755-5',113,11);


INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('2843191-0','MacKensie Baker','duis.a@protonmail.org','018-751-7084','Ap #858-361 Egestas St.'),
  ('29362748-7','Risa Holloway','nunc@icloud.org','048-266-2237','Ap #763-2734 Nunc. Avenue'),
  ('7265698-9','Alea Berg','nunc.quisque@protonmail.org','077-305-8526','991-3761 Dolor St.'),
  ('33101952-6','Uta Espinoza','id@google.com','045-871-5662','511-1884 Malesuada Rd.'),
  ('49867216-7','Nichole Petty','ligula@aol.couk','032-538-2113','742-1729 Euismod Rd.'),
  ('5420466-3','Katell Herman','risus.duis.a@yahoo.edu','012-641-8560','3516 Enim Rd.'),
  ('13835414-8','Mary Curtis','ipsum.primis@icloud.edu','032-563-4582','P.O. Box 125, 3277 Egestas Rd.'),
  ('45621994-2','Jesse Cleveland','cursus@icloud.org','037-138-8582','Ap #818-8910 Lorem St.'),
  ('23859357-3','Grant Patton','fringilla.cursus@protonmail.com','046-551-4104','Ap #701-2676 Fringilla St.'),
  ('26620304-7','Madison Carrillo','vel.lectus@outlook.net','053-477-9367','953-1817 Eget Ave'),
  ('32180979-0','Lynn O''donnell','sit.amet@aol.org','091-895-8705','P.O. Box 110, 4410 Ornare Av.'),
  ('10631187-0','Marsden Luna','etiam.vestibulum@aol.com','093-488-5317','478-9525 Ac Av.'),
  ('48336413-K','Allen Heath','nec.ligula.consectetuer@aol.net','047-547-8244','Ap #206-8550 Consequat St.'),
  ('35457831-K','Joelle Myers','eu.ultrices@yahoo.couk','072-052-1854','286-6403 Nunc Road'),
  ('25785414-0','Jeremy West','quis.pede.praesent@aol.com','031-057-7467','Ap #827-3124 Duis Avenue'),
  ('48341931-7','Anne Mcguire','luctus.felis@icloud.com','017-724-2800','665-5499 Nam Road'),
  ('23299228-K','Thane James','facilisis.magna@google.com','038-745-7835','521-1436 Curabitur Road'),
  ('12316193-9','Samuel Clay','tellus@google.couk','052-348-1781','P.O. Box 583, 2065 Suspendisse Avenue'),
  ('48852-6','Christine Travis','sagittis.semper.nam@hotmail.ca','005-773-3467','P.O. Box 709, 6535 Curabitur Street'),
  ('39266461-0','Cleo Saunders','magna@google.com','055-067-1229','804-6084 Ligula. Avenue'),
  ('32546761-4','Emmanuel Phillips','eu.tempor@google.com','076-653-5259','5810 Donec Rd.'),
  ('48105848-1','Kenyon Gillespie','aliquam.adipiscing@google.net','065-217-2840','330-3277 Hendrerit St.'),
  ('25117198-K','Callie Nieves','ac.mattis@outlook.ca','058-704-7142','675-1180 Nascetur Rd.'),
  ('27326951-7','Harper Miller','augue.sed.molestie@aol.couk','057-436-1349','652-7936 Orci Av.'),
  ('33547962-9','Kelly Hansen','dictum.phasellus@icloud.org','013-242-0503','327-7482 Molestie Avenue'),
  ('43367850-8','Zahir Dotson','a.odio.semper@aol.org','087-863-1706','418-1551 Nec, St.'),
  ('18473160-6','Kylan Burt','laoreet.libero@google.com','066-325-8524','P.O. Box 146, 5618 Quis Ave'),
  ('29902153-K','Tallulah Bowman','donec.nibh.enim@icloud.ca','004-647-6410','Ap #482-292 Cursus Road'),
  ('7717517-2','Kareem Norman','curabitur.consequat.lectus@protonmail.edu','095-215-5505','Ap #861-641 Ultricies Rd.'),
  ('48466707-1','Leo Finley','sed.libero.proin@protonmail.com','045-287-9044','Ap #383-6410 Dictum. Av.'),
  ('43303774-K','Alvin Soto','non.egestas@google.edu','094-813-8326','Ap #717-2356 Id St.'),
  ('46153150-4','Zachary Berry','viverra.maecenas@yahoo.org','091-823-7129','857-8654 Sagittis Av.'),
  ('25902267-3','Len Mccray','cursus.et.eros@protonmail.couk','005-639-5583','120-5421 Phasellus St.'),
  ('25501612-1','Elmo Meyers','cursus.purus@protonmail.org','066-893-8367','Ap #764-941 Enim Rd.'),
  ('28111191-4','Edan Hardin','mauris.ut.quam@outlook.net','058-643-7516','Ap #167-7116 Neque Ave'),
  ('46656748-5','Beck Bryant','scelerisque.sed.sapien@aol.edu','054-382-9393','P.O. Box 898, 4829 Ac Rd.'),
  ('26279572-1','Whilemina Beach','suspendisse@google.org','022-367-2928','Ap #286-5079 Sed Rd.'),
  ('6427641-7','Hilda York','ipsum@aol.ca','097-461-0076','413-866 Congue, Av.'),
  ('26484700-1','Naida Short','nunc.sit.amet@icloud.com','077-286-8425','145-9815 Arcu. Av.'),
  ('18153438-9','Quyn Holden','arcu.imperdiet@google.couk','087-762-5582','P.O. Box 116, 2689 Euismod Road'),
  ('20380351-6','Melissa Conrad','malesuada.vel@hotmail.net','042-316-7328','Ap #373-2233 Facilisis. Avenue'),
  ('24204534-3','Dustin Lowery','class.aptent@google.ca','041-875-6705','Ap #963-7408 At Road'),
  ('26393893-3','Martin Harmon','vulputate.ullamcorper@hotmail.ca','081-648-6389','683-9576 Sociis Avenue'),
  ('28241890-8','Yardley Roman','duis.ac@outlook.couk','032-806-8277','Ap #552-6151 Sed St.'),
  ('25342402-8','Keefe Nunez','integer.sem.elit@aol.couk','087-385-6555','Ap #285-1326 Urna. St.'),
  ('38425287-7','Nayda Stevenson','semper.nam.tempor@outlook.edu','068-004-8276','P.O. Box 177, 9318 Sit Av.'),
  ('2269681-5','Austin Ramsey','sit@google.edu','088-687-8523','525-3175 Parturient Avenue'),
  ('12906127-8','Tanya Mckay','non.cursus@hotmail.edu','070-906-5113','P.O. Box 419, 8162 Augue Rd.'),
  ('12949968-0','Brent Ewing','mauris.sapien@yahoo.net','040-758-5426','P.O. Box 194, 6363 Quisque Road'),
  ('4443244-7','Riley Parks','commodo.at@icloud.ca','033-901-5127','570-2352 Taciti Street');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('11482753-3','Shea Mcguire','eu@outlook.com','074-129-3501','Ap #570-7022 Tempor Av.'),
  ('464335-6','Rashad Cantrell','penatibus@icloud.org','086-505-1246','3282 Nunc Rd.'),
  ('36692859-6','Mark Foley','ipsum.ac@yahoo.org','088-954-4881','Ap #980-6143 Nullam Road'),
  ('2723837-8','Emma Mcintyre','non.luctus.sit@yahoo.ca','092-524-8895','828-2409 Fermentum St.'),
  ('1890312-1','Maryam Lee','tellus.eu@aol.couk','013-666-1424','P.O. Box 446, 9953 Lectus Av.'),
  ('12822975-2','Malcolm Herring','blandit.viverra@protonmail.ca','036-227-4032','P.O. Box 795, 9633 Pede Rd.'),
  ('3354319-0','Gail Haynes','tempus.lorem@protonmail.edu','065-534-0378','943-9349 Pretium Street'),
  ('13327230-5','Kyla Kirkland','luctus.vulputate@icloud.couk','005-757-0067','P.O. Box 678, 2218 Pretium Ave'),
  ('44254417-4','Alexa Rasmussen','in.consectetuer@protonmail.net','042-504-5815','Ap #308-7944 Sociosqu Rd.'),
  ('10515997-8','Zena Camacho','tempus.mauris@icloud.ca','016-484-0232','Ap #902-6684 Nullam Street'),
  ('2560108-4','Tyrone Booth','tincidunt.adipiscing.mauris@protonmail.couk','010-996-8466','7450 Molestie Rd.'),
  ('33888803-1','Harding Haynes','etiam@google.com','013-554-3214','3841 Et Road'),
  ('3312803-7','Zeus Vance','diam.pellentesque.habitant@protonmail.org','096-441-4365','Ap #618-5385 Duis Rd.'),
  ('42224976-1','Jolene Mcpherson','accumsan.interdum@outlook.edu','077-187-1123','Ap #727-6914 Et Avenue'),
  ('22950386-3','Murphy Craft','cursus@google.com','020-374-2374','688-5242 Cursus Rd.'),
  ('45952563-7','Grant Ferguson','mus@protonmail.couk','093-211-6404','794-8449 Pellentesque Av.'),
  ('32678177-0','Allen Stein','vestibulum.massa@outlook.edu','014-869-1539','Ap #401-5230 Neque Street'),
  ('44597831-0','Savannah Kim','sociis.natoque.penatibus@hotmail.edu','024-999-5314','143-7387 Tellus. St.'),
  ('12674508-7','Judah Griffin','non@google.com','036-202-1503','P.O. Box 924, 6062 Mollis. Rd.'),
  ('33723826-2','Cleo Bradley','imperdiet@outlook.couk','057-355-9230','Ap #176-6193 Ac Ave'),
  ('2152299-6','Adam Watson','adipiscing.enim@protonmail.net','044-182-2447','P.O. Box 511, 7401 Proin Rd.'),
  ('40709835-8','Stewart Romero','vitae@icloud.net','008-691-8095','828-7956 Lectus St.'),
  ('1934695-1','Liberty Bruce','semper@outlook.org','017-839-2738','9323 Nunc St.'),
  ('17262729-3','Mara Cherry','magna.et.ipsum@protonmail.edu','089-963-9539','Ap #249-2951 Imperdiet Rd.'),
  ('42634999-K','Diana Rollins','nonummy.ipsum.non@aol.edu','043-284-5274','P.O. Box 966, 4300 Nulla Av.'),
  ('12868975-3','Clarke Fowler','diam.vel@google.org','014-833-8137','Ap #631-682 Consequat, Avenue'),
  ('19950463-0','Keegan Irwin','malesuada.augue.ut@protonmail.com','066-673-5955','354-4951 Nibh. Road'),
  ('35301718-7','Kibo Boyd','faucibus.ut.nulla@hotmail.net','051-672-1523','9671 Tortor. Av.'),
  ('7697976-6','Kirsten Bowman','quis.accumsan@protonmail.com','024-821-4872','Ap #117-1032 Libero Rd.'),
  ('39657376-8','Tanner Odom','cras.convallis@hotmail.com','047-471-2818','Ap #127-843 Euismod Avenue'),
  ('858411-7','Nyssa Cross','lorem.ipsum.sodales@aol.edu','072-573-5308','Ap #798-7377 Ipsum Ave'),
  ('39475237-1','Sylvester Knapp','tristique.aliquet@hotmail.net','051-226-0919','Ap #228-5119 Erat Av.'),
  ('17162191-7','Jermaine Cantu','nulla.semper@icloud.org','085-403-4126','762-3047 Molestie St.'),
  ('4633906-1','Brenda Pierce','non@yahoo.org','045-739-3578','Ap #683-881 Eget Road'),
  ('44228716-3','Josiah Dillon','in.consectetuer@google.ca','073-282-6785','Ap #567-3766 Fusce Street'),
  ('37850321-3','Ashely Franco','at.lacus@yahoo.org','058-851-4811','468-5833 Quam. Av.'),
  ('7652770-9','Jameson Murray','non@yahoo.couk','082-364-1562','P.O. Box 384, 1750 Scelerisque St.'),
  ('20570733-6','Ishmael Dennis','donec.nibh.enim@hotmail.couk','036-083-2808','Ap #943-1445 Accumsan Street'),
  ('31373578-8','Kane Nolan','mauris@icloud.ca','010-403-6062','162-6600 Dapibus St.'),
  ('13119171-5','Sarah Fowler','dignissim.lacus.aliquam@outlook.net','013-025-0857','P.O. Box 550, 9487 Sapien, Av.'),
  ('1326116-4','Ross Campos','augue.eu@protonmail.ca','001-188-9487','5151 Lacus Avenue'),
  ('8471496-8','Amery Phelps','varius.nam@outlook.edu','026-252-8638','P.O. Box 163, 240 Felis Street'),
  ('45463922-7','Hillary Potter','ultrices@protonmail.couk','052-892-5675','4163 Placerat, St.'),
  ('4795965-9','Halla Bartlett','eros@google.ca','035-363-7808','Ap #549-3328 Consectetuer, Road'),
  ('1985837-5','Emmanuel O''brien','eu.lacus@hotmail.org','044-263-8463','P.O. Box 632, 3417 Tristique Av.'),
  ('2632416-5','Peter Brennan','elementum.sem@google.ca','083-811-3564','P.O. Box 142, 7656 Pellentesque Street'),
  ('7870174-9','Raja Cortez','in.molestie.tortor@icloud.couk','030-551-1695','Ap #864-6785 Non Avenue'),
  ('9640216-3','Garth Flowers','elit.dictum@yahoo.com','058-252-0637','P.O. Box 991, 5727 Donec Road'),
  ('323954-3','Mercedes Hahn','placerat.orci@protonmail.org','020-386-1381','849-9310 Rhoncus. St.'),
  ('3779314-0','Ulric Aguilar','ultricies@yahoo.couk','098-012-6554','Ap #749-7254 Dolor. Rd.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('22668708-4','Athena Figueroa','duis.sit.amet@google.edu','069-116-6250','3551 Convallis Road'),
  ('4363197-7','Rebecca Fox','ipsum@hotmail.couk','082-854-1818','Ap #974-3620 Dui. Avenue'),
  ('17402870-2','Lucy Warner','velit@google.ca','021-891-8044','517-3216 Ac St.'),
  ('15985913-4','Karleigh Maxwell','arcu.sed@protonmail.org','062-746-4323','Ap #453-3731 Quis, St.'),
  ('22962413-K','Kasper Huber','tristique.pellentesque.tellus@protonmail.edu','074-324-7837','219-2559 Tincidunt Rd.'),
  ('784324-0','Rigel Dickson','odio.nam@aol.com','054-451-1253','202 Vel St.'),
  ('46573375-6','Salvador Solis','sit.amet@aol.org','065-864-2354','215-6588 Elit Rd.'),
  ('26173173-8','Matthew Rice','aliquet.magna@protonmail.ca','064-428-9824','Ap #706-9733 Cum Street'),
  ('3777041-8','Elmo Valencia','massa.rutrum@outlook.couk','045-028-5437','Ap #779-4274 Vitae Av.'),
  ('37608953-3','Plato Hancock','pede.cras@outlook.edu','002-980-4258','330-6047 Auctor Av.'),
  ('3920779-6','Eleanor Hensley','integer@google.org','012-151-0907','284-3511 Risus Rd.'),
  ('38693717-6','Duncan Hayes','semper.et@google.net','087-334-0456','Ap #241-4724 Integer Avenue'),
  ('27939428-3','Mona Conner','quisque.ornare@google.net','097-531-9837','P.O. Box 326, 1598 Magna Ave'),
  ('22451273-2','Tanek Rivas','integer@protonmail.edu','085-537-9409','Ap #967-583 Gravida. Street'),
  ('8521947-2','Xenos Quinn','tempus.scelerisque@outlook.couk','075-751-0678','P.O. Box 465, 3607 Montes, St.'),
  ('9598155-0','Adrienne Hartman','sed.nunc@yahoo.org','076-215-8748','P.O. Box 512, 755 Per Ave'),
  ('39282475-8','Fiona Berg','duis.risus.odio@protonmail.couk','013-055-6856','Ap #585-9825 Vulputate, Av.'),
  ('14649226-6','Sydney Fischer','magna.duis.dignissim@hotmail.edu','055-377-8689','Ap #699-2929 Dapibus Avenue'),
  ('45291827-7','Imani Brady','ipsum.phasellus@google.org','083-602-7887','990-926 In St.'),
  ('46533262-K','Adrienne Wall','urna.nullam@protonmail.com','027-647-1532','Ap #375-1691 Nullam Avenue'),
  ('3771417-8','Dieter Gardner','nunc.ullamcorper.eu@protonmail.com','085-107-0977','P.O. Box 506, 5528 Feugiat Av.'),
  ('33163155-8','Marsden Reid','nunc.laoreet.lectus@protonmail.couk','060-765-2873','799-935 Imperdiet Rd.'),
  ('17414897-K','Gray Workman','ullamcorper.viverra@aol.com','060-265-9115','Ap #620-571 Montes, Ave'),
  ('15197648-4','Ian Bradshaw','porttitor.tellus@outlook.org','018-252-6231','658-7939 Lorem Ave'),
  ('724295-6','Simon Cole','a.auctor@aol.edu','054-981-7085','5567 Eu Street'),
  ('15727662-K','Mira Sampson','erat.volutpat.nulla@google.net','017-562-2258','394-821 Feugiat Ave'),
  ('27310657-K','Daria Lancaster','sed@google.com','038-242-0334','Ap #160-7277 Hendrerit St.'),
  ('241344-2','Lee Greene','non.luctus@google.org','011-497-7567','Ap #792-7528 Imperdiet Ave'),
  ('7690652-1','Kato Warner','ad.litora@hotmail.com','053-682-5484','357-2443 Ligula Road'),
  ('36178672-6','Jasmine Bennett','pellentesque.tellus@outlook.net','080-304-4624','Ap #139-3354 Metus Street'),
  ('8531489-0','Gillian Reid','sagittis@yahoo.org','024-110-7381','Ap #170-9419 Leo. St.'),
  ('35707554-8','Virginia Ramos','cum.sociis.natoque@icloud.ca','058-849-8550','Ap #578-3863 Sem Avenue'),
  ('18605597-7','Lewis Moran','tincidunt.neque@outlook.com','086-018-5449','636-2946 Ultricies Street'),
  ('14457237-8','Hoyt Stokes','a.felis@google.com','075-966-7445','Ap #712-5535 Nibh. Avenue'),
  ('34905567-8','Leroy Ellison','quis.arcu@google.ca','067-846-6301','Ap #416-5829 Mollis. St.'),
  ('2426896-9','Lynn Mejia','phasellus.ornare@hotmail.edu','081-445-3791','Ap #108-7767 Consectetuer, Av.'),
  ('39771947-2','Lester Mayer','praesent.interdum@icloud.org','078-857-6927','248-6669 Vel Avenue'),
  ('36697535-7','Chaim Cain','nullam.enim.sed@outlook.couk','064-977-7678','910-1044 Ipsum. Av.'),
  ('50111203-8','Brent Harding','turpis.nulla@hotmail.ca','015-459-6525','P.O. Box 227, 5335 Id, Av.'),
  ('5624553-7','Brenda Morin','ante.dictum@outlook.com','067-736-6975','550-7651 Euismod Av.'),
  ('1723172-3','Cheryl Stephenson','ut@yahoo.edu','015-187-6314','Ap #120-1795 Adipiscing. St.'),
  ('40851728-1','Yoshio Lamb','risus@aol.edu','006-366-2513','763-8349 Egestas Av.'),
  ('15303262-9','Rylee Nelson','tempus.lorem@aol.edu','046-484-8861','Ap #403-8392 Id Av.'),
  ('31272855-9','Alexandra Conway','ante.ipsum@google.ca','076-368-7845','P.O. Box 794, 8333 Gravida Ave'),
  ('24308974-3','Theodore Tillman','eleifend.cras@google.com','099-568-5383','4067 Nisi Street'),
  ('37942920-3','Fulton Buckner','ornare.sagittis@icloud.net','084-442-3010','Ap #200-5687 Mollis. Rd.'),
  ('15976879-1','Bree Best','urna.nunc@aol.com','059-785-7011','557-7729 Pellentesque Rd.'),
  ('22941315-5','Wade Reid','nec@google.edu','031-651-1706','260-8082 Posuere Rd.'),
  ('11146117-1','Clarke Yang','elementum.dui@protonmail.com','005-535-5788','P.O. Box 314, 8616 Nunc Av.'),
  ('18993555-2','Martena Rush','mattis.velit@google.edu','025-502-3665','359-9707 Vel St.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('6828569-0','Fritz Orr','luctus.sit@aol.net','037-161-1938','Ap #361-5483 Fringilla Avenue'),
  ('8910706-7','Walter Norman','nam.ligula.elit@protonmail.com','075-621-3160','3154 Morbi Road'),
  ('37538683-6','Shoshana Soto','eu@protonmail.org','021-435-3241','245-6398 Quis, Rd.'),
  ('49506917-6','Doris Head','pretium@yahoo.couk','068-042-3562','799-4567 Consequat, Street'),
  ('26465143-3','Julian Hampton','semper.auctor@icloud.couk','057-767-9581','9457 Ante. Street'),
  ('12863360-K','Addison Burris','dolor.fusce@google.ca','024-211-8247','4028 Dolor. Av.'),
  ('35464842-3','Hanna Dickerson','ut@aol.edu','007-414-5055','7957 Pede. Rd.'),
  ('49228383-5','Tamekah Leonard','sed@yahoo.com','045-122-9796','730-6499 Purus, St.'),
  ('4843648-K','Maisie Hebert','risus.odio@hotmail.com','057-137-1012','658-1875 Urna, Ave'),
  ('36710570-4','Walter Palmer','posuere.cubilia@icloud.edu','008-156-8777','3946 Malesuada. Av.'),
  ('36463590-7','Anjolie Figueroa','vel.quam@hotmail.org','033-753-2568','483-7315 Et Road'),
  ('49261260-K','Angelica Cash','sit.amet@yahoo.couk','067-611-8425','114-8254 Fringilla Street'),
  ('67016-2','Perry Lucas','magna.malesuada@outlook.com','011-391-8641','Ap #489-512 Aliquam Street'),
  ('17247534-5','Ina Decker','proin.vel.arcu@protonmail.net','087-612-1256','P.O. Box 887, 2952 Arcu. Ave'),
  ('42666994-3','Micah Sloan','metus@protonmail.couk','030-358-0547','146-2371 Magna. Rd.'),
  ('9513916-7','Noel Mcfarland','vitae@icloud.com','091-621-4873','940-3398 Nulla. Avenue'),
  ('50344810-6','Jakeem Mcclain','vestibulum.ut@yahoo.ca','077-700-6257','8940 Mauris Av.'),
  ('478918-0','Larissa Burnett','sollicitudin@aol.couk','049-752-2220','762-6715 Ultrices Road'),
  ('49880234-6','Neville Ewing','et.libero@yahoo.org','022-675-5241','Ap #458-9494 Congue. St.'),
  ('13931994-K','Hadassah Gardner','dictum@icloud.org','086-264-7088','P.O. Box 107, 5687 Dictum Avenue'),
  ('46490831-5','Kermit Farrell','quam@outlook.org','030-857-5758','Ap #676-341 Ut, Rd.'),
  ('31103598-3','Lysandra Doyle','risus.nunc@outlook.org','058-288-5313','P.O. Box 230, 2462 Integer Avenue'),
  ('25918150-K','Mira Kemp','justo.proin@google.edu','069-753-6835','812-9812 Arcu Street'),
  ('3528420-6','Maile Jennings','elit.dictum@icloud.edu','043-455-4495','P.O. Box 621, 6423 Lobortis, Rd.'),
  ('35579147-5','Tara Orr','malesuada.vel@google.net','006-264-1101','Ap #675-7443 Adipiscing Rd.'),
  ('31603398-9','Nell Rice','feugiat.nec@google.com','028-067-3368','Ap #841-9237 Proin Ave'),
  ('33672606-9','Elliott Nichols','dapibus@protonmail.org','065-202-4746','Ap #984-1690 Id Avenue'),
  ('47352241-1','Jane Wells','erat.volutpat.nulla@outlook.edu','031-113-1569','Ap #361-4533 Suscipit, Ave'),
  ('19928743-5','Ivor Massey','non.arcu@outlook.com','014-821-0276','Ap #170-9060 Pede, Ave'),
  ('43838491-K','Dawn Vance','sodales.nisi@aol.com','077-862-5328','5762 At, Avenue'),
  ('48440778-9','Perry Mcintosh','egestas.sed@google.edu','084-743-5914','P.O. Box 701, 552 Augue Street'),
  ('3596015-5','Nasim Carpenter','blandit.nam.nulla@outlook.edu','075-884-5385','440-759 Purus. Av.'),
  ('41955593-2','Jorden Hammond','quam.vel@yahoo.edu','058-842-6823','Ap #495-6996 Tempus St.'),
  ('38253942-7','Kyla Richmond','convallis.est.vitae@protonmail.couk','047-474-7497','927-1301 Tempus, Ave'),
  ('26671316-9','Kuame Ramirez','congue.turpis@yahoo.net','031-422-4868','622-9162 Penatibus Avenue'),
  ('8277892-6','Castor Moore','suspendisse.commodo@protonmail.couk','023-554-7891','291-3807 Elit, St.'),
  ('8759565-K','Maxwell Ortiz','etiam.vestibulum.massa@icloud.net','038-878-4251','P.O. Box 665, 9684 Ut, Ave'),
  ('13869214-0','Herrod Merritt','maecenas.iaculis@outlook.edu','013-563-6134','6477 Ac St.'),
  ('6752700-3','Zachery Chapman','integer.vulputate.risus@google.org','077-944-2411','113-5022 Suspendisse Rd.'),
  ('449367-2','Shad Stone','aliquam.nisl@google.couk','022-567-4682','543-4653 Lobortis Ave'),
  ('3812859-0','Randall Harper','vitae.risus@protonmail.couk','025-461-7268','1132 Placerat Street'),
  ('14258794-7','Tate Sampson','a.odio.semper@yahoo.edu','049-660-6186','7609 Sapien. St.'),
  ('46540292-K','Victoria Price','dignissim.magna.a@icloud.org','055-197-0351','4943 Vitae Rd.'),
  ('21525102-0','Shelby Mccall','ante.nunc.mauris@outlook.couk','054-689-3115','P.O. Box 846, 1919 Tristique Rd.'),
  ('7333815-8','Noelle Warner','metus.aenean@yahoo.couk','011-147-9501','Ap #592-885 At St.'),
  ('19222587-6','Liberty Glover','vulputate.nisi.sem@aol.ca','031-591-3651','8051 Risus. Road'),
  ('12864837-2','Echo Spence','gravida.molestie@yahoo.ca','048-779-1651','P.O. Box 835, 2312 Id, Ave'),
  ('5807199-4','Skyler Conrad','elit.pellentesque.a@hotmail.edu','045-266-9417','P.O. Box 543, 1711 Fringilla, Rd.'),
  ('34403852-K','Christine Winters','laoreet@outlook.org','019-274-1618','616-2384 Mauris, St.'),
  ('6265249-7','MacKenzie Wooten','a.feugiat@aol.com','081-258-3415','Ap #126-2391 Felis. St.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('17861331-6','Sheila Randall','neque@hotmail.edu','053-642-7048','P.O. Box 573, 3438 Consectetuer Ave'),
  ('40878137-K','Meghan Bradshaw','eu@icloud.org','061-858-2527','P.O. Box 177, 9533 Felis Street'),
  ('48233981-6','Alexander Gillespie','justo.faucibus@google.ca','004-064-8394','Ap #833-4496 Vel St.'),
  ('14388320-5','Echo Cleveland','lacinia.orci.consectetuer@google.net','038-285-7927','190-6882 Duis Rd.'),
  ('21327989-0','Bethany Gardner','libero.et.tristique@icloud.edu','089-618-8753','747-8155 Risus Av.'),
  ('23480965-2','Ainsley Marsh','sit@icloud.com','094-493-0176','Ap #714-2113 Sagittis. Rd.'),
  ('4726260-7','Brock Frazier','magnis@yahoo.ca','053-458-3157','340-7132 Habitant Rd.'),
  ('2715114-0','Hakeem Woods','aenean.sed@hotmail.couk','039-485-6230','486-4447 Ut Road'),
  ('40225788-1','Aimee Kelly','varius.et@aol.com','042-745-7818','P.O. Box 417, 5507 Magna. St.'),
  ('4679724-8','Heather Aguilar','auctor.non.feugiat@aol.ca','019-498-3443','1361 Augue Road'),
  ('20850795-8','Stone Rocha','adipiscing.mauris@protonmail.couk','073-179-7573','6401 Ut Avenue'),
  ('32732475-6','Alea Hooper','ipsum.dolor@hotmail.edu','071-522-5306','292-7205 Nulla. Rd.'),
  ('47753672-7','Ima Palmer','diam.luctus.lobortis@outlook.edu','099-787-1885','580-4645 Dolor, Rd.'),
  ('17408118-2','Bertha Potts','vitae.orci@yahoo.com','096-734-8922','Ap #875-3166 Nunc Rd.'),
  ('1755469-7','Isadora Carey','eget.laoreet@hotmail.org','009-273-9851','7177 Vel, Rd.'),
  ('10401554-9','Audra Kidd','sed.eu@protonmail.org','030-747-4629','890-6652 Magna Rd.'),
  ('48601711-2','Chava Bell','hendrerit.neque@icloud.ca','051-650-8618','Ap #247-7974 Nunc Road'),
  ('3238865-5','August Johnston','aenean@yahoo.org','087-207-2758','801-6873 Mattis Rd.'),
  ('49668401-K','Hayfa Gamble','vulputate.lacus.cras@yahoo.couk','026-662-1195','595-8502 Quisque Avenue'),
  ('5646861-7','Bethany Wall','tortor.dictum@outlook.edu','077-025-7287','296-2040 Vitae St.'),
  ('27340343-4','Valentine Kennedy','integer@protonmail.org','068-535-1252','Ap #531-5036 Suspendisse Rd.'),
  ('18246584-4','Honorato Patrick','erat.semper.rutrum@icloud.ca','054-325-6927','P.O. Box 109, 399 Orci, Ave'),
  ('2943424-7','Lucy Fisher','sit.amet@hotmail.net','054-223-9020','725-7466 Aliquam St.'),
  ('19430883-3','Pascale Huber','laoreet.posuere@aol.com','015-541-8938','780-6516 Lorem, Rd.'),
  ('44924647-0','Cherokee Lloyd','fusce.aliquet@outlook.org','036-802-6432','Ap #882-5173 Ut Road'),
  ('29448746-8','Alika Shannon','rhoncus.donec@aol.net','022-594-4131','1063 Lacus. Street'),
  ('17881496-6','Farrah Mcintyre','lorem.eget@protonmail.edu','063-230-6252','7894 Dictum. St.'),
  ('4280701-K','Quinlan Cash','egestas.blandit@outlook.net','039-552-3311','760-3378 Vivamus Rd.'),
  ('17735202-0','Acton James','auctor.odio@yahoo.edu','003-242-7317','678-1925 Enim. Street'),
  ('31158390-5','Ethan Stone','placerat.cras@hotmail.edu','052-388-3243','279-7191 Erat. Av.'),
  ('36735314-7','Dara Cooke','pede.malesuada@icloud.net','061-488-6426','648-2095 A Av.'),
  ('49277310-7','Mallory Fernandez','morbi.accumsan.laoreet@protonmail.com','027-222-1912','331-2448 Tincidunt St.'),
  ('2284443-1','Ariana Wade','in.consectetuer.ipsum@aol.org','096-551-6445','785-9537 Nec Street'),
  ('30626881-3','Madeline Kane','felis@icloud.com','040-085-7860','P.O. Box 358, 3208 Semper Ave'),
  ('34594149-5','Odette Reese','volutpat@google.ca','044-812-9716','Ap #586-4682 Nulla. Rd.'),
  ('1687382-9','Sydnee O''brien','sagittis.lobortis@hotmail.org','002-636-1515','716 Lorem St.'),
  ('18180325-8','Caldwell Mason','et.risus.quisque@google.net','088-301-2916','Ap #622-422 Laoreet Road'),
  ('43789569-4','Keely Pruitt','eros@google.couk','042-334-3154','4704 Vitae, St.'),
  ('22619294-8','Tasha Barry','lectus@aol.org','055-272-1998','3922 Donec St.'),
  ('333681-6','Keaton Mathis','nibh.sit@icloud.ca','027-962-9232','Ap #186-1504 Lacus St.'),
  ('45515727-7','Cade Nixon','nostra@hotmail.com','069-412-7176','P.O. Box 832, 6321 Eu St.'),
  ('19982868-1','Vernon O''brien','tempor.erat@protonmail.edu','078-102-6553','P.O. Box 521, 6494 Augue Road'),
  ('15270546-8','Sonia Collier','hendrerit.id.ante@outlook.ca','058-396-6643','354-1927 Erat Rd.'),
  ('7528135-8','Tad Todd','quam.quis@hotmail.couk','043-715-8518','689-3349 Eros St.'),
  ('2582198-K','Rosalyn Daugherty','amet.consectetuer.adipiscing@google.ca','021-215-5216','9595 Sem Ave'),
  ('191086-8','Karina Morrison','penatibus.et@google.ca','011-928-9835','433-8651 A, Ave'),
  ('26190571-K','Kyle King','erat.eget@aol.net','081-321-3266','Ap #835-115 Molestie St.'),
  ('833293-2','Marvin Merritt','mauris.nulla@aol.org','062-312-0560','P.O. Box 163, 9765 Egestas. Avenue'),
  ('20724128-8','Jael Lambert','ac.turpis@aol.ca','060-685-7800','978-456 Adipiscing Street'),
  ('9877805-5','Mikayla Bender','aliquam.arcu@hotmail.org','075-768-8775','Ap #528-8360 Quam, Av.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('49557213-7','Sheila Hogan','in.lorem.donec@protonmail.edu','063-252-2049','Ap #179-1252 Et St.'),
  ('35647373-6','Roth Hunt','ac@outlook.net','015-262-4234','620-1113 Posuere Av.'),
  ('29221233-K','Dexter Glenn','enim.mauris@yahoo.net','091-800-6706','888-8334 Tellus Rd.'),
  ('40926907-9','Barbara Cohen','ipsum@aol.edu','016-114-4438','Ap #210-5807 Volutpat Rd.'),
  ('9258-4','Gage Savage','senectus@yahoo.org','020-385-6434','678-4034 Proin Rd.'),
  ('24832692-1','Damon Castillo','pede.ac@hotmail.edu','021-272-2125','Ap #557-4214 Dignissim Road'),
  ('26524609-5','Todd Huber','aliquam.auctor@hotmail.ca','066-814-3820','641-8514 Ridiculus Street'),
  ('4974648-2','Libby Ford','quis.diam@yahoo.couk','089-562-3457','511-3282 Suspendisse Rd.'),
  ('17989432-7','Kimberly Lee','et.ultrices@icloud.net','041-063-5119','738-3199 Amet, Rd.'),
  ('25289704-6','Ezra Stokes','proin@protonmail.couk','032-385-2701','621-8644 Donec Ave'),
  ('46705421-K','Diana Espinoza','purus.sapien@icloud.couk','085-136-6970','588-1554 Turpis Av.'),
  ('9701205-9','Uma Kane','vitae.sodales@yahoo.net','068-515-6244','Ap #177-1233 Morbi Street'),
  ('29230123-5','Ingrid Kirkland','orci@aol.edu','065-482-8278','673-6372 Dolor St.'),
  ('13894560-K','Rajah Hogan','diam.vel@protonmail.net','033-962-2672','573-5429 Et, Street'),
  ('28499290-3','Cade Decker','est.mauris.rhoncus@icloud.com','045-749-8639','739-6347 Aliquam St.'),
  ('12167726-1','Conan Hensley','placerat.cras@outlook.org','012-786-4246','745-8396 Amet Av.'),
  ('41726403-5','Sonia Graham','consectetuer@protonmail.ca','064-965-1654','866-8772 Nullam St.'),
  ('19399800-3','Jonas Salinas','libero.mauris.aliquam@protonmail.net','082-868-1930','8434 Nam Avenue'),
  ('27974329-6','Colt Chapman','varius.ultrices.mauris@google.ca','009-570-1301','234-9294 Donec Ave'),
  ('38706583-0','Melinda Bean','dignissim.pharetra.nam@hotmail.com','046-682-5365','P.O. Box 489, 1040 Ultricies St.'),
  ('10334386-0','Haviva Cooke','tristique.pellentesque@protonmail.org','057-388-0722','7842 Donec St.'),
  ('1710194-3','Upton Nieves','cras.pellentesque@outlook.com','088-557-5262','Ap #443-8448 Eu St.'),
  ('41897708-6','Norman Pearson','a.auctor@icloud.com','052-852-8349','639-4509 Ac Av.'),
  ('18569629-4','Iliana Leach','rutrum@google.org','015-868-5302','P.O. Box 446, 6930 Donec Rd.'),
  ('34836330-1','Constance Haney','libero.est@hotmail.org','061-763-6798','6610 Scelerisque Rd.'),
  ('4030140-2','Hilel Alvarado','vel@google.org','085-538-4323','5126 Elementum Road'),
  ('193052-4','Jane Hardy','morbi.metus.vivamus@google.org','017-554-8507','P.O. Box 751, 9424 Aliquet Ave'),
  ('28548464-2','Fay Richardson','penatibus@aol.couk','011-083-8046','166-5829 Lacus. St.'),
  ('19347620-1','Chase Harrison','odio.etiam.ligula@protonmail.edu','088-783-6411','Ap #637-5757 Libero Ave'),
  ('19868588-7','Dale Hunt','non.justo.proin@hotmail.edu','071-319-0757','6554 In Rd.'),
  ('11779135-1','Leandra Huber','proin.vel.arcu@aol.net','058-550-5444','Ap #164-8926 Ornare St.'),
  ('3987147-5','Blossom Sharpe','vitae@google.ca','035-633-4553','Ap #191-281 Vulputate Street'),
  ('9524316-9','Ariana Porter','metus.eu@hotmail.org','056-625-6176','307-6675 Egestas. Av.'),
  ('9181501-K','Alexa Sweeney','augue.eu.tellus@aol.org','023-527-6854','Ap #567-1019 Proin Ave'),
  ('25859399-5','Kaitlin Page','ligula.aenean.gravida@aol.couk','011-476-5265','Ap #590-6607 Lobortis Ave'),
  ('33653809-2','Merrill Calhoun','velit@icloud.net','025-227-2846','Ap #704-3532 Mauris, Ave'),
  ('29990933-6','Ignacia Macdonald','adipiscing.ligula@aol.ca','013-535-1747','Ap #150-2521 Orci. Av.'),
  ('22445920-3','Jesse Bennett','vulputate.posuere.vulputate@yahoo.net','041-534-4683','2484 Facilisis St.'),
  ('11946670-9','India Sweeney','nulla.eget.metus@aol.net','004-270-7712','619-2512 Eu St.'),
  ('6664486-3','Burton Glover','aptent@google.com','026-146-7782','Ap #364-1268 Nunc Rd.'),
  ('6130291-3','Serina Mcgowan','adipiscing.lobortis@icloud.org','082-829-0235','P.O. Box 275, 6518 Interdum Ave'),
  ('5877180-5','Ayanna Brady','faucibus@outlook.couk','033-345-8311','Ap #580-4726 Mauris, Rd.'),
  ('262851-1','Kareem Christian','congue.in.scelerisque@google.ca','067-384-7667','835-3626 At Avenue'),
  ('1490295-3','Sawyer Wilder','ullamcorper.magna@google.ca','082-314-4246','Ap #135-6175 Magnis Rd.'),
  ('36872343-6','Caleb Albert','morbi.sit.amet@outlook.org','014-681-3528','430-3444 Nunc Av.'),
  ('22512684-4','Thomas Bridges','maecenas.mi@yahoo.net','074-174-3956','P.O. Box 943, 6739 Hendrerit. Rd.'),
  ('211762-2','Celeste Blackburn','a@protonmail.com','094-043-5404','Ap #314-8787 Lacinia Ave'),
  ('49139862-0','Adele Nieves','dui.augue@protonmail.com','070-648-3677','3231 Sapien, Rd.'),
  ('10768595-2','Cathleen Parker','vivamus@google.ca','066-117-3745','8573 Dictum. Avenue'),
  ('4636416-3','Sean Hanson','ante.ipsum.primis@aol.com','055-287-6344','333-3548 At, Road');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('699856-9','Nadine Robbins','donec.egestas@protonmail.edu','051-173-3086','Ap #908-3727 Arcu. Avenue'),
  ('2094344-0','Giselle Wagner','primis@outlook.com','030-634-7220','846-7122 Nibh Road'),
  ('32401464-0','Britanni Alvarado','et.pede.nunc@google.net','087-016-8751','5405 Feugiat Avenue'),
  ('19462698-3','Christen Alvarado','arcu.vivamus.sit@hotmail.couk','074-557-3022','Ap #427-1966 Tellus. Rd.'),
  ('36852256-2','Shelly Malone','dolor.fusce@protonmail.org','037-724-5476','P.O. Box 759, 6923 Sit St.'),
  ('15348739-1','Oleg Rowe','placerat.cras.dictum@aol.ca','072-951-2619','Ap #648-9420 Nec Rd.'),
  ('4465683-3','Brenden Burt','eu.eros@outlook.couk','008-921-2663','3399 Id, Ave'),
  ('5857429-5','Lyle Dorsey','ut.cursus@outlook.net','075-566-3768','370-9667 Vel Av.'),
  ('33580846-0','Dean Gilbert','duis.elementum.dui@yahoo.edu','031-568-2054','Ap #110-5994 Enim St.'),
  ('34947618-5','Raja Mccray','diam.lorem.auctor@icloud.ca','059-343-1535','9937 Nunc. St.'),
  ('19521645-2','Felix Patterson','diam.proin@protonmail.couk','057-938-1319','P.O. Box 609, 5244 Ultrices, Rd.'),
  ('22139765-7','Graiden Kinney','justo.faucibus.lectus@outlook.com','012-797-5934','P.O. Box 167, 7246 Nunc Av.'),
  ('6123580-9','Reagan Brady','hendrerit.neque.in@icloud.net','032-250-3715','Ap #376-8483 Risus. Avenue'),
  ('20367714-6','Boris Weiss','felis.donec@google.couk','034-346-0917','749-9426 Nisi. Street'),
  ('42253705-8','Indira Pickett','aliquam.fringilla@outlook.edu','053-393-1850','Ap #819-4495 At, St.'),
  ('18659182-8','Asher Spence','eu.placerat@outlook.org','027-533-7678','337-3547 A, Ave'),
  ('19841889-7','Ryder Pierce','enim@icloud.net','032-137-2293','Ap #780-8362 A Road'),
  ('19548419-8','Colton Hall','metus.vivamus@protonmail.couk','063-614-5617','7042 Vel Street'),
  ('9615511-5','Xyla Acosta','nunc.pulvinar@google.couk','077-512-1966','315-865 Porttitor Street'),
  ('3331594-5','Kaseem Slater','egestas@yahoo.ca','055-459-6420','409-2881 Tincidunt Avenue'),
  ('4219724-6','Jack Vinson','aliquet.phasellus@protonmail.com','096-702-2447','7549 Id Rd.'),
  ('47326912-0','Florence Zimmerman','donec@outlook.net','001-115-1313','Ap #681-8743 Vehicula Rd.'),
  ('35293727-4','Ivor Guerrero','mauris@protonmail.com','025-706-3475','Ap #326-7229 Magna St.'),
  ('14490911-9','Silas Prince','orci.adipiscing.non@icloud.com','024-224-8957','7521 Cursus Rd.'),
  ('1692470-9','Jacob Lambert','felis.adipiscing@aol.ca','080-078-0187','541-8373 Nunc Ave'),
  ('42328379-3','Zane Duke','pellentesque.massa.lobortis@google.edu','037-575-9989','P.O. Box 246, 2815 Rutrum St.'),
  ('28613404-1','Danielle Schultz','amet.ante.vivamus@protonmail.org','016-858-1675','P.O. Box 330, 1364 Pellentesque. Rd.'),
  ('50895130-2','Edward Mckee','erat.nonummy.ultricies@protonmail.ca','046-678-1712','P.O. Box 565, 3371 Ut Av.'),
  ('30823535-1','Selma Morse','tristique.senectus.et@google.ca','033-818-7135','7011 Sed Avenue'),
  ('6726517-3','Kirby Mercado','lobortis@protonmail.org','018-838-8386','Ap #694-4413 Enim. Avenue'),
  ('17351174-4','Echo Brock','amet.massa@google.com','078-318-9215','P.O. Box 915, 5767 Eu, St.'),
  ('36325501-9','Teagan Ryan','rutrum.eu@google.ca','042-502-7429','805-8152 Ac Av.'),
  ('9652662-8','Allistair Wilkinson','convallis@aol.edu','005-268-8464','353-7745 Magna. St.'),
  ('19977253-8','Cheyenne Mcclure','tempor.bibendum.donec@google.com','093-687-7742','457-2069 Morbi Ave'),
  ('21248383-4','Jason Wallace','ullamcorper.viverra@outlook.couk','062-684-4458','440-7394 Laoreet, St.'),
  ('40926275-9','Edward Horn','pharetra.nam@outlook.ca','084-662-7645','Ap #796-7797 Curabitur Road'),
  ('37852447-4','Fiona Roy','diam.dictum@icloud.couk','082-258-8030','Ap #288-393 Phasellus Ave'),
  ('47322107-1','Fay Rich','tellus.sem.mollis@protonmail.net','068-114-7834','Ap #554-6467 Lobortis Street'),
  ('48159709-9','Rashad Foreman','faucibus.orci.luctus@icloud.edu','017-312-7735','Ap #615-2685 Rutrum Rd.'),
  ('40282355-0','Ariel House','ante.blandit.viverra@hotmail.edu','089-271-3957','Ap #782-8828 Primis Avenue'),
  ('4946636-6','Rae Wallace','malesuada.vel@hotmail.net','065-497-2513','P.O. Box 215, 6195 Malesuada St.'),
  ('16522716-6','Vance Mclean','proin@hotmail.com','002-339-4817','2193 Nulla. Av.'),
  ('9445289-9','Wade Ball','ultrices.posuere@google.couk','028-161-4191','5863 Quisque Street'),
  ('36425613-2','Yeo Burris','luctus.et@protonmail.org','026-595-7341','Ap #787-7069 Pede, Rd.'),
  ('28165498-5','Abraham Goodman','ut.sagittis.lobortis@icloud.couk','046-904-8897','926 Risus. Rd.'),
  ('45581817-6','Nayda Farrell','proin.ultrices@google.ca','078-535-9538','Ap #196-4111 Risus. St.'),
  ('28831857-3','Dahlia Dejesus','nunc.mauris@google.edu','074-756-0459','477-8202 Class St.'),
  ('4066844-6','Maryam England','amet.ultricies@hotmail.com','026-783-8534','Ap #725-3621 Mauris Street'),
  ('27983572-7','Wynter Wynn','dis.parturient.montes@google.ca','010-158-2888','Ap #346-5015 Ornare, Rd.'),
  ('35952296-7','Mason Hebert','mi@yahoo.com','032-248-6559','750-2713 Convallis, Road');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('31355479-1','Moana Ramirez','quisque.fringilla@google.edu','065-517-0028','519-5745 Metus. Ave'),
  ('11672123-6','Ayanna Marshall','felis.donec@outlook.ca','053-140-0128','207-1178 Sit Street'),
  ('184553-5','Lisandra Prince','et.nunc@hotmail.edu','042-424-1618','P.O. Box 274, 456 Lectus Avenue'),
  ('485659-7','Curran Brewer','nisl@outlook.edu','058-045-1081','5292 Molestie St.'),
  ('3942286-7','Orla Mullins','dignissim.lacus.aliquam@outlook.com','037-562-7113','421-950 Ac Av.'),
  ('9231563-0','Jescie Hansen','elementum.sem.vitae@aol.com','087-285-6302','170-737 Nunc Avenue'),
  ('30530472-7','Hilary Bird','dolor.quam@google.com','021-826-3837','P.O. Box 436, 5081 Ipsum. Av.'),
  ('41705700-5','Hayley Owen','molestie.tellus@hotmail.edu','078-335-2255','P.O. Box 928, 6807 Tincidunt Road'),
  ('25602595-7','Mikayla Carroll','lacinia.vitae@icloud.net','012-625-8116','5505 Vitae Rd.'),
  ('29128884-7','Hayes Eaton','cras.vulputate@protonmail.net','080-769-9355','Ap #324-8860 Urna. St.'),
  ('35188629-3','Odessa Baird','vulputate.velit.eu@hotmail.couk','022-413-9835','Ap #246-5165 Morbi Ave'),
  ('48199641-4','Amena Matthews','sapien.gravida@google.org','086-774-0719','2759 Amet, St.'),
  ('31650106-0','Vielka Mcbride','nascetur@protonmail.ca','085-411-4586','P.O. Box 145, 5103 Vulputate, Street'),
  ('36194931-5','Serina Whitley','sit.amet.nulla@protonmail.com','063-968-6775','474-3288 Malesuada Rd.'),
  ('45409742-4','Otto Berger','per@outlook.edu','050-638-5438','P.O. Box 664, 6573 Nec, Road'),
  ('13433430-4','Cassidy Kirby','eros@hotmail.couk','087-428-1706','Ap #345-956 Curabitur St.'),
  ('4127855-2','Karyn Sims','at.lacus.quisque@icloud.com','072-222-9675','4879 Cursus. Street'),
  ('14433334-9','Louis Strickland','consectetuer.mauris@outlook.com','026-446-2117','110-3905 Dignissim. Rd.'),
  ('20657476-3','Patrick Alexander','vivamus.sit@hotmail.ca','023-864-1031','5016 Nullam St.'),
  ('46349688-9','Stuart Paul','a.nunc.in@hotmail.couk','024-883-0131','Ap #280-7895 Elit Avenue'),
  ('46482781-1','Brennan Ayers','duis.a@icloud.net','095-864-0018','P.O. Box 116, 6280 Fringilla Avenue'),
  ('25634130-1','Benedict Davis','elit@hotmail.couk','035-898-5214','316-2866 A, Road'),
  ('10135385-0','Eagan Ortega','enim.consequat@outlook.net','032-418-0310','Ap #809-7313 Maecenas Rd.'),
  ('9207589-3','Ulysses Mathis','dolor.nulla.semper@icloud.com','047-782-4878','P.O. Box 923, 8792 Diam. Rd.'),
  ('35758837-5','Caesar Clarke','nunc@yahoo.edu','069-556-9448','315-8243 Tristique Rd.'),
  ('41620941-3','Maggy Emerson','et@outlook.org','073-344-5447','P.O. Box 977, 9196 Eros Av.'),
  ('44435994-3','Iris James','ultricies@yahoo.com','050-126-0422','739-5047 Leo. Av.'),
  ('31215293-2','Iliana Newton','donec.fringilla@hotmail.edu','076-651-7187','2758 Nunc Av.'),
  ('21760843-0','Harrison Kramer','et.magnis@icloud.org','066-860-1348','Ap #872-401 Cursus Road'),
  ('44678730-6','Kane Williams','nulla.tincidunt@yahoo.com','058-604-5637','Ap #324-1088 Enim Rd.'),
  ('17225783-6','Malachi Roach','turpis.aliquam@outlook.net','078-281-4633','5448 Nunc Av.'),
  ('47896624-5','Sheila Spencer','nunc.mauris@protonmail.edu','019-346-5443','Ap #699-7596 Nulla Av.'),
  ('1752833-5','Ramona Shaffer','facilisis.non@google.net','061-535-4500','Ap #968-1492 Lobortis St.'),
  ('516872-4','Upton House','mauris@aol.edu','019-025-1796','Ap #653-8615 Ut, Ave'),
  ('22593462-2','Lenore Whitfield','odio.a.purus@yahoo.org','060-272-2128','251-7329 Ipsum Road'),
  ('27461769-1','Nissim Hickman','cum.sociis.natoque@hotmail.ca','074-144-2462','801-4635 Nam Rd.'),
  ('22878544-K','Shelley Gilliam','nunc@icloud.org','046-667-5316','770-203 Eros Ave'),
  ('1967209-3','Cameron Shannon','nisl@icloud.org','053-806-2131','Ap #484-6622 Elit Ave'),
  ('12912158-0','Olivia Travis','eget@aol.net','013-237-5392','287-3109 Feugiat. Rd.'),
  ('20775400-5','Diana Larson','mauris.ipsum.porta@google.net','077-324-6358','Ap #684-4479 Aliquet, Rd.'),
  ('4798516-1','Britanni Watts','nam.interdum@yahoo.net','014-432-2619','689-560 Nullam Rd.'),
  ('3164380-5','Odysseus Rosa','amet.metus.aliquam@yahoo.couk','070-657-3482','330-2572 Lorem Rd.'),
  ('33233451-4','Scott Solomon','luctus.aliquet@aol.com','030-834-1483','7481 Sapien Street'),
  ('1279941-1','Kameko Burks','morbi.metus.vivamus@protonmail.couk','050-615-6017','Ap #741-826 Sodales. Avenue'),
  ('853081-5','Alexis Burgess','erat.in@google.ca','024-418-5561','558 Sodales. Rd.'),
  ('30164623-2','Tarik Morgan','massa.mauris@google.ca','018-136-4541','109 Ac Avenue'),
  ('48355525-3','Hakeem Hood','bibendum@hotmail.couk','072-942-3524','P.O. Box 707, 2701 Malesuada St.'),
  ('10991680-3','Vera Webb','commodo.hendrerit.donec@protonmail.net','071-272-9938','P.O. Box 486, 5475 Ullamcorper. St.'),
  ('30991564-K','James Cantu','a.dui@yahoo.net','019-768-6790','174-3549 Phasellus St.'),
  ('3188611-2','Blaze Barton','duis@protonmail.ca','003-642-2875','Ap #644-1586 Orci Ave');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('47991225-4','Allen Arnold','quisque.nonummy@icloud.edu','030-319-7243','Ap #122-8125 Velit St.'),
  ('46561623-7','Dora Rojas','lacus.etiam@aol.net','013-636-4824','744-3893 A St.'),
  ('47344357-0','Upton Grant','in.at@hotmail.edu','033-617-3844','789 Dictum Rd.'),
  ('37117210-6','Omar Burke','luctus.sit@hotmail.couk','041-018-9878','Ap #158-2129 Donec Rd.'),
  ('166555-3','Ebony Mckay','etiam.vestibulum.massa@aol.net','035-917-6244','623-347 Hendrerit Street'),
  ('33383834-6','Christine Wiggins','orci@icloud.com','016-071-2668','715-3133 Tellus St.'),
  ('3776541-4','Kasper Nash','tristique.pellentesque@google.edu','085-357-8227','372-8696 Quis, Av.'),
  ('37518785-K','Ora Sargent','magna.nam@icloud.edu','042-766-1643','631-5796 Aenean Street'),
  ('4171020-9','Jeanette Grant','eu.neque@icloud.com','052-241-1917','Ap #219-2540 Felis Rd.'),
  ('1585526-6','Zane Thornton','sed.et@protonmail.edu','074-058-5518','7745 Curabitur Av.'),
  ('32779247-4','Timon Stokes','nonummy.fusce@icloud.edu','035-949-3933','P.O. Box 827, 4808 Nulla Ave'),
  ('3067793-5','Mark Dudley','ut.erat@outlook.edu','052-563-1134','658-6659 Ornare Rd.'),
  ('35807970-9','Austin Jordan','mi@yahoo.net','050-493-5448','Ap #318-6352 Arcu Road'),
  ('30499287-5','Nerea Roberts','tempor@protonmail.net','031-432-7082','7898 Lorem Avenue'),
  ('41482774-8','Keegan Buck','pretium.neque@yahoo.couk','064-736-8411','Ap #713-5350 Tincidunt, Av.'),
  ('13137805-K','Daphne Franco','nulla.dignissim.maecenas@icloud.com','036-737-3683','2037 Nulla. Rd.'),
  ('4795390-1','Lynn Snyder','elit.dictum.eu@icloud.ca','048-234-2813','P.O. Box 657, 6370 Ut St.'),
  ('17942842-3','Nichole Brooks','sit.amet@hotmail.org','086-550-7540','Ap #162-1878 Nascetur St.'),
  ('48539519-9','Claudia Henson','augue.ut.lacus@outlook.com','080-341-7607','2146 Et, Street'),
  ('23279332-5','Leigh Hahn','velit.eu.sem@outlook.org','052-820-3852','Ap #638-2345 Fermentum Road'),
  ('7982126-8','Callie Ball','ante@aol.ca','076-670-8536','P.O. Box 786, 4920 Mauris Road'),
  ('15914648-0','Logan Townsend','suscipit.est@protonmail.ca','042-172-7461','1269 Elementum, Ave'),
  ('49264703-9','Haviva Cole','risus@aol.ca','041-372-1378','553-2746 Ut Av.'),
  ('13237645-K','Nicole Perez','est.tempor.bibendum@google.edu','078-687-8993','6002 Dui, Rd.'),
  ('25803929-7','Brent Miranda','placerat@outlook.net','076-152-8727','Ap #218-1445 Quis Rd.'),
  ('6457981-9','Rebecca Bennett','purus.maecenas.libero@aol.net','052-915-6458','955-8538 Ac Road'),
  ('40836252-0','Ivor Vega','quis.arcu@yahoo.edu','056-434-1641','Ap #131-9509 Ligula. St.'),
  ('9363313-K','Marsden Bush','augue@outlook.couk','021-668-1083','Ap #738-3012 Magna Av.'),
  ('14884125-K','Skyler Sandoval','ac.fermentum@icloud.net','058-178-8758','Ap #234-4240 Mauris Rd.'),
  ('27211344-0','Iona Chan','imperdiet.nec.leo@icloud.couk','065-904-3522','160-5512 Sed Ave'),
  ('9435908-2','Brianna Barr','nulla.tincidunt.neque@google.com','044-651-5073','728-4397 Scelerisque Road'),
  ('26844560-9','Indigo Murphy','sem@aol.org','063-859-6946','414-8676 Etiam Rd.'),
  ('29937285-5','Reece Rogers','aliquet@outlook.edu','048-216-8743','Ap #763-3220 Vestibulum St.'),
  ('26119415-5','Tanner Aguilar','natoque.penatibus@google.org','084-514-3382','831-5037 Blandit St.'),
  ('12987352-3','Jerome Branch','tempus.lorem.fringilla@google.net','048-387-1880','6249 Quis Av.'),
  ('27908982-0','Caesar Ewing','ipsum@outlook.couk','005-063-5840','711-2596 Erat. St.'),
  ('8739321-6','Zia Brady','pede.praesent.eu@protonmail.net','039-488-8146','Ap #922-6592 Pellentesque. Rd.'),
  ('36511172-3','Hanna Peters','libero.at@icloud.com','067-123-8515','264-884 Sit Rd.'),
  ('30980702-2','Cailin Leach','porttitor.eros.nec@yahoo.net','098-333-4915','P.O. Box 991, 4878 Risus. Rd.'),
  ('3683177-4','Hilary Salinas','metus.sit@hotmail.com','063-887-4811','P.O. Box 603, 6409 Dictum Av.'),
  ('19581251-9','Elmo Lyons','vulputate@hotmail.net','078-578-3393','Ap #328-9623 Vulputate Avenue'),
  ('14172121-6','Hedwig Rutledge','primis.in.faucibus@google.edu','017-211-8947','606-4821 Eu Street'),
  ('2158143-7','Hamilton Frye','eleifend.nec@icloud.ca','095-167-7710','7363 Vestibulum Av.'),
  ('7868853-K','Jael Roth','magnis.dis.parturient@aol.edu','001-578-9348','900-1630 Donec Ave'),
  ('7848839-5','Gil Bernard','enim.sed@outlook.net','016-728-5631','527-8901 Luctus Av.'),
  ('38849321-6','Danielle Browning','nonummy@protonmail.ca','077-587-2156','184-5277 Dolor Road'),
  ('33469193-4','Russell Carlson','porttitor@aol.ca','046-003-3283','Ap #454-5575 Nonummy Street'),
  ('32373825-4','Helen Bradley','imperdiet.ornare@outlook.ca','042-641-5752','372-6736 Vehicula. Road'),
  ('18752594-2','Adara Sexton','dignissim.pharetra@protonmail.edu','056-264-7731','Ap #503-1973 Ac Street'),
  ('33308807-K','Hanna Phelps','odio.vel.est@protonmail.ca','016-128-3741','559-4326 Libero Rd.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('3912162-K','Risa Velez','hendrerit.id@icloud.com','098-303-5224','P.O. Box 703, 3830 Dapibus St.'),
  ('16797971-8','Karina Wilder','blandit.congue.in@aol.org','054-770-9512','P.O. Box 121, 8021 Id Avenue'),
  ('49705222-K','Natalie Long','vitae.posuere@aol.couk','034-611-1128','P.O. Box 334, 847 Ut Street'),
  ('22831763-2','Thane Ramirez','integer.tincidunt.aliquam@protonmail.org','048-278-7788','321-5740 Bibendum Ave'),
  ('23229895-2','Quamar Diaz','egestas.rhoncus@outlook.com','032-257-4052','P.O. Box 441, 7509 Vestibulum Rd.'),
  ('3035147-9','Talon Forbes','dignissim.pharetra.nam@google.ca','085-318-8528','Ap #150-9956 A St.'),
  ('5010410-9','Brian Buckley','curabitur.vel@protonmail.couk','036-119-7451','Ap #133-7189 Non Avenue'),
  ('43795905-6','Leonard Glenn','aenean@outlook.ca','079-198-0136','Ap #766-1767 Orci, Av.'),
  ('27287723-8','Steel Ellison','velit.egestas.lacinia@hotmail.ca','024-730-3491','Ap #366-1453 Placerat, Road'),
  ('22302853-5','Reuben Hull','ut@yahoo.edu','053-435-7407','P.O. Box 852, 5285 Vehicula Avenue'),
  ('40432581-7','Hermione Bradley','nisi.sem@yahoo.ca','058-811-6983','388-4125 A Ave'),
  ('43299614-K','Kevin Gamble','quam.pellentesque.habitant@outlook.ca','094-471-4525','Ap #566-7193 Nunc Rd.'),
  ('31327804-2','Indigo Hester','euismod.enim.etiam@outlook.com','068-504-4827','672 Augue Avenue'),
  ('8438464-K','Drake Molina','rhoncus.nullam.velit@yahoo.com','001-165-0934','7935 Nec, Street'),
  ('49300337-2','Lucius Kirby','consequat@hotmail.net','085-578-1898','Ap #452-3412 Mollis Street'),
  ('18991347-8','Olympia Maldonado','nunc@icloud.ca','065-060-1727','Ap #334-4014 Diam Road'),
  ('24468163-8','Pearl Poole','arcu@google.couk','007-509-8850','2004 Etiam Rd.'),
  ('13687859-K','Charlotte Baldwin','nullam.feugiat.placerat@hotmail.edu','033-988-7291','Ap #389-3471 Mauris Road'),
  ('25987913-2','Warren Shannon','est@aol.net','083-375-6880','Ap #687-1407 Orci. Avenue'),
  ('2717454-K','Brady Leonard','vitae.diam.proin@outlook.ca','082-516-0384','5503 Nisl Rd.'),
  ('34834484-6','Rose Gill','blandit@yahoo.edu','083-653-8131','4975 Dolor Ave'),
  ('12313445-1','Amanda Chen','porttitor@yahoo.couk','077-567-3832','Ap #724-2184 Aliquam St.'),
  ('48866469-7','Lewis Hancock','cum.sociis.natoque@protonmail.ca','080-327-8673','Ap #235-7069 Eu Av.'),
  ('22308493-1','Raven Sherman','ad.litora@yahoo.com','079-982-3256','8895 Sed St.'),
  ('24598287-9','Yasir Bruce','vulputate.nisi.sem@hotmail.com','086-920-2268','P.O. Box 507, 2486 Mi Avenue'),
  ('32124950-7','Hayley Rivers','sodales.purus.in@yahoo.edu','017-453-6025','Ap #504-9068 Sed St.'),
  ('31190681-K','Aurora Baxter','purus@icloud.edu','073-605-3306','Ap #881-6745 Tincidunt Av.'),
  ('41496577-6','Barry Morris','ut.dolor.dapibus@outlook.com','038-312-3447','Ap #202-557 Penatibus St.'),
  ('1348136-9','TaShya Cooper','erat.sed@aol.edu','003-522-3400','P.O. Box 197, 4852 Sed Av.'),
  ('12406417-1','Marny Collier','fringilla@google.com','051-587-5374','8970 Nunc Av.'),
  ('31599959-6','Duncan Cruz','est@outlook.com','007-817-1805','312-729 Elit, Road'),
  ('25145191-5','Carolyn Mills','mauris.blandit@yahoo.org','046-073-9446','Ap #777-1279 Ipsum Avenue'),
  ('11989123-K','Gray Stephens','nonummy.ut.molestie@aol.net','022-744-5297','Ap #712-8965 Ullamcorper Rd.'),
  ('21900978-K','Kristen Carey','iaculis.odio@icloud.net','036-767-8534','530-9862 Euismod Ave'),
  ('28199367-4','Brandon Grant','pellentesque.a@aol.edu','028-773-7303','4793 Libero St.'),
  ('37758315-9','Hedy Ewing','duis@google.com','038-715-5245','711-2407 Dictum Avenue'),
  ('44858513-1','Clayton Schultz','erat.semper.rutrum@aol.net','023-819-3225','193-7893 Id, Ave'),
  ('3424618-1','Rama Ewing','rutrum.non@protonmail.com','096-548-3386','P.O. Box 965, 9147 Metus. St.'),
  ('39579783-2','Jack Hahn','mollis.duis.sit@aol.edu','080-073-5453','490-9298 In St.'),
  ('13131628-3','Sebastian Callahan','sociis.natoque@google.com','001-672-2984','790-4816 Vel Rd.'),
  ('23225926-4','Odette Kane','gravida.nunc@outlook.couk','043-806-7147','P.O. Box 185, 7581 Erat St.'),
  ('23304982-4','Kylee Trujillo','sociosqu.ad@outlook.couk','042-663-2463','Ap #896-3308 Tellus. Road'),
  ('6872702-2','Kareem Hale','egestas.fusce.aliquet@google.edu','059-684-2567','328-3522 A, St.'),
  ('29164861-4','Ulric Potts','luctus.et.ultrices@hotmail.com','094-646-4466','Ap #306-1213 Convallis, Road'),
  ('20482820-2','Sean Wooten','in@hotmail.net','047-455-0483','3610 Elit, Avenue'),
  ('6481317-K','Kevin Larsen','erat.volutpat@hotmail.net','001-424-6141','P.O. Box 510, 127 Penatibus Street'),
  ('29187358-8','Irene Love','pulvinar.arcu@hotmail.org','038-328-6187','Ap #542-9607 Tincidunt, St.'),
  ('10973664-3','Cameron Mueller','vestibulum.ut.eros@yahoo.com','096-082-4028','Ap #891-5521 Mattis Av.'),
  ('40517647-5','Caesar Cohen','proin.vel.nisl@protonmail.ca','074-361-0555','891-2438 Risus Ave'),
  ('3438540-8','Bianca Baldwin','ut.semper@outlook.com','067-512-1206','Ap #528-9305 Lacus. Street');

INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('826525-9','Indira Callahan','cursus@aol.org','046-654-2566','Ap #631-1204 Non Street'),
  ('24898840-1','Buckminster Carson','arcu.vestibulum@yahoo.org','022-216-3239','Ap #601-7252 Risus. Avenue'),
  ('3929541-5','Keane Torres','nec.metus@yahoo.net','099-657-8846','648-150 Velit St.'),
  ('7652481-5','Jennifer Spencer','bibendum.ullamcorper.duis@aol.com','023-043-6640','372-599 Nisi. Avenue'),
  ('18173588-0','Martin Romero','vivamus.rhoncus.donec@hotmail.com','015-665-8272','424 Blandit Avenue'),
  ('33565321-1','Myles Sandoval','lacus.quisque@yahoo.couk','060-315-4345','Ap #608-9184 Facilisis, Rd.'),
  ('8991625-9','Nehru Butler','pulvinar.arcu@outlook.net','027-887-5145','P.O. Box 243, 4816 Pellentesque Rd.'),
  ('31959798-0','Kane Albert','dolor@icloud.couk','006-657-2843','Ap #965-4398 Tortor, Avenue'),
  ('22863314-3','Robert Todd','orci.phasellus@hotmail.edu','047-086-6945','941-5711 Amet Street'),
  ('19228285-3','Adrian Wilkerson','convallis@yahoo.couk','025-328-1279','7345 Metus Av.'),
  ('34282783-7','Arsenio Dominguez','amet@aol.net','063-369-9276','Ap #934-7433 Justo St.'),
  ('4228336-3','Iona Padilla','sagittis@aol.edu','050-444-1330','589-2824 Pharetra Avenue'),
  ('20671560-K','Beck Jacobson','ut.sem@yahoo.edu','081-033-6303','P.O. Box 592, 5138 Ridiculus Avenue'),
  ('880234-3','Kelsie Case','nascetur.ridiculus.mus@aol.com','011-098-8868','8160 Quisque Av.'),
  ('27199649-7','Avye Burch','enim.non@yahoo.ca','068-366-7191','P.O. Box 372, 8181 Ac Ave'),
  ('6815957-1','Leo Barry','non.massa.non@hotmail.couk','045-874-5745','P.O. Box 895, 9294 Sed Ave'),
  ('33775772-3','Kay Ruiz','non.magna@icloud.com','038-446-4632','Ap #580-6254 Venenatis Road'),
  ('14452129-3','Hilary Lancaster','phasellus.in.felis@hotmail.com','076-651-7360','156 Nibh Avenue'),
  ('16979672-6','Lewis Mann','placerat.augue@google.ca','061-873-8915','P.O. Box 408, 4529 Arcu. Av.'),
  ('23758412-0','Geoffrey Cline','massa@google.org','053-209-5526','P.O. Box 337, 3027 Urna Avenue'),
  ('1477054-2','Keely Walls','eu.accumsan@outlook.net','054-447-6203','P.O. Box 235, 9060 Cras Rd.'),
  ('27187851-6','Rhea Hardy','bibendum.donec@hotmail.org','047-822-4562','Ap #631-903 Pretium St.'),
  ('34280409-8','Brooke Lang','a@protonmail.com','080-138-8245','Ap #924-175 Hendrerit Street'),
  ('48198255-3','Michelle Melendez','justo.praesent@hotmail.net','086-726-6567','811-6007 Pede St.'),
  ('39327767-K','Evangeline Ross','arcu.morbi.sit@aol.net','060-434-5395','885-7511 Suspendisse Road'),
  ('2946275-5','Peter Ferrell','vel@yahoo.com','001-183-1126','Ap #619-2576 Ac, Av.'),
  ('1453762-7','Lev Rush','magna@protonmail.com','089-226-5041','Ap #507-3735 Eu Road'),
  ('7143634-9','Carl Davidson','tincidunt.neque@icloud.com','055-458-1221','P.O. Box 987, 9348 Eu, Rd.'),
  ('21372862-8','Sylvester Henry','magna.nam.ligula@icloud.edu','097-233-5265','4769 Molestie Rd.'),
  ('3514192-8','Linus Baxter','proin.sed@protonmail.ca','036-150-2376','293-371 Cubilia Road'),
  ('6533418-6','Gage Rhodes','quam.dignissim@hotmail.edu','047-874-9707','498-6584 Parturient Road'),
  ('7939774-1','Hannah Conley','dolor.sit.amet@outlook.net','040-223-0348','Ap #582-7853 Dignissim Av.'),
  ('6451342-7','Kennan Todd','eget.volutpat@yahoo.edu','043-982-0021','6634 Malesuada Road'),
  ('28863789-K','Angelica Flowers','nisi.dictum.augue@outlook.ca','041-962-8380','898-6509 Pede, St.'),
  ('43375473-5','Samantha Young','vel.turpis@protonmail.edu','050-353-8326','Ap #921-563 Sapien, Rd.'),
  ('42800519-8','Elmo Fry','adipiscing.non.luctus@aol.com','014-122-8627','875-598 Arcu. Road'),
  ('32817752-8','Kareem Vargas','sem.consequat.nec@outlook.net','035-282-6281','205-9595 Orci Avenue'),
  ('30727189-3','Nichole Bryan','ante.ipsum.primis@hotmail.couk','031-601-3535','Ap #889-4250 Rutrum St.'),
  ('35546545-4','Neil Sweeney','dictum@yahoo.com','067-782-8169','979-3980 Tempor Av.'),
  ('8628742-0','Nevada Armstrong','quam@google.com','094-675-4342','P.O. Box 177, 496 Ipsum. St.'),
  ('10831281-5','Wyoming Saunders','nulla.aliquet@protonmail.couk','050-678-2640','597-6738 Erat St.'),
  ('32722242-2','Joy Holmes','metus.aliquam.erat@hotmail.couk','044-781-3082','9367 Feugiat. Rd.'),
  ('42196749-0','Nerea Durham','sem.mollis.dui@protonmail.ca','073-285-7378','P.O. Box 699, 901 Id, St.'),
  ('44920337-2','Carter Stephenson','rhoncus.donec@outlook.edu','032-217-0702','Ap #854-3087 Mollis Ave'),
  ('10284189-1','Evan Hebert','leo.in.lobortis@yahoo.net','046-267-3568','Ap #554-9508 Enim Ave'),
  ('16884278-3','Trevor Rhodes','sit@aol.org','016-660-4145','P.O. Box 546, 1753 Auctor. Ave'),
  ('40737419-3','Sara Waters','donec.nibh@hotmail.net','056-661-2413','1669 At, St.'),
  ('27214424-9','Elijah Barlow','tellus.aenean@icloud.edu','051-334-2398','Ap #434-5870 Mauris Rd.'),
  ('6272892-2','Knox Valdez','sem.magna.nec@protonmail.org','054-257-4654','Ap #162-4498 Lacus. St.'),
  ('39586197-2','Carol Mccoy','luctus@outlook.edu','029-539-6084','P.O. Box 131, 573 Erat St.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('49199378-2','Kevyn Rivers','donec@protonmail.edu','037-654-6843','790-2278 Vehicula. Av.'),
  ('1396687-7','Mara Evans','non.massa@google.couk','086-855-7917','555-6864 Nec, St.'),
  ('42618974-7','Hashim Tanner','pede.nunc@google.couk','053-826-6346','P.O. Box 973, 8319 Libero. Rd.'),
  ('24584998-2','Dara Cote','pellentesque.sed@outlook.org','078-444-2773','Ap #403-7237 Egestas. Ave'),
  ('234166-2','Fulton Shepard','tortor.integer.aliquam@icloud.org','027-662-1486','Ap #235-9280 Ipsum Road'),
  ('19980328-K','Charde Snider','dis@google.couk','015-631-4793','P.O. Box 776, 2150 Ut St.'),
  ('34678840-2','Mari Lopez','quis@outlook.com','068-494-1922','Ap #113-3886 Egestas Av.'),
  ('46461804-K','Sigourney Daniels','ut.pellentesque@outlook.com','072-364-1236','Ap #207-5199 Adipiscing St.'),
  ('22363485-0','Grant Ware','ut.nec@outlook.net','063-688-7337','5810 Risus. Ave'),
  ('34267828-9','Henry Warner','eu.dolor.egestas@hotmail.couk','038-347-4522','Ap #125-2503 Velit St.'),
  ('352622-4','Blaze Church','ac.urna.ut@google.ca','049-517-9932','Ap #419-5084 A Rd.'),
  ('9818708-1','Jayme Rosales','nulla.interdum@outlook.couk','083-924-8284','165-2670 Amet St.'),
  ('286688-9','Adrienne Gibbs','malesuada.ut@yahoo.net','052-850-6695','Ap #775-3864 Morbi Avenue'),
  ('22578559-7','Steel Dyer','eros.nec.tellus@outlook.edu','071-577-4227','Ap #637-5623 Sodales Avenue'),
  ('16282689-1','Vaughan Rhodes','proin.mi@protonmail.org','032-131-5410','P.O. Box 835, 5427 Nunc St.'),
  ('13505226-4','Joelle Branch','non.luctus@icloud.couk','088-564-3684','367-6409 Aenean St.'),
  ('47866625-K','Knox Slater','egestas@protonmail.com','080-886-0844','249-3564 Ante, Ave'),
  ('5063452-3','Hamilton George','facilisis@icloud.com','053-783-2184','827-2941 Aliquam St.'),
  ('42885656-2','Martena Acevedo','ac.libero@hotmail.edu','048-045-9005','P.O. Box 114, 3966 Imperdiet Av.'),
  ('1187551-3','Clayton Hahn','integer@google.org','083-501-6755','Ap #393-194 Hendrerit. St.'),
  ('2417256-2','Davis Pope','orci.sem@aol.edu','041-890-8576','689-5353 Ultricies Rd.'),
  ('13853750-1','Flynn Pollard','donec.felis@outlook.edu','019-311-5073','P.O. Box 182, 1266 Praesent Rd.'),
  ('1293679-6','Laith Paul','eget.metus.eu@aol.couk','084-189-0446','478-7247 Nam Avenue'),
  ('49948496-8','Justine King','vel.nisl@google.edu','012-993-5414','Ap #158-4143 Scelerisque Ave'),
  ('23573163-0','Ima Romero','nec@protonmail.edu','071-478-4846','777-9382 Purus. Rd.'),
  ('6465342-3','Stone Horne','porttitor.scelerisque@google.net','093-428-8332','Ap #564-4533 Nulla Av.'),
  ('35465402-4','Stella Mcknight','phasellus@aol.org','054-229-1942','Ap #175-1906 Odio. Rd.'),
  ('15892285-1','Charles Roberts','aliquet.proin@yahoo.edu','047-475-3234','Ap #683-5046 Bibendum. Rd.'),
  ('48381691-K','Oliver Cain','tincidunt.nunc@protonmail.edu','052-021-5565','P.O. Box 293, 7830 Molestie Ave'),
  ('32977875-4','Moana Gentry','et.ipsum.cursus@outlook.org','012-966-3730','818-6116 Tincidunt Rd.'),
  ('2139758-K','Jaime Wilkerson','ut.sagittis.lobortis@icloud.org','081-514-5497','Ap #365-1716 Sapien, Road'),
  ('17923606-0','Whoopi Key','nam@protonmail.net','027-787-4763','486-6791 Ipsum. Av.'),
  ('35753112-8','David Johnston','cursus@yahoo.net','045-825-0404','Ap #700-1521 Non Rd.'),
  ('32442161-0','Benedict Strong','non.lacinia@aol.ca','058-101-1436','P.O. Box 644, 7642 Amet, Rd.'),
  ('3836630-0','Alexa Foreman','ante@protonmail.edu','053-069-7957','5486 Auctor Av.'),
  ('19290599-0','Rajah Benson','nullam.vitae.diam@aol.ca','094-886-3451','184-6081 Eget, Street'),
  ('37277479-7','Channing Hampton','justo@google.edu','014-762-7111','Ap #430-2033 Amet St.'),
  ('44379948-6','Marvin Owen','quam@icloud.ca','081-840-5174','Ap #224-2534 Quis Ave'),
  ('40128587-3','Colby Shaffer','mauris.erat@hotmail.net','043-231-7520','826-8215 Posuere, St.'),
  ('34310228-3','Suki Abbott','mi.duis.risus@protonmail.org','031-381-8766','689-8802 Non Street'),
  ('10706379-K','Maite Adkins','eget.magna@protonmail.org','073-503-0289','142 Elementum Street'),
  ('18650194-2','Carol Vazquez','sociis.natoque@aol.couk','019-747-3834','Ap #222-4931 Vitae Ave'),
  ('311538-0','Deacon Hurley','maecenas.malesuada@yahoo.com','015-622-6768','275-5230 Magnis Avenue'),
  ('42453287-8','Xander Briggs','tortor.at.risus@google.org','084-119-9580','574-9321 Cras Ave'),
  ('50707777-3','Cassandra Rocha','volutpat@aol.com','085-621-8246','Ap #142-4813 Quisque Rd.'),
  ('10346114-6','Peter Peterson','ipsum.dolor.sit@icloud.edu','084-881-1685','P.O. Box 533, 2919 Ante Rd.'),
  ('46691665-K','Ursa Griffin','praesent.interdum@protonmail.couk','025-760-6216','Ap #383-8298 Vulputate St.'),
  ('19619789-3','Russell Heath','tincidunt.orci@yahoo.org','042-450-8797','Ap #474-9832 Dictum Rd.'),
  ('26351763-6','Indigo Mullen','pharetra.nibh.aliquam@yahoo.couk','036-109-8758','7727 In St.'),
  ('25522713-0','Basia Macdonald','mauris.erat@hotmail.com','020-144-2333','Ap #365-7790 Vel Ave');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('29475335-4','Kessie Roberson','orci.in@outlook.ca','045-591-7486','Ap #540-1176 Mi, Av.'),
  ('38504455-0','Sasha Cote','aliquam@hotmail.com','032-315-7783','1182 Ligula. St.'),
  ('40523969-8','Francis Webb','lobortis.quam@protonmail.couk','046-033-3808','Ap #729-5547 In, Rd.'),
  ('26352495-0','Benjamin Chaney','ac@aol.com','066-088-8312','Ap #574-8067 Metus Avenue'),
  ('17669273-1','Melvin Jimenez','dictum@hotmail.org','075-175-8367','P.O. Box 980, 2756 Lectus Street'),
  ('20255908-5','Barry Romero','neque.sed.eget@hotmail.net','016-534-7992','Ap #825-3060 Donec Av.'),
  ('18565531-8','Lee Blanchard','luctus.ipsum@google.com','053-710-2643','962-8915 Tellus. Avenue'),
  ('13962214-6','Keane George','augue.id.ante@outlook.net','044-636-5320','Ap #692-9278 Eu, Av.'),
  ('32379629-7','Priscilla Schwartz','vestibulum.accumsan.neque@protonmail.org','005-550-2606','282-4584 Vestibulum Avenue'),
  ('25724244-7','Winter Knox','libero.morbi@outlook.edu','058-377-4330','P.O. Box 347, 628 Sed Av.'),
  ('861660-4','Ingrid Jensen','auctor@google.com','065-755-4143','665-2699 Arcu. St.'),
  ('50427790-9','Xantha Henson','sed@icloud.net','058-259-2334','Ap #517-9550 Senectus Street'),
  ('16841887-6','Christian Gentry','pellentesque.massa.lobortis@protonmail.com','027-413-8160','704-7740 Senectus Rd.'),
  ('46371192-5','Alexis Miller','aliquam.adipiscing.lacus@hotmail.couk','083-442-7570','738-9652 Id, Rd.'),
  ('32843926-3','Hoyt Mathis','ut@outlook.edu','066-256-0704','P.O. Box 767, 3227 Cras Rd.'),
  ('34181117-1','Ignatius Gay','elementum.purus.accumsan@hotmail.ca','029-804-8419','Ap #931-9083 Et St.'),
  ('25238461-8','Scott Morrow','enim.nunc.ut@protonmail.net','080-022-6446','P.O. Box 816, 191 Et, Street'),
  ('45450359-7','Whilemina Rush','rutrum.eu@google.com','016-032-5109','2447 Dis St.'),
  ('6415906-2','Desiree Walsh','interdum.enim@protonmail.com','077-111-8298','850-1095 Nec Ave'),
  ('30252467-K','Karen Ward','sed@aol.edu','045-225-5011','769-5854 Suscipit Avenue'),
  ('2986816-6','Blythe Petty','viverra.donec@outlook.net','040-282-7244','Ap #579-8123 Urna. St.'),
  ('5633934-5','Rylee Battle','et.nunc.quisque@outlook.com','037-687-1310','Ap #920-6383 Vitae, Avenue'),
  ('14582575-K','Geraldine Clements','nec.orci@outlook.net','026-744-3476','P.O. Box 139, 4008 Non, Street'),
  ('1399243-6','Selma Sykes','tellus.eu@icloud.org','034-994-6759','P.O. Box 377, 7635 Pellentesque Street'),
  ('17542480-6','Fatima Arnold','ac.urna@aol.net','051-253-4580','Ap #231-7171 Curabitur St.'),
  ('23453878-0','Rafael Velez','ut.nisi.a@google.net','055-995-3628','9492 Tristique St.'),
  ('3344038-3','Cyrus Gross','orci.adipiscing@icloud.net','072-463-4572','547-2683 Interdum. St.'),
  ('29477102-6','Armando Mckee','nascetur@outlook.couk','015-753-5823','Ap #187-824 Aliquam Road'),
  ('25814227-6','Abraham Velasquez','erat.vivamus.nisi@aol.couk','027-210-5213','Ap #222-3182 Ad Road'),
  ('42508559-K','Brock Sherman','odio.nam@outlook.ca','044-577-4874','9814 Integer Ave'),
  ('1617703-2','Catherine Houston','donec@yahoo.org','003-774-3882','4281 Rutrum, Ave'),
  ('2718614-9','Brian Chang','in.scelerisque.scelerisque@hotmail.ca','093-809-5734','Ap #349-5790 Tincidunt Rd.'),
  ('4348833-3','Fredericka Booth','sed.et@aol.org','025-718-8189','Ap #702-6643 Aliquam Street'),
  ('622622-1','Nolan Ray','lorem.donec@hotmail.org','052-646-2047','797-1083 Libero. St.'),
  ('3787833-2','Janna Calhoun','curabitur.vel.lectus@outlook.edu','078-297-8669','P.O. Box 428, 6574 Leo. St.'),
  ('47229731-7','Reese Woods','amet.ultricies.sem@hotmail.ca','037-516-0225','501-7180 Phasellus Av.'),
  ('579393-9','Olivia Booth','nunc.mauris.sapien@protonmail.org','040-165-3801','880-7059 Sollicitudin St.'),
  ('31463680-5','Ramona Christian','vitae@outlook.org','083-779-8222','P.O. Box 952, 7851 Donec Road'),
  ('6864554-9','Rana Stein','sollicitudin.a@hotmail.com','082-283-1682','558-1786 Tempor Ave'),
  ('39988545-0','Upton Walker','ipsum@yahoo.com','056-518-3098','P.O. Box 756, 7005 Elit Street'),
  ('33782557-5','Illana Richmond','lacus.aliquam@aol.edu','008-528-7740','Ap #961-6765 Aliquet Rd.'),
  ('43425922-3','Gemma Adkins','egestas@aol.edu','061-611-0122','787-2821 Aenean Rd.'),
  ('49836924-3','Lois Oneal','vitae.erat.vel@google.com','052-912-2689','Ap #448-1154 Tellus Rd.'),
  ('1253946-0','Kermit Cardenas','eu.tellus.phasellus@yahoo.net','012-265-8285','Ap #529-3239 Molestie Rd.'),
  ('37341101-9','Brady Crosby','non.vestibulum@google.edu','052-965-5133','663-7462 Mus. St.'),
  ('20667594-2','Lesley Mejia','ac.mattis@protonmail.edu','026-989-6352','498-5109 Sit Street'),
  ('38393890-2','Amir Phelps','risus.donec@protonmail.org','008-145-6133','801-9897 Ornare Ave'),
  ('33926788-K','Stewart Glover','arcu.aliquam@icloud.net','043-335-7754','Ap #953-521 Habitant St.'),
  ('42961871-1','Gregory Gibbs','a.mi@protonmail.org','037-675-6386','Ap #290-5699 Est, Ave'),
  ('28686792-8','Tobias Bolton','dictum.ultricies@yahoo.ca','041-142-8464','Ap #980-7729 Lorem, Ave');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('10219714-3','Chelsea Harmon','odio.phasellus@google.net','044-911-4336','Ap #887-7115 Ut Rd.'),
  ('35878746-0','Janna Roberson','mi.lacinia@google.net','034-595-5475','3813 Rutrum Av.'),
  ('23473511-K','Kiona Hopper','ultrices@hotmail.edu','035-394-6561','P.O. Box 186, 6819 Nec Avenue'),
  ('34701221-1','Raven Gilmore','vulputate.mauris.sagittis@icloud.net','046-674-2677','P.O. Box 809, 1362 Ac Rd.'),
  ('12309415-8','Gabriel Koch','in@hotmail.ca','062-395-3687','410-8745 Non St.'),
  ('39619954-8','Charles Atkinson','molestie.tortor@aol.couk','064-651-4186','769-1731 Dictum Av.'),
  ('47263493-3','Denise Buchanan','bibendum.fermentum@protonmail.net','069-675-6544','371-7469 Ipsum Av.'),
  ('53395-5','Dexter Madden','eget.mollis@hotmail.net','021-971-5108','Ap #968-8964 Hendrerit St.'),
  ('27347975-9','Rigel Hayden','non.leo@google.ca','029-457-8765','858-503 Sodales Rd.'),
  ('9896230-1','Aristotle Ross','vulputate@aol.org','036-727-7332','Ap #666-3548 Nunc St.'),
  ('37667154-2','Dara Jefferson','velit.in@outlook.couk','085-533-1232','Ap #638-980 Vestibulum Road'),
  ('49131271-8','Gage Luna','ut.pharetra.sed@hotmail.edu','088-308-0874','Ap #983-8831 Donec Rd.'),
  ('28279548-5','Martina Lee','etiam@aol.ca','081-887-0444','312-2750 Nascetur Rd.'),
  ('46910506-7','Joel Dixon','vel.est.tempor@aol.com','045-241-9650','1362 Suspendisse St.'),
  ('10962530-2','Catherine Roberson','luctus.aliquet@hotmail.ca','047-843-4486','Ap #630-6940 Vel, Avenue'),
  ('34388372-2','Ashely Shannon','luctus.ipsum.leo@icloud.com','037-154-1550','786-9094 Rhoncus. Ave'),
  ('5184508-0','Julian Velasquez','magna.malesuada@protonmail.com','037-613-7567','9817 Et, Rd.'),
  ('39578339-4','Brian Massey','fusce@outlook.com','066-919-5431','Ap #896-8366 Convallis, St.'),
  ('33783997-5','Calvin Gibson','nunc.est.mollis@google.edu','063-222-4178','888-5798 Sit Rd.'),
  ('14775706-9','Scarlet Turner','laoreet.lectus@google.couk','076-470-1138','6831 Sed Rd.'),
  ('10889671-K','Omar Cortez','per.inceptos.hymenaeos@outlook.org','029-222-6213','Ap #855-3683 Interdum. Ave'),
  ('17256368-6','Barclay Becker','fringilla.porttitor@hotmail.ca','028-562-0618','P.O. Box 939, 1528 Erat Road'),
  ('16949388-K','Willow Collins','interdum.nunc@outlook.org','034-519-3449','986-8557 Orci St.'),
  ('11125584-9','Quintessa Harmon','faucibus.leo.in@icloud.ca','032-729-6286','109-8082 Risus St.'),
  ('32599126-7','Harlan Moody','at.lacus.quisque@protonmail.net','087-543-2040','Ap #222-2248 Metus. Rd.'),
  ('18352275-2','Dai Sutton','eget@google.org','053-834-6785','Ap #700-6465 Cras St.'),
  ('25864978-8','Kevyn Guy','mi.enim@outlook.edu','043-964-1655','P.O. Box 773, 1452 Amet Street'),
  ('29968348-6','Mary Hubbard','cursus.et@yahoo.net','047-202-1470','P.O. Box 866, 6774 Quis Ave'),
  ('11988320-2','Sade Conner','donec.est@icloud.edu','024-470-6661','Ap #891-7820 Posuere Rd.'),
  ('4686762-9','Galena Wilcox','non.dapibus@hotmail.edu','058-684-4449','919-4328 Ipsum. Rd.'),
  ('16543524-9','Yen Hendrix','lorem@google.org','014-146-1846','562-4945 Lacus. St.'),
  ('7980123-2','Hoyt Martinez','adipiscing.fringilla@google.couk','081-805-2105','P.O. Box 154, 401 Lectus, Rd.'),
  ('11128351-6','Orli Tyler','lobortis.class.aptent@google.org','042-898-3223','P.O. Box 270, 3619 Fusce Road'),
  ('35636383-3','Illana Osborn','eleifend@icloud.edu','011-033-3700','183-7167 Mauris Av.'),
  ('25414315-4','Hollee Mercado','sit@aol.edu','057-337-7522','P.O. Box 976, 1319 Ullamcorper. St.'),
  ('33330984-K','Nasim Bender','vivamus.nibh@icloud.org','035-416-8382','Ap #971-3651 Non Ave'),
  ('1281503-4','Iona Short','fringilla@icloud.net','007-144-5294','741-5481 Natoque St.'),
  ('38460966-K','Kieran Bryant','dui.cum@aol.couk','080-333-2714','637-961 Vitae Av.'),
  ('19857451-1','Bree Hunt','luctus.curabitur@yahoo.net','059-598-0820','703-699 Sem Ave'),
  ('37467881-7','Charlotte Wolf','mus.aenean@outlook.edu','055-236-3853','8932 Praesent Avenue'),
  ('33371630-5','Ignatius Morton','euismod.in@yahoo.net','096-524-7753','P.O. Box 547, 7819 Suspendisse St.'),
  ('10886477-K','Elijah Peterson','volutpat.nulla@google.ca','037-117-0367','439-6852 Nunc Ave'),
  ('97034-4','Kirk Pope','risus.quisque.libero@icloud.net','081-177-6685','710-6976 Ligula Ave'),
  ('1648971-9','Renee Mcclain','sollicitudin@outlook.edu','013-466-5094','198-5204 Morbi Rd.'),
  ('32642704-7','Ian Mccarty','congue.turpis@protonmail.couk','043-444-5608','Ap #965-1714 Turpis Ave'),
  ('27617748-6','Addison Reed','nam.interdum.enim@yahoo.edu','051-781-3730','Ap #831-4944 Nullam Road'),
  ('6893141-K','Sandra Gillespie','a@yahoo.net','034-983-9516','P.O. Box 238, 7388 Risus Rd.'),
  ('6237730-5','Tanek Gamble','vulputate.ullamcorper.magna@icloud.net','012-333-4424','Ap #223-5778 Amet Ave'),
  ('47578117-1','Cara Heath','odio@outlook.com','069-110-8761','7147 Lacus. St.'),
  ('6328185-9','Brielle Stone','convallis.ligula@yahoo.com','068-449-4497','Ap #918-3397 Pellentesque Street');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('15670796-1','Clare Gay','pede.nec@yahoo.com','021-432-5311','981 Massa. St.'),
  ('3641462-6','Yuli Stafford','sed.orci@protonmail.org','061-687-3703','Ap #847-964 Neque. Rd.'),
  ('7175488-K','Melinda Kirkland','etiam.vestibulum.massa@yahoo.com','071-834-6518','Ap #944-5552 Odio. St.'),
  ('34883250-6','Dalton Williamson','tortor.nibh.sit@yahoo.ca','087-637-8727','131-2251 At Street'),
  ('31206779-K','Faith Hughes','euismod.mauris.eu@yahoo.com','082-547-8455','431-3987 In, Rd.'),
  ('46608268-6','Rudyard Roberts','nulla@hotmail.couk','023-546-4148','P.O. Box 724, 8230 Vitae Av.'),
  ('36751859-6','Nero Steele','hendrerit.consectetuer.cursus@google.com','079-557-9144','P.O. Box 890, 5141 Non St.'),
  ('22592713-8','Abel Hartman','bibendum@icloud.net','028-819-9163','357-4975 Non, Av.'),
  ('37516398-5','Lareina Larson','nam.ac@google.org','035-704-6527','Ap #384-7743 Malesuada St.'),
  ('15784570-5','Macey Anderson','vestibulum.lorem@yahoo.net','044-565-1331','9902 Placerat Ave'),
  ('27301426-8','Porter Kaufman','nisl.maecenas@aol.com','038-504-1425','Ap #624-4252 Lacus. Ave'),
  ('654214-K','Martena Montoya','curabitur.egestas@hotmail.com','008-528-6286','Ap #628-834 Felis St.'),
  ('12397181-7','Donna Shaffer','amet.ultricies.sem@icloud.ca','017-582-9561','Ap #587-7331 Hendrerit. Ave'),
  ('11826891-1','Lani Skinner','ante@aol.couk','076-837-5187','5826 Lectus Ave'),
  ('4284840-9','Damon Wilkerson','dictum@aol.couk','077-192-6805','Ap #922-8239 Porttitor Ave'),
  ('3948172-3','Dominic Mullen','cursus@aol.com','081-492-7311','P.O. Box 743, 1378 Lobortis Rd.'),
  ('46862498-2','Freya Mcneil','sit@yahoo.org','061-281-7202','Ap #124-2858 Vestibulum St.'),
  ('31933998-1','Ariana Dickerson','elementum.purus@protonmail.ca','027-882-6822','1047 Faucibus. St.'),
  ('42927751-5','Tanya Spence','nulla.vulputate@google.com','085-886-0076','227-1553 A, Rd.'),
  ('10103950-1','Wesley Joyce','non.enim.commodo@outlook.net','068-731-5971','5120 Nam St.'),
  ('30513489-9','Jada Wheeler','cubilia.curae@google.ca','071-531-6727','8706 Tellus. Avenue'),
  ('36516726-5','Brennan Collins','faucibus.orci@protonmail.org','070-147-6087','P.O. Box 519, 9213 Mauris. Ave'),
  ('6346816-9','Cody Robbins','amet.metus@yahoo.net','056-276-7121','805-9195 Non Street'),
  ('95828-K','Alvin Zamora','tellus.suspendisse.sed@outlook.com','024-108-6207','P.O. Box 763, 5544 Magna. Street'),
  ('1629139-0','Erica Bradley','nec.ante.maecenas@yahoo.net','086-072-5343','P.O. Box 828, 1015 Lacus. Rd.'),
  ('48337467-4','Helen Benton','laoreet.posuere@yahoo.ca','040-764-6176','1911 Etiam Ave'),
  ('4519732-8','Owen Wilkerson','ut.dolor@protonmail.net','056-611-2701','Ap #705-9747 Egestas. Ave'),
  ('298349-4','Beverly Maynard','eget.ipsum@outlook.com','080-152-4171','Ap #725-2879 Mauris Av.'),
  ('8882892-5','Wang Lamb','in.at.pede@protonmail.net','058-568-0778','184-822 Consequat Rd.'),
  ('23724566-0','Peter Massey','quisque@outlook.ca','096-167-6379','Ap #614-7278 Vivamus Av.'),
  ('13677701-7','Holly Hines','cras.eu.tellus@protonmail.ca','019-534-7660','217-5284 Vitae Avenue'),
  ('15467298-2','Beau Hobbs','cras@yahoo.ca','091-772-2019','Ap #380-5089 Donec Rd.'),
  ('10837675-9','Omar Clements','a.sollicitudin@outlook.edu','086-288-8534','Ap #224-7136 Consectetuer St.'),
  ('42310596-8','Sonya Gilliam','proin.ultrices@yahoo.org','071-282-8511','Ap #754-881 Eu Rd.'),
  ('21251401-2','Louis William','adipiscing.elit@outlook.net','065-073-4954','Ap #976-8060 Consequat St.'),
  ('45456811-7','Tara Valencia','sem.vitae.aliquam@protonmail.couk','051-961-6262','363-5646 Risus. Road'),
  ('34614323-1','Savannah Michael','duis.a@hotmail.com','097-575-3502','752-133 Fermentum Rd.'),
  ('24908689-4','Jakeem Conley','orci@icloud.couk','016-451-1146','169-1761 Magna. St.'),
  ('38888491-6','Rigel Chavez','donec.tincidunt@aol.com','023-533-1846','Ap #476-385 Mauris Rd.'),
  ('823358-6','Chancellor Poole','aliquam.iaculis.lacus@aol.com','077-145-2374','214-9767 Nibh. St.'),
  ('29235193-3','Kevin Irwin','velit@protonmail.com','065-970-2627','Ap #990-5436 A St.'),
  ('27126195-0','Carter Parrish','aliquet.odio.etiam@aol.com','087-631-6792','325-5066 Venenatis Av.'),
  ('33404901-9','Hakeem Mcconnell','proin.vel.nisl@outlook.com','044-317-8296','171-5619 Cras Street'),
  ('48971155-9','Tanya Mathis','mauris.sagittis@protonmail.couk','002-388-4742','4101 Amet, Av.'),
  ('4896751-5','Simone Christensen','nulla.integer.vulputate@icloud.edu','037-636-1723','Ap #834-3290 Diam. Road'),
  ('42175995-2','Signe Puckett','gravida.nunc.sed@hotmail.edu','044-844-6029','P.O. Box 567, 3451 Dolor, Rd.'),
  ('13564265-7','Alan O''brien','cras.eget.nisi@yahoo.org','054-967-9572','957-4721 Massa Street'),
  ('38540198-1','Clinton Gordon','sem@outlook.org','023-567-9967','Ap #184-7538 Pede, Avenue'),
  ('33796533-4','Jerry Bradley','erat.etiam@google.edu','046-682-5880','Ap #961-9768 Sit Road'),
  ('44370765-4','Mannix Porter','auctor.vitae.aliquet@icloud.com','078-844-1253','144-1980 Sociis Rd.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('18799165-K','Garth Bray','pellentesque.habitant.morbi@outlook.edu','091-921-7353','Ap #794-5895 Aenean St.'),
  ('461852-1','Alyssa Mcguire','gravida.sit.amet@outlook.ca','015-744-7827','Ap #606-1236 Sed St.'),
  ('3365978-4','Clayton Shepherd','nonummy.ultricies@google.ca','036-500-5448','Ap #519-9333 Nisi. Ave'),
  ('41777347-9','Ciaran Grimes','eleifend.nunc.risus@outlook.couk','091-845-8549','810-6919 Ante Ave'),
  ('10344755-0','Andrew Parsons','ut.quam.vel@outlook.org','048-893-4753','Ap #806-3801 Gravida St.'),
  ('15827626-7','Yuli Sykes','leo.vivamus@hotmail.com','048-506-2546','564-9375 Ligula Av.'),
  ('36218685-4','Noelle Houston','sit.amet@yahoo.net','043-713-0673','Ap #444-3024 Ridiculus Street'),
  ('31512203-1','Dalton Sellers','mollis.vitae.posuere@hotmail.couk','087-855-9455','P.O. Box 630, 784 Leo Rd.'),
  ('38862398-5','Rooney Quinn','eu.ligula@aol.ca','028-737-6644','Ap #979-6204 Eros Avenue'),
  ('17518858-4','Venus Walker','feugiat.metus.sit@protonmail.com','047-798-3985','696-7512 Gravida St.'),
  ('3249722-5','Allistair Lee','imperdiet@hotmail.couk','038-764-1863','8963 Et Rd.'),
  ('47799176-9','Tatum Holden','et.netus.et@icloud.ca','002-577-4069','P.O. Box 628, 1963 A Road'),
  ('20962990-9','Demetrius Holmes','dictum.augue@protonmail.net','008-797-0773','Ap #135-3037 Sed Rd.'),
  ('34605201-5','Velma Alford','non.magna@protonmail.ca','018-368-1145','968-8017 Lacus. Rd.'),
  ('362596-6','Sharon Coleman','cras@google.net','050-423-6053','Ap #468-9906 Parturient Ave'),
  ('17375952-5','Olympia Mathis','neque.in@outlook.couk','093-723-3577','724-1186 Mauris Road'),
  ('10937332-K','Bianca Robinson','diam@outlook.net','054-120-1284','733-993 Sed St.'),
  ('48821618-K','Cally Patrick','maecenas.malesuada@yahoo.ca','087-862-2966','954-7787 Orci Av.'),
  ('33862339-9','Oprah Webster','fermentum.vel@aol.net','092-862-3718','Ap #830-7869 Sit Av.'),
  ('21532819-8','Kennan Gutierrez','consequat.enim@protonmail.com','040-230-1286','Ap #136-8782 Et, Street'),
  ('33862361-5','Rashad Watts','nonummy.fusce@outlook.couk','072-737-4116','7891 Sed St.'),
  ('36306890-1','Odette Carver','turpis.aliquam@aol.couk','072-389-8145','Ap #350-296 Iaculis Street'),
  ('22914299-2','Kylie Frank','eleifend.nunc.risus@outlook.com','062-635-2165','8986 Luctus Rd.'),
  ('1615409-1','Malcolm Roman','vitae@hotmail.ca','054-792-2544','P.O. Box 586, 7212 Et, Road'),
  ('4095870-3','Signe Parks','est.tempor@aol.ca','062-972-6655','298-1073 Nibh Avenue'),
  ('16177145-7','Karyn Webb','orci.tincidunt.adipiscing@outlook.couk','082-634-6758','353-6670 Massa. Avenue'),
  ('6710818-3','Nero Savage','scelerisque.lorem.ipsum@icloud.edu','073-672-3274','Ap #582-6617 Nulla. St.'),
  ('1124366-5','Sydney Cooper','justo.faucibus@aol.ca','035-617-7768','Ap #146-5098 Et Rd.'),
  ('1925053-9','Hilary Bryan','euismod.mauris@yahoo.couk','081-087-9752','139-5742 Ultricies Street'),
  ('47506426-7','Joy Bright','nulla.donec@hotmail.couk','046-648-4591','7059 Libero Rd.'),
  ('4497765-6','Grant Fox','vel.turpis@outlook.edu','068-451-1457','236-9939 Mus. Rd.'),
  ('10773220-9','Brooke Perez','non.enim.mauris@icloud.net','036-189-7189','129-6138 Suspendisse Rd.'),
  ('29893435-3','Imani Parks','non@hotmail.net','063-472-5623','7060 Ligula. St.'),
  ('20252144-4','Aristotle Poole','condimentum.donec@icloud.couk','072-646-6121','P.O. Box 707, 4235 Volutpat Road'),
  ('1771105-9','Thomas Chase','sagittis.lobortis@protonmail.com','013-393-2435','Ap #785-8841 Eros. Road'),
  ('48105159-2','Micah Stein','velit.justo.nec@google.couk','004-073-7332','Ap #127-6784 Ligula. Street'),
  ('3970336-K','Zephania Phillips','vitae@google.couk','012-462-2124','135-2154 Non Av.'),
  ('4132063-K','Alec Haney','risus@hotmail.edu','078-417-4894','Ap #313-4700 Velit Rd.'),
  ('26886840-2','Emerald Spence','quis.pede@aol.org','015-022-6394','Ap #372-9931 Ut Road'),
  ('4924292-1','Abel York','malesuada.fames.ac@aol.com','080-567-7735','3617 Erat Road'),
  ('2593595-0','Eliana Griffin','turpis@aol.org','072-528-2535','432-3746 Arcu. Rd.'),
  ('38912466-4','Zephr Hill','auctor@google.org','069-342-1985','P.O. Box 660, 866 Egestas. Ave'),
  ('11903114-1','Warren Mcclain','ornare.in@aol.net','084-157-8658','249 Pede Ave'),
  ('38484150-3','Mara Brock','sem.egestas@hotmail.org','031-556-7021','843-4219 Molestie Av.'),
  ('19336750-K','Mohammad Kinney','vel@icloud.ca','083-670-0118','P.O. Box 405, 5825 Ipsum Avenue'),
  ('45361803-K','Candace Munoz','nibh.aliquam@protonmail.edu','034-186-6793','Ap #510-1968 Non, Ave'),
  ('14707264-3','Noelle Pittman','sit@outlook.couk','027-689-7878','9322 A Road'),
  ('20246700-8','Ignacia Tran','ullamcorper@yahoo.edu','033-301-7002','5505 Ridiculus Avenue'),
  ('7915833-K','Jocelyn Strickland','lorem.auctor@protonmail.couk','011-446-3761','8161 Cras St.'),
  ('18279580-1','Seth Valdez','quisque.imperdiet.erat@outlook.com','004-817-2849','Ap #118-6563 Ultricies Rd.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('32696732-7','Kyle Goodman','interdum.libero.dui@icloud.com','092-282-8285','Ap #156-8653 Ut, St.'),
  ('8586875-6','Hedy Mullins','ac.mi.eleifend@google.ca','056-762-5324','396-4786 Semper Road'),
  ('1786143-3','Mia Boone','libero@outlook.com','033-435-1236','Ap #606-2684 Etiam Ave'),
  ('18608315-6','Yen Bray','eros.nec.tellus@hotmail.net','015-330-8603','3854 Enim, Rd.'),
  ('42777897-5','Francesca Guzman','purus.in@outlook.ca','084-293-4263','224-8199 Sem, Avenue'),
  ('2317726-9','Josephine Waters','est.ac@hotmail.ca','082-287-8662','581-9921 Massa Avenue'),
  ('18996592-3','Carlos Guy','enim.etiam@hotmail.net','079-213-8738','5498 In, St.'),
  ('18507970-8','Madeline Hess','aenean@aol.net','093-415-6477','374-2568 Donec Av.'),
  ('41684322-8','Geraldine Leach','dolor.quisque@hotmail.org','090-606-8927','P.O. Box 910, 520 Eu, Ave'),
  ('37766603-8','Ruth Guzman','eget@icloud.edu','025-062-6553','Ap #409-6334 Adipiscing St.'),
  ('11742919-9','Aidan Santiago','euismod.enim@icloud.edu','011-668-7343','Ap #547-5152 Elit Street'),
  ('48139555-0','Curran Rodgers','posuere.at@google.edu','078-761-1056','598-8341 Posuere Road'),
  ('1865675-2','Kimberly Guy','lorem.ipsum@yahoo.com','070-087-7495','Ap #734-7565 Tempor Ave'),
  ('47110134-6','Moses Pope','libero.mauris@icloud.edu','024-735-5354','4649 Primis Rd.'),
  ('21759649-1','Ramona Head','scelerisque.dui.suspendisse@aol.org','046-761-6819','Ap #922-817 Tristique Avenue'),
  ('3740972-3','Allen Callahan','sem@icloud.net','013-311-7724','723-8945 In Rd.'),
  ('22975731-8','Gillian Hull','ipsum.porta@aol.couk','029-420-3199','Ap #257-6603 Fermentum Rd.'),
  ('34709987-2','Zeus Patterson','et.malesuada@protonmail.couk','098-292-7803','5279 Donec Street'),
  ('33473373-4','Wynne Flores','augue.eu@yahoo.com','032-245-1623','P.O. Box 790, 4429 Lobortis St.'),
  ('35137234-6','Keely Greene','ipsum.ac@icloud.com','030-728-6917','P.O. Box 883, 6141 Congue. Rd.'),
  ('21184458-2','Colette Holder','enim.sed.nulla@hotmail.edu','061-257-9445','969-354 Aliquet Rd.'),
  ('4857214-6','Georgia Rose','ligula.donec@aol.net','093-671-8736','900-649 Nec Rd.'),
  ('31248750-0','Lani Booth','a.facilisis@google.net','086-847-6501','P.O. Box 122, 6305 Phasellus Ave'),
  ('33100793-5','Cameron Gill','mauris.integer.sem@outlook.couk','057-218-4754','479-2687 Ornare Ave'),
  ('27799616-2','Brenna Morrison','rhoncus.nullam@outlook.org','077-223-8365','Ap #614-1781 Orci, Av.'),
  ('1528456-0','Andrew Morse','luctus.ipsum@icloud.org','056-948-3835','Ap #484-2655 Hendrerit Rd.'),
  ('42648311-4','Ava Hood','sed.tortor@protonmail.net','045-427-4455','1882 Lorem St.'),
  ('36874751-3','Ayanna Shaw','nunc.laoreet.lectus@yahoo.net','021-286-4651','Ap #409-464 Vitae, Av.'),
  ('22499113-4','Stuart Cox','donec.at@protonmail.edu','038-734-3001','Ap #327-5268 Proin Av.'),
  ('4528653-3','Colin Sanford','felis.adipiscing@icloud.net','082-164-8823','P.O. Box 745, 6720 At, St.'),
  ('30967752-8','Boris Morin','etiam.ligula@yahoo.ca','088-908-3779','Ap #320-1927 Mauris Av.'),
  ('16410532-6','Reed Frye','penatibus.et@aol.couk','075-282-3493','Ap #148-3525 Eu St.'),
  ('21560113-7','Rooney Sims','dolor@outlook.ca','058-252-4751','Ap #440-9868 Sed, Rd.'),
  ('26638892-6','Mona Chaney','sodales.elit@icloud.couk','048-861-1115','Ap #343-1146 Sapien, Ave'),
  ('1179973-6','Robin Weaver','laoreet@hotmail.couk','098-721-8845','P.O. Box 545, 1608 Lacinia Ave'),
  ('2877565-2','Fletcher Adams','suspendisse.aliquet@protonmail.edu','083-625-4512','583-6603 Libero Street'),
  ('36781566-3','Cadman Koch','nisl.nulla@icloud.net','011-684-4161','537-3678 Enim Rd.'),
  ('4288088-4','Kenneth Golden','nonummy.ipsum@google.org','047-333-2581','Ap #572-4154 Cum Rd.'),
  ('2775313-2','Winifred Singleton','elit.curabitur@protonmail.net','023-164-5743','607-3807 Dignissim. St.'),
  ('49813676-1','Yoshio Cote','volutpat.nulla@google.ca','083-388-8745','P.O. Box 612, 1037 Nunc Road'),
  ('35918199-K','Ulla Mcclain','ac.facilisis@hotmail.ca','050-363-3427','3221 Libero St.'),
  ('11306566-4','Rhoda May','sed@hotmail.ca','093-827-5725','Ap #376-9821 Cras Av.'),
  ('325008-3','Guinevere Donovan','duis.risus@yahoo.ca','087-170-2986','Ap #436-192 Ac Ave'),
  ('13701252-9','Patricia Mccarthy','auctor.odio.a@hotmail.org','034-428-7617','5769 Justo. St.'),
  ('11940741-9','Chaney Richards','ut.lacus@protonmail.ca','061-543-1536','P.O. Box 189, 5178 Cras Avenue'),
  ('3862487-3','Darius Allen','est.mauris@outlook.ca','036-177-3705','8034 Quis St.'),
  ('25491389-8','Jelani Short','accumsan.laoreet.ipsum@icloud.org','033-899-4628','P.O. Box 417, 5474 Ligula. Avenue'),
  ('18753887-4','Pamela Irwin','id.mollis.nec@hotmail.net','035-812-5382','210-1533 Tempus Rd.'),
  ('38906790-3','Kylan Hendrix','facilisis.facilisis.magna@hotmail.couk','032-627-4713','Ap #259-8671 Arcu. Ave'),
  ('50148857-7','Owen Leon','nec.malesuada@protonmail.net','056-118-1203','513-8518 Consectetuer Rd.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('33205809-6','Whitney Hopkins','ipsum.nunc@outlook.edu','007-514-4757','1219 Nascetur Av.'),
  ('45319792-1','Melodie Dunn','dui.lectus@icloud.edu','056-364-8348','P.O. Box 997, 845 Phasellus Ave'),
  ('18634364-6','Lara Key','arcu@hotmail.net','057-841-1880','172-5186 Morbi Avenue'),
  ('27356797-6','Althea Monroe','libero@protonmail.net','085-060-5741','392-4873 Adipiscing Road'),
  ('6648449-1','Cheyenne Hester','commodo.at@protonmail.org','017-489-7158','604-6298 Quis, St.'),
  ('47307353-6','Brandon Oliver','nisi.a@yahoo.com','066-627-7551','423-9931 Proin Street'),
  ('45718276-7','Lael Chen','accumsan@icloud.couk','014-710-9857','P.O. Box 537, 6673 Tortor Rd.'),
  ('32751281-1','Nathaniel Haney','non.dui@icloud.net','063-548-5408','P.O. Box 491, 5255 Montes, St.'),
  ('9848752-2','Adrienne Mooney','risus.donec@hotmail.edu','048-782-2071','Ap #217-8831 Primis Street'),
  ('24909505-2','Lani Bauer','mauris@icloud.ca','032-828-5236','667-7817 Lectus St.'),
  ('711151-7','Rahim Wise','vel.arcu@aol.org','061-611-8183','4120 Curabitur St.'),
  ('46309313-K','Omar Simon','curabitur@icloud.couk','072-231-9302','513-8691 Sed Avenue'),
  ('20287539-4','Keane Love','luctus.et.ultrices@hotmail.net','053-628-0344','206-5848 A Road'),
  ('47911723-3','Colette Long','nunc.ac.mattis@yahoo.ca','093-358-4286','P.O. Box 859, 553 Nunc St.'),
  ('45338344-K','Travis Stevenson','cursus.integer@outlook.ca','018-807-0315','Ap #817-1929 Imperdiet Rd.'),
  ('29258107-6','Diana Schroeder','erat.sed@yahoo.com','047-745-3757','463-7970 Faucibus Rd.'),
  ('24642835-2','Haley Larson','amet.massa@google.org','050-473-0430','628-1548 Montes, Ave'),
  ('15739680-3','Owen Steele','vitae.erat@outlook.edu','071-863-5562','P.O. Box 718, 233 Et, St.'),
  ('43954539-9','Stella Maldonado','eu.odio@google.com','004-198-3824','Ap #474-8126 Curabitur St.'),
  ('24601674-7','Barry Conner','aliquam@hotmail.ca','060-117-4412','Ap #511-2382 Mauris Street'),
  ('22998973-1','Clayton Brennan','libero.dui@yahoo.ca','005-306-1101','886 Vel Ave'),
  ('44858821-1','Martha Lambert','tristique@outlook.org','046-254-9092','Ap #295-4368 Lacus. Ave'),
  ('12412988-5','Burton Lane','ut.molestie.in@outlook.net','074-757-7959','155-8363 Nonummy Street'),
  ('39868199-1','Justine Mayer','vel.venenatis.vel@aol.net','062-259-1879','5486 Mi, Rd.'),
  ('36229320-0','Grant Barr','orci@icloud.ca','064-122-3160','7448 Imperdiet Rd.'),
  ('22692321-7','Minerva Daniel','maecenas.libero@google.org','085-541-4934','Ap #889-775 Vitae, Rd.'),
  ('48119975-1','Robert Sampson','amet.risus@outlook.org','048-754-9343','P.O. Box 809, 6925 Neque Road'),
  ('1493416-2','Sybill Howell','molestie.dapibus@outlook.net','006-904-4163','P.O. Box 580, 5814 Lorem St.'),
  ('9763747-4','Vance Stark','sapien@google.ca','024-630-7706','447-4337 Posuere Av.'),
  ('15125302-4','Lucy Patrick','nunc.nulla@protonmail.com','031-792-5562','Ap #119-3204 Ut Rd.'),
  ('32667506-7','Madaline Gallegos','magna@hotmail.couk','026-490-3269','7661 Blandit Rd.'),
  ('8959786-2','Cathleen House','rhoncus@protonmail.ca','081-562-5991','906-1520 Nunc St.'),
  ('24920513-3','Sebastian Peters','sed.facilisis.vitae@hotmail.net','014-721-7376','P.O. Box 157, 4326 Arcu. Rd.'),
  ('3144784-4','Iola Davis','pede@icloud.org','020-467-9764','882-2324 Ipsum Ave'),
  ('33289189-8','Silas Bonner','ut@aol.couk','051-170-6669','P.O. Box 990, 1951 Ut Street'),
  ('1642943-0','Odessa Ayers','malesuada.id@hotmail.edu','074-381-0375','6572 Maecenas Ave'),
  ('307495-1','Lacy Best','pellentesque.tincidunt@protonmail.com','044-232-6163','Ap #628-1667 Duis Ave'),
  ('50606168-7','Lila Maddox','adipiscing.non@aol.org','006-948-2788','969-2337 Integer Rd.'),
  ('8931618-9','Oprah Whitehead','donec.luctus@hotmail.edu','067-128-4480','3977 Convallis St.'),
  ('31193617-4','Alfonso Ochoa','pede.nonummy@icloud.net','036-977-1358','7095 Sit St.'),
  ('19760805-6','Unity Hendricks','metus@aol.org','072-302-1826','Ap #245-4096 Purus, Av.'),
  ('49611325-K','Clayton Gay','quisque.varius.nam@hotmail.edu','045-789-6337','996-9286 Imperdiet St.'),
  ('31895487-9','Kasper Lindsay','mollis.lectus.pede@icloud.ca','022-547-5778','P.O. Box 951, 6969 Integer Rd.'),
  ('34883780-K','Cynthia Mendoza','nulla.at@google.net','041-364-8211','P.O. Box 906, 5657 Et Av.'),
  ('41481417-4','Yeo Clay','consectetuer.adipiscing@icloud.net','036-641-4725','681-9848 Gravida. St.'),
  ('39625992-3','Leigh Blackwell','amet.nulla.donec@aol.com','039-318-0357','P.O. Box 962, 2591 Lorem, St.'),
  ('8668552-3','Urielle Vega','ipsum.suspendisse@protonmail.org','041-676-0204','917-5122 Odio Street'),
  ('48881410-9','Brett Wolf','justo.praesent@hotmail.ca','034-426-6347','P.O. Box 605, 2633 Quisque St.'),
  ('4249839-4','Myles Ferguson','nisl.maecenas@icloud.edu','060-892-1918','866-7752 Nibh St.'),
  ('34170170-8','Tyler Buchanan','pede.cras@hotmail.com','060-725-3649','628-3105 Nunc, St.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('22440478-6','Bertha Rivers','venenatis@yahoo.ca','068-554-6460','P.O. Box 475, 4087 Sem Street'),
  ('23357588-7','Allistair Ward','sit.amet@hotmail.couk','019-658-5925','835-1147 Sollicitudin Rd.'),
  ('45162260-9','Anika Bradford','sed@google.ca','019-593-6627','P.O. Box 262, 6550 Sociis Rd.'),
  ('43491650-K','Yasir Horn','laoreet.lectus@hotmail.edu','045-725-7267','238-805 Amet Street'),
  ('45404268-9','Quinlan Gregory','neque.in.ornare@icloud.com','034-428-2131','Ap #173-7935 Sit Ave'),
  ('22252619-1','Carter Dillard','sem.pellentesque.ut@protonmail.org','015-237-6115','3744 Fermentum St.'),
  ('19868118-0','Breanna Harvey','faucibus@yahoo.edu','003-951-2811','8774 Tellus. Ave'),
  ('9114642-8','Sopoline Bradford','malesuada.ut@hotmail.net','005-925-4434','4403 At St.'),
  ('43302376-5','Sean Gould','tincidunt.pede@protonmail.net','051-556-5275','517 Dolor. Rd.'),
  ('41687114-0','Christian Mccarty','varius.orci@protonmail.net','041-446-1332','P.O. Box 318, 5244 Nisi Avenue'),
  ('3580221-5','Freya Mayo','ornare.facilisis@aol.edu','042-179-0639','Ap #860-6885 Magna Rd.'),
  ('476801-9','Quail Marks','vel.faucibus.id@hotmail.edu','025-223-1971','5722 Aliquam St.'),
  ('6490522-8','Ariel Holloway','erat.volutpat@outlook.edu','038-059-3164','P.O. Box 990, 2392 Vivamus Av.'),
  ('21111668-4','Larissa Summers','dolor@outlook.net','044-726-7861','2905 Adipiscing Avenue'),
  ('209803-2','Ashely Pennington','dui.lectus@aol.com','035-396-7223','9149 Nisl St.'),
  ('1948800-4','Leonard Flynn','dolor@google.couk','085-205-6234','Ap #742-3751 Mauris Rd.'),
  ('8149359-6','Calvin Robertson','et.ultrices@outlook.com','042-139-4352','610-489 Curabitur Rd.'),
  ('25881938-1','Kessie Preston','in.sodales@aol.edu','005-274-6336','Ap #923-7444 Turpis. Ave'),
  ('4519275-K','Jessica Dorsey','vitae@google.net','036-906-1895','Ap #748-1820 Semper Road'),
  ('2340217-3','Duncan Short','iaculis.odio@hotmail.org','042-353-0032','Ap #631-695 Facilisi. Rd.'),
  ('43961273-8','September Bridges','risus@aol.com','082-856-5638','P.O. Box 858, 7657 Donec Ave'),
  ('40862490-8','Quamar Baldwin','eu@protonmail.ca','016-662-7493','306-2288 Vulputate, Ave'),
  ('21906352-0','Brynn Hess','mollis.phasellus@outlook.com','058-848-5852','235-5506 Amet Rd.'),
  ('3885562-K','Graiden Bryan','imperdiet.dictum@google.com','052-750-9812','9498 Nisi Rd.'),
  ('46971708-9','Fuller O''brien','dis.parturient@hotmail.org','011-504-2141','682-6559 Euismod St.'),
  ('28816922-5','Pamela Hahn','quam.a.felis@icloud.net','041-796-7186','P.O. Box 792, 5765 Semper Av.'),
  ('24402584-6','Quon Sanders','commodo.tincidunt@protonmail.edu','056-065-5584','P.O. Box 243, 3665 Donec Av.'),
  ('32128153-2','Julian Wade','elit.etiam@protonmail.net','044-777-9335','P.O. Box 102, 2327 Mauris St.'),
  ('25427572-7','Sage Flowers','praesent.eu.dui@protonmail.org','025-866-1827','527-4450 Tortor Avenue'),
  ('21627523-3','Rose Richard','molestie.dapibus@yahoo.couk','074-243-4212','671-6430 Pellentesque Avenue'),
  ('28949956-3','Naida Hudson','a.ultricies@protonmail.net','062-072-0621','P.O. Box 533, 7204 Tincidunt Road'),
  ('42395667-4','Illana Sharp','ultricies.dignissim@aol.couk','046-237-4924','P.O. Box 216, 4277 Quis Av.'),
  ('41596727-6','Pearl Walton','volutpat@aol.couk','055-671-1466','2178 Et St.'),
  ('21781255-0','Daniel Mayer','porttitor.tellus@google.org','080-227-3329','Ap #991-9474 Sed St.'),
  ('418771-7','Nola Lawson','duis.volutpat@hotmail.org','023-695-4725','Ap #190-308 Nunc Avenue'),
  ('32733249-K','Jesse Whitley','pede.nunc@outlook.org','048-972-0513','Ap #348-557 Magna Road'),
  ('33918914-5','Mufutau Roberts','turpis@protonmail.org','077-987-9212','Ap #259-9121 Etiam Road'),
  ('48297406-6','Tiger Fields','a.scelerisque@google.com','057-182-2362','227-9900 Elit St.'),
  ('34857756-5','Delilah Fisher','donec.egestas@yahoo.net','082-418-3526','4061 Ut Road'),
  ('45378322-7','Xena Romero','tincidunt@protonmail.org','081-320-2748','Ap #633-8852 Consectetuer Rd.'),
  ('4970818-1','Halla Sykes','risus.quis@aol.org','072-872-5334','982-4423 Tempor St.'),
  ('50659799-4','Audrey Reyes','maecenas@yahoo.edu','057-150-8356','308-4585 Lectus. St.'),
  ('5887951-7','Britanney Waters','ante.ipsum.primis@protonmail.ca','034-713-7674','9125 Turpis. Avenue'),
  ('46860748-4','William Rutledge','quam.elementum@yahoo.com','072-266-7648','Ap #690-1683 Luctus St.'),
  ('42362145-1','Bianca Barrett','risus.at.fringilla@hotmail.net','011-339-1773','P.O. Box 217, 7017 Nunc Av.'),
  ('11153637-6','Hillary Baker','vitae.erat@outlook.couk','029-706-5805','P.O. Box 903, 3605 Amet Street'),
  ('48136294-6','Philip Mendoza','orci.luctus.et@aol.couk','007-765-1191','949-5274 Egestas Road'),
  ('35509892-3','Chancellor Walters','purus.duis@outlook.ca','086-742-8482','336-8233 Ultricies Street'),
  ('4188894-6','Evangeline Hoffman','vulputate.mauris@protonmail.org','067-548-0859','289-5942 Dui. Road'),
  ('669275-3','Evan Johnston','nullam.suscipit@outlook.org','067-657-6998','Ap #706-4425 Lorem Rd.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('7103400-3','Xavier Mcdaniel','aliquam.arcu@outlook.com','072-146-5432','Ap #914-614 Aliquam Street'),
  ('669939-1','Jordan Fischer','a.aliquet@icloud.com','077-586-4703','Ap #166-9124 Nulla St.'),
  ('19746185-3','Jameson Henson','metus.vivamus@outlook.ca','046-425-2818','4875 Fermentum Road'),
  ('44325621-0','Iris Santana','quam.dignissim@aol.com','080-744-8751','6630 Magna. Avenue'),
  ('37529936-4','Nero Mclean','aliquet.metus.urna@protonmail.org','031-600-6394','P.O. Box 628, 7225 Non, St.'),
  ('21566296-9','Petra Barnett','tincidunt.pede@yahoo.org','065-913-7442','330-5691 Molestie Avenue'),
  ('24757643-6','Noelle Nichols','aliquam.adipiscing@protonmail.ca','082-967-5528','9877 In St.'),
  ('2297775-K','Dane Mckinney','eu@hotmail.couk','038-779-5115','653-1852 Dui Ave'),
  ('6812616-9','Tara Spencer','odio.a.purus@aol.com','087-824-5363','P.O. Box 643, 768 Aliquam Rd.'),
  ('40856745-9','Desirae Fry','amet@aol.ca','017-188-6729','Ap #885-7045 Molestie St.'),
  ('1661689-3','Dorian Mclaughlin','fringilla@aol.com','001-785-3086','P.O. Box 631, 5208 Aliquam St.'),
  ('37678949-7','Xantha Dean','scelerisque.mollis@yahoo.net','046-078-4158','906-753 Nascetur Street'),
  ('4656208-9','Samson England','ipsum.suspendisse@google.net','053-410-9543','Ap #348-4026 Eu Avenue'),
  ('34831845-4','Emi House','vitae.erat@outlook.couk','041-556-5507','Ap #151-8443 Proin Rd.'),
  ('46492920-7','Aspen Steele','aliquam.enim@aol.couk','007-565-6116','171-8844 Dolor St.'),
  ('16651969-1','Yardley Blanchard','mi.felis.adipiscing@icloud.couk','013-751-2831','P.O. Box 835, 4337 Lacus Rd.'),
  ('20977585-9','Quinn Page','fermentum@hotmail.org','042-874-1742','P.O. Box 725, 9912 Vel, Rd.'),
  ('2332054-1','Bernard York','risus.in@aol.com','021-776-6121','Ap #955-7693 Mauris Street'),
  ('35546172-6','Garrett Branch','ornare.in@outlook.ca','082-612-6517','717-3145 Dui. Av.'),
  ('41107182-0','Jaime O''connor','quisque.varius@google.ca','026-611-2445','254-1745 Interdum Street'),
  ('27507648-1','Hunter Fisher','integer.in@yahoo.org','055-314-5526','268-8551 Vitae, Rd.'),
  ('4516193-5','Chester Haney','sociosqu.ad@google.ca','068-165-5204','Ap #205-498 Interdum Street'),
  ('27950903-K','Nicholas Jarvis','vel.lectus@google.ca','087-248-4680','2046 In St.'),
  ('43178240-5','Hop Knapp','suspendisse@yahoo.com','098-577-8764','P.O. Box 709, 7887 Mi Rd.'),
  ('2728014-5','Thane Padilla','tincidunt.aliquam@google.com','042-142-9734','476 In Ave'),
  ('41705665-3','Olympia Sullivan','lorem@outlook.net','064-867-6957','6256 Congue. Rd.'),
  ('3420644-9','Hop Preston','amet.faucibus.ut@outlook.com','087-966-0203','754-785 Cum St.'),
  ('30992154-2','Uma Bartlett','sit.amet.consectetuer@protonmail.couk','068-344-5144','939-4704 Ultrices Rd.'),
  ('15864421-5','Tarik Strickland','enim@yahoo.net','068-874-5218','Ap #629-1917 Magna Av.'),
  ('29993802-6','Lysandra Morrow','non@icloud.com','002-437-2546','552-1947 Vel St.'),
  ('16550505-0','Joan Logan','placerat.cras.dictum@aol.ca','062-832-2222','564-3473 Ut Road'),
  ('38293936-0','Jameson Baldwin','vel.nisl.quisque@protonmail.com','086-877-4794','8194 Molestie. Street'),
  ('42457535-6','Allistair Lewis','eu.sem@hotmail.couk','016-532-2131','Ap #701-4441 Adipiscing St.'),
  ('29184591-6','Kristen Conner','molestie.pharetra@outlook.couk','004-659-6953','642-5625 Quis, Ave'),
  ('42111192-8','Desirae Landry','lectus.quis@icloud.couk','022-229-3753','P.O. Box 583, 5576 Metus Rd.'),
  ('15820219-0','Mona Dennis','cras.eget@yahoo.edu','030-662-5181','Ap #873-9352 Nulla Ave'),
  ('44378471-3','Devin O''Neill','ante.ipsum.primis@hotmail.couk','028-884-6143','313-8001 Sed, St.'),
  ('22865149-4','Margaret Moore','enim.etiam.gravida@hotmail.net','082-237-5602','831-9931 Facilisis, St.'),
  ('37616460-8','Raya Rosa','purus.sapien@hotmail.com','006-844-5124','Ap #965-2293 Faucibus Road'),
  ('3715376-1','Drake Christian','dui@outlook.couk','078-677-2446','Ap #136-5653 Neque Rd.'),
  ('9286910-5','Grady Greene','vestibulum.ante@yahoo.couk','080-778-8675','391-3948 Vulputate Avenue'),
  ('21532944-5','Britanney Shepherd','lacus.quisque@protonmail.couk','033-838-1778','P.O. Box 540, 3115 Lorem Rd.'),
  ('36312169-1','Dustin Morrow','et@outlook.net','091-446-8457','173-4930 Dolor St.'),
  ('25310777-4','Zachary Shaw','nisl@aol.couk','082-254-8305','623-7568 Ante. Road'),
  ('10214500-3','Summer Bell','donec.feugiat@icloud.net','066-512-5766','8142 Massa. Ave'),
  ('38289913-K','Isaiah Jones','sociis.natoque.penatibus@yahoo.edu','064-669-8344','459-6516 In, Road'),
  ('3812560-5','Chandler Oneil','dui.suspendisse@google.ca','075-564-4251','Ap #223-7182 Proin Ave'),
  ('26529570-3','Shay Murphy','lacus.nulla@outlook.com','029-404-5216','Ap #116-7804 Interdum Avenue'),
  ('8369335-5','Devin Britt','luctus.et.ultrices@aol.net','065-557-5707','Ap #696-4367 Feugiat Road'),
  ('16569116-4','Sean Patel','aliquam.auctor.velit@hotmail.net','055-128-2332','3286 Iaculis Av.');

INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('46708416-K','Laith Leonard','ullamcorper.eu.euismod@icloud.net','018-762-2234','805-7797 Amet, Av.'),
  ('23917602-K','Orson Medina','cum.sociis@outlook.couk','051-114-7425','Ap #170-3413 Lectus. Av.'),
  ('9329970-1','Gail Mercer','neque.nullam@aol.edu','078-727-1915','8833 Fermentum St.'),
  ('48260943-0','Gregory Hardin','fusce@hotmail.com','016-799-3006','Ap #792-5189 Enim. Ave'),
  ('10104254-5','Jerome Stephens','sapien.cursus@outlook.org','012-036-1210','569-6896 Donec Av.'),
  ('35944113-4','Ian Duran','pulvinar.arcu.et@aol.edu','068-325-3325','P.O. Box 453, 8322 Mi Avenue'),
  ('16222517-0','Ethan Nunez','feugiat@hotmail.couk','088-662-3927','Ap #506-7294 Eu, Ave'),
  ('2981658-1','Tatyana Mcgowan','nunc.sed.orci@hotmail.org','001-438-4386','553-5061 Adipiscing. Ave'),
  ('18167520-9','Jennifer English','mi.aliquam@aol.edu','071-604-6629','P.O. Box 940, 4240 Augue. Street'),
  ('38707804-5','Dawn Reid','nonummy.ipsum@google.net','056-396-5828','913 Lectus Rd.'),
  ('34939438-3','Gray Reese','ad.litora@protonmail.edu','034-274-3674','787-9929 Aptent St.'),
  ('32106584-8','Sonia Howard','in.felis@protonmail.couk','094-699-9177','7533 Nullam Street'),
  ('12887357-0','Ifeoma Briggs','ipsum.nunc@hotmail.com','074-656-1887','662-4179 Lectus Rd.'),
  ('6994103-6','Arsenio Glass','risus@icloud.couk','066-932-4936','798-3895 Magna. Ave'),
  ('39536781-1','Tashya Dennis','hymenaeos.mauris.ut@icloud.net','011-573-5423','Ap #401-1007 In Avenue'),
  ('5113512-1','Hashim Salazar','augue.sed.molestie@google.ca','057-588-2623','P.O. Box 193, 8547 Mattis Avenue'),
  ('8982295-5','Blake Donovan','erat.eget@aol.com','041-672-8524','Ap #311-7845 Eu, Av.'),
  ('22611724-5','Claire Peck','tortor.nunc@icloud.edu','005-244-9842','9933 Gravida St.'),
  ('14509147-0','Bethany Haynes','tempor@outlook.org','094-965-6825','P.O. Box 228, 4055 Vestibulum Road'),
  ('21991424-5','Lacey Lester','eget.mollis@icloud.couk','052-376-1366','196-5757 In, Road'),
  ('44979297-1','Lamar Livingston','odio.phasellus@hotmail.ca','036-354-8151','P.O. Box 173, 5817 Non Rd.'),
  ('1987858-9','Britanney Stout','fringilla@hotmail.couk','087-418-6731','445-6103 Mattis St.'),
  ('7931485-4','Odessa Daugherty','amet.metus@hotmail.edu','081-132-3393','196-750 Ac Av.'),
  ('44557542-9','Xanthus Barrett','euismod.urna@hotmail.org','092-616-5025','768-4658 Mattis St.'),
  ('11229934-3','Justina Valencia','vitae.erat.vel@protonmail.edu','046-689-8861','3731 Eget, Avenue'),
  ('45964817-8','Cameron Russell','quisque.ornare@protonmail.org','014-897-2278','274-820 Ut Ave'),
  ('864486-1','Sonya Paul','ut.erat@aol.com','011-927-8837','Ap #782-1333 Risus. Rd.'),
  ('35655499-K','Britanni Pacheco','risus.duis.a@icloud.com','010-421-8563','Ap #912-4454 Vivamus Rd.'),
  ('176096-3','Bernard Ochoa','proin.non@google.com','026-417-4687','945-6059 Donec Av.'),
  ('1686995-3','Eaton Mckee','erat.semper.rutrum@hotmail.ca','011-182-9521','Ap #151-7749 Non Rd.'),
  ('8629764-7','Jordan Hurst','est.mauris.eu@hotmail.ca','036-581-5577','Ap #654-9452 Fusce St.'),
  ('9505134-0','Lance Cannon','ultrices.vivamus.rhoncus@yahoo.ca','081-031-6426','416-6834 Consequat Rd.'),
  ('40165573-5','Laurel Copeland','fusce.feugiat@outlook.edu','031-774-3234','P.O. Box 938, 6297 Quisque St.'),
  ('30818668-7','Justina Mueller','ac.sem@aol.edu','015-582-3655','861-6741 Mauris Av.'),
  ('25519598-0','Ainsley Riley','montes.nascetur@protonmail.net','085-774-4519','771-5966 Euismod Street'),
  ('2682429-K','Ferris Maldonado','nam@protonmail.net','066-778-4884','786-4586 Nec St.'),
  ('2732365-0','Carol Kinney','velit.egestas@outlook.net','017-045-9700','427-7281 In Rd.'),
  ('256621-4','Todd Pruitt','morbi@yahoo.com','018-156-2510','1347 Odio. Avenue'),
  ('13874392-6','Alfonso Freeman','lacinia.at@yahoo.edu','079-522-3179','538-6351 Ligula. Ave'),
  ('41681513-5','Kyra Robbins','mollis.lectus@google.org','059-703-4923','P.O. Box 743, 6181 Etiam Rd.'),
  ('36745644-2','Quon Bradley','at@hotmail.couk','023-429-8893','P.O. Box 967, 169 Arcu Road'),
  ('33657353-K','Cailin Calderon','ut.nisi.a@aol.edu','053-568-5726','541-5092 Nec Av.'),
  ('245375-4','Ria Conley','euismod@icloud.ca','048-654-5983','228-8107 Magna. Rd.'),
  ('41513400-2','Lacy Gordon','morbi.neque.tellus@google.net','023-684-4784','817-3313 Est. St.'),
  ('36513471-5','Odette Martin','quam.a@outlook.couk','051-114-8751','Ap #475-4962 Ipsum. Avenue'),
  ('10750875-9','Chase Mccullough','nonummy.ut.molestie@icloud.edu','060-828-1587','Ap #721-200 Magna. Avenue'),
  ('30415908-1','Nathaniel Bright','et.rutrum@outlook.net','077-824-6286','Ap #801-3641 Pellentesque Av.'),
  ('3967311-8','Adena Hopper','tincidunt@hotmail.edu','078-411-8519','P.O. Box 966, 1936 Orci Ave'),
  ('43412697-5','Ariel Dejesus','purus.gravida@outlook.couk','034-623-6238','Ap #320-6110 Semper Ave'),
  ('16275940-K','Sawyer Meadows','eleifend.egestas.sed@aol.org','063-617-3643','1750 Cras St.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('2482145-5','Jasmine Sanchez','ultricies.sem.magna@yahoo.org','051-687-5474','2663 Leo Road'),
  ('26320512-K','Keely Craig','ornare@protonmail.org','077-582-3343','817-1108 Magnis Rd.'),
  ('42404945-K','Camilla Santiago','magnis.dis@yahoo.net','095-713-8635','Ap #525-1753 Tincidunt Street'),
  ('7577732-9','Felicia Chan','tristique.ac@protonmail.ca','063-799-5111','281-9445 Aenean Rd.'),
  ('4444931-5','Maisie Brown','porttitor.tellus@aol.ca','055-311-3556','2861 Tempor St.'),
  ('2421854-6','Austin Johns','magna@outlook.ca','031-043-1512','5712 Nisl. Avenue'),
  ('3777939-3','Fuller Blanchard','interdum.nunc@hotmail.net','086-281-6624','P.O. Box 615, 3116 Egestas. Rd.'),
  ('45545183-3','Heidi Mcconnell','erat@protonmail.ca','063-835-0378','2930 Ante. St.'),
  ('27212594-5','Danielle Dejesus','odio@protonmail.ca','050-177-4045','768-7135 Risus Rd.'),
  ('40902685-0','Theodore Frazier','eros.proin.ultrices@google.com','017-435-2915','492-1785 Nullam Road'),
  ('49939348-2','Tasha Wilcox','non.justo@hotmail.couk','006-533-7025','P.O. Box 266, 8379 Sociis Ave'),
  ('21839348-9','Sydnee Perez','montes.nascetur@protonmail.com','062-516-6638','415-8789 Dolor. Street'),
  ('4378419-6','Yvonne Lowery','nunc.ullamcorper.velit@icloud.com','017-205-3613','P.O. Box 248, 235 Luctus, Av.'),
  ('48138947-K','Harriet Chaney','maecenas.iaculis.aliquet@yahoo.com','055-449-1412','Ap #384-3797 Accumsan Avenue'),
  ('10649132-1','Phoebe Sandoval','pede@icloud.net','052-883-1149','545-6701 Quis Ave'),
  ('43913837-8','Russell Henson','ridiculus.mus@google.com','048-374-0555','Ap #654-1971 Nulla Rd.'),
  ('3549109-0','Dexter Chaney','mollis.integer@google.net','098-521-2186','3496 Auctor, Rd.'),
  ('6160902-4','Eaton Moon','felis.donec@google.ca','082-836-3339','Ap #703-8061 Mi Avenue'),
  ('45835937-7','Thaddeus Gonzales','pede.suspendisse@hotmail.couk','014-306-7115','732-1647 Non Ave'),
  ('29293421-1','Rashad Craft','pede.cras@yahoo.ca','037-446-4233','Ap #277-8658 Facilisis. Street'),
  ('24379280-0','Chandler Rhodes','quisque.fringilla@hotmail.com','061-054-4185','Ap #605-2066 A, Road'),
  ('7702244-9','Xavier Camacho','tempor@protonmail.com','073-225-7652','238-2926 Risus. Street'),
  ('25882590-K','Leah Cooper','molestie.tortor@aol.couk','010-864-6507','599-442 Ridiculus Rd.'),
  ('27956426-K','Kirk Fitzgerald','molestie@outlook.net','046-436-4832','P.O. Box 531, 2870 Odio St.'),
  ('13210287-2','Rajah Crane','lobortis.class@outlook.com','063-206-8735','Ap #348-3895 Vulputate, Rd.'),
  ('33517217-5','Keefe Hickman','nibh@hotmail.com','022-265-2754','Ap #989-831 Nunc St.'),
  ('40459148-7','Hilel Stewart','vitae.velit.egestas@aol.ca','084-742-8788','168-9144 Arcu Street'),
  ('1196676-4','Barrett Sherman','orci.in@aol.org','081-727-5658','Ap #775-1835 Rhoncus. Av.'),
  ('9573685-8','Dean Baird','ultrices.a@icloud.com','028-210-7710','6944 Lorem Avenue'),
  ('24537304-K','Abra Brady','duis.ac@aol.edu','080-058-4365','4556 Dignissim Rd.'),
  ('32320468-3','Emma Rich','nibh.sit@outlook.ca','070-872-1623','P.O. Box 644, 1429 Tincidunt. St.'),
  ('41674397-5','Oliver Dillard','eu.metus.in@hotmail.org','073-512-7378','744-7330 Varius Avenue'),
  ('14674421-4','Joseph Best','eu.ligula@yahoo.couk','064-205-2185','Ap #827-8680 Pede Street'),
  ('40351220-6','Sybil Duke','in.consectetuer.ipsum@google.com','083-062-4891','154-7875 Nonummy Ave'),
  ('34970231-2','Keelie Decker','et@aol.org','085-987-9862','876-8950 Id Rd.'),
  ('39278148-K','Brenden Hyde','felis@google.com','073-315-8754','P.O. Box 686, 9625 Augue Rd.'),
  ('49823112-8','Moana Dunn','sed@hotmail.net','011-874-7433','549-274 Nunc. St.'),
  ('27343927-7','Clarke Valdez','luctus.vulputate.nisi@icloud.net','023-374-1935','4768 Massa Rd.'),
  ('14149168-7','Alana Richardson','tellus.faucibus@protonmail.edu','032-324-3881','Ap #425-9022 Aliquet, St.'),
  ('19117724-K','Megan Rios','sed@outlook.com','050-573-1137','Ap #308-458 Nullam St.'),
  ('10709505-5','Ina Ward','suspendisse.dui@yahoo.org','086-548-3838','Ap #666-6718 Nulla Ave'),
  ('15691151-8','MacKensie Santana','eu.ligula@google.org','005-350-1578','Ap #608-2252 Sed St.'),
  ('38877215-8','Raven Carr','ante.bibendum@icloud.ca','015-122-7424','859-5978 Augue Ave'),
  ('49134102-5','Callum Oneal','tellus.suspendisse@protonmail.org','013-872-8963','8204 Phasellus Avenue'),
  ('30430573-8','Hiram Walter','sed.nec.metus@hotmail.edu','091-227-5758','925-2419 Odio, St.'),
  ('19893406-2','Justin Daniel','ornare@yahoo.net','023-415-4248','Ap #697-5595 Ligula. Street'),
  ('724989-6','Tate Miles','metus@hotmail.net','095-243-8167','7275 Lorem Avenue'),
  ('790614-5','Vladimir Cote','aliquam.gravida.mauris@hotmail.ca','065-847-3666','P.O. Box 411, 8612 Sem, Road'),
  ('42369767-9','Daryl Clements','semper.dui@outlook.couk','016-672-6027','P.O. Box 648, 7394 Sit Av.'),
  ('26379741-8','Miranda Hoover','ornare.sagittis@google.couk','061-242-2831','570-5721 Urna Rd.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('19520297-4','Kylan Glenn','enim.commodo@icloud.couk','013-822-7441','P.O. Box 549, 3092 Luctus Avenue'),
  ('20998996-4','Caleb Soto','euismod.urna@protonmail.org','006-721-1915','Ap #572-559 Bibendum Avenue'),
  ('10121991-7','Cailin Charles','aliquet@aol.org','086-511-4114','541-8350 Mauris Road'),
  ('24895662-3','Cade Mullins','id.mollis@icloud.org','068-675-5452','747-5334 Lectus St.'),
  ('10765522-0','Kyle Spencer','diam.eu.dolor@yahoo.net','048-238-4768','P.O. Box 547, 522 Enim Street'),
  ('28103249-6','Stacey Cobb','eu.erat@google.com','031-738-4355','Ap #988-417 A, Street'),
  ('24175660-2','Isadora Brennan','ullamcorper.duis@icloud.org','049-333-7720','819-8631 Nulla Avenue'),
  ('20576710-K','Gay Hensley','enim@aol.com','092-753-7879','P.O. Box 289, 4774 Consequat Ave'),
  ('24468150-6','Sade Floyd','eget.laoreet@protonmail.couk','031-079-1796','Ap #801-1226 Nisl. St.'),
  ('41833703-6','Lesley Fry','pellentesque.tincidunt@aol.ca','053-590-4862','3252 Vel, St.'),
  ('205647-K','Yoshi Hebert','eleifend@outlook.couk','007-647-1584','3207 Elementum St.'),
  ('50965225-2','Richard Mcintyre','cum@hotmail.edu','058-783-4026','8000 Phasellus Rd.'),
  ('2527416-4','Arsenio Coleman','ridiculus.mus.proin@yahoo.org','051-314-2676','582-624 Dui. Avenue'),
  ('29500462-2','Kyra Oneil','turpis.egestas@icloud.net','032-234-5089','496-2295 Quis St.'),
  ('46825615-0','Byron Howard','ut@yahoo.ca','036-022-9745','398-1108 Amet, Av.'),
  ('1838211-3','Megan Marshall','eu.arcu.morbi@aol.edu','057-719-8143','P.O. Box 587, 7411 Non, St.'),
  ('35515377-0','Gray Dunn','in.cursus@icloud.org','059-038-9428','P.O. Box 317, 8050 Neque Ave'),
  ('18913941-1','Yardley Michael','id.ante.dictum@icloud.com','022-518-8824','Ap #704-4354 Morbi Avenue'),
  ('1095696-K','Karleigh Maddox','est.arcu@protonmail.couk','014-745-1235','231-1217 Facilisis St.'),
  ('10419998-4','Mufutau Carroll','rhoncus@outlook.com','051-969-5127','P.O. Box 370, 8504 Integer St.'),
  ('50835664-1','Yuli Elliott','parturient.montes.nascetur@yahoo.com','067-765-7451','P.O. Box 765, 8301 Venenatis Rd.'),
  ('44655877-3','Britanney Welch','magnis@hotmail.edu','083-782-7387','Ap #877-7510 Est. Rd.'),
  ('49922954-2','Tana Morin','libero.et@hotmail.com','021-222-1751','P.O. Box 194, 9574 Fringilla Rd.'),
  ('4527408-K','Brendan Whitehead','enim.condimentum.eget@hotmail.edu','067-227-4274','Ap #458-344 Sed, Ave'),
  ('37587173-4','Violet Guzman','egestas.a@aol.couk','035-516-5388','Ap #609-6171 Quam. Rd.'),
  ('4589677-3','Burton Rios','malesuada@google.com','038-692-8294','Ap #126-9267 Tellus. St.'),
  ('611135-1','Ray Peterson','ligula.donec.luctus@google.org','094-673-8924','280-9861 Enim. Road'),
  ('48755443-K','Tana Koch','convallis.est@google.edu','014-252-1354','6784 Quis, Av.'),
  ('6878784-K','Amal Flores','pharetra.nam.ac@aol.couk','064-753-6823','9195 Velit. Rd.'),
  ('20907959-3','Norman Bean','eget@hotmail.com','057-386-7755','688-2170 Metus. St.'),
  ('6998668-4','Harlan Atkinson','id.ante@outlook.net','067-601-3884','421-3432 Nulla Rd.'),
  ('20555137-9','Gwendolyn Burnett','nostra.per@icloud.couk','000-175-9928','370-3629 Ut, Rd.'),
  ('43204253-7','Chandler Wilder','hymenaeos.mauris@outlook.couk','058-782-3331','Ap #689-1456 Fringilla Road'),
  ('1512309-5','Dolan Moss','in.nec@protonmail.org','035-006-7723','P.O. Box 463, 3335 Eleifend Street'),
  ('32578191-2','Walter Goodwin','ipsum@hotmail.edu','041-616-8957','681-8909 Nibh. Ave'),
  ('28733425-7','Nathaniel Vaughan','amet@protonmail.org','043-002-3278','973-5602 Amet, St.'),
  ('4745875-7','Chadwick Allen','eu.nulla@google.com','082-314-4173','466-8173 In Rd.'),
  ('47172761-K','Yeo Keith','non.bibendum@aol.edu','071-522-3822','154-3772 Felis, Road'),
  ('11192584-4','Kato Curtis','nisi@aol.com','002-077-0746','165-1256 Augue St.'),
  ('1922374-4','Imani Walls','orci.adipiscing@icloud.edu','018-932-4784','316-3216 Mauris, St.'),
  ('39789419-3','Kuame Jensen','orci.quis.lectus@aol.couk','044-667-3243','393-6551 Fusce Road'),
  ('22707262-8','Aaron Grant','magna.praesent@icloud.com','062-257-8576','P.O. Box 710, 4511 Consectetuer Rd.'),
  ('7748411-6','Ivy Walls','neque.non@google.edu','076-424-3288','P.O. Box 929, 9285 Tincidunt Rd.'),
  ('23967909-9','Victoria Alvarado','ante.dictum@google.edu','073-411-3554','Ap #227-7990 Elementum Rd.'),
  ('39207112-1','Cailin Nieves','urna.convallis@google.com','094-554-7517','171-8944 Felis. Ave'),
  ('32714245-3','Mollie Lucas','fringilla.donec.feugiat@outlook.net','088-885-4657','P.O. Box 450, 2352 Et Rd.'),
  ('8642552-1','Victoria Hunter','magna.praesent.interdum@hotmail.ca','033-885-0929','Ap #580-7692 Gravida St.'),
  ('847138-K','Boris Peterson','faucibus@hotmail.com','068-816-5014','8735 Quam St.'),
  ('29108509-1','Elvis Daniels','lacinia.orci@hotmail.org','031-556-4682','P.O. Box 969, 7472 Natoque St.'),
  ('45577353-9','Anastasia Olsen','arcu.aliquam@outlook.net','050-478-9463','158-707 In, St.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('23842338-4','Nasim Wilkerson','tempor@yahoo.net','067-953-2303','Ap #956-699 Libero Avenue'),
  ('40754325-4','Giselle Park','metus.in@protonmail.org','047-216-5820','826-1689 Phasellus Street'),
  ('33302996-0','Flavia Merrill','sed@protonmail.ca','024-642-3534','P.O. Box 826, 5587 Urna Avenue'),
  ('12196402-3','Zeph Cleveland','nonummy.ut@hotmail.edu','042-730-0437','Ap #393-7240 Turpis. St.'),
  ('49612724-2','Winifred Griffith','ligula.aenean@google.net','040-621-5056','Ap #832-1499 Malesuada Rd.'),
  ('28794269-9','Jessamine Valencia','nulla.integer@yahoo.net','002-111-6715','Ap #519-5774 Cum Rd.'),
  ('34739197-2','Marcia Cobb','dignissim.magna.a@protonmail.couk','032-137-4483','495-7612 Rutrum. Street'),
  ('15982981-2','Jaime Barry','faucibus.lectus.a@protonmail.com','019-514-1274','Ap #566-655 Curae St.'),
  ('30980326-4','Bradley Serrano','eu.dui@outlook.net','053-293-8545','510-3339 Dapibus Rd.'),
  ('46386662-7','Audrey Miller','ut.tincidunt.orci@yahoo.net','041-534-0843','959-3685 Aliquam Avenue'),
  ('4037232-6','Indira Mckenzie','porttitor.eros@protonmail.org','007-452-1313','P.O. Box 621, 3364 Ac Street'),
  ('2462890-6','Nathan Franklin','fringilla@aol.org','026-549-7982','887-2747 Integer Avenue'),
  ('8163642-7','Martin Black','blandit.mattis@protonmail.org','006-122-3818','1925 Neque Street'),
  ('26200138-5','Yardley Whitehead','vitae@outlook.com','085-266-7844','Ap #650-4984 Ligula. Avenue'),
  ('28782909-4','Addison Carrillo','facilisis.vitae@yahoo.com','072-644-4477','P.O. Box 184, 1269 Ut St.'),
  ('12276939-9','Dolan White','massa@yahoo.net','083-819-2407','2795 Elementum, Av.'),
  ('47909126-9','Adena Bray','nulla.ante.iaculis@outlook.ca','037-675-7391','Ap #117-8824 Odio St.'),
  ('44654639-2','Barrett Thomas','imperdiet@google.couk','048-356-5207','P.O. Box 239, 6647 In St.'),
  ('1612370-6','Kiayada Terry','magna.a@yahoo.com','010-595-5214','Ap #383-7938 Felis St.'),
  ('8105945-4','Lane Farley','lorem.vehicula@hotmail.org','079-273-4785','P.O. Box 740, 6233 Sem Rd.'),
  ('45525237-7','Donovan Frazier','et.ultrices.posuere@protonmail.org','036-397-2418','555-6144 Diam Ave'),
  ('41135440-7','Lacey Melton','mus.donec@aol.couk','056-920-8487','P.O. Box 418, 3280 Semper St.'),
  ('11166180-4','Jocelyn Bartlett','nunc.id@yahoo.ca','045-975-7362','P.O. Box 721, 9371 Lacus. St.'),
  ('31461243-4','Emily Hawkins','arcu.vel@icloud.couk','097-807-6380','Ap #285-7213 Nisl. St.'),
  ('9870337-3','Autumn Bruce','porta.elit@hotmail.edu','058-685-8957','215-5028 Et Rd.'),
  ('10705178-3','Abdul Odom','velit@protonmail.edu','065-738-0268','P.O. Box 598, 1292 Maecenas Rd.'),
  ('16840781-5','Azalia Cummings','hendrerit.consectetuer@outlook.net','021-517-6892','666-743 Ultrices Road'),
  ('46552725-0','Donna Sanchez','non.dui@hotmail.org','048-471-8718','P.O. Box 256, 7408 Magnis Road'),
  ('33545941-5','Venus Flynn','sociis.natoque@aol.org','088-556-5455','687-9218 Lacus. Rd.'),
  ('35352332-5','Liberty Copeland','nostra@hotmail.org','064-890-4445','P.O. Box 541, 6464 Molestie Street'),
  ('4930499-4','Neil Glenn','varius@hotmail.org','091-294-3692','Ap #729-1982 Egestas Ave'),
  ('3697461-3','Knox Bartlett','sed.dui@protonmail.com','091-622-4363','722-8781 Sed Ave'),
  ('43815173-7','Amaya Clemons','scelerisque.neque@hotmail.org','016-871-8742','Ap #184-8805 Nunc St.'),
  ('1689974-7','Fulton Hill','lectus.rutrum@outlook.edu','070-113-8690','Ap #478-3537 Sem Ave'),
  ('29948396-7','Renee Carrillo','vivamus.nisi@protonmail.couk','016-754-1628','264-6578 Eu Road'),
  ('23351141-2','Kelly O''donnell','nunc@icloud.org','084-916-1917','P.O. Box 870, 4508 Nunc St.'),
  ('36797208-4','Patience Wilkins','donec.egestas@outlook.ca','045-256-5163','Ap #897-8475 Ridiculus Ave'),
  ('2293780-4','Vera Booker','nam.ac@icloud.com','031-512-4331','3859 Velit Rd.'),
  ('38623758-1','Lucius Hines','laoreet.libero@outlook.couk','033-884-6890','Ap #150-7650 Neque. Rd.'),
  ('16179698-0','Aiko Guerra','morbi.non@protonmail.com','058-178-2722','1384 Phasellus St.'),
  ('25172614-0','Destiny Holder','sed@yahoo.ca','085-216-2339','Ap #427-9790 Non, Rd.'),
  ('426881-4','Melvin Mccray','ipsum.sodales@outlook.ca','031-233-1329','Ap #116-5012 Vulputate, St.'),
  ('45192223-8','Knox Sherman','nibh@yahoo.org','045-623-7701','Ap #379-9902 Habitant Rd.'),
  ('14163133-0','Jerome Peck','aliquam.adipiscing@outlook.com','048-815-0979','Ap #480-3493 Cum St.'),
  ('28420167-1','Simone Salazar','molestie@google.edu','073-146-3847','Ap #192-1246 Egestas. Street'),
  ('720495-7','Hanna Jones','metus.eu@hotmail.ca','053-798-4291','808-1153 Pharetra, Street'),
  ('364159-7','Madeson Weaver','eros.non@protonmail.edu','075-273-3777','Ap #441-860 A, Road'),
  ('3241083-9','Nayda Mcgowan','dictum.magna.ut@google.couk','016-866-6103','Ap #892-2623 Risus. Street'),
  ('14162886-0','Connor Marks','risus.at@hotmail.net','042-539-2556','3092 Aliquam Avenue'),
  ('33328328-K','Neve Mullins','rutrum.magna@google.couk','097-618-8226','5063 Eget Ave');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('43209574-6','Zahir Hays','donec.non@protonmail.org','077-872-1031','Ap #153-9285 Sed Av.'),
  ('246815-8','Karleigh Hoover','leo.vivamus@protonmail.net','054-988-2256','5080 Ullamcorper. Road'),
  ('27941194-3','Ezra Hester','nunc.sed@icloud.couk','061-516-2835','P.O. Box 768, 3598 Mollis Av.'),
  ('6665225-4','Hector Noel','eu.ligula@protonmail.couk','062-914-5842','908-6559 Phasellus Rd.'),
  ('33841927-9','Evangeline Grant','mollis.phasellus.libero@aol.ca','073-935-4185','Ap #479-9622 Sodales. St.'),
  ('6401770-5','Lesley Delaney','faucibus@google.com','035-248-7524','9601 Lacinia Road'),
  ('14497734-3','Adele Everett','orci.phasellus@yahoo.net','095-467-7523','P.O. Box 299, 3599 Lorem Rd.'),
  ('35155993-4','Mallory Crane','tempus.scelerisque.lorem@icloud.ca','017-559-1863','990-6801 Bibendum. Av.'),
  ('16965943-5','Hyacinth Carpenter','mattis.integer@hotmail.edu','037-143-8148','Ap #493-7582 Vel Road'),
  ('2120746-2','Lynn Hawkins','ornare.lectus@yahoo.ca','067-473-6355','Ap #647-9581 Mauris Street'),
  ('34366568-7','Colby Pugh','nunc.mauris.elit@icloud.edu','057-519-1441','Ap #750-198 Semper. Ave'),
  ('1933962-9','Louis Bowers','sed.neque@aol.ca','041-250-2784','Ap #329-4927 Mi Ave'),
  ('39511720-3','Jenette Dejesus','tellus.aenean@aol.couk','055-926-1203','3894 Sed Road'),
  ('24316748-5','Tiger Bradshaw','erat.eget@google.com','045-565-0752','732-6214 Odio Road'),
  ('38440632-7','Gwendolyn Madden','purus.maecenas@protonmail.org','071-074-4099','Ap #134-7177 Nec Rd.'),
  ('44982560-8','Craig Dale','felis.orci@icloud.edu','091-351-2800','P.O. Box 814, 2438 Phasellus Ave'),
  ('49795706-0','Coby Nixon','tellus@outlook.net','082-474-2130','P.O. Box 700, 7846 Dignissim. Rd.'),
  ('33463151-6','Perry Bruce','sem.consequat@hotmail.ca','044-327-4467','468-3307 Dis St.'),
  ('33128333-9','Lila Lowe','ut@protonmail.edu','073-506-1601','P.O. Box 924, 3827 Mi Av.'),
  ('23816992-5','Kirby Morgan','sociis@yahoo.org','021-225-3530','3687 Mauris St.'),
  ('45142372-K','Lance Gonzalez','dolor@protonmail.com','055-735-4505','Ap #930-2807 Arcu Av.'),
  ('369736-3','Nicholas Davis','eget@aol.net','027-785-5536','Ap #576-5393 Donec Av.'),
  ('1268299-9','Nathan Reid','dictum@yahoo.com','056-230-4511','Ap #545-6125 Donec Street'),
  ('9945408-3','Ralph Carlson','dictum.cursus.nunc@hotmail.ca','073-812-4146','Ap #843-7682 Dictum Rd.'),
  ('386825-7','Lawrence Thompson','est.mollis@icloud.com','059-117-8083','7754 Ipsum. Rd.'),
  ('24220548-0','Rogan Cochran','vitae.nibh@google.edu','018-780-1872','Ap #129-139 Elementum Ave'),
  ('4036038-7','Unity Frazier','duis.dignissim@outlook.com','082-257-5592','Ap #130-1475 Leo. Rd.'),
  ('37704108-9','Janna Evans','dictum.eu@google.couk','098-172-2125','Ap #403-438 Vulputate, Avenue'),
  ('5654281-7','Kerry Hodge','arcu.sed.eu@google.couk','018-376-1232','478-3035 Et Rd.'),
  ('15710335-0','Ralph Bernard','eu@protonmail.net','030-678-4807','Ap #243-9290 Rhoncus Avenue'),
  ('43110454-7','Warren Stevens','dignissim.maecenas@hotmail.com','088-805-7742','1247 Praesent Rd.'),
  ('13339546-6','Jesse Howard','dictum.sapien@aol.org','075-378-1576','Ap #896-9534 Mus. St.'),
  ('6147613-K','Adena Arnold','nec@icloud.com','095-284-4149','Ap #929-1083 Egestas. Street'),
  ('3833312-7','Leo Good','eu.erat@protonmail.net','001-212-3513','491-7384 Integer Road'),
  ('25179379-4','Benjamin O''brien','malesuada.augue@hotmail.org','067-787-3733','P.O. Box 688, 9562 Libero Ave'),
  ('4492377-7','Jarrod Holden','eget.nisi@icloud.net','027-305-8611','907-3328 Turpis Street'),
  ('20551757-K','Laurel Sanchez','at.risus@icloud.edu','088-132-1435','Ap #259-1158 Lobortis Rd.'),
  ('34526835-9','Samuel Ingram','euismod.est@yahoo.org','004-981-8621','241-7122 Lorem Rd.'),
  ('25448994-8','Tasha Ferrell','justo@icloud.ca','078-381-3140','404-9248 Suspendisse St.'),
  ('10424274-K','Breanna Cruz','id@hotmail.com','027-852-6131','374-2370 Enim. Avenue'),
  ('43736897-K','Chanda Grimes','nam.ligula@google.com','087-671-5594','P.O. Box 381, 8016 At, Rd.'),
  ('34361740-2','Octavius Castaneda','lacus@icloud.com','023-387-7553','4662 Ut, Road'),
  ('46546512-3','Ivy Whitfield','duis.a@google.edu','046-571-6325','P.O. Box 534, 3356 Molestie St.'),
  ('22722668-4','Stephen Joyner','gravida.praesent.eu@google.edu','065-032-7227','Ap #670-4879 Leo, Av.'),
  ('48615642-2','Brenna Schultz','suspendisse.aliquet@outlook.edu','092-735-5886','671-3954 Malesuada Rd.'),
  ('36132951-1','Jarrod Matthews','egestas.hendrerit@hotmail.com','088-121-0834','Ap #427-7227 Mollis Rd.'),
  ('39145164-8','Mallory Price','fusce.aliquam@aol.edu','018-384-7461','724-4433 Suspendisse St.'),
  ('305766-6','Ulric Flores','sociis@outlook.org','024-671-2228','569-9256 Urna. St.'),
  ('43893820-6','Allen Perry','convallis.ligula@google.net','059-761-0782','134-4023 Etiam Avenue'),
  ('34152442-3','Francesca Bolton','est@outlook.couk','063-392-5544','Ap #633-9365 Metus Road');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('48341370-K','Donovan Conway','nulla.vulputate@icloud.ca','020-058-3625','Ap #471-2883 Duis Ave'),
  ('26317503-4','Anthony Stephens','luctus.curabitur.egestas@outlook.com','031-563-2565','Ap #878-2075 Malesuada Road'),
  ('25597469-6','Karina Mcclain','id.blandit@google.ca','043-288-0675','Ap #199-9560 Pellentesque Road'),
  ('46976530-K','Calvin Downs','dolor@icloud.couk','048-795-6745','584-9442 Aliquam, Ave'),
  ('31808477-7','Maxine Fowler','in.tincidunt@outlook.edu','093-526-2092','Ap #338-7170 Dolor. Ave'),
  ('28242182-8','Halla Wooten','lorem.ipsum@aol.ca','044-433-5155','867-2573 Dolor Ave'),
  ('342047-7','Ignatius Kline','orci.ut.semper@protonmail.net','085-778-6365','4632 Morbi Road'),
  ('14150943-8','Stone Rosales','vel@outlook.edu','012-198-2036','P.O. Box 610, 9094 Pede Rd.'),
  ('45323436-3','Lacey Wilkins','pede.et@icloud.org','061-514-2784','537-2134 Gravida Rd.'),
  ('46553638-1','Willow York','nascetur.ridiculus@protonmail.ca','097-943-9044','Ap #245-8649 Quam. Rd.'),
  ('19378275-2','Chester Pena','arcu@protonmail.org','035-657-7827','Ap #420-8251 Turpis Av.'),
  ('35533549-6','Imogene May','pretium.aliquet@google.net','013-632-8678','751-3531 Ipsum Street'),
  ('28250909-1','Aladdin Castaneda','enim.mi@google.ca','047-754-5701','P.O. Box 822, 8702 Odio. Rd.'),
  ('42744116-4','Dane Nolan','nascetur.ridiculus@yahoo.net','045-442-8793','729-5746 Feugiat St.'),
  ('21557436-9','Guy Hendricks','scelerisque.mollis.phasellus@google.net','082-577-1462','Ap #340-6423 Rutrum. Rd.'),
  ('50978449-3','Chase Holcomb','nulla.ante.iaculis@aol.ca','042-411-5365','970-2565 Odio Ave'),
  ('15640826-3','Jolie Sheppard','enim@hotmail.org','063-972-5413','756-5630 Semper St.'),
  ('35436183-3','Stacey Pollard','dignissim@hotmail.ca','018-984-1525','292-1661 Ut Road'),
  ('2633712-7','Ainsley Barrett','sed@outlook.net','085-456-7728','273 Et Road'),
  ('13474161-9','Maite Rollins','eu.enim@icloud.ca','062-421-5845','816-1943 Dolor, Avenue'),
  ('43729137-3','Caryn Patterson','donec@protonmail.couk','078-373-7993','864-2994 Diam. St.'),
  ('42548544-K','Montana Watson','magnis.dis.parturient@protonmail.org','070-134-2271','371-6449 Mauris Road'),
  ('18864846-0','Mara Shaffer','magna.a.neque@aol.org','022-680-4847','347-9108 Magna Rd.'),
  ('11620250-6','Phyllis Brady','magnis@icloud.org','014-489-4632','216-9119 Pede, Road'),
  ('6250910-4','Rae Calhoun','a.feugiat.tellus@icloud.org','051-432-0658','P.O. Box 868, 2517 Eu Rd.'),
  ('19356403-8','Denton Park','vel.quam@aol.net','066-950-8186','Ap #119-2190 Ac St.'),
  ('21311175-2','Kirestin Pennington','sit.amet.risus@google.edu','010-276-5265','578-6591 Blandit. Ave'),
  ('40843415-7','Amal Mcbride','vitae.erat@outlook.org','082-254-8344','Ap #759-3719 Proin Road'),
  ('3825995-4','Shaeleigh Lindsay','cursus.integer.mollis@icloud.couk','084-064-0569','Ap #286-9213 Dolor. St.'),
  ('22980867-2','Raymond Welch','proin.vel@protonmail.ca','035-367-0178','P.O. Box 617, 6828 Rhoncus. St.'),
  ('33366831-9','Ina Carson','lorem.ac@protonmail.com','076-726-5434','325-4144 Nibh Street'),
  ('16470769-5','Nora Rodriguez','arcu@hotmail.ca','048-146-2864','467-8658 Eget Road'),
  ('86158-8','Talon Peterson','iaculis.nec@aol.couk','048-841-2551','Ap #608-5895 Tincidunt Avenue'),
  ('19639414-1','Clare Raymond','mollis.dui.in@icloud.couk','047-826-5314','Ap #996-2182 Aliquam Ave'),
  ('2796251-3','Dai Mcdaniel','fringilla.donec@outlook.couk','051-952-5314','Ap #671-7460 Magna, St.'),
  ('36211261-3','Penelope Stark','commodo.tincidunt.nibh@icloud.edu','000-281-5972','P.O. Box 173, 1910 Sodales Av.'),
  ('35311901-K','Nehru Scott','vitae.mauris@outlook.edu','046-456-9745','7815 Semper Road'),
  ('26120343-K','Jamal Chan','elit.pede@protonmail.edu','054-791-2343','Ap #646-8005 Vulputate Av.'),
  ('19191338-8','Quinn Deleon','pede.et.risus@google.org','017-083-5645','P.O. Box 559, 5469 Mollis Ave'),
  ('1768237-7','Zachary Love','turpis.vitae@icloud.ca','017-698-1728','Ap #850-1506 Fringilla Av.'),
  ('11980759-K','Althea Barrera','aenean.eget.magna@hotmail.ca','023-031-1519','310-5606 Nunc Ave'),
  ('40624333-8','Oleg Roberson','turpis.vitae.purus@yahoo.couk','046-812-0212','450-9227 Taciti Av.'),
  ('36102291-2','Joelle Curry','eu.ligula.aenean@google.edu','005-615-8847','Ap #335-4308 Cursus St.'),
  ('45960155-4','Piper Fulton','duis@hotmail.ca','045-323-2784','833 Turpis St.'),
  ('23596840-1','Carson Webb','aliquam@hotmail.couk','060-653-4681','880-6507 Nonummy Ave'),
  ('23819924-7','Myles Webb','pharetra.nibh.aliquam@hotmail.ca','031-177-3414','2738 Lorem, St.'),
  ('47697102-0','Timothy Justice','eros@yahoo.com','039-606-6124','P.O. Box 497, 5463 In Rd.'),
  ('48975492-4','Jessamine Greer','curae.donec@icloud.org','030-364-5313','Ap #332-6877 Urna. Road'),
  ('37888323-7','Illiana Rivers','purus.in@icloud.org','054-578-5455','573-1355 Egestas Rd.'),
  ('31503767-0','Maxine Parker','aliquam.vulputate@outlook.com','048-740-5365','Ap #962-2995 Vivamus Road');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('41605481-9','Isabelle Franks','vitae.posuere@google.couk','067-514-4798','Ap #379-4864 Nibh Road'),
  ('35228448-3','Malcolm Bailey','vel.faucibus@icloud.edu','039-344-1545','3351 Pellentesque St.'),
  ('20805704-9','Cecilia Bender','consectetuer@aol.com','019-052-3253','4118 Donec Road'),
  ('49121246-2','Cassandra Walls','ipsum.suspendisse.sagittis@icloud.edu','034-454-4360','202 Sed Rd.'),
  ('39673512-1','Riley Juarez','mi.fringilla@protonmail.couk','085-472-2484','4639 Quisque St.'),
  ('1015653-K','Quamar Mcmillan','nunc.mauris@hotmail.couk','066-693-8207','711-4167 Ante Av.'),
  ('34465278-3','Brennan Adkins','tellus@google.edu','084-732-5480','9286 Cursus, Avenue'),
  ('38237114-3','Moses Lamb','dolor.nulla@hotmail.couk','007-660-9601','Ap #563-5511 Molestie. Rd.'),
  ('10651656-1','Sybil Mckenzie','hendrerit.consectetuer@outlook.org','052-841-5227','814-7099 Elit, Rd.'),
  ('26706928-K','Madaline Ashley','pede.malesuada@protonmail.net','036-480-9916','722-6751 Ridiculus St.'),
  ('46993880-8','Erin King','adipiscing.enim@protonmail.edu','011-341-5117','P.O. Box 713, 1417 Cum Street'),
  ('49783544-5','Colby Marshall','tellus.non.magna@outlook.com','003-678-1746','P.O. Box 345, 8097 Orci Rd.'),
  ('2066833-4','Madeline Serrano','magnis.dis.parturient@protonmail.ca','052-765-6887','4640 Tortor Street'),
  ('47171902-1','Willow Pratt','sed.dui@yahoo.com','081-618-1356','4956 Elit, Ave'),
  ('18134333-8','Noble Crane','urna@aol.couk','071-146-5473','205-2292 Tristique St.'),
  ('3222879-8','Colin Lamb','egestas.a@google.edu','028-808-8631','Ap #338-6741 In Avenue'),
  ('1855259-0','Lee Robles','urna.justo.faucibus@yahoo.couk','012-615-4818','981-3574 Sociosqu St.'),
  ('46775870-5','Hyatt Bryant','vitae.semper.egestas@protonmail.couk','025-021-6757','673-5052 Mus. Road'),
  ('35463207-1','Jessica Bishop','cum.sociis@protonmail.edu','093-621-5115','P.O. Box 354, 9352 Elit, Street'),
  ('970371-3','Ivory Santana','aptent.taciti@outlook.edu','044-657-3588','Ap #294-4096 Ultrices. Avenue'),
  ('691195-1','Hayfa Rivas','orci@yahoo.net','064-188-8988','174-9151 Etiam Road'),
  ('26887293-0','Bradley Hampton','nisl.elementum@hotmail.couk','087-268-6474','794-8484 Sollicitudin Rd.'),
  ('17118761-3','David Bennett','ut.pharetra.sed@icloud.com','072-194-3968','Ap #252-4738 Sed Av.'),
  ('45770281-7','Kenyon Medina','sed.et@aol.edu','066-423-1088','Ap #288-115 In Rd.'),
  ('14755482-6','Elliott Johnson','dignissim@yahoo.net','030-812-4466','390-1124 Proin Ave'),
  ('41267841-9','Coby Contreras','donec.luctus@yahoo.ca','086-343-2482','5395 Ornare Avenue'),
  ('18185886-9','Laura Camacho','facilisis@aol.org','018-958-0311','366-5648 Leo Rd.'),
  ('9992935-9','Leigh Erickson','libero.morbi@yahoo.couk','093-313-5887','Ap #696-9324 Pretium St.'),
  ('5251167-4','Roth Mercado','vitae@aol.net','014-143-9457','P.O. Box 667, 9749 Tempus, Rd.'),
  ('17477296-7','Elaine Best','praesent.eu.dui@aol.edu','029-347-3011','P.O. Box 135, 5547 Fames Rd.'),
  ('7502546-7','Gary Downs','condimentum.eget@google.ca','098-591-5963','946-103 Vulputate, St.'),
  ('31155273-2','Rachel Michael','a@google.edu','052-163-4338','P.O. Box 907, 3903 Felis St.'),
  ('28348198-0','Aimee Reeves','pretium.et.rutrum@yahoo.net','086-183-7573','Ap #571-3579 Metus. Av.'),
  ('41758307-6','Burke Glover','dis.parturient.montes@icloud.org','061-878-6749','7423 Purus Street'),
  ('12239734-3','Eagan Mcleod','donec.tempus@outlook.ca','077-404-0327','Ap #626-406 Amet Avenue'),
  ('41193247-8','Lee Rowe','ullamcorper.eu@outlook.net','011-327-7344','917-8140 Nunc Road'),
  ('1510379-5','Berk Osborne','non.sollicitudin@protonmail.net','017-142-4050','Ap #825-8517 Nunc St.'),
  ('13571851-3','Skyler Morgan','venenatis.lacus@icloud.edu','054-796-3491','4368 Aptent Rd.'),
  ('30742999-3','Kiayada Kramer','rutrum.urna@protonmail.org','066-734-2137','P.O. Box 557, 2751 Risus Rd.'),
  ('46135570-6','Lunea Cross','sodales.purus@icloud.edu','010-968-6444','640-8418 In Avenue'),
  ('23559841-8','Hedwig Maldonado','metus.in@hotmail.edu','011-812-5452','Ap #635-7596 Nascetur St.'),
  ('15218526-K','Cadman Maldonado','facilisis.eget@google.ca','067-164-3166','Ap #140-9445 Eu St.'),
  ('25986530-1','Martin Grimes','at.velit@aol.net','045-512-9230','P.O. Box 796, 8341 Commodo Rd.'),
  ('3890733-6','Cecilia Ferrell','magnis.dis.parturient@icloud.ca','046-321-1242','Ap #308-1778 Neque. Rd.'),
  ('28865301-1','Zephr Reid','eleifend.vitae@aol.com','076-122-5812','Ap #744-6925 Enim. Avenue'),
  ('36541675-3','Serena Barnett','venenatis.lacus@hotmail.ca','075-944-7838','P.O. Box 421, 3797 Velit Av.'),
  ('7354658-3','Kelly Macias','convallis.erat.eget@aol.com','041-882-4837','P.O. Box 323, 3306 Nec, Rd.'),
  ('27591445-2','Justin Hughes','luctus.ut@aol.couk','044-718-1468','Ap #958-2939 Enim Rd.'),
  ('23194182-7','Gisela Holman','blandit.at@protonmail.net','067-129-0377','787-4858 Aliquet, Road'),
  ('48356856-8','Jin Whitaker','nec.diam@hotmail.net','032-612-4661','P.O. Box 867, 9316 Enim Avenue');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('2757277-4','Winifred Henry','gravida@hotmail.edu','089-895-2232','325-2170 Sed, St.'),
  ('18448185-5','Caldwell Maxwell','a.ultricies@outlook.org','003-646-2361','6436 Blandit St.'),
  ('326751-2','Salvador Briggs','sapien@icloud.com','080-417-8108','225-4109 Facilisis Av.'),
  ('22717906-6','Hilary Massey','sit.amet.metus@outlook.org','089-386-3167','Ap #309-9817 Cursus Rd.'),
  ('4619802-6','Sarah Chan','leo.cras.vehicula@google.couk','069-320-4486','918-2599 Ut Road'),
  ('16635321-1','Shelby Simpson','risus.a@google.couk','041-554-4756','Ap #853-1935 Vitae Street'),
  ('35453366-9','Elijah Underwood','nunc@google.org','053-910-4111','Ap #586-2813 Et Av.'),
  ('19543982-6','Madison Franco','tincidunt@icloud.ca','031-318-7203','174-1269 Augue. St.'),
  ('35892890-0','Xantha Ellis','libero@hotmail.ca','048-100-3967','Ap #370-4290 Donec Avenue'),
  ('45765540-1','Kamal Hatfield','turpis.aliquam.adipiscing@yahoo.org','035-082-7284','Ap #178-7365 Elementum, Street'),
  ('14117560-2','Belle Leach','fames.ac.turpis@aol.edu','040-534-7518','309-4704 Risus. Avenue'),
  ('16237465-6','Ainsley Frederick','eros.non.enim@outlook.org','046-767-5533','P.O. Box 983, 4890 Ut Av.'),
  ('7273625-7','Lamar Moore','ultrices.mauris@protonmail.edu','057-236-2388','9804 Nec St.'),
  ('12795986-2','Alan Delgado','quisque.ac.libero@aol.org','093-971-8848','Ap #906-666 Orci, Ave'),
  ('19310175-5','Chiquita Yang','curabitur.ut@yahoo.com','024-236-2717','5666 Ornare Road'),
  ('13488196-8','Nyssa Wood','sociis@icloud.com','042-774-5751','P.O. Box 206, 9939 Elit, Avenue'),
  ('869272-6','Irene Sykes','mi.fringilla.mi@outlook.net','005-086-0887','469-1894 Egestas St.'),
  ('29869777-7','Nora Ward','venenatis.lacus@icloud.couk','088-472-3786','Ap #295-1041 Convallis Road'),
  ('21557577-2','Wyoming Crosby','nullam.scelerisque.neque@outlook.ca','079-467-2730','P.O. Box 929, 6643 Faucibus. Avenue'),
  ('34235492-0','John Simmons','massa.suspendisse@hotmail.org','081-883-0833','389-6108 Pede. Avenue'),
  ('48956344-4','Jessamine Rhodes','imperdiet.ornare@protonmail.ca','046-252-7595','P.O. Box 321, 8858 Fringilla. Av.'),
  ('36420662-3','Lesley Ryan','ac@icloud.ca','078-693-3489','3311 Eros Ave'),
  ('27202724-2','Nyssa Merritt','congue@google.com','046-119-1984','Ap #963-7131 Placerat, Rd.'),
  ('22479279-4','Clinton Hoover','ut.aliquam@hotmail.edu','041-317-0252','234-5173 Posuere Rd.'),
  ('13136212-9','Illana Fox','scelerisque.neque@outlook.com','034-844-1762','588-726 Imperdiet Av.'),
  ('13661914-4','Hadley Stuart','mus.aenean@outlook.edu','014-643-3764','854-166 Enim, Ave'),
  ('45417309-0','Carl Griffith','rutrum.non.hendrerit@protonmail.com','012-878-7124','623-2788 Nibh Av.'),
  ('13967384-0','Christopher Curry','vel@protonmail.ca','061-957-7958','626-2049 Eu Av.'),
  ('43968887-4','Dennis England','vel.est.tempor@hotmail.org','050-244-8455','P.O. Box 340, 6758 Pede, Avenue'),
  ('2848128-4','Dara Mcintyre','mauris.blandit@icloud.com','018-315-4373','P.O. Box 846, 5877 Ultricies Avenue'),
  ('4487875-5','Rhoda Bentley','leo.vivamus.nibh@icloud.ca','036-789-3864','Ap #772-4673 Ipsum Road'),
  ('16727458-7','Jerry Newman','phasellus@aol.com','035-713-4122','Ap #648-1261 Semper Av.'),
  ('9799570-2','Aspen Franklin','sed.eu.eros@yahoo.ca','086-622-8058','816-2634 Pede. Street'),
  ('29346913-K','Lane Bryant','arcu.sed@aol.com','084-343-4372','459-1002 Elit, Rd.'),
  ('3532103-9','Anika Emerson','cras.vulputate@icloud.ca','033-581-5577','412-8970 Velit. Ave'),
  ('5729551-1','Baker Rose','cursus.non.egestas@google.org','017-236-2248','Ap #868-4060 Nec Rd.'),
  ('33978459-0','Rama Campos','in.molestie@protonmail.edu','067-293-1625','238-1736 Aliquet, St.'),
  ('44786603-K','Upton Dean','quis.diam@yahoo.edu','062-676-8451','Ap #191-1334 Tempus, Road'),
  ('11980905-3','Caldwell Mack','justo.eu.arcu@google.org','053-411-5651','Ap #278-1000 Vitae Road'),
  ('40927596-6','Aretha Henderson','ipsum@protonmail.ca','087-120-4508','P.O. Box 532, 5474 Cras Road'),
  ('24769666-0','Zephania Pratt','ante@hotmail.net','012-717-0375','922-7608 Eu St.'),
  ('34605812-9','Frances Workman','etiam.gravida@hotmail.org','091-361-8775','954-667 Est St.'),
  ('419175-7','Halla Sweet','elit.a@hotmail.ca','093-935-1845','Ap #534-1743 Egestas Rd.'),
  ('764416-7','Hope Fisher','risus.nulla@icloud.org','026-369-7345','Ap #140-8468 Scelerisque Rd.'),
  ('12408933-6','Clinton Patterson','sodales.elit@outlook.ca','001-916-7733','458-7657 Consectetuer Street'),
  ('23722716-6','Denise Le','sit.amet.risus@hotmail.couk','063-834-5447','Ap #412-847 Nec Avenue'),
  ('50235664-K','Barry Andrews','sodales.nisi.magna@outlook.org','001-761-3976','7619 Quisque Road'),
  ('20620588-1','Sybill Gross','molestie.orci.tincidunt@hotmail.net','062-365-7988','P.O. Box 419, 551 Libero Rd.'),
  ('16875962-2','Octavia Kelly','et.commodo@hotmail.org','067-875-0065','121-7791 Duis Road'),
  ('26734598-8','Hoyt Evans','massa@outlook.couk','068-896-6559','Ap #996-6749 Nulla Rd.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('42620993-4','Melyssa Hopkins','turpis.nec@aol.ca','016-906-9859','6660 Magna St.'),
  ('34830491-7','Theodore Bartlett','lobortis.class.aptent@outlook.couk','042-605-0444','Ap #195-5628 A Ave'),
  ('22762686-0','Lillian Dawson','vitae.mauris.sit@yahoo.ca','013-393-6111','Ap #875-8638 Morbi Av.'),
  ('22666604-4','Roth Bolton','dictum.ultricies@protonmail.couk','063-127-1979','6767 Lobortis Av.'),
  ('2664874-2','Alec Witt','duis.at@outlook.edu','011-596-2676','Ap #755-762 Elit. St.'),
  ('23473785-6','Madaline Jones','hymenaeos@yahoo.couk','012-175-8285','Ap #811-8992 Sit St.'),
  ('22401768-5','Cadman Graham','molestie.sodales@protonmail.net','011-250-6385','Ap #202-107 At, Rd.'),
  ('1312320-9','Wyoming Calhoun','risus@icloud.org','031-387-7184','171-306 Donec Road'),
  ('10652295-2','Griffith Haynes','quis@hotmail.org','014-574-9845','216-9981 Erat Rd.'),
  ('48749127-6','Akeem Gould','dis@protonmail.ca','065-435-0332','944-9270 Suspendisse Ave'),
  ('27217276-5','Jeremy Hanson','duis@yahoo.edu','075-313-3467','P.O. Box 808, 1358 Nec Ave'),
  ('26932196-2','Peter Sweeney','ut.tincidunt.orci@aol.net','071-741-8949','7159 Consequat Rd.'),
  ('3263777-9','Macon Pearson','felis.donec@outlook.com','054-863-3544','Ap #240-5400 Suspendisse Rd.'),
  ('25992177-5','Nadine Malone','suspendisse.non.leo@protonmail.couk','023-377-1887','709-5630 Magna St.'),
  ('4499186-1','Camille Garrison','eleifend.vitae.erat@protonmail.org','062-233-1596','151-1966 Enim, Road'),
  ('42919155-6','Hakeem Reyes','pede.suspendisse.dui@google.ca','088-818-4687','890-8803 Orci Rd.'),
  ('38857310-4','Denise Jimenez','ut.quam@aol.org','014-918-7067','Ap #160-3617 Phasellus Av.'),
  ('45343934-8','Julie Baldwin','duis.volutpat.nunc@hotmail.org','018-646-3353','346-647 Orci Street'),
  ('26766664-4','Curran Farley','nibh.phasellus.nulla@hotmail.couk','014-416-8866','Ap #991-3735 Pellentesque. Av.'),
  ('15268632-3','Zenaida Roberts','ridiculus.mus@protonmail.com','065-271-1472','Ap #448-2824 Ipsum. Av.'),
  ('36696613-7','Colorado Riggs','sem.elit@outlook.net','094-090-5761','8058 Magna. Road'),
  ('7494366-7','Laith Vincent','elementum.sem@yahoo.com','084-750-0564','199-1289 Nulla. Avenue'),
  ('8825642-5','Kyle Rios','laoreet.posuere.enim@outlook.net','069-715-4730','P.O. Box 371, 1746 Curabitur Av.'),
  ('33495647-4','Kennedy Estes','at@outlook.couk','024-017-1175','2424 Elit. Ave'),
  ('9838269-0','Sage Lewis','eu.accumsan.sed@google.net','021-142-6510','Ap #407-2687 Penatibus St.'),
  ('11734682-K','Rhoda Richmond','proin@icloud.ca','047-234-9939','Ap #936-2802 Odio St.'),
  ('10883952-K','Calvin Watkins','donec.fringilla.donec@icloud.couk','036-675-1245','9415 Phasellus Avenue'),
  ('35509687-4','Ciara Serrano','quisque.ornare.tortor@google.edu','040-958-6295','230-4991 Dictum St.'),
  ('18448491-9','Quin Norton','nullam.scelerisque@protonmail.com','072-460-9333','Ap #912-4345 Pede Avenue'),
  ('14343214-9','Walker Ward','amet@hotmail.couk','049-605-3271','Ap #724-1609 Ac Street'),
  ('22331743-K','Prescott Sweeney','metus.in@aol.edu','082-229-4052','P.O. Box 767, 1536 Feugiat. St.'),
  ('10440146-5','Felix Golden','odio.a.purus@icloud.couk','021-073-3648','P.O. Box 154, 6634 Molestie Road'),
  ('14515570-3','Dominic Vang','a@yahoo.edu','002-441-5481','201-7378 Nulla St.'),
  ('37830923-9','Gail Blake','orci.tincidunt@google.org','011-147-7290','634-8117 Adipiscing Road'),
  ('23336716-8','Jarrod Franklin','malesuada.integer@outlook.ca','053-746-6383','735-2561 Ipsum Avenue'),
  ('7963840-4','Joshua Fletcher','tellus.id@outlook.net','072-204-2737','P.O. Box 234, 7068 In Avenue'),
  ('23911859-3','Perry Daniels','arcu.nunc.mauris@outlook.edu','039-682-9527','991-7746 A Av.'),
  ('26154119-K','Quon Vasquez','cursus.et@yahoo.org','024-736-3246','Ap #201-7851 Sed Av.'),
  ('17211868-2','Camilla Sexton','id.mollis@aol.org','019-168-0828','507-3958 Amet Rd.'),
  ('14310154-1','Freya Henry','auctor.non.feugiat@aol.ca','079-086-2528','Ap #623-2876 Eget St.'),
  ('2876163-5','Neville Perez','dolor.fusce@icloud.couk','075-456-3748','624-9011 Eu, Street'),
  ('4836809-3','Carly Crosby','neque.sed@aol.couk','051-786-6277','Ap #636-5758 Vitae Av.'),
  ('6770866-0','Talon Cohen','magnis@google.org','047-265-7642','Ap #279-2420 Justo. Street'),
  ('30268781-1','Graham Powell','nunc.id@hotmail.net','015-838-8386','Ap #475-5264 Curae Road'),
  ('44370993-2','Ifeoma Mcgee','vehicula.aliquet@icloud.ca','075-061-7846','665-9001 A Rd.'),
  ('9228271-6','Drake Daniel','est.nunc@google.ca','061-643-8432','154-7605 Vehicula Ave'),
  ('21387757-7','Martin Barton','imperdiet.nec.leo@outlook.org','016-027-1431','613-5286 Sagittis Avenue'),
  ('37575381-2','Lionel Lopez','primis@yahoo.ca','075-043-3768','139-8740 Pede, Street'),
  ('1840187-8','Emmanuel Cole','placerat.augue@hotmail.net','088-248-5266','353-7354 Ante Rd.'),
  ('18504853-5','Brandon Prince','odio.tristique@protonmail.org','043-662-3105','331-2360 Nunc St.');
INSERT INTO cliente (nrodocumento,nombre,email,phone,direccion)
VALUES
  ('43641524-9','Nehru Patton','hendrerit@icloud.ca','032-117-6898','Ap #189-6428 Euismod Street'),
  ('4651673-7','Lance Poole','placerat.eget.venenatis@yahoo.ca','036-880-3882','Ap #976-3747 Tempus, Rd.'),
  ('4441359-0','Marvin Keller','lacinia@icloud.couk','071-971-3361','944-9423 Ac St.'),
  ('25511320-8','Zelda Barr','augue.eu.tempor@aol.net','066-132-5442','Ap #230-4312 Est. Rd.'),
  ('16179906-8','Adam Evans','ultricies.adipiscing@outlook.org','031-086-6711','Ap #505-9424 Ac Street'),
  ('19843558-9','Brian Mathews','cursus.luctus@hotmail.net','054-398-8144','377-179 Malesuada St.'),
  ('2811967-4','Alma Glover','ultrices.a.auctor@outlook.edu','091-697-6431','6566 Quam Street'),
  ('28710876-1','Herrod Leach','aenean.massa@aol.net','051-386-1027','328-5467 Sociis Rd.'),
  ('6617860-9','Garrison Knapp','convallis.erat.eget@aol.couk','072-854-0860','161-6999 Lobortis Rd.'),
  ('35243513-9','Bethany Emerson','libero@hotmail.ca','067-316-9545','4258 Est Ave'),
  ('7463209-2','Samuel Little','tempus.mauris@icloud.edu','041-779-9167','Ap #168-3266 Sed Rd.'),
  ('38597729-8','Rae Roberts','semper.cursus@yahoo.ca','037-458-0101','468-4547 Sem Street'),
  ('2123635-7','Ivan Head','sed.neque@hotmail.org','072-591-5881','966-6566 Eget Rd.'),
  ('2522692-5','Hedda Smith','elit.etiam@protonmail.net','087-117-5404','7018 Neque Ave'),
  ('36551983-8','Dennis Stein','commodo.ipsum@outlook.net','084-777-0358','P.O. Box 930, 291 Imperdiet, St.'),
  ('27722312-0','Samantha Rivas','cras.convallis@google.com','072-986-5932','P.O. Box 704, 4106 Dolor Ave'),
  ('20753654-7','Talon Roy','pretium@hotmail.net','063-104-3366','Ap #625-3965 Mollis Avenue'),
  ('13443951-3','Judith Kane','pellentesque@google.ca','074-838-0340','Ap #390-232 Netus Av.'),
  ('23136872-8','Brittany Guzman','nibh.aliquam.ornare@google.com','001-060-8418','8217 Leo, Avenue'),
  ('4868525-0','Eaton Calhoun','et.magnis.dis@yahoo.com','060-427-8564','Ap #121-2620 Cras Avenue'),
  ('19376838-5','Jordan Blankenship','tellus.imperdiet@aol.org','076-132-7355','430 Ac Rd.'),
  ('788177-0','Daria Mercer','fusce.feugiat@icloud.net','099-575-1204','5082 Ante Av.'),
  ('21828819-7','Macon Waller','tellus.aenean.egestas@aol.edu','041-637-9167','Ap #451-8788 Vivamus Av.'),
  ('32325103-7','Suki Kennedy','neque.et@protonmail.edu','072-231-3593','785-4261 Iaculis St.'),
  ('9143968-9','Lewis Oliver','enim.diam@yahoo.couk','060-234-4015','Ap #723-8401 Id St.'),
  ('36354712-5','Whilemina Duffy','posuere@icloud.couk','028-815-8349','207-6311 Eget, Road'),
  ('7419796-5','Joseph Kidd','turpis.vitae.purus@aol.net','050-664-3982','Ap #399-3839 Varius Ave'),
  ('2681769-2','Xavier Odom','dignissim.pharetra@outlook.com','030-332-2648','250-7992 Montes, St.'),
  ('47552796-8','Quemby Bridges','suspendisse.eleifend@google.org','094-112-4373','Ap #161-617 Felis. St.'),
  ('22442239-3','Pamela Palmer','neque.sed.sem@aol.edu','032-822-5352','P.O. Box 704, 9669 Phasellus Road'),
  ('46343501-4','Ishmael Webster','a.magna@icloud.couk','005-744-2623','222-3628 Sit Road'),
  ('25789250-6','Kyle Mckinney','dolor.quisque@protonmail.ca','025-748-5867','501-6518 Augue Rd.'),
  ('4314143-0','Travis Cabrera','orci.lacus@icloud.couk','023-365-8889','8510 Proin Street'),
  ('42428940-K','Ulric Giles','elit@hotmail.edu','058-652-3408','Ap #255-7254 Sit Ave'),
  ('39775721-8','Emi Bridges','imperdiet.ullamcorper.duis@aol.couk','072-221-8772','151-8313 Bibendum Road'),
  ('4758948-7','Callum Guerrero','tincidunt.adipiscing.mauris@outlook.net','014-152-5053','419-6053 Lectus Street'),
  ('33997149-8','Quinn Mcgowan','at.sem@icloud.net','066-555-8833','Ap #602-5110 Cursus Avenue'),
  ('1122027-4','Kennedy Roman','mi.duis@outlook.com','050-517-6716','279-3830 Sed Rd.'),
  ('46337336-1','Anika Rice','metus.aliquam@outlook.edu','055-785-3217','4111 Magna. Rd.'),
  ('43643180-5','Caldwell Hall','mauris.sagittis.placerat@google.couk','075-173-3217','283-3628 Etiam Rd.'),
  ('36596992-2','Grace Justice','consequat.nec@yahoo.ca','006-168-2228','Ap #486-9937 Vel Ave'),
  ('41832875-4','Ivor Swanson','sem.vitae@google.org','025-634-0970','7439 Vitae, Av.'),
  ('2171656-1','Jordan Mccoy','fusce.mi@hotmail.couk','068-234-8426','Ap #264-4612 Fringilla Av.'),
  ('34267352-K','Emily Beach','magnis.dis.parturient@icloud.edu','098-144-3126','2252 Neque Street'),
  ('631941-6','Harrison Mcintosh','lectus.pede@hotmail.com','062-806-5725','Ap #817-2245 Ultrices St.'),
  ('45654643-9','Robert Bird','vulputate.nisi@protonmail.couk','029-236-7452','494-4363 Dolor Road'),
  ('16765562-9','Jarrod Watts','dapibus.rutrum.justo@google.ca','022-216-4885','Ap #750-1772 Pellentesque St.'),
  ('32270250-7','Uriah Becker','rutrum@outlook.couk','088-769-9970','Ap #138-9157 Metus Road'),
  ('11563170-5','Steel Farmer','aenean.massa@google.couk','058-771-1566','905-8522 Libero Av.'),
  ('26157537-K','Fatima Padilla','nonummy.fusce.fermentum@outlook.net','061-622-9846','530-9129 Aliquet Avenue');

INSERT INTO venta VALUES (1,'10617926-3','8402711-1','S003','A','04/04/2021',45,15,675);
INSERT INTO venta VALUES (2,'16754787-7','23819125-4','S005','A','28/11/2021',42,14,588);
INSERT INTO venta VALUES (3,'43658690-6','24180587-5','S001','B','23/03/2021',37,15,555);
INSERT INTO venta VALUES (4,'38573307-0','42396509-6','S001','B','13/12/2021',38,14,532);
INSERT INTO venta VALUES (5,'20470883-5','14315947-7','S003','A','08/10/2021',24,13,312);
INSERT INTO venta VALUES (6,'36878394-3','29374931-0','S003','A','22/07/2021',50,15,750);
INSERT INTO venta VALUES (7,'41679145-7','45421301-7','S005','A','15/11/2020',31,12,372);
INSERT INTO venta VALUES (8,'45418521-8','14315947-7','S003','A','16/01/2021',15,12,180);
INSERT INTO venta VALUES (9,'21270853-4','18567395-2','S005','B','25/09/2020',38,12,456);
INSERT INTO venta VALUES (10,'40710376-9','45421301-7','S002','A','19/01/2021',49,14,686);
INSERT INTO venta VALUES (11,'6912960-9','24180587-5','S001','A','30/11/2021',43,13,559);
INSERT INTO venta VALUES (12,'48137357-3','45421301-7','S002','A','12/09/2020',22,14,308);
INSERT INTO venta VALUES (13,'45353607-6','4810357-K','S004','A','29/08/2021',32,13,416);
INSERT INTO venta VALUES (14,'48165122-0','46566450-9','S004','B','24/02/2021',25,12,300);
INSERT INTO venta VALUES (15,'21306253-0','42396509-6','S004','B','02/04/2020',36,13,468);
INSERT INTO venta VALUES (16,'27800142-3','24180587-5','S005','A','09/01/2021',48,13,624);
INSERT INTO venta VALUES (17,'33544200-8','29374931-0','S001','B','02/05/2020',23,14,322);
INSERT INTO venta VALUES (18,'43172949-0','8402711-1','S003','A','20/09/2021',38,15,570);
INSERT INTO venta VALUES (19,'4789885-4','42396509-6','S004','A','05/01/2020',39,14,546);
INSERT INTO venta VALUES (20,'29714361-1','42396509-6','S003','B','05/08/2021',26,12,312);
INSERT INTO venta VALUES (21,'29664964-3','14519212-9','S004','B','01/10/2021',24,12,288);
INSERT INTO venta VALUES (22,'28254157-2','32531450-8','S001','A','18/07/2021',48,14,672);
INSERT INTO venta VALUES (23,'16273853-4','23819125-4','S005','A','06/10/2020',12,12,144);
INSERT INTO venta VALUES (24,'48210322-7','18567395-2','S002','B','25/05/2020',49,15,735);
INSERT INTO venta VALUES (25,'6582422-1','45421301-7','S005','B','12/09/2020',23,14,322);
INSERT INTO venta VALUES (26,'34706394-0','45421301-7','S005','B','08/02/2021',36,13,468);
INSERT INTO venta VALUES (27,'8787339-0','32531450-8','S004','A','15/09/2020',35,12,420);
INSERT INTO venta VALUES (28,'47276939-1','6183303-K','S004','B','19/04/2020',17,12,204);
INSERT INTO venta VALUES (29,'33835374-K','18567395-2','S001','B','28/10/2021',24,12,288);
INSERT INTO venta VALUES (30,'366394-9','6183303-K','S004','A','11/12/2021',29,12,348);
INSERT INTO venta VALUES (31,'17879838-3','20237862-5','S003','B','21/04/2021',35,14,490);
INSERT INTO venta VALUES (32,'14594521-6','46566450-9','S003','B','09/06/2021',26,14,364);
INSERT INTO venta VALUES (33,'29350309-5','20237862-5','S003','A','03/05/2021',18,15,270);
INSERT INTO venta VALUES (34,'1779629-1','32531450-8','S002','B','28/12/2021',21,15,315);
INSERT INTO venta VALUES (35,'48630823-0','29374931-0','S003','A','05/05/2021',21,15,315);
INSERT INTO venta VALUES (36,'7533270-K','24180587-5','S001','B','07/11/2021',49,12,588);
INSERT INTO venta VALUES (37,'46162832-K','45421301-7','S004','A','04/10/2020',21,15,315);
INSERT INTO venta VALUES (38,'43870612-7','14315947-7','S003','A','26/06/2020',18,13,234);
INSERT INTO venta VALUES (39,'31794996-0','14519212-9','S005','B','22/07/2020',35,15,525);
INSERT INTO venta VALUES (40,'38699872-8','29374931-0','S005','B','02/10/2020',37,12,444);
INSERT INTO venta VALUES (41,'22948447-8','8402711-1','S004','B','29/12/2021',49,15,735);
INSERT INTO venta VALUES (42,'37945101-2','20237862-5','S002','A','13/07/2021',46,13,598);
INSERT INTO venta VALUES (43,'3682499-9','29374931-0','S002','A','04/01/2020',25,15,375);
INSERT INTO venta VALUES (44,'26709845-K','23819125-4','S004','B','12/11/2020',15,12,180);
INSERT INTO venta VALUES (45,'22313552-8','14519212-9','S003','A','17/03/2020',27,15,405);
INSERT INTO venta VALUES (46,'35944733-7','18567395-2','S001','B','16/05/2020',31,12,372);
INSERT INTO venta VALUES (47,'28347312-0','45421301-7','S002','B','26/08/2021',37,14,518);
INSERT INTO venta VALUES (48,'17567351-2','23819125-4','S001','B','15/10/2020',16,15,240);
INSERT INTO venta VALUES (49,'11597470-K','46566450-9','S003','B','28/02/2020',10,14,140);
INSERT INTO venta VALUES (50,'26716838-5','32531450-8','S004','A','19/01/2020',28,12,336);
INSERT INTO venta VALUES (51,'4499425-9','42396509-6','S005','A','22/06/2020',16,14,224);
INSERT INTO venta VALUES (52,'19271288-2','42396509-6','S005','A','28/07/2020',19,15,285);
INSERT INTO venta VALUES (53,'5680886-8','20237862-5','S002','A','01/03/2020',34,13,442);
INSERT INTO venta VALUES (54,'4685879-4','29374931-0','S004','A','14/03/2021',17,15,255);
INSERT INTO venta VALUES (55,'18513792-9','4810357-K','S002','A','04/01/2021',36,13,468);
INSERT INTO venta VALUES (56,'15663741-6','42396509-6','S001','A','07/06/2021',11,13,143);
INSERT INTO venta VALUES (57,'31772728-3','6183303-K','S002','B','06/05/2020',43,13,559);
INSERT INTO venta VALUES (58,'22660782-K','4810357-K','S003','B','02/10/2020',37,12,444);
INSERT INTO venta VALUES (59,'19124581-4','18567395-2','S005','A','30/08/2020',26,14,364);
INSERT INTO venta VALUES (60,'28178116-2','46566450-9','S002','A','22/03/2021',46,12,552);
INSERT INTO venta VALUES (61,'25633949-8','46566450-9','S003','A','20/04/2020',38,13,494);
INSERT INTO venta VALUES (62,'49296302-K','18567395-2','S005','A','07/09/2021',19,13,247);
INSERT INTO venta VALUES (63,'7664889-1','42396509-6','S005','A','26/04/2020',25,12,300);
INSERT INTO venta VALUES (64,'1741449-6','6183303-K','S001','A','12/05/2020',48,14,672);
INSERT INTO venta VALUES (65,'2748213-9','20237862-5','S002','A','20/01/2020',38,12,456);
INSERT INTO venta VALUES (66,'10826186-2','4810357-K','S004','B','07/10/2021',39,15,585);
INSERT INTO venta VALUES (67,'3438400-2','4810357-K','S002','A','05/11/2020',11,15,165);
INSERT INTO venta VALUES (68,'9994880-9','45421301-7','S004','A','20/10/2021',48,14,672);
INSERT INTO venta VALUES (69,'32865337-0','4810357-K','S005','A','18/11/2020',27,12,324);
INSERT INTO venta VALUES (70,'37849952-6','18567395-2','S001','A','19/02/2021',16,13,208);
INSERT INTO venta VALUES (71,'8917582-8','8402711-1','S005','A','04/01/2020',33,14,462);
INSERT INTO venta VALUES (72,'7992294-3','18567395-2','S001','A','20/03/2021',29,14,406);
INSERT INTO venta VALUES (73,'659110-8','4810357-K','S002','B','03/04/2021',49,13,637);
INSERT INTO venta VALUES (74,'18766252-4','32531450-8','S005','B','03/03/2020',49,12,588);
INSERT INTO venta VALUES (75,'22305414-5','45421301-7','S003','A','05/07/2021',16,12,192);
INSERT INTO venta VALUES (76,'28681326-7','47232966-9','S004','A','12/01/2021',29,14,406);
INSERT INTO venta VALUES (77,'12800750-4','47232966-9','S001','A','01/11/2021',19,15,285);
INSERT INTO venta VALUES (78,'43509564-K','14315947-7','S005','B','07/06/2021',39,15,585);
INSERT INTO venta VALUES (79,'24176673-K','42396509-6','S002','B','14/09/2020',17,12,204);
INSERT INTO venta VALUES (80,'9454867-5','24180587-5','S003','B','11/11/2020',30,13,390);
INSERT INTO venta VALUES (81,'30577989-K','14519212-9','S004','B','24/04/2021',27,12,324);
INSERT INTO venta VALUES (82,'26612311-6','23819125-4','S001','B','26/08/2021',12,13,156);
INSERT INTO venta VALUES (83,'38445393-7','32531450-8','S003','A','07/02/2020',44,13,572);
INSERT INTO venta VALUES (84,'13282297-2','18567395-2','S001','A','04/10/2020',37,14,518);
INSERT INTO venta VALUES (85,'1716359-0','14519212-9','S005','A','05/04/2020',34,12,408);
INSERT INTO venta VALUES (86,'20504888-K','45421301-7','S002','A','26/06/2021',24,14,336);
INSERT INTO venta VALUES (87,'38685858-6','23819125-4','S003','B','20/07/2020',13,13,169);
INSERT INTO venta VALUES (88,'35669888-6','23819125-4','S001','A','16/12/2020',44,12,528);
INSERT INTO venta VALUES (89,'16820896-0','14519212-9','S002','A','23/02/2020',13,15,195);
INSERT INTO venta VALUES (90,'77629-7','47232966-9','S005','A','14/09/2021',43,13,559);
INSERT INTO venta VALUES (91,'36787845-2','4810357-K','S003','A','01/12/2021',27,12,324);
INSERT INTO venta VALUES (92,'44974580-9','14315947-7','S003','B','27/05/2020',29,14,406);
INSERT INTO venta VALUES (93,'30936921-1','42396509-6','S005','A','25/08/2020',41,14,574);
INSERT INTO venta VALUES (94,'26810372-4','46566450-9','S002','B','13/01/2021',31,12,372);
INSERT INTO venta VALUES (95,'49941275-4','32531450-8','S004','B','05/11/2021',39,14,546);
INSERT INTO venta VALUES (96,'25291221-5','18567395-2','S003','B','15/08/2021',38,13,494);
INSERT INTO venta VALUES (97,'15516900-1','14519212-9','S003','B','05/04/2021',35,15,525);
INSERT INTO venta VALUES (98,'27774169-5','8402711-1','S002','B','01/02/2021',28,12,336);
INSERT INTO venta VALUES (99,'27714165-5','45421301-7','S004','A','19/08/2020',50,14,700);
INSERT INTO venta VALUES (100,'3976702-3','20237862-5','S005','A','25/04/2021',37,13,481);
INSERT INTO venta VALUES (101,'2843191-0','45421301-7','S003','A','19/11/2021',12,15,180);
INSERT INTO venta VALUES (102,'29362748-7','29374931-0','S004','B','08/06/2020',20,13,260);
INSERT INTO venta VALUES (103,'7265698-9','32531450-8','S003','A','24/07/2021',10,12,120);
INSERT INTO venta VALUES (104,'33101952-6','24180587-5','S002','B','23/03/2020',50,14,700);
INSERT INTO venta VALUES (105,'49867216-7','14519212-9','S001','A','13/05/2021',46,15,690);
INSERT INTO venta VALUES (106,'5420466-3','45421301-7','S002','A','09/06/2020',11,13,143);
INSERT INTO venta VALUES (107,'13835414-8','14315947-7','S003','A','20/04/2020',43,15,645);
INSERT INTO venta VALUES (108,'45621994-2','32531450-8','S005','A','31/03/2020',11,13,143);
INSERT INTO venta VALUES (109,'23859357-3','29374931-0','S002','B','28/12/2021',25,14,350);
INSERT INTO venta VALUES (110,'26620304-7','4810357-K','S001','A','09/02/2021',19,12,228);
INSERT INTO venta VALUES (111,'32180979-0','6183303-K','S003','A','06/02/2021',31,14,434);
INSERT INTO venta VALUES (112,'10631187-0','14315947-7','S004','A','12/08/2021',15,15,225);
INSERT INTO venta VALUES (113,'48336413-K','14315947-7','S004','B','15/03/2020',42,13,546);
INSERT INTO venta VALUES (114,'35457831-K','4810357-K','S005','A','20/04/2020',20,12,240);
INSERT INTO venta VALUES (115,'25785414-0','6183303-K','S003','B','21/07/2020',10,13,130);
INSERT INTO venta VALUES (116,'48341931-7','29374931-0','S005','B','06/06/2021',26,13,338);
INSERT INTO venta VALUES (117,'23299228-K','29374931-0','S003','A','12/10/2020',13,12,156);
INSERT INTO venta VALUES (118,'12316193-9','14315947-7','S005','A','14/10/2020',17,13,221);
INSERT INTO venta VALUES (119,'48852-6','46566450-9','S002','A','18/02/2021',25,12,300);
INSERT INTO venta VALUES (120,'39266461-0','8402711-1','S003','B','11/12/2021',40,14,560);
INSERT INTO venta VALUES (121,'32546761-4','20237862-5','S004','B','26/05/2021',35,14,490);
INSERT INTO venta VALUES (122,'48105848-1','42396509-6','S005','A','28/02/2021',20,13,260);
INSERT INTO venta VALUES (123,'25117198-K','45421301-7','S002','B','05/01/2021',50,13,650);
INSERT INTO venta VALUES (124,'27326951-7','6183303-K','S002','A','18/04/2021',41,15,615);
INSERT INTO venta VALUES (125,'33547962-9','20237862-5','S001','B','25/02/2020',11,12,132);
INSERT INTO venta VALUES (126,'43367850-8','8402711-1','S004','B','05/05/2021',16,15,240);
INSERT INTO venta VALUES (127,'18473160-6','42396509-6','S005','A','01/07/2020',22,13,286);
INSERT INTO venta VALUES (128,'29902153-K','6183303-K','S003','A','05/01/2020',44,15,660);
INSERT INTO venta VALUES (129,'7717517-2','8402711-1','S001','B','13/05/2021',48,15,720);
INSERT INTO venta VALUES (130,'48466707-1','4810357-K','S001','A','12/06/2021',28,13,364);
INSERT INTO venta VALUES (131,'43303774-K','8402711-1','S001','A','16/08/2021',32,15,480);
INSERT INTO venta VALUES (132,'46153150-4','24180587-5','S004','A','27/07/2020',38,15,570);
INSERT INTO venta VALUES (133,'25902267-3','47232966-9','S003','B','04/01/2020',18,15,270);
INSERT INTO venta VALUES (134,'25501612-1','4810357-K','S001','B','09/07/2021',35,13,455);
INSERT INTO venta VALUES (135,'28111191-4','24180587-5','S002','B','23/03/2020',37,15,555);
INSERT INTO venta VALUES (136,'46656748-5','14519212-9','S003','A','15/12/2020',28,12,336);
INSERT INTO venta VALUES (137,'26279572-1','45421301-7','S002','B','07/02/2021',22,15,330);
INSERT INTO venta VALUES (138,'6427641-7','4810357-K','S003','A','16/01/2020',25,13,325);
INSERT INTO venta VALUES (139,'26484700-1','14519212-9','S001','A','28/05/2021',45,12,540);
INSERT INTO venta VALUES (140,'18153438-9','46566450-9','S005','A','11/11/2021',18,13,234);
INSERT INTO venta VALUES (141,'20380351-6','20237862-5','S004','A','17/04/2021',48,13,624);
INSERT INTO venta VALUES (142,'24204534-3','42396509-6','S003','A','27/07/2020',14,15,210);
INSERT INTO venta VALUES (143,'26393893-3','14315947-7','S002','B','30/01/2020',11,14,154);
INSERT INTO venta VALUES (144,'28241890-8','23819125-4','S002','A','25/03/2021',13,13,169);
INSERT INTO venta VALUES (145,'25342402-8','18567395-2','S001','B','15/05/2020',22,12,264);
INSERT INTO venta VALUES (146,'38425287-7','20237862-5','S005','B','20/12/2021',13,12,156);
INSERT INTO venta VALUES (147,'2269681-5','29374931-0','S003','A','09/08/2020',24,15,360);
INSERT INTO venta VALUES (148,'12906127-8','24180587-5','S001','B','05/09/2020',35,13,455);
INSERT INTO venta VALUES (149,'12949968-0','29374931-0','S005','B','17/12/2020',50,14,700);
INSERT INTO venta VALUES (150,'4443244-7','24180587-5','S001','A','30/12/2021',35,12,420);
INSERT INTO venta VALUES (151,'11482753-3','46566450-9','S004','A','24/01/2021',28,13,364);
INSERT INTO venta VALUES (152,'464335-6','46566450-9','S002','B','26/01/2021',16,14,224);
INSERT INTO venta VALUES (153,'36692859-6','4810357-K','S002','A','04/12/2020',47,13,611);
INSERT INTO venta VALUES (154,'2723837-8','29374931-0','S001','B','06/09/2021',50,12,600);
INSERT INTO venta VALUES (155,'1890312-1','32531450-8','S001','A','12/01/2020',18,14,252);
INSERT INTO venta VALUES (156,'12822975-2','14315947-7','S002','A','21/05/2020',21,12,252);
INSERT INTO venta VALUES (157,'3354319-0','14519212-9','S003','A','24/07/2021',25,13,325);
INSERT INTO venta VALUES (158,'13327230-5','8402711-1','S004','A','19/12/2021',24,14,336);
INSERT INTO venta VALUES (159,'44254417-4','18567395-2','S002','B','24/09/2020',43,15,645);
INSERT INTO venta VALUES (160,'10515997-8','42396509-6','S001','A','26/11/2021',10,13,130);
INSERT INTO venta VALUES (161,'2560108-4','47232966-9','S005','A','04/01/2020',45,12,540);
INSERT INTO venta VALUES (162,'33888803-1','6183303-K','S001','A','03/06/2021',41,13,533);
INSERT INTO venta VALUES (163,'3312803-7','24180587-5','S001','B','26/12/2021',25,12,300);
INSERT INTO venta VALUES (164,'42224976-1','32531450-8','S003','B','19/02/2020',28,12,336);
INSERT INTO venta VALUES (165,'22950386-3','20237862-5','S002','A','27/10/2020',27,14,378);
INSERT INTO venta VALUES (166,'45952563-7','23819125-4','S003','B','25/07/2021',38,12,456);
INSERT INTO venta VALUES (167,'32678177-0','23819125-4','S004','B','11/07/2021',35,14,490);
INSERT INTO venta VALUES (168,'44597831-0','42396509-6','S004','B','22/08/2020',37,13,481);
INSERT INTO venta VALUES (169,'12674508-7','6183303-K','S001','B','20/03/2021',34,13,442);
INSERT INTO venta VALUES (170,'33723826-2','47232966-9','S003','A','24/05/2021',40,13,520);
INSERT INTO venta VALUES (171,'2152299-6','46566450-9','S004','A','09/03/2020',17,14,238);
INSERT INTO venta VALUES (172,'40709835-8','45421301-7','S004','A','02/05/2020',19,12,228);
INSERT INTO venta VALUES (173,'1934695-1','29374931-0','S002','A','14/11/2020',18,12,216);
INSERT INTO venta VALUES (174,'17262729-3','8402711-1','S002','B','05/07/2021',29,12,348);
INSERT INTO venta VALUES (175,'42634999-K','18567395-2','S003','B','01/02/2021',22,14,308);
INSERT INTO venta VALUES (176,'12868975-3','47232966-9','S005','A','10/04/2021',50,13,650);
INSERT INTO venta VALUES (177,'19950463-0','8402711-1','S002','A','15/04/2021',39,15,585);
INSERT INTO venta VALUES (178,'35301718-7','32531450-8','S002','A','23/11/2021',29,15,435);
INSERT INTO venta VALUES (179,'7697976-6','42396509-6','S004','B','11/04/2020',16,12,192);
INSERT INTO venta VALUES (180,'39657376-8','20237862-5','S002','A','25/01/2021',40,13,520);
INSERT INTO venta VALUES (181,'858411-7','23819125-4','S002','B','19/11/2020',12,15,180);
INSERT INTO venta VALUES (182,'39475237-1','45421301-7','S003','A','09/06/2020',18,14,252);
INSERT INTO venta VALUES (183,'17162191-7','32531450-8','S003','B','31/10/2021',39,14,546);
INSERT INTO venta VALUES (184,'4633906-1','32531450-8','S004','A','16/07/2020',27,12,324);
INSERT INTO venta VALUES (185,'44228716-3','14315947-7','S001','B','05/12/2021',10,13,130);
INSERT INTO venta VALUES (186,'37850321-3','45421301-7','S002','B','09/03/2020',47,14,658);
INSERT INTO venta VALUES (187,'7652770-9','20237862-5','S004','A','11/06/2021',14,13,182);
INSERT INTO venta VALUES (188,'20570733-6','6183303-K','S002','A','17/04/2021',11,13,143);
INSERT INTO venta VALUES (189,'31373578-8','46566450-9','S001','B','20/08/2021',16,13,208);
INSERT INTO venta VALUES (190,'13119171-5','46566450-9','S003','B','29/09/2021',39,13,507);
INSERT INTO venta VALUES (191,'1326116-4','20237862-5','S001','A','28/08/2021',50,13,650);
INSERT INTO venta VALUES (192,'8471496-8','20237862-5','S005','A','01/01/2021',13,13,169);
INSERT INTO venta VALUES (193,'45463922-7','45421301-7','S005','B','13/03/2021',38,14,532);
INSERT INTO venta VALUES (194,'4795965-9','45421301-7','S001','A','16/03/2020',19,12,228);
INSERT INTO venta VALUES (195,'1985837-5','32531450-8','S003','A','17/01/2021',11,12,132);
INSERT INTO venta VALUES (196,'2632416-5','42396509-6','S005','A','22/08/2021',22,14,308);
INSERT INTO venta VALUES (197,'7870174-9','14519212-9','S001','A','12/10/2021',30,12,360);
INSERT INTO venta VALUES (198,'9640216-3','14315947-7','S001','B','17/07/2020',36,14,504);
INSERT INTO venta VALUES (199,'323954-3','14315947-7','S001','A','18/01/2021',49,14,686);
INSERT INTO venta VALUES (200,'3779314-0','23819125-4','S005','B','15/02/2020',47,14,658);
INSERT INTO venta VALUES (201,'22668708-4','4810357-K','S003','A','27/03/2020',12,12,144);
INSERT INTO venta VALUES (202,'4363197-7','4810357-K','S005','B','08/10/2020',41,13,533);
INSERT INTO venta VALUES (203,'17402870-2','46566450-9','S004','A','02/08/2021',14,13,182);
INSERT INTO venta VALUES (204,'15985913-4','46566450-9','S005','A','08/02/2021',43,15,645);
INSERT INTO venta VALUES (205,'22962413-K','20237862-5','S002','B','04/02/2021',37,14,518);
INSERT INTO venta VALUES (206,'784324-0','20237862-5','S002','B','22/07/2020',33,12,396);
INSERT INTO venta VALUES (207,'46573375-6','24180587-5','S003','B','16/10/2020',37,12,444);
INSERT INTO venta VALUES (208,'26173173-8','42396509-6','S003','B','03/08/2020',17,12,204);
INSERT INTO venta VALUES (209,'3777041-8','45421301-7','S001','B','25/06/2021',42,12,504);
INSERT INTO venta VALUES (210,'37608953-3','42396509-6','S001','A','31/01/2021',41,14,574);
INSERT INTO venta VALUES (211,'3920779-6','14519212-9','S002','B','11/10/2020',36,13,468);
INSERT INTO venta VALUES (212,'38693717-6','23819125-4','S005','A','15/10/2021',41,12,492);
INSERT INTO venta VALUES (213,'27939428-3','14315947-7','S005','A','21/03/2021',50,12,600);
INSERT INTO venta VALUES (214,'22451273-2','18567395-2','S003','A','02/06/2020',25,14,350);
INSERT INTO venta VALUES (215,'8521947-2','45421301-7','S001','A','18/08/2020',27,13,351);
INSERT INTO venta VALUES (216,'9598155-0','29374931-0','S003','B','30/09/2021',13,14,182);
INSERT INTO venta VALUES (217,'39282475-8','29374931-0','S005','A','17/01/2021',28,12,336);
INSERT INTO venta VALUES (218,'14649226-6','18567395-2','S004','B','24/12/2020',44,14,616);
INSERT INTO venta VALUES (219,'45291827-7','45421301-7','S001','B','31/07/2021',40,12,480);
INSERT INTO venta VALUES (220,'46533262-K','20237862-5','S001','A','26/05/2020',23,15,345);
INSERT INTO venta VALUES (221,'3771417-8','14315947-7','S001','B','12/02/2021',10,12,120);
INSERT INTO venta VALUES (222,'33163155-8','42396509-6','S002','B','02/02/2021',22,15,330);
INSERT INTO venta VALUES (223,'17414897-K','8402711-1','S004','B','28/12/2021',21,14,294);
INSERT INTO venta VALUES (224,'15197648-4','46566450-9','S005','B','09/07/2020',50,12,600);
INSERT INTO venta VALUES (225,'724295-6','24180587-5','S001','A','31/07/2020',50,15,750);
INSERT INTO venta VALUES (226,'15727662-K','24180587-5','S004','B','01/09/2020',12,13,156);
INSERT INTO venta VALUES (227,'27310657-K','8402711-1','S002','B','23/07/2021',19,15,285);
INSERT INTO venta VALUES (228,'241344-2','46566450-9','S004','B','07/12/2021',36,13,468);
INSERT INTO venta VALUES (229,'7690652-1','14315947-7','S005','B','11/03/2020',10,15,150);
INSERT INTO venta VALUES (230,'36178672-6','4810357-K','S004','B','16/01/2021',12,12,144);
INSERT INTO venta VALUES (231,'8531489-0','8402711-1','S005','B','14/04/2020',49,13,637);
INSERT INTO venta VALUES (232,'35707554-8','47232966-9','S003','A','22/10/2020',39,14,546);
INSERT INTO venta VALUES (233,'18605597-7','29374931-0','S003','B','05/10/2020',28,13,364);
INSERT INTO venta VALUES (234,'14457237-8','32531450-8','S002','A','20/02/2020',23,15,345);
INSERT INTO venta VALUES (235,'34905567-8','14519212-9','S002','B','24/04/2021',50,15,750);
INSERT INTO venta VALUES (236,'2426896-9','46566450-9','S005','A','31/10/2020',20,14,280);
INSERT INTO venta VALUES (237,'39771947-2','6183303-K','S002','B','04/03/2021',19,15,285);
INSERT INTO venta VALUES (238,'36697535-7','14315947-7','S005','B','21/07/2021',44,12,528);
INSERT INTO venta VALUES (239,'50111203-8','8402711-1','S001','A','14/02/2020',20,15,300);
INSERT INTO venta VALUES (240,'5624553-7','20237862-5','S003','A','15/12/2021',28,14,392);
INSERT INTO venta VALUES (241,'1723172-3','18567395-2','S003','B','03/11/2020',13,13,169);
INSERT INTO venta VALUES (242,'40851728-1','14519212-9','S004','B','30/06/2021',41,14,574);
INSERT INTO venta VALUES (243,'15303262-9','8402711-1','S001','A','29/06/2021',48,14,672);
INSERT INTO venta VALUES (244,'31272855-9','20237862-5','S002','B','08/07/2021',37,13,481);
INSERT INTO venta VALUES (245,'24308974-3','4810357-K','S001','A','25/06/2021',16,14,224);
INSERT INTO venta VALUES (246,'37942920-3','14519212-9','S002','B','23/01/2021',19,13,247);
INSERT INTO venta VALUES (247,'15976879-1','32531450-8','S002','A','01/12/2021',28,14,392);
INSERT INTO venta VALUES (248,'22941315-5','4810357-K','S002','B','22/08/2020',40,15,600);
INSERT INTO venta VALUES (249,'11146117-1','20237862-5','S001','A','22/12/2021',12,12,144);
INSERT INTO venta VALUES (250,'18993555-2','24180587-5','S001','B','31/08/2021',47,12,564);
INSERT INTO venta VALUES (251,'6828569-0','46566450-9','S003','B','22/11/2020',37,12,444);
INSERT INTO venta VALUES (252,'8910706-7','42396509-6','S002','B','29/09/2020',34,14,476);
INSERT INTO venta VALUES (253,'37538683-6','8402711-1','S005','B','20/06/2020',27,14,378);
INSERT INTO venta VALUES (254,'49506917-6','6183303-K','S003','A','20/12/2021',26,14,364);
INSERT INTO venta VALUES (255,'26465143-3','14519212-9','S002','B','03/04/2020',29,12,348);
INSERT INTO venta VALUES (256,'12863360-K','14519212-9','S005','A','16/11/2020',46,13,598);
INSERT INTO venta VALUES (257,'35464842-3','8402711-1','S002','B','23/01/2021',21,12,252);
INSERT INTO venta VALUES (258,'49228383-5','47232966-9','S003','B','29/07/2021',49,13,637);
INSERT INTO venta VALUES (259,'4843648-K','32531450-8','S001','A','29/06/2021',43,14,602);
INSERT INTO venta VALUES (260,'36710570-4','18567395-2','S003','A','27/02/2021',30,13,390);
INSERT INTO venta VALUES (261,'36463590-7','14315947-7','S002','B','12/07/2020',39,13,507);
INSERT INTO venta VALUES (262,'49261260-K','4810357-K','S005','B','07/01/2020',28,13,364);
INSERT INTO venta VALUES (263,'67016-2','14519212-9','S003','A','25/05/2021',30,14,420);
INSERT INTO venta VALUES (264,'17247534-5','24180587-5','S005','B','10/12/2021',31,12,372);
INSERT INTO venta VALUES (265,'42666994-3','20237862-5','S002','B','04/09/2021',47,12,564);
INSERT INTO venta VALUES (266,'9513916-7','42396509-6','S001','B','01/10/2021',25,15,375);
INSERT INTO venta VALUES (267,'50344810-6','6183303-K','S004','B','29/04/2021',23,15,345);
INSERT INTO venta VALUES (268,'478918-0','47232966-9','S001','B','20/03/2020',43,15,645);
INSERT INTO venta VALUES (269,'49880234-6','20237862-5','S001','B','10/03/2021',36,12,432);
INSERT INTO venta VALUES (270,'13931994-K','45421301-7','S005','A','12/02/2020',15,12,180);
INSERT INTO venta VALUES (271,'46490831-5','29374931-0','S002','A','26/03/2021',18,12,216);
INSERT INTO venta VALUES (272,'31103598-3','42396509-6','S005','A','25/05/2020',17,12,204);
INSERT INTO venta VALUES (273,'25918150-K','47232966-9','S005','B','14/08/2021',49,12,588);
INSERT INTO venta VALUES (274,'3528420-6','18567395-2','S003','B','27/12/2020',27,14,378);
INSERT INTO venta VALUES (275,'35579147-5','42396509-6','S004','B','16/05/2020',20,15,300);
INSERT INTO venta VALUES (276,'31603398-9','46566450-9','S003','B','29/08/2020',10,14,140);
INSERT INTO venta VALUES (277,'33672606-9','42396509-6','S005','B','02/05/2021',43,15,645);
INSERT INTO venta VALUES (278,'47352241-1','42396509-6','S004','A','15/04/2020',30,13,390);
INSERT INTO venta VALUES (279,'19928743-5','18567395-2','S001','A','21/12/2020',31,13,403);
INSERT INTO venta VALUES (280,'43838491-K','45421301-7','S002','B','02/01/2021',20,13,260);
INSERT INTO venta VALUES (281,'48440778-9','47232966-9','S005','B','30/09/2020',26,13,338);
INSERT INTO venta VALUES (282,'3596015-5','42396509-6','S001','B','17/09/2020',29,14,406);
INSERT INTO venta VALUES (283,'41955593-2','14315947-7','S004','A','18/03/2020',40,12,480);
INSERT INTO venta VALUES (284,'38253942-7','18567395-2','S002','B','17/12/2021',16,12,192);
INSERT INTO venta VALUES (285,'26671316-9','23819125-4','S002','B','24/03/2021',44,15,660);
INSERT INTO venta VALUES (286,'8277892-6','32531450-8','S001','A','01/06/2020',49,14,686);
INSERT INTO venta VALUES (287,'8759565-K','18567395-2','S005','B','04/06/2021',21,15,315);
INSERT INTO venta VALUES (288,'13869214-0','4810357-K','S004','A','12/06/2021',49,15,735);
INSERT INTO venta VALUES (289,'6752700-3','42396509-6','S001','B','08/11/2021',50,13,650);
INSERT INTO venta VALUES (290,'449367-2','4810357-K','S005','B','28/06/2021',14,13,182);
INSERT INTO venta VALUES (291,'3812859-0','4810357-K','S001','A','14/11/2021',44,15,660);
INSERT INTO venta VALUES (292,'14258794-7','23819125-4','S004','B','19/04/2021',16,13,208);
INSERT INTO venta VALUES (293,'46540292-K','8402711-1','S001','B','23/10/2021',50,15,750);
INSERT INTO venta VALUES (294,'21525102-0','6183303-K','S005','A','12/07/2021',29,15,435);
INSERT INTO venta VALUES (295,'7333815-8','32531450-8','S004','B','30/01/2021',22,14,308);
INSERT INTO venta VALUES (296,'19222587-6','24180587-5','S003','B','15/03/2021',40,14,560);
INSERT INTO venta VALUES (297,'12864837-2','29374931-0','S002','A','01/05/2021',11,15,165);
INSERT INTO venta VALUES (298,'5807199-4','4810357-K','S003','B','17/12/2020',20,15,300);
INSERT INTO venta VALUES (299,'34403852-K','32531450-8','S002','B','29/03/2020',28,14,392);
INSERT INTO venta VALUES (300,'6265249-7','20237862-5','S003','B','14/06/2020',16,15,240);
INSERT INTO venta VALUES (301,'17861331-6','42396509-6','S004','A','05/02/2020',11,15,165);
INSERT INTO venta VALUES (302,'40878137-K','24180587-5','S002','A','12/07/2021',16,15,240);
INSERT INTO venta VALUES (303,'48233981-6','29374931-0','S001','A','12/12/2020',50,12,600);
INSERT INTO venta VALUES (304,'14388320-5','45421301-7','S001','A','13/10/2020',41,14,574);
INSERT INTO venta VALUES (305,'21327989-0','32531450-8','S004','B','29/05/2021',37,13,481);
INSERT INTO venta VALUES (306,'23480965-2','24180587-5','S004','B','17/05/2020',44,13,572);
INSERT INTO venta VALUES (307,'4726260-7','6183303-K','S004','B','17/09/2021',50,12,600);
INSERT INTO venta VALUES (308,'2715114-0','32531450-8','S004','A','24/10/2021',20,14,280);
INSERT INTO venta VALUES (309,'40225788-1','46566450-9','S002','A','10/08/2020',13,15,195);
INSERT INTO venta VALUES (310,'4679724-8','4810357-K','S004','B','01/03/2020',36,14,504);
INSERT INTO venta VALUES (311,'20850795-8','47232966-9','S001','A','13/08/2021',30,12,360);
INSERT INTO venta VALUES (312,'32732475-6','24180587-5','S003','B','16/10/2020',20,12,240);
INSERT INTO venta VALUES (313,'47753672-7','14519212-9','S002','A','05/09/2020',12,13,156);
INSERT INTO venta VALUES (314,'17408118-2','6183303-K','S001','A','06/02/2021',22,15,330);
INSERT INTO venta VALUES (315,'1755469-7','42396509-6','S005','A','05/01/2021',49,14,686);
INSERT INTO venta VALUES (316,'10401554-9','18567395-2','S004','B','03/04/2021',47,13,611);
INSERT INTO venta VALUES (317,'48601711-2','32531450-8','S004','B','25/03/2020',46,14,644);
INSERT INTO venta VALUES (318,'3238865-5','18567395-2','S004','B','05/11/2021',39,15,585);
INSERT INTO venta VALUES (319,'49668401-K','8402711-1','S004','A','12/04/2020',30,13,390);
INSERT INTO venta VALUES (320,'5646861-7','4810357-K','S001','A','07/05/2020',30,15,450);
INSERT INTO venta VALUES (321,'27340343-4','29374931-0','S004','A','09/10/2020',11,12,132);
INSERT INTO venta VALUES (322,'18246584-4','29374931-0','S004','A','15/07/2021',27,12,324);
INSERT INTO venta VALUES (323,'2943424-7','6183303-K','S004','B','24/03/2020',45,12,540);
INSERT INTO venta VALUES (324,'19430883-3','14519212-9','S004','B','31/12/2020',41,12,492);
INSERT INTO venta VALUES (325,'44924647-0','18567395-2','S005','B','06/03/2020',38,14,532);
INSERT INTO venta VALUES (326,'29448746-8','14519212-9','S004','B','01/05/2020',25,12,300);
INSERT INTO venta VALUES (327,'17881496-6','6183303-K','S005','B','06/02/2021',24,12,288);
INSERT INTO venta VALUES (328,'4280701-K','6183303-K','S002','A','27/08/2020',36,14,504);
INSERT INTO venta VALUES (329,'17735202-0','18567395-2','S002','B','07/12/2020',24,15,360);
INSERT INTO venta VALUES (330,'31158390-5','6183303-K','S004','A','29/03/2021',45,12,540);
INSERT INTO venta VALUES (331,'36735314-7','4810357-K','S003','A','16/05/2020',19,14,266);
INSERT INTO venta VALUES (332,'49277310-7','18567395-2','S005','A','02/03/2021',39,14,546);
INSERT INTO venta VALUES (333,'2284443-1','42396509-6','S004','B','07/11/2020',25,14,350);
INSERT INTO venta VALUES (334,'30626881-3','6183303-K','S004','A','06/02/2021',14,14,196);
INSERT INTO venta VALUES (335,'34594149-5','45421301-7','S004','A','14/09/2021',49,15,735);
INSERT INTO venta VALUES (336,'1687382-9','20237862-5','S005','A','08/05/2021',34,12,408);
INSERT INTO venta VALUES (337,'18180325-8','4810357-K','S005','A','31/12/2021',27,12,324);
INSERT INTO venta VALUES (338,'43789569-4','32531450-8','S004','A','25/03/2020',46,14,644);
INSERT INTO venta VALUES (339,'22619294-8','46566450-9','S001','B','14/05/2020',13,14,182);
INSERT INTO venta VALUES (340,'333681-6','4810357-K','S002','A','04/02/2021',18,15,270);
INSERT INTO venta VALUES (341,'45515727-7','46566450-9','S002','B','26/10/2020',11,15,165);
INSERT INTO venta VALUES (342,'19982868-1','23819125-4','S001','B','27/06/2021',33,14,462);
INSERT INTO venta VALUES (343,'15270546-8','29374931-0','S002','B','26/02/2020',26,12,312);
INSERT INTO venta VALUES (344,'7528135-8','45421301-7','S004','B','25/10/2021',12,14,168);
INSERT INTO venta VALUES (345,'2582198-K','24180587-5','S005','A','04/10/2021',22,14,308);
INSERT INTO venta VALUES (346,'191086-8','23819125-4','S005','A','04/02/2021',13,12,156);
INSERT INTO venta VALUES (347,'26190571-K','14519212-9','S003','B','23/05/2020',25,15,375);
INSERT INTO venta VALUES (348,'833293-2','4810357-K','S004','A','26/05/2021',11,13,143);
INSERT INTO venta VALUES (349,'20724128-8','46566450-9','S004','A','15/07/2020',34,14,476);
INSERT INTO venta VALUES (350,'9877805-5','45421301-7','S002','A','15/07/2020',21,15,315);
INSERT INTO venta VALUES (351,'49557213-7','46566450-9','S003','A','24/05/2020',14,12,168);
INSERT INTO venta VALUES (352,'35647373-6','14519212-9','S003','A','30/07/2021',33,12,396);
INSERT INTO venta VALUES (353,'29221233-K','14315947-7','S001','A','03/11/2021',42,13,546);
INSERT INTO venta VALUES (354,'40926907-9','42396509-6','S001','B','21/07/2020',19,13,247);
INSERT INTO venta VALUES (355,'9258-4','14315947-7','S001','B','13/06/2020',29,14,406);
INSERT INTO venta VALUES (356,'24832692-1','4810357-K','S005','B','20/10/2021',17,12,204);
INSERT INTO venta VALUES (357,'26524609-5','8402711-1','S004','A','20/10/2020',43,14,602);
INSERT INTO venta VALUES (358,'4974648-2','47232966-9','S003','A','02/03/2021',17,15,255);
INSERT INTO venta VALUES (359,'17989432-7','23819125-4','S001','A','12/01/2020',21,13,273);
INSERT INTO venta VALUES (360,'25289704-6','8402711-1','S003','B','14/05/2021',11,14,154);
INSERT INTO venta VALUES (361,'46705421-K','42396509-6','S004','A','08/03/2021',40,13,520);
INSERT INTO venta VALUES (362,'9701205-9','23819125-4','S005','A','18/08/2020',18,15,270);
INSERT INTO venta VALUES (363,'29230123-5','14519212-9','S004','B','01/07/2020',48,14,672);
INSERT INTO venta VALUES (364,'13894560-K','8402711-1','S003','A','25/05/2020',22,14,308);
INSERT INTO venta VALUES (365,'28499290-3','8402711-1','S003','A','21/05/2021',34,14,476);
INSERT INTO venta VALUES (366,'12167726-1','45421301-7','S004','B','30/11/2020',18,12,216);
INSERT INTO venta VALUES (367,'41726403-5','23819125-4','S004','B','02/09/2021',15,14,210);
INSERT INTO venta VALUES (368,'19399800-3','46566450-9','S005','B','12/02/2021',28,14,392);
INSERT INTO venta VALUES (369,'27974329-6','23819125-4','S003','B','29/04/2021',50,13,650);
INSERT INTO venta VALUES (370,'38706583-0','20237862-5','S004','A','01/10/2020',23,12,276);
INSERT INTO venta VALUES (371,'10334386-0','32531450-8','S002','A','06/06/2021',43,13,559);
INSERT INTO venta VALUES (372,'1710194-3','8402711-1','S001','A','25/11/2020',33,15,495);
INSERT INTO venta VALUES (373,'41897708-6','29374931-0','S001','B','08/07/2020',36,12,432);
INSERT INTO venta VALUES (374,'18569629-4','14315947-7','S002','A','25/03/2020',12,15,180);
INSERT INTO venta VALUES (375,'34836330-1','18567395-2','S003','B','30/04/2021',39,15,585);
INSERT INTO venta VALUES (376,'4030140-2','42396509-6','S002','A','13/02/2021',13,14,182);
INSERT INTO venta VALUES (377,'193052-4','18567395-2','S001','A','02/02/2021',40,12,480);
INSERT INTO venta VALUES (378,'28548464-2','23819125-4','S004','B','22/01/2021',37,14,518);
INSERT INTO venta VALUES (379,'19347620-1','29374931-0','S002','A','14/03/2020',39,15,585);
INSERT INTO venta VALUES (380,'19868588-7','29374931-0','S005','A','17/05/2020',21,13,273);
INSERT INTO venta VALUES (381,'11779135-1','45421301-7','S003','A','03/12/2021',14,12,168);
INSERT INTO venta VALUES (382,'3987147-5','29374931-0','S002','A','23/06/2020',23,13,299);
INSERT INTO venta VALUES (383,'9524316-9','8402711-1','S005','B','17/05/2020',46,12,552);
INSERT INTO venta VALUES (384,'9181501-K','24180587-5','S001','B','31/10/2021',37,13,481);
INSERT INTO venta VALUES (385,'25859399-5','46566450-9','S002','B','26/08/2020',13,12,156);
INSERT INTO venta VALUES (386,'33653809-2','46566450-9','S005','A','03/03/2021',39,13,507);
INSERT INTO venta VALUES (387,'29990933-6','42396509-6','S004','B','06/05/2020',50,13,650);
INSERT INTO venta VALUES (388,'22445920-3','29374931-0','S001','A','17/02/2020',20,13,260);
INSERT INTO venta VALUES (389,'11946670-9','14519212-9','S001','B','25/10/2021',46,15,690);
INSERT INTO venta VALUES (390,'6664486-3','14519212-9','S001','A','22/04/2020',12,14,168);
INSERT INTO venta VALUES (391,'6130291-3','47232966-9','S001','A','13/06/2021',45,15,675);
INSERT INTO venta VALUES (392,'5877180-5','4810357-K','S004','A','03/01/2020',32,13,416);
INSERT INTO venta VALUES (393,'262851-1','32531450-8','S001','B','09/01/2021',40,14,560);
INSERT INTO venta VALUES (394,'1490295-3','29374931-0','S004','A','19/07/2020',31,12,372);
INSERT INTO venta VALUES (395,'36872343-6','32531450-8','S002','A','25/11/2020',23,12,276);
INSERT INTO venta VALUES (396,'22512684-4','46566450-9','S003','B','05/05/2020',30,15,450);
INSERT INTO venta VALUES (397,'211762-2','32531450-8','S001','B','07/11/2021',40,12,480);
INSERT INTO venta VALUES (398,'49139862-0','20237862-5','S003','A','25/08/2020',33,12,396);
INSERT INTO venta VALUES (399,'10768595-2','4810357-K','S003','A','11/03/2020',39,15,585);
INSERT INTO venta VALUES (400,'4636416-3','18567395-2','S002','A','29/01/2021',26,12,312);
INSERT INTO venta VALUES (401,'699856-9','14519212-9','S005','A','03/04/2021',20,15,300);
INSERT INTO venta VALUES (402,'2094344-0','18567395-2','S001','B','12/06/2021',12,13,156);
INSERT INTO venta VALUES (403,'32401464-0','14315947-7','S005','B','17/06/2021',29,15,435);
INSERT INTO venta VALUES (404,'19462698-3','6183303-K','S005','B','21/06/2021',44,13,572);
INSERT INTO venta VALUES (405,'36852256-2','4810357-K','S001','B','12/10/2021',45,12,540);
INSERT INTO venta VALUES (406,'15348739-1','4810357-K','S004','A','12/04/2020',10,13,130);
INSERT INTO venta VALUES (407,'4465683-3','14315947-7','S001','A','19/01/2020',28,12,336);
INSERT INTO venta VALUES (408,'5857429-5','14519212-9','S002','A','18/08/2021',16,14,224);
INSERT INTO venta VALUES (409,'33580846-0','18567395-2','S003','B','22/05/2021',44,12,528);
INSERT INTO venta VALUES (410,'34947618-5','23819125-4','S004','B','10/03/2021',43,13,559);
INSERT INTO venta VALUES (411,'19521645-2','47232966-9','S005','A','06/05/2021',32,14,448);
INSERT INTO venta VALUES (412,'22139765-7','32531450-8','S004','A','03/01/2020',22,12,264);
INSERT INTO venta VALUES (413,'6123580-9','45421301-7','S001','B','02/08/2020',37,13,481);
INSERT INTO venta VALUES (414,'20367714-6','14519212-9','S001','B','02/10/2021',27,15,405);
INSERT INTO venta VALUES (415,'42253705-8','4810357-K','S004','B','25/10/2021',25,14,350);
INSERT INTO venta VALUES (416,'18659182-8','45421301-7','S001','A','10/03/2020',34,14,476);
INSERT INTO venta VALUES (417,'19841889-7','32531450-8','S002','A','20/12/2020',50,15,750);
INSERT INTO venta VALUES (418,'19548419-8','14315947-7','S002','B','11/08/2020',17,13,221);
INSERT INTO venta VALUES (419,'9615511-5','18567395-2','S005','A','19/07/2020',17,13,221);
INSERT INTO venta VALUES (420,'3331594-5','24180587-5','S002','B','02/04/2020',22,12,264);
INSERT INTO venta VALUES (421,'4219724-6','24180587-5','S001','A','25/04/2021',34,13,442);
INSERT INTO venta VALUES (422,'47326912-0','18567395-2','S001','A','29/02/2020',46,13,598);
INSERT INTO venta VALUES (423,'35293727-4','29374931-0','S004','B','16/11/2021',18,15,270);
INSERT INTO venta VALUES (424,'14490911-9','24180587-5','S004','A','18/09/2021',38,14,532);
INSERT INTO venta VALUES (425,'1692470-9','24180587-5','S004','B','26/09/2020',23,13,299);
INSERT INTO venta VALUES (426,'42328379-3','24180587-5','S005','A','18/08/2020',28,12,336);
INSERT INTO venta VALUES (427,'28613404-1','4810357-K','S002','B','14/01/2020',41,13,533);
INSERT INTO venta VALUES (428,'50895130-2','29374931-0','S005','A','26/09/2021',12,13,156);
INSERT INTO venta VALUES (429,'30823535-1','8402711-1','S004','A','25/08/2020',33,12,396);
INSERT INTO venta VALUES (430,'6726517-3','23819125-4','S003','B','03/07/2021',14,15,210);
INSERT INTO venta VALUES (431,'17351174-4','32531450-8','S004','B','29/02/2020',43,12,516);
INSERT INTO venta VALUES (432,'36325501-9','24180587-5','S002','A','23/11/2020',23,14,322);
INSERT INTO venta VALUES (433,'9652662-8','14519212-9','S004','B','26/09/2021',41,14,574);
INSERT INTO venta VALUES (434,'19977253-8','20237862-5','S003','B','26/03/2021',15,15,225);
INSERT INTO venta VALUES (435,'21248383-4','8402711-1','S001','B','03/06/2020',41,13,533);
INSERT INTO venta VALUES (436,'40926275-9','23819125-4','S004','A','18/07/2020',27,15,405);
INSERT INTO venta VALUES (437,'37852447-4','23819125-4','S002','A','29/12/2020',45,14,630);
INSERT INTO venta VALUES (438,'47322107-1','46566450-9','S003','B','14/10/2021',31,13,403);
INSERT INTO venta VALUES (439,'48159709-9','46566450-9','S005','B','16/07/2020',33,15,495);
INSERT INTO venta VALUES (440,'40282355-0','20237862-5','S001','A','27/05/2021',28,12,336);
INSERT INTO venta VALUES (441,'4946636-6','45421301-7','S005','A','30/11/2020',44,14,616);
INSERT INTO venta VALUES (442,'16522716-6','14315947-7','S002','A','08/04/2020',30,13,390);
INSERT INTO venta VALUES (443,'9445289-9','45421301-7','S001','B','21/09/2021',36,12,432);
INSERT INTO venta VALUES (444,'36425613-2','47232966-9','S003','A','05/02/2020',45,14,630);
INSERT INTO venta VALUES (445,'28165498-5','4810357-K','S003','A','01/10/2020',49,15,735);
INSERT INTO venta VALUES (446,'45581817-6','8402711-1','S005','B','23/02/2020',43,13,559);
INSERT INTO venta VALUES (447,'28831857-3','8402711-1','S002','A','15/08/2020',37,15,555);
INSERT INTO venta VALUES (448,'4066844-6','42396509-6','S003','A','04/12/2021',26,13,338);
INSERT INTO venta VALUES (449,'27983572-7','32531450-8','S001','A','04/12/2020',29,15,435);
INSERT INTO venta VALUES (450,'35952296-7','18567395-2','S004','B','10/12/2020',32,15,480);
INSERT INTO venta VALUES (451,'31355479-1','23819125-4','S003','B','26/03/2021',26,15,390);
INSERT INTO venta VALUES (452,'11672123-6','32531450-8','S004','A','07/11/2020',28,12,336);
INSERT INTO venta VALUES (453,'184553-5','4810357-K','S001','B','03/06/2021',15,12,180);
INSERT INTO venta VALUES (454,'485659-7','29374931-0','S001','B','13/03/2020',31,13,403);
INSERT INTO venta VALUES (455,'3942286-7','23819125-4','S002','A','19/05/2020',39,14,546);
INSERT INTO venta VALUES (456,'9231563-0','20237862-5','S004','A','03/04/2021',41,12,492);
INSERT INTO venta VALUES (457,'30530472-7','46566450-9','S004','B','15/01/2020',27,13,351);
INSERT INTO venta VALUES (458,'41705700-5','14519212-9','S001','A','01/12/2020',33,14,462);
INSERT INTO venta VALUES (459,'25602595-7','32531450-8','S005','B','30/08/2021',36,13,468);
INSERT INTO venta VALUES (460,'29128884-7','14519212-9','S002','B','17/05/2021',35,15,525);
INSERT INTO venta VALUES (461,'35188629-3','29374931-0','S003','A','27/07/2020',46,15,690);
INSERT INTO venta VALUES (462,'48199641-4','47232966-9','S005','A','06/04/2021',21,13,273);
INSERT INTO venta VALUES (463,'31650106-0','14519212-9','S002','B','12/07/2021',36,15,540);
INSERT INTO venta VALUES (464,'36194931-5','24180587-5','S005','A','17/07/2020',36,12,432);
INSERT INTO venta VALUES (465,'45409742-4','14315947-7','S002','A','27/01/2021',11,14,154);
INSERT INTO venta VALUES (466,'13433430-4','6183303-K','S005','A','18/04/2020',29,13,377);
INSERT INTO venta VALUES (467,'4127855-2','45421301-7','S005','B','22/11/2021',12,14,168);
INSERT INTO venta VALUES (468,'14433334-9','46566450-9','S005','A','04/10/2020',40,12,480);
INSERT INTO venta VALUES (469,'20657476-3','4810357-K','S005','B','06/11/2021',38,14,532);
INSERT INTO venta VALUES (470,'46349688-9','18567395-2','S003','B','05/07/2021',47,12,564);
INSERT INTO venta VALUES (471,'46482781-1','18567395-2','S005','B','16/03/2021',34,14,476);
INSERT INTO venta VALUES (472,'25634130-1','23819125-4','S002','B','14/08/2020',25,13,325);
INSERT INTO venta VALUES (473,'10135385-0','23819125-4','S004','A','02/11/2021',48,12,576);
INSERT INTO venta VALUES (474,'9207589-3','14519212-9','S001','B','14/04/2020',49,12,588);
INSERT INTO venta VALUES (475,'35758837-5','14315947-7','S003','B','27/02/2020',16,14,224);
INSERT INTO venta VALUES (476,'41620941-3','14315947-7','S003','A','25/05/2020',13,14,182);
INSERT INTO venta VALUES (477,'44435994-3','4810357-K','S001','A','22/06/2021',41,12,492);
INSERT INTO venta VALUES (478,'31215293-2','42396509-6','S004','A','09/05/2021',45,15,675);
INSERT INTO venta VALUES (479,'21760843-0','45421301-7','S001','A','17/10/2020',33,13,429);
INSERT INTO venta VALUES (480,'44678730-6','24180587-5','S003','A','26/03/2020',41,13,533);
INSERT INTO venta VALUES (481,'17225783-6','46566450-9','S001','B','15/04/2021',29,15,435);
INSERT INTO venta VALUES (482,'47896624-5','14315947-7','S004','B','18/08/2021',21,13,273);
INSERT INTO venta VALUES (483,'1752833-5','24180587-5','S003','B','22/12/2021',35,14,490);
INSERT INTO venta VALUES (484,'516872-4','23819125-4','S001','A','21/10/2021',30,14,420);
INSERT INTO venta VALUES (485,'22593462-2','32531450-8','S004','A','01/02/2020',46,12,552);
INSERT INTO venta VALUES (486,'27461769-1','45421301-7','S004','A','28/06/2021',34,15,510);
INSERT INTO venta VALUES (487,'22878544-K','24180587-5','S002','A','02/06/2020',49,15,735);
INSERT INTO venta VALUES (488,'1967209-3','24180587-5','S001','B','29/11/2021',50,15,750);
INSERT INTO venta VALUES (489,'12912158-0','42396509-6','S001','A','26/01/2021',28,14,392);
INSERT INTO venta VALUES (490,'20775400-5','18567395-2','S002','A','06/08/2020',46,12,552);
INSERT INTO venta VALUES (491,'4798516-1','8402711-1','S005','B','25/08/2020',13,15,195);
INSERT INTO venta VALUES (492,'3164380-5','32531450-8','S003','A','18/08/2020',49,12,588);
INSERT INTO venta VALUES (493,'33233451-4','46566450-9','S004','B','30/09/2021',21,15,315);
INSERT INTO venta VALUES (494,'1279941-1','14519212-9','S001','A','28/10/2020',12,14,168);
INSERT INTO venta VALUES (495,'853081-5','46566450-9','S001','B','10/11/2021',33,13,429);
INSERT INTO venta VALUES (496,'30164623-2','14315947-7','S003','B','25/04/2020',34,12,408);
INSERT INTO venta VALUES (497,'48355525-3','4810357-K','S005','B','17/01/2021',19,15,285);
INSERT INTO venta VALUES (498,'10991680-3','32531450-8','S004','A','04/09/2021',48,12,576);
INSERT INTO venta VALUES (499,'30991564-K','8402711-1','S005','A','11/09/2020',27,15,405);
INSERT INTO venta VALUES (500,'3188611-2','8402711-1','S005','A','02/12/2020',31,13,403);
INSERT INTO venta VALUES (501,'47991225-4','14315947-7','S002','A','30/08/2020',35,15,525);
INSERT INTO venta VALUES (502,'46561623-7','47232966-9','S001','A','12/07/2020',23,13,299);
INSERT INTO venta VALUES (503,'47344357-0','47232966-9','S003','A','18/05/2021',22,15,330);
INSERT INTO venta VALUES (504,'37117210-6','14315947-7','S004','A','19/10/2021',22,12,264);
INSERT INTO venta VALUES (505,'166555-3','18567395-2','S001','A','10/12/2021',11,15,165);
INSERT INTO venta VALUES (506,'33383834-6','20237862-5','S004','B','24/01/2021',47,12,564);
INSERT INTO venta VALUES (507,'3776541-4','46566450-9','S003','B','05/10/2021',39,12,468);
INSERT INTO venta VALUES (508,'37518785-K','23819125-4','S001','B','17/12/2020',17,13,221);
INSERT INTO venta VALUES (509,'4171020-9','20237862-5','S003','B','27/10/2021',32,13,416);
INSERT INTO venta VALUES (510,'1585526-6','8402711-1','S004','B','02/03/2020',30,13,390);
INSERT INTO venta VALUES (511,'32779247-4','23819125-4','S004','A','24/07/2020',48,14,672);
INSERT INTO venta VALUES (512,'3067793-5','14315947-7','S003','B','11/07/2021',42,14,588);
INSERT INTO venta VALUES (513,'35807970-9','46566450-9','S002','B','02/12/2021',25,15,375);
INSERT INTO venta VALUES (514,'30499287-5','42396509-6','S001','B','26/09/2021',23,14,322);
INSERT INTO venta VALUES (515,'41482774-8','32531450-8','S001','A','25/04/2021',35,13,455);
INSERT INTO venta VALUES (516,'13137805-K','4810357-K','S003','A','25/02/2020',38,14,532);
INSERT INTO venta VALUES (517,'4795390-1','23819125-4','S005','A','22/07/2021',42,14,588);
INSERT INTO venta VALUES (518,'17942842-3','4810357-K','S001','B','23/10/2020',45,14,630);
INSERT INTO venta VALUES (519,'48539519-9','45421301-7','S002','B','21/09/2020',18,15,270);
INSERT INTO venta VALUES (520,'23279332-5','14519212-9','S003','A','06/07/2020',23,15,345);
INSERT INTO venta VALUES (521,'7982126-8','46566450-9','S001','B','07/11/2021',47,13,611);
INSERT INTO venta VALUES (522,'15914648-0','24180587-5','S002','B','28/01/2020',50,15,750);
INSERT INTO venta VALUES (523,'49264703-9','20237862-5','S004','B','01/02/2021',13,14,182);
INSERT INTO venta VALUES (524,'13237645-K','18567395-2','S001','B','25/01/2021',14,15,210);
INSERT INTO venta VALUES (525,'25803929-7','14315947-7','S003','A','22/11/2020',32,13,416);
INSERT INTO venta VALUES (526,'6457981-9','24180587-5','S001','B','13/07/2021',44,14,616);
INSERT INTO venta VALUES (527,'40836252-0','24180587-5','S005','A','06/03/2020',26,13,338);
INSERT INTO venta VALUES (528,'9363313-K','45421301-7','S003','A','15/02/2020',36,12,432);
INSERT INTO venta VALUES (529,'14884125-K','4810357-K','S002','A','26/04/2020',22,12,264);
INSERT INTO venta VALUES (530,'27211344-0','47232966-9','S001','A','13/04/2020',30,15,450);
INSERT INTO venta VALUES (531,'9435908-2','14315947-7','S001','A','15/01/2020',10,13,130);
INSERT INTO venta VALUES (532,'26844560-9','45421301-7','S002','B','04/01/2020',20,14,280);
INSERT INTO venta VALUES (533,'29937285-5','47232966-9','S002','A','23/03/2020',23,13,299);
INSERT INTO venta VALUES (534,'26119415-5','6183303-K','S005','B','26/11/2021',14,12,168);
INSERT INTO venta VALUES (535,'12987352-3','8402711-1','S002','A','27/11/2020',42,12,504);
INSERT INTO venta VALUES (536,'27908982-0','18567395-2','S001','A','30/06/2021',24,15,360);
INSERT INTO venta VALUES (537,'8739321-6','8402711-1','S001','A','23/01/2020',14,13,182);
INSERT INTO venta VALUES (538,'36511172-3','6183303-K','S001','B','11/09/2020',47,15,705);
INSERT INTO venta VALUES (539,'30980702-2','4810357-K','S004','B','18/11/2020',50,13,650);
INSERT INTO venta VALUES (540,'3683177-4','32531450-8','S004','A','25/01/2020',41,13,533);
INSERT INTO venta VALUES (541,'19581251-9','45421301-7','S004','B','27/05/2020',40,13,520);
INSERT INTO venta VALUES (542,'14172121-6','42396509-6','S001','B','04/02/2021',22,13,286);
INSERT INTO venta VALUES (543,'2158143-7','42396509-6','S003','A','07/06/2020',13,12,156);
INSERT INTO venta VALUES (544,'7868853-K','14519212-9','S001','A','26/08/2020',22,13,286);
INSERT INTO venta VALUES (545,'7848839-5','20237862-5','S005','A','18/03/2020',22,15,330);
INSERT INTO venta VALUES (546,'38849321-6','46566450-9','S004','B','19/07/2021',39,13,507);
INSERT INTO venta VALUES (547,'33469193-4','24180587-5','S003','A','08/01/2021',29,13,377);
INSERT INTO venta VALUES (548,'32373825-4','8402711-1','S003','A','02/08/2021',27,13,351);
INSERT INTO venta VALUES (549,'18752594-2','42396509-6','S003','B','02/12/2020',48,12,576);
INSERT INTO venta VALUES (550,'33308807-K','45421301-7','S002','B','23/04/2020',43,13,559);
INSERT INTO venta VALUES (551,'3912162-K','24180587-5','S005','B','21/11/2021',19,13,247);
INSERT INTO venta VALUES (552,'16797971-8','47232966-9','S004','A','09/03/2020',12,13,156);
INSERT INTO venta VALUES (553,'49705222-K','32531450-8','S001','A','29/08/2020',14,12,168);
INSERT INTO venta VALUES (554,'22831763-2','24180587-5','S003','A','28/03/2021',28,13,364);
INSERT INTO venta VALUES (555,'23229895-2','32531450-8','S002','B','18/04/2020',45,15,675);
INSERT INTO venta VALUES (556,'3035147-9','45421301-7','S002','B','19/05/2021',46,14,644);
INSERT INTO venta VALUES (557,'5010410-9','24180587-5','S005','A','07/09/2020',32,14,448);
INSERT INTO venta VALUES (558,'43795905-6','14315947-7','S004','A','30/04/2020',14,14,196);
INSERT INTO venta VALUES (559,'27287723-8','42396509-6','S001','B','31/10/2020',27,15,405);
INSERT INTO venta VALUES (560,'22302853-5','20237862-5','S004','B','16/01/2021',19,15,285);
INSERT INTO venta VALUES (561,'40432581-7','14315947-7','S001','B','24/05/2020',41,14,574);
INSERT INTO venta VALUES (562,'43299614-K','23819125-4','S004','B','20/08/2020',27,13,351);
INSERT INTO venta VALUES (563,'31327804-2','46566450-9','S003','B','18/07/2020',27,13,351);
INSERT INTO venta VALUES (564,'8438464-K','8402711-1','S002','B','02/03/2020',40,13,520);
INSERT INTO venta VALUES (565,'49300337-2','23819125-4','S002','A','20/08/2021',41,15,615);
INSERT INTO venta VALUES (566,'18991347-8','20237862-5','S002','A','20/06/2021',46,13,598);
INSERT INTO venta VALUES (567,'24468163-8','42396509-6','S002','A','29/08/2021',27,15,405);
INSERT INTO venta VALUES (568,'13687859-K','42396509-6','S005','B','21/03/2021',38,13,494);
INSERT INTO venta VALUES (569,'25987913-2','42396509-6','S005','A','14/11/2021',46,12,552);
INSERT INTO venta VALUES (570,'2717454-K','14315947-7','S001','B','08/11/2021',25,14,350);
INSERT INTO venta VALUES (571,'34834484-6','20237862-5','S004','A','04/03/2020',27,12,324);
INSERT INTO venta VALUES (572,'12313445-1','14519212-9','S003','A','01/08/2020',48,15,720);
INSERT INTO venta VALUES (573,'48866469-7','18567395-2','S005','A','19/03/2021',39,13,507);
INSERT INTO venta VALUES (574,'22308493-1','29374931-0','S003','A','10/08/2020',14,15,210);
INSERT INTO venta VALUES (575,'24598287-9','47232966-9','S005','A','17/06/2020',18,14,252);
INSERT INTO venta VALUES (576,'32124950-7','45421301-7','S003','B','15/11/2021',15,14,210);
INSERT INTO venta VALUES (577,'31190681-K','8402711-1','S004','B','29/10/2020',29,13,377);
INSERT INTO venta VALUES (578,'41496577-6','32531450-8','S002','A','15/07/2020',19,12,228);
INSERT INTO venta VALUES (579,'1348136-9','29374931-0','S001','B','11/12/2021',15,12,180);
INSERT INTO venta VALUES (580,'12406417-1','47232966-9','S001','A','10/02/2020',30,12,360);
INSERT INTO venta VALUES (581,'31599959-6','18567395-2','S001','B','25/10/2021',34,13,442);
INSERT INTO venta VALUES (582,'25145191-5','47232966-9','S001','A','09/07/2020',15,15,225);
INSERT INTO venta VALUES (583,'11989123-K','42396509-6','S005','A','20/07/2020',12,14,168);
INSERT INTO venta VALUES (584,'21900978-K','32531450-8','S002','B','12/09/2021',27,13,351);
INSERT INTO venta VALUES (585,'28199367-4','14315947-7','S002','B','10/01/2021',48,14,672);
INSERT INTO venta VALUES (586,'37758315-9','20237862-5','S001','A','09/11/2021',38,14,532);
INSERT INTO venta VALUES (587,'44858513-1','32531450-8','S001','B','19/07/2021',21,15,315);
INSERT INTO venta VALUES (588,'3424618-1','14519212-9','S003','B','26/08/2020',37,12,444);
INSERT INTO venta VALUES (589,'39579783-2','8402711-1','S003','A','27/07/2021',33,12,396);
INSERT INTO venta VALUES (590,'13131628-3','14315947-7','S004','B','29/10/2021',45,12,540);
INSERT INTO venta VALUES (591,'23225926-4','18567395-2','S002','B','17/03/2021',21,13,273);
INSERT INTO venta VALUES (592,'23304982-4','6183303-K','S004','A','10/07/2020',15,15,225);
INSERT INTO venta VALUES (593,'6872702-2','46566450-9','S001','A','28/10/2021',18,14,252);
INSERT INTO venta VALUES (594,'29164861-4','8402711-1','S003','B','19/01/2021',27,12,324);
INSERT INTO venta VALUES (595,'20482820-2','32531450-8','S001','A','05/12/2020',17,14,238);
INSERT INTO venta VALUES (596,'6481317-K','4810357-K','S003','B','22/04/2021',16,15,240);
INSERT INTO venta VALUES (597,'29187358-8','6183303-K','S001','B','18/03/2020',32,14,448);
INSERT INTO venta VALUES (598,'10973664-3','18567395-2','S002','A','16/07/2021',50,12,600);
INSERT INTO venta VALUES (599,'40517647-5','32531450-8','S004','A','01/04/2020',13,13,169);
INSERT INTO venta VALUES (600,'3438540-8','47232966-9','S003','A','13/06/2020',40,15,600);
INSERT INTO venta VALUES (601,'826525-9','14315947-7','S003','B','01/10/2020',41,15,615);
INSERT INTO venta VALUES (602,'24898840-1','23819125-4','S003','A','01/08/2020',47,12,564);
INSERT INTO venta VALUES (603,'3929541-5','45421301-7','S004','B','30/07/2021',25,12,300);
INSERT INTO venta VALUES (604,'7652481-5','6183303-K','S002','B','28/05/2021',39,14,546);
INSERT INTO venta VALUES (605,'18173588-0','18567395-2','S002','B','25/11/2021',20,14,280);
INSERT INTO venta VALUES (606,'33565321-1','20237862-5','S002','B','06/03/2020',25,13,325);
INSERT INTO venta VALUES (607,'8991625-9','6183303-K','S001','A','04/08/2020',50,12,600);
INSERT INTO venta VALUES (608,'31959798-0','47232966-9','S003','A','03/12/2021',14,13,182);
INSERT INTO venta VALUES (609,'22863314-3','23819125-4','S005','B','03/08/2021',12,12,144);
INSERT INTO venta VALUES (610,'19228285-3','29374931-0','S005','B','22/05/2020',30,12,360);
INSERT INTO venta VALUES (611,'34282783-7','18567395-2','S004','B','11/09/2021',38,15,570);
INSERT INTO venta VALUES (612,'4228336-3','18567395-2','S001','B','11/09/2021',29,14,406);
INSERT INTO venta VALUES (613,'20671560-K','4810357-K','S002','A','01/07/2020',21,13,273);
INSERT INTO venta VALUES (614,'880234-3','8402711-1','S003','A','03/05/2021',31,12,372);
INSERT INTO venta VALUES (615,'27199649-7','32531450-8','S005','A','19/05/2021',44,13,572);
INSERT INTO venta VALUES (616,'6815957-1','47232966-9','S005','B','05/04/2020',23,12,276);
INSERT INTO venta VALUES (617,'33775772-3','32531450-8','S004','B','18/08/2021',43,14,602);
INSERT INTO venta VALUES (618,'14452129-3','24180587-5','S005','B','28/09/2020',47,12,564);
INSERT INTO venta VALUES (619,'16979672-6','18567395-2','S004','B','30/05/2021',49,12,588);
INSERT INTO venta VALUES (620,'23758412-0','24180587-5','S003','A','16/09/2021',32,15,480);
INSERT INTO venta VALUES (621,'1477054-2','47232966-9','S002','A','04/01/2020',39,12,468);
INSERT INTO venta VALUES (622,'27187851-6','29374931-0','S002','B','14/12/2021',45,12,540);
INSERT INTO venta VALUES (623,'34280409-8','14315947-7','S005','A','15/06/2021',10,14,140);
INSERT INTO venta VALUES (624,'48198255-3','46566450-9','S001','A','07/05/2021',35,15,525);
INSERT INTO venta VALUES (625,'39327767-K','32531450-8','S005','B','26/06/2020',22,15,330);
INSERT INTO venta VALUES (626,'2946275-5','46566450-9','S001','A','19/01/2020',29,14,406);
INSERT INTO venta VALUES (627,'1453762-7','6183303-K','S002','B','27/03/2020',42,13,546);
INSERT INTO venta VALUES (628,'7143634-9','45421301-7','S002','A','08/12/2021',17,14,238);
INSERT INTO venta VALUES (629,'21372862-8','8402711-1','S004','B','09/07/2021',46,12,552);
INSERT INTO venta VALUES (630,'3514192-8','6183303-K','S004','B','03/05/2020',20,13,260);
INSERT INTO venta VALUES (631,'6533418-6','42396509-6','S002','A','20/05/2020',18,13,234);
INSERT INTO venta VALUES (632,'7939774-1','42396509-6','S003','B','03/11/2020',15,14,210);
INSERT INTO venta VALUES (633,'6451342-7','47232966-9','S003','B','03/06/2020',37,12,444);
INSERT INTO venta VALUES (634,'28863789-K','32531450-8','S005','B','01/10/2020',41,14,574);
INSERT INTO venta VALUES (635,'43375473-5','29374931-0','S004','B','21/03/2021',34,12,408);
INSERT INTO venta VALUES (636,'42800519-8','42396509-6','S003','B','04/12/2020',16,15,240);
INSERT INTO venta VALUES (637,'32817752-8','14315947-7','S003','B','12/02/2020',10,12,120);
INSERT INTO venta VALUES (638,'30727189-3','23819125-4','S001','B','27/12/2021',18,15,270);
INSERT INTO venta VALUES (639,'35546545-4','24180587-5','S001','B','07/06/2020',47,13,611);
INSERT INTO venta VALUES (640,'8628742-0','8402711-1','S003','B','12/08/2021',12,13,156);
INSERT INTO venta VALUES (641,'10831281-5','4810357-K','S003','B','12/06/2020',41,13,533);
INSERT INTO venta VALUES (642,'32722242-2','29374931-0','S002','B','15/03/2021',13,13,169);
INSERT INTO venta VALUES (643,'42196749-0','4810357-K','S001','B','26/12/2021',15,13,195);
INSERT INTO venta VALUES (644,'44920337-2','18567395-2','S004','B','09/08/2020',45,13,585);
INSERT INTO venta VALUES (645,'10284189-1','20237862-5','S002','B','06/04/2021',12,14,168);
INSERT INTO venta VALUES (646,'16884278-3','45421301-7','S001','A','24/02/2020',49,13,637);
INSERT INTO venta VALUES (647,'40737419-3','18567395-2','S002','B','31/12/2021',38,13,494);
INSERT INTO venta VALUES (648,'27214424-9','46566450-9','S001','A','23/12/2020',50,13,650);
INSERT INTO venta VALUES (649,'6272892-2','32531450-8','S004','B','24/08/2021',45,14,630);
INSERT INTO venta VALUES (650,'39586197-2','45421301-7','S002','A','28/02/2020',37,14,518);
INSERT INTO venta VALUES (651,'49199378-2','18567395-2','S005','A','27/02/2020',25,12,300);
INSERT INTO venta VALUES (652,'1396687-7','45421301-7','S001','B','25/01/2021',11,13,143);
INSERT INTO venta VALUES (653,'42618974-7','18567395-2','S001','B','29/04/2021',38,14,532);
INSERT INTO venta VALUES (654,'24584998-2','32531450-8','S002','B','03/03/2020',18,15,270);
INSERT INTO venta VALUES (655,'234166-2','45421301-7','S002','B','29/06/2020',28,15,420);
INSERT INTO venta VALUES (656,'19980328-K','47232966-9','S002','A','10/08/2020',19,14,266);
INSERT INTO venta VALUES (657,'34678840-2','24180587-5','S004','B','30/11/2021',49,14,686);
INSERT INTO venta VALUES (658,'46461804-K','18567395-2','S004','A','27/03/2020',39,13,507);
INSERT INTO venta VALUES (659,'22363485-0','18567395-2','S005','B','04/11/2021',39,12,468);
INSERT INTO venta VALUES (660,'34267828-9','45421301-7','S004','B','09/09/2020',23,12,276);
INSERT INTO venta VALUES (661,'352622-4','18567395-2','S002','A','02/10/2021',33,14,462);
INSERT INTO venta VALUES (662,'9818708-1','4810357-K','S003','A','12/04/2020',47,14,658);
INSERT INTO venta VALUES (663,'286688-9','20237862-5','S003','B','30/04/2020',37,15,555);
INSERT INTO venta VALUES (664,'22578559-7','8402711-1','S004','A','01/05/2021',14,12,168);
INSERT INTO venta VALUES (665,'16282689-1','20237862-5','S004','A','09/07/2021',28,14,392);
INSERT INTO venta VALUES (666,'13505226-4','46566450-9','S005','B','07/10/2020',14,14,196);
INSERT INTO venta VALUES (667,'47866625-K','42396509-6','S004','A','17/11/2020',25,14,350);
INSERT INTO venta VALUES (668,'5063452-3','45421301-7','S003','B','12/07/2020',19,14,266);
INSERT INTO venta VALUES (669,'42885656-2','23819125-4','S005','A','17/11/2021',26,14,364);
INSERT INTO venta VALUES (670,'1187551-3','24180587-5','S003','A','18/04/2020',35,12,420);
INSERT INTO venta VALUES (671,'2417256-2','20237862-5','S001','A','08/11/2020',44,13,572);
INSERT INTO venta VALUES (672,'13853750-1','8402711-1','S005','B','20/04/2020',29,14,406);
INSERT INTO venta VALUES (673,'1293679-6','14519212-9','S003','A','25/07/2021',13,15,195);
INSERT INTO venta VALUES (674,'49948496-8','24180587-5','S005','A','30/06/2020',13,14,182);
INSERT INTO venta VALUES (675,'23573163-0','8402711-1','S005','A','21/04/2020',18,15,270);
INSERT INTO venta VALUES (676,'6465342-3','6183303-K','S005','B','26/11/2021',11,14,154);
INSERT INTO venta VALUES (677,'35465402-4','8402711-1','S001','A','01/03/2020',13,14,182);
INSERT INTO venta VALUES (678,'15892285-1','14519212-9','S004','A','22/03/2020',43,14,602);
INSERT INTO venta VALUES (679,'48381691-K','32531450-8','S004','A','11/09/2021',30,15,450);
INSERT INTO venta VALUES (680,'32977875-4','18567395-2','S003','B','15/06/2021',45,12,540);
INSERT INTO venta VALUES (681,'2139758-K','4810357-K','S005','B','24/11/2021',27,14,378);
INSERT INTO venta VALUES (682,'17923606-0','24180587-5','S004','B','27/08/2021',19,14,266);
INSERT INTO venta VALUES (683,'35753112-8','20237862-5','S004','A','13/10/2021',13,14,182);
INSERT INTO venta VALUES (684,'32442161-0','46566450-9','S001','B','20/05/2020',29,15,435);
INSERT INTO venta VALUES (685,'3836630-0','8402711-1','S004','B','12/02/2020',14,14,196);
INSERT INTO venta VALUES (686,'19290599-0','8402711-1','S005','B','04/05/2021',23,12,276);
INSERT INTO venta VALUES (687,'37277479-7','32531450-8','S001','A','30/11/2021',18,15,270);
INSERT INTO venta VALUES (688,'44379948-6','46566450-9','S004','B','10/07/2020',23,13,299);
INSERT INTO venta VALUES (689,'40128587-3','20237862-5','S001','A','29/12/2021',36,14,504);
INSERT INTO venta VALUES (690,'34310228-3','45421301-7','S002','A','01/04/2021',28,12,336);
INSERT INTO venta VALUES (691,'10706379-K','14315947-7','S005','B','18/09/2020',39,15,585);
INSERT INTO venta VALUES (692,'18650194-2','8402711-1','S005','A','05/11/2021',48,14,672);
INSERT INTO venta VALUES (693,'311538-0','45421301-7','S005','B','19/12/2020',46,14,644);
INSERT INTO venta VALUES (694,'42453287-8','42396509-6','S004','B','02/04/2020',17,12,204);
INSERT INTO venta VALUES (695,'50707777-3','6183303-K','S003','B','21/06/2020',22,15,330);
INSERT INTO venta VALUES (696,'10346114-6','6183303-K','S002','B','23/10/2021',50,14,700);
INSERT INTO venta VALUES (697,'46691665-K','42396509-6','S004','B','26/01/2021',45,14,630);
INSERT INTO venta VALUES (698,'18996592-3','24180587-5','S004','A','28/06/2020',28,12,336);
INSERT INTO venta VALUES (699,'19619789-3','8402711-1','S003','A','01/08/2021',48,15,720);
INSERT INTO venta VALUES (700,'26351763-6','32531450-8','S004','A','18/11/2021',24,12,288);
INSERT INTO venta VALUES (701,'25522713-0','18567395-2','S002','A','16/10/2021',36,14,504);
INSERT INTO venta VALUES (702,'29475335-4','47232966-9','S003','B','06/08/2020',50,12,600);
INSERT INTO venta VALUES (703,'38504455-0','23819125-4','S005','A','21/08/2020',20,12,240);
INSERT INTO venta VALUES (704,'40523969-8','47232966-9','S002','A','30/03/2020',26,15,390);
INSERT INTO venta VALUES (705,'26352495-0','14519212-9','S001','B','23/12/2020',26,14,364);
INSERT INTO venta VALUES (706,'17669273-1','45421301-7','S003','B','28/09/2021',47,15,705);
INSERT INTO venta VALUES (707,'20255908-5','6183303-K','S001','A','26/10/2020',37,15,555);
INSERT INTO venta VALUES (708,'18565531-8','20237862-5','S002','A','02/08/2021',37,12,444);
INSERT INTO venta VALUES (709,'13962214-6','14315947-7','S002','A','14/04/2020',29,13,377);
INSERT INTO venta VALUES (710,'32379629-7','14519212-9','S003','A','21/03/2020',15,14,210);
INSERT INTO venta VALUES (711,'25724244-7','8402711-1','S005','A','18/10/2020',28,14,392);
INSERT INTO venta VALUES (712,'861660-4','6183303-K','S004','B','14/10/2020',18,15,270);
INSERT INTO venta VALUES (713,'50427790-9','42396509-6','S002','A','16/05/2020',33,13,429);
INSERT INTO venta VALUES (714,'16841887-6','32531450-8','S001','A','01/04/2020',48,14,672);
INSERT INTO venta VALUES (715,'46371192-5','23819125-4','S004','B','08/06/2020',32,13,416);
INSERT INTO venta VALUES (716,'32843926-3','45421301-7','S003','A','19/08/2020',49,12,588);
INSERT INTO venta VALUES (717,'34181117-1','4810357-K','S002','B','12/06/2021',11,15,165);
INSERT INTO venta VALUES (718,'25238461-8','42396509-6','S002','A','16/06/2021',33,14,462);
INSERT INTO venta VALUES (719,'45450359-7','4810357-K','S004','A','21/05/2020',42,15,630);
INSERT INTO venta VALUES (720,'6415906-2','23819125-4','S001','B','25/01/2021',44,13,572);
INSERT INTO venta VALUES (721,'30252467-K','46566450-9','S003','B','03/03/2021',48,12,576);
INSERT INTO venta VALUES (722,'2986816-6','42396509-6','S004','B','02/10/2020',13,14,182);
INSERT INTO venta VALUES (723,'5633934-5','18567395-2','S004','A','13/09/2021',27,13,351);
INSERT INTO venta VALUES (724,'14582575-K','47232966-9','S001','A','25/02/2021',47,12,564);
INSERT INTO venta VALUES (725,'1399243-6','32531450-8','S003','B','12/12/2020',42,15,630);
INSERT INTO venta VALUES (726,'17542480-6','46566450-9','S003','A','15/06/2021',37,15,555);
INSERT INTO venta VALUES (727,'23453878-0','18567395-2','S001','A','02/07/2021',26,14,364);
INSERT INTO venta VALUES (728,'3344038-3','14519212-9','S002','B','20/06/2020',18,14,252);
INSERT INTO venta VALUES (729,'29477102-6','14519212-9','S005','B','16/09/2021',13,12,156);
INSERT INTO venta VALUES (730,'25814227-6','32531450-8','S001','A','08/12/2020',11,15,165);
INSERT INTO venta VALUES (731,'42508559-K','46566450-9','S001','A','15/02/2020',41,12,492);
INSERT INTO venta VALUES (732,'1617703-2','18567395-2','S001','B','17/03/2020',10,12,120);
INSERT INTO venta VALUES (733,'2718614-9','32531450-8','S003','B','30/01/2021',29,13,377);
INSERT INTO venta VALUES (734,'4348833-3','23819125-4','S001','A','23/12/2021',17,12,204);
INSERT INTO venta VALUES (735,'622622-1','23819125-4','S005','A','06/01/2020',17,13,221);
INSERT INTO venta VALUES (736,'3787833-2','24180587-5','S003','B','28/09/2020',18,15,270);
INSERT INTO venta VALUES (737,'47229731-7','46566450-9','S001','B','03/05/2021',12,12,144);
INSERT INTO venta VALUES (738,'579393-9','20237862-5','S002','A','09/05/2020',30,13,390);
INSERT INTO venta VALUES (739,'31463680-5','8402711-1','S005','A','02/05/2021',42,12,504);
INSERT INTO venta VALUES (740,'6864554-9','45421301-7','S004','B','18/11/2020',11,12,132);
INSERT INTO venta VALUES (741,'39988545-0','45421301-7','S003','A','04/02/2020',40,12,480);
INSERT INTO venta VALUES (742,'33782557-5','8402711-1','S003','B','20/07/2021',13,13,169);
INSERT INTO venta VALUES (743,'43425922-3','46566450-9','S003','B','21/04/2020',21,14,294);
INSERT INTO venta VALUES (744,'49836924-3','8402711-1','S004','B','25/03/2020',21,14,294);
INSERT INTO venta VALUES (745,'1253946-0','6183303-K','S002','A','05/04/2020',42,13,546);
INSERT INTO venta VALUES (746,'37341101-9','45421301-7','S004','A','05/03/2020',11,15,165);
INSERT INTO venta VALUES (747,'20667594-2','8402711-1','S005','B','24/05/2020',24,12,288);
INSERT INTO venta VALUES (748,'38393890-2','14315947-7','S003','A','04/11/2020',40,12,480);
INSERT INTO venta VALUES (749,'33926788-K','45421301-7','S002','B','02/08/2020',10,15,150);
INSERT INTO venta VALUES (750,'42961871-1','24180587-5','S002','B','24/06/2021',22,14,308);
INSERT INTO venta VALUES (751,'28686792-8','46566450-9','S003','A','23/01/2020',43,13,559);
INSERT INTO venta VALUES (752,'10219714-3','20237862-5','S002','A','14/01/2020',27,15,405);
INSERT INTO venta VALUES (753,'35878746-0','32531450-8','S001','B','26/01/2020',13,13,169);
INSERT INTO venta VALUES (754,'23473511-K','46566450-9','S004','B','20/06/2021',30,12,360);
INSERT INTO venta VALUES (755,'34701221-1','23819125-4','S003','A','26/10/2021',19,12,228);
INSERT INTO venta VALUES (756,'12309415-8','14315947-7','S004','B','08/05/2021',19,15,285);
INSERT INTO venta VALUES (757,'39619954-8','29374931-0','S003','B','09/09/2021',29,13,377);
INSERT INTO venta VALUES (758,'47263493-3','47232966-9','S002','B','12/10/2021',33,15,495);
INSERT INTO venta VALUES (759,'53395-5','45421301-7','S002','B','16/06/2020',30,13,390);
INSERT INTO venta VALUES (760,'27347975-9','14315947-7','S005','A','24/08/2021',26,14,364);
INSERT INTO venta VALUES (761,'9896230-1','14519212-9','S001','A','16/07/2020',18,13,234);
INSERT INTO venta VALUES (762,'37667154-2','8402711-1','S002','A','29/09/2021',29,15,435);
INSERT INTO venta VALUES (763,'49131271-8','42396509-6','S002','A','28/08/2021',50,13,650);
INSERT INTO venta VALUES (764,'28279548-5','4810357-K','S002','B','01/06/2021',21,12,252);
INSERT INTO venta VALUES (765,'46910506-7','29374931-0','S003','A','30/10/2021',31,12,372);
INSERT INTO venta VALUES (766,'10962530-2','6183303-K','S005','B','03/01/2021',50,12,600);
INSERT INTO venta VALUES (767,'34388372-2','32531450-8','S001','B','25/07/2021',16,15,240);
INSERT INTO venta VALUES (768,'5184508-0','47232966-9','S002','A','25/06/2021',11,14,154);
INSERT INTO venta VALUES (769,'39578339-4','24180587-5','S003','B','01/05/2020',43,13,559);
INSERT INTO venta VALUES (770,'33783997-5','20237862-5','S004','B','18/09/2020',29,13,377);
INSERT INTO venta VALUES (771,'14775706-9','4810357-K','S004','A','25/06/2021',26,14,364);
INSERT INTO venta VALUES (772,'10889671-K','20237862-5','S003','A','16/09/2020',46,14,644);
INSERT INTO venta VALUES (773,'17256368-6','18567395-2','S001','B','12/07/2020',20,12,240);
INSERT INTO venta VALUES (774,'16949388-K','24180587-5','S001','A','26/12/2021',22,13,286);
INSERT INTO venta VALUES (775,'11125584-9','14519212-9','S003','A','29/12/2021',31,12,372);
INSERT INTO venta VALUES (776,'32599126-7','23819125-4','S005','A','14/03/2021',22,14,308);
INSERT INTO venta VALUES (777,'18352275-2','46566450-9','S003','A','05/06/2020',21,12,252);
INSERT INTO venta VALUES (778,'25864978-8','23819125-4','S004','B','29/07/2020',15,14,210);
INSERT INTO venta VALUES (779,'29968348-6','20237862-5','S004','B','23/05/2021',42,15,630);
INSERT INTO venta VALUES (780,'11988320-2','14519212-9','S005','B','27/11/2020',44,15,660);
INSERT INTO venta VALUES (781,'4686762-9','14315947-7','S004','A','25/01/2020',36,15,540);
INSERT INTO venta VALUES (782,'16543524-9','18567395-2','S005','B','27/11/2021',42,15,630);
INSERT INTO venta VALUES (783,'7980123-2','29374931-0','S005','A','16/12/2020',12,14,168);
INSERT INTO venta VALUES (784,'11128351-6','24180587-5','S001','A','17/12/2020',50,12,600);
INSERT INTO venta VALUES (785,'35636383-3','18567395-2','S003','B','17/05/2021',10,15,150);
INSERT INTO venta VALUES (786,'25414315-4','46566450-9','S004','A','21/08/2021',34,14,476);
INSERT INTO venta VALUES (787,'33330984-K','47232966-9','S003','A','28/11/2021',17,13,221);
INSERT INTO venta VALUES (788,'1281503-4','4810357-K','S004','B','09/01/2021',26,13,338);
INSERT INTO venta VALUES (789,'38460966-K','23819125-4','S005','A','08/08/2020',21,15,315);
INSERT INTO venta VALUES (790,'19857451-1','20237862-5','S001','B','01/09/2020',10,13,130);
INSERT INTO venta VALUES (791,'37467881-7','4810357-K','S005','B','04/08/2020',37,13,481);
INSERT INTO venta VALUES (792,'33371630-5','46566450-9','S003','A','10/07/2020',13,13,169);
INSERT INTO venta VALUES (793,'10886477-K','29374931-0','S005','B','23/03/2021',39,13,507);
INSERT INTO venta VALUES (794,'97034-4','4810357-K','S003','A','26/02/2021',35,12,420);
INSERT INTO venta VALUES (795,'1648971-9','46566450-9','S002','A','11/09/2021',26,12,312);
INSERT INTO venta VALUES (796,'32642704-7','18567395-2','S004','A','01/09/2020',46,12,552);
INSERT INTO venta VALUES (797,'27617748-6','20237862-5','S003','B','08/05/2021',49,12,588);
INSERT INTO venta VALUES (798,'6893141-K','42396509-6','S004','B','02/11/2021',32,15,480);
INSERT INTO venta VALUES (799,'6237730-5','14315947-7','S004','A','07/09/2021',22,15,330);
INSERT INTO venta VALUES (800,'47578117-1','29374931-0','S003','A','18/05/2020',36,12,432);
INSERT INTO venta VALUES (801,'6328185-9','29374931-0','S005','B','25/08/2020',28,15,420);
INSERT INTO venta VALUES (802,'15670796-1','14519212-9','S001','B','14/12/2021',34,15,510);
INSERT INTO venta VALUES (803,'3641462-6','32531450-8','S004','A','01/03/2020',50,12,600);
INSERT INTO venta VALUES (804,'7175488-K','24180587-5','S002','B','17/03/2020',27,12,324);
INSERT INTO venta VALUES (805,'34883250-6','24180587-5','S005','B','29/03/2021',37,15,555);
INSERT INTO venta VALUES (806,'31206779-K','32531450-8','S001','A','06/11/2021',15,14,210);
INSERT INTO venta VALUES (807,'46608268-6','8402711-1','S005','B','08/08/2021',20,15,300);
INSERT INTO venta VALUES (808,'36751859-6','24180587-5','S002','B','19/01/2021',24,15,360);
INSERT INTO venta VALUES (809,'22592713-8','45421301-7','S005','B','11/05/2020',33,14,462);
INSERT INTO venta VALUES (810,'37516398-5','29374931-0','S003','A','02/03/2021',49,13,637);
INSERT INTO venta VALUES (811,'15784570-5','32531450-8','S002','A','24/06/2020',40,12,480);
INSERT INTO venta VALUES (812,'27301426-8','20237862-5','S002','B','14/07/2020',29,12,348);
INSERT INTO venta VALUES (813,'654214-K','18567395-2','S001','B','17/06/2021',34,13,442);
INSERT INTO venta VALUES (814,'12397181-7','46566450-9','S001','B','19/10/2020',12,14,168);
INSERT INTO venta VALUES (815,'11826891-1','8402711-1','S004','A','27/01/2021',19,13,247);
INSERT INTO venta VALUES (816,'4284840-9','14315947-7','S002','B','10/04/2020',11,14,154);
INSERT INTO venta VALUES (817,'3948172-3','42396509-6','S002','B','25/03/2020',28,12,336);
INSERT INTO venta VALUES (818,'46862498-2','8402711-1','S002','A','11/04/2021',49,14,686);
INSERT INTO venta VALUES (819,'31933998-1','23819125-4','S005','A','15/04/2020',45,12,540);
INSERT INTO venta VALUES (820,'42927751-5','14519212-9','S005','A','30/07/2020',41,12,492);
INSERT INTO venta VALUES (821,'10103950-1','24180587-5','S004','B','10/03/2020',14,14,196);
INSERT INTO venta VALUES (822,'30513489-9','4810357-K','S001','A','18/02/2020',50,12,600);
INSERT INTO venta VALUES (823,'36516726-5','45421301-7','S005','A','19/08/2020',28,13,364);
INSERT INTO venta VALUES (824,'6346816-9','14315947-7','S002','A','13/12/2021',43,13,559);
INSERT INTO venta VALUES (825,'95828-K','14519212-9','S001','B','26/08/2020',46,12,552);
INSERT INTO venta VALUES (826,'1629139-0','18567395-2','S005','B','26/04/2020',40,13,520);
INSERT INTO venta VALUES (827,'48337467-4','45421301-7','S001','B','09/08/2020',17,13,221);
INSERT INTO venta VALUES (828,'4519732-8','20237862-5','S005','A','02/02/2021',32,14,448);
INSERT INTO venta VALUES (829,'298349-4','18567395-2','S003','B','23/05/2021',46,13,598);
INSERT INTO venta VALUES (830,'8882892-5','18567395-2','S001','A','26/09/2020',50,14,700);
INSERT INTO venta VALUES (831,'23724566-0','42396509-6','S001','B','20/08/2021',38,14,532);
INSERT INTO venta VALUES (832,'13677701-7','14315947-7','S005','A','03/09/2020',29,12,348);
INSERT INTO venta VALUES (833,'15467298-2','4810357-K','S001','A','20/10/2021',23,13,299);
INSERT INTO venta VALUES (834,'10837675-9','4810357-K','S003','A','29/12/2021',10,14,140);
INSERT INTO venta VALUES (835,'42310596-8','14519212-9','S004','A','23/01/2020',27,12,324);
INSERT INTO venta VALUES (836,'21251401-2','24180587-5','S002','A','08/04/2020',22,12,264);
INSERT INTO venta VALUES (837,'45456811-7','23819125-4','S001','A','18/08/2021',45,13,585);
INSERT INTO venta VALUES (838,'34614323-1','42396509-6','S002','B','22/10/2020',31,12,372);
INSERT INTO venta VALUES (839,'24908689-4','32531450-8','S003','B','04/11/2020',28,14,392);
INSERT INTO venta VALUES (840,'38888491-6','29374931-0','S004','B','11/07/2020',24,14,336);
INSERT INTO venta VALUES (841,'823358-6','6183303-K','S004','B','20/11/2021',50,14,700);
INSERT INTO venta VALUES (842,'29235193-3','42396509-6','S001','B','23/07/2020',38,15,570);
INSERT INTO venta VALUES (843,'27126195-0','23819125-4','S002','A','16/09/2020',44,13,572);
INSERT INTO venta VALUES (844,'33404901-9','32531450-8','S004','A','23/04/2021',12,14,168);
INSERT INTO venta VALUES (845,'48971155-9','42396509-6','S002','A','23/07/2021',38,14,532);
INSERT INTO venta VALUES (846,'4896751-5','8402711-1','S003','B','03/02/2020',12,13,156);
INSERT INTO venta VALUES (847,'42175995-2','47232966-9','S005','B','20/08/2020',40,15,600);
INSERT INTO venta VALUES (848,'13564265-7','45421301-7','S001','B','01/11/2021',26,14,364);
INSERT INTO venta VALUES (849,'38540198-1','42396509-6','S005','A','17/03/2020',31,13,403);
INSERT INTO venta VALUES (850,'33796533-4','24180587-5','S004','A','13/06/2021',41,13,533);
INSERT INTO venta VALUES (851,'44370765-4','14315947-7','S005','B','03/09/2020',49,15,735);
INSERT INTO venta VALUES (852,'18799165-K','6183303-K','S003','A','27/03/2020',30,12,360);
INSERT INTO venta VALUES (853,'461852-1','20237862-5','S001','B','29/11/2020',43,13,559);
INSERT INTO venta VALUES (854,'3365978-4','6183303-K','S003','B','23/12/2020',26,13,338);
INSERT INTO venta VALUES (855,'41777347-9','6183303-K','S003','B','11/04/2021',38,12,456);
INSERT INTO venta VALUES (856,'10344755-0','47232966-9','S004','B','20/03/2020',32,14,448);
INSERT INTO venta VALUES (857,'15827626-7','4810357-K','S004','B','28/01/2021',18,15,270);
INSERT INTO venta VALUES (858,'36218685-4','29374931-0','S002','B','15/07/2020',30,12,360);
INSERT INTO venta VALUES (859,'31512203-1','24180587-5','S002','A','02/02/2020',34,15,510);
INSERT INTO venta VALUES (860,'38862398-5','14315947-7','S001','B','13/10/2020',48,14,672);
INSERT INTO venta VALUES (861,'17518858-4','29374931-0','S004','B','23/10/2020',29,14,406);
INSERT INTO venta VALUES (862,'3249722-5','6183303-K','S004','B','05/07/2020',13,13,169);
INSERT INTO venta VALUES (863,'47799176-9','47232966-9','S003','A','29/09/2021',21,12,252);
INSERT INTO venta VALUES (864,'20962990-9','20237862-5','S004','B','26/10/2021',36,14,504);
INSERT INTO venta VALUES (865,'34605201-5','47232966-9','S001','A','16/07/2020',48,12,576);
INSERT INTO venta VALUES (866,'362596-6','32531450-8','S003','B','02/02/2020',47,13,611);
INSERT INTO venta VALUES (867,'17375952-5','20237862-5','S002','B','06/03/2020',21,15,315);
INSERT INTO venta VALUES (868,'10937332-K','42396509-6','S001','B','03/03/2021',10,13,130);
INSERT INTO venta VALUES (869,'48821618-K','14519212-9','S003','B','07/08/2021',15,15,225);
INSERT INTO venta VALUES (870,'33862339-9','20237862-5','S005','B','23/10/2020',41,15,615);
INSERT INTO venta VALUES (871,'21532819-8','32531450-8','S002','A','05/04/2021',13,14,182);
INSERT INTO venta VALUES (872,'33862361-5','14315947-7','S005','B','28/06/2020',12,13,156);
INSERT INTO venta VALUES (873,'36306890-1','46566450-9','S004','B','18/11/2021',19,13,247);
INSERT INTO venta VALUES (874,'22914299-2','47232966-9','S001','A','28/01/2020',46,12,552);
INSERT INTO venta VALUES (875,'1615409-1','8402711-1','S002','B','02/02/2020',26,14,364);
INSERT INTO venta VALUES (876,'4095870-3','18567395-2','S003','B','17/06/2021',20,13,260);
INSERT INTO venta VALUES (877,'16177145-7','32531450-8','S001','B','07/03/2020',23,13,299);
INSERT INTO venta VALUES (878,'6710818-3','6183303-K','S002','A','09/04/2020',47,13,611);
INSERT INTO venta VALUES (879,'1124366-5','29374931-0','S005','B','09/11/2020',10,14,140);
INSERT INTO venta VALUES (880,'1925053-9','32531450-8','S002','A','13/10/2020',24,12,288);
INSERT INTO venta VALUES (881,'47506426-7','18567395-2','S001','A','30/04/2021',20,12,240);
INSERT INTO venta VALUES (882,'4497765-6','47232966-9','S001','A','05/06/2020',42,15,630);
INSERT INTO venta VALUES (883,'10773220-9','32531450-8','S002','A','15/03/2020',25,12,300);
INSERT INTO venta VALUES (884,'29893435-3','6183303-K','S002','A','25/01/2021',45,12,540);
INSERT INTO venta VALUES (885,'20252144-4','42396509-6','S002','A','10/10/2021',24,14,336);
INSERT INTO venta VALUES (886,'1771105-9','32531450-8','S004','B','02/08/2021',12,13,156);
INSERT INTO venta VALUES (887,'48105159-2','8402711-1','S003','A','10/12/2020',10,12,120);
INSERT INTO venta VALUES (888,'3970336-K','32531450-8','S004','A','31/03/2020',42,12,504);
INSERT INTO venta VALUES (889,'4132063-K','23819125-4','S001','A','06/06/2020',34,15,510);
INSERT INTO venta VALUES (890,'26886840-2','4810357-K','S003','A','12/01/2020',32,13,416);
INSERT INTO venta VALUES (891,'4924292-1','4810357-K','S004','A','04/03/2021',35,15,525);
INSERT INTO venta VALUES (892,'2593595-0','24180587-5','S005','A','07/01/2021',24,12,288);
INSERT INTO venta VALUES (893,'38912466-4','14315947-7','S002','B','08/03/2020',28,14,392);
INSERT INTO venta VALUES (894,'11903114-1','14519212-9','S005','A','30/06/2020',36,15,540);
INSERT INTO venta VALUES (895,'38484150-3','29374931-0','S002','B','15/12/2020',17,14,238);
INSERT INTO venta VALUES (896,'19336750-K','32531450-8','S004','A','02/04/2020',27,14,378);
INSERT INTO venta VALUES (897,'45361803-K','29374931-0','S005','B','29/07/2020',46,15,690);
INSERT INTO venta VALUES (898,'14707264-3','14519212-9','S002','B','12/11/2021',47,12,564);
INSERT INTO venta VALUES (899,'20246700-8','47232966-9','S005','B','18/01/2020',33,15,495);
INSERT INTO venta VALUES (900,'7915833-K','47232966-9','S005','B','24/09/2020',45,13,585);
INSERT INTO venta VALUES (901,'18279580-1','14519212-9','S005','B','15/08/2021',40,14,560);
INSERT INTO venta VALUES (902,'32696732-7','29374931-0','S002','A','08/03/2020',44,13,572);
INSERT INTO venta VALUES (903,'8586875-6','6183303-K','S001','A','02/11/2020',32,12,384);
INSERT INTO venta VALUES (904,'1786143-3','42396509-6','S004','A','04/11/2020',28,13,364);
INSERT INTO venta VALUES (905,'18608315-6','47232966-9','S001','B','03/10/2021',15,15,225);
INSERT INTO venta VALUES (906,'42777897-5','14315947-7','S004','A','06/08/2020',49,15,735);
INSERT INTO venta VALUES (907,'2317726-9','23819125-4','S003','B','21/06/2021',16,13,208);
INSERT INTO venta VALUES (908,'18507970-8','14315947-7','S002','A','15/12/2020',36,12,432);
INSERT INTO venta VALUES (909,'41684322-8','24180587-5','S005','A','12/04/2021',22,15,330);
INSERT INTO venta VALUES (910,'37766603-8','14315947-7','S002','A','06/05/2021',43,12,516);
INSERT INTO venta VALUES (911,'11742919-9','45421301-7','S005','A','16/12/2021',13,14,182);
INSERT INTO venta VALUES (912,'48139555-0','29374931-0','S001','A','07/09/2020',43,15,645);
INSERT INTO venta VALUES (913,'1865675-2','14519212-9','S005','B','08/01/2020',29,15,435);
INSERT INTO venta VALUES (914,'47110134-6','14519212-9','S003','A','05/04/2021',20,13,260);
INSERT INTO venta VALUES (915,'21759649-1','14315947-7','S002','A','16/08/2020',50,14,700);
INSERT INTO venta VALUES (916,'3740972-3','23819125-4','S001','A','26/06/2021',13,12,156);
INSERT INTO venta VALUES (917,'22975731-8','24180587-5','S005','A','06/09/2020',28,14,392);
INSERT INTO venta VALUES (918,'34709987-2','20237862-5','S001','A','27/02/2020',47,15,705);
INSERT INTO venta VALUES (919,'33473373-4','32531450-8','S003','A','25/06/2020',40,13,520);
INSERT INTO venta VALUES (920,'35137234-6','14315947-7','S002','A','09/02/2021',33,15,495);
INSERT INTO venta VALUES (921,'21184458-2','8402711-1','S005','A','03/03/2021',48,14,672);
INSERT INTO venta VALUES (922,'4857214-6','32531450-8','S005','A','21/01/2020',38,12,456);
INSERT INTO venta VALUES (923,'31248750-0','23819125-4','S002','B','12/06/2020',18,13,234);
INSERT INTO venta VALUES (924,'33100793-5','46566450-9','S003','B','22/08/2020',36,15,540);
INSERT INTO venta VALUES (925,'27799616-2','24180587-5','S002','B','07/02/2020',39,15,585);
INSERT INTO venta VALUES (926,'1528456-0','18567395-2','S003','B','10/05/2021',18,14,252);
INSERT INTO venta VALUES (927,'42648311-4','45421301-7','S002','A','25/05/2021',48,14,672);
INSERT INTO venta VALUES (928,'36874751-3','6183303-K','S001','A','17/10/2020',30,15,450);
INSERT INTO venta VALUES (929,'22499113-4','47232966-9','S004','B','28/03/2020',18,15,270);
INSERT INTO venta VALUES (930,'4528653-3','4810357-K','S001','A','22/09/2021',14,14,196);
INSERT INTO venta VALUES (931,'30967752-8','42396509-6','S004','B','27/09/2021',43,15,645);
INSERT INTO venta VALUES (932,'16410532-6','45421301-7','S002','A','23/09/2021',15,15,225);
INSERT INTO venta VALUES (933,'21560113-7','47232966-9','S005','A','06/12/2020',49,14,686);
INSERT INTO venta VALUES (934,'26638892-6','6183303-K','S001','B','14/02/2021',33,12,396);
INSERT INTO venta VALUES (935,'1179973-6','29374931-0','S001','B','01/03/2020',20,13,260);
INSERT INTO venta VALUES (936,'2877565-2','24180587-5','S003','B','18/03/2020',33,12,396);
INSERT INTO venta VALUES (937,'36781566-3','47232966-9','S001','A','01/11/2021',41,15,615);
INSERT INTO venta VALUES (938,'4288088-4','14519212-9','S003','B','15/09/2021',34,13,442);
INSERT INTO venta VALUES (939,'2775313-2','46566450-9','S005','A','13/04/2020',25,14,350);
INSERT INTO venta VALUES (940,'49813676-1','14519212-9','S002','B','15/03/2020',32,15,480);
INSERT INTO venta VALUES (941,'35918199-K','18567395-2','S001','A','16/01/2021',40,14,560);
INSERT INTO venta VALUES (942,'11306566-4','24180587-5','S003','B','20/08/2021',12,14,168);
INSERT INTO venta VALUES (943,'325008-3','14519212-9','S005','A','19/06/2021',41,12,492);
INSERT INTO venta VALUES (944,'13701252-9','32531450-8','S001','A','10/10/2021',37,12,444);
INSERT INTO venta VALUES (945,'11940741-9','20237862-5','S002','A','09/02/2020',37,15,555);
INSERT INTO venta VALUES (946,'3862487-3','47232966-9','S005','B','01/05/2020',32,12,384);
INSERT INTO venta VALUES (947,'25491389-8','32531450-8','S001','A','15/03/2021',16,15,240);
INSERT INTO venta VALUES (948,'18753887-4','46566450-9','S005','B','12/09/2021',33,12,396);
INSERT INTO venta VALUES (949,'38906790-3','14315947-7','S005','B','17/11/2020',45,15,675);
INSERT INTO venta VALUES (950,'50148857-7','14519212-9','S003','B','08/11/2021',22,14,308);
INSERT INTO venta VALUES (951,'33205809-6','45421301-7','S004','A','01/07/2021',19,13,247);
INSERT INTO venta VALUES (952,'45319792-1','45421301-7','S001','B','29/11/2021',31,14,434);
INSERT INTO venta VALUES (953,'18634364-6','6183303-K','S003','B','01/05/2021',13,15,195);
INSERT INTO venta VALUES (954,'27356797-6','29374931-0','S005','B','22/07/2020',35,15,525);
INSERT INTO venta VALUES (955,'6648449-1','6183303-K','S001','A','02/08/2021',27,14,378);
INSERT INTO venta VALUES (956,'47307353-6','46566450-9','S001','B','14/11/2021',25,14,350);
INSERT INTO venta VALUES (957,'45718276-7','6183303-K','S002','B','15/01/2021',13,13,169);
INSERT INTO venta VALUES (958,'32751281-1','14519212-9','S003','A','09/08/2020',35,13,455);
INSERT INTO venta VALUES (959,'9848752-2','29374931-0','S003','A','20/04/2020',37,15,555);
INSERT INTO venta VALUES (960,'24909505-2','6183303-K','S001','A','26/05/2021',15,14,210);
INSERT INTO venta VALUES (961,'711151-7','14315947-7','S001','A','22/10/2020',22,12,264);
INSERT INTO venta VALUES (962,'46309313-K','45421301-7','S002','A','06/05/2021',42,13,546);
INSERT INTO venta VALUES (963,'20287539-4','29374931-0','S003','B','14/02/2020',17,12,204);
INSERT INTO venta VALUES (964,'47911723-3','20237862-5','S005','A','03/12/2020',11,15,165);
INSERT INTO venta VALUES (965,'45338344-K','14519212-9','S004','B','18/01/2020',42,14,588);
INSERT INTO venta VALUES (966,'29258107-6','47232966-9','S005','A','22/09/2020',47,13,611);
INSERT INTO venta VALUES (967,'24642835-2','46566450-9','S003','B','13/11/2020',26,15,390);
INSERT INTO venta VALUES (968,'15739680-3','6183303-K','S004','A','15/03/2020',22,15,330);
INSERT INTO venta VALUES (969,'43954539-9','14315947-7','S002','B','10/07/2020',12,13,156);
INSERT INTO venta VALUES (970,'24601674-7','14519212-9','S002','A','21/10/2020',47,14,658);
INSERT INTO venta VALUES (971,'22998973-1','14315947-7','S002','A','29/11/2020',45,14,630);
INSERT INTO venta VALUES (972,'44858821-1','6183303-K','S005','A','11/02/2020',16,15,240);
INSERT INTO venta VALUES (973,'12412988-5','6183303-K','S001','A','29/08/2021',19,14,266);
INSERT INTO venta VALUES (974,'39868199-1','14519212-9','S001','B','02/03/2020',43,15,645);
INSERT INTO venta VALUES (975,'36229320-0','23819125-4','S004','A','20/11/2020',19,15,285);
INSERT INTO venta VALUES (976,'22692321-7','6183303-K','S001','B','06/08/2020',26,13,338);
INSERT INTO venta VALUES (977,'48119975-1','6183303-K','S004','B','19/12/2021',41,15,615);
INSERT INTO venta VALUES (978,'1493416-2','32531450-8','S004','B','27/08/2021',17,15,255);
INSERT INTO venta VALUES (979,'9763747-4','47232966-9','S005','A','30/11/2020',15,15,225);
INSERT INTO venta VALUES (980,'15125302-4','32531450-8','S001','A','13/02/2021',28,14,392);
INSERT INTO venta VALUES (981,'32667506-7','20237862-5','S002','B','13/04/2021',48,14,672);
INSERT INTO venta VALUES (982,'8959786-2','14315947-7','S004','A','03/07/2020',27,12,324);
INSERT INTO venta VALUES (983,'24920513-3','23819125-4','S003','B','07/06/2021',22,14,308);
INSERT INTO venta VALUES (984,'3144784-4','46566450-9','S002','B','22/11/2020',40,14,560);
INSERT INTO venta VALUES (985,'33289189-8','42396509-6','S003','B','10/10/2020',17,14,238);
INSERT INTO venta VALUES (986,'1642943-0','24180587-5','S001','A','01/12/2021',31,13,403);
INSERT INTO venta VALUES (987,'307495-1','42396509-6','S005','A','09/12/2021',48,14,672);
INSERT INTO venta VALUES (988,'50606168-7','23819125-4','S005','A','27/11/2020',36,14,504);
INSERT INTO venta VALUES (989,'8931618-9','14519212-9','S001','A','11/10/2020',47,15,705);
INSERT INTO venta VALUES (990,'31193617-4','8402711-1','S001','A','17/03/2021',35,15,525);
INSERT INTO venta VALUES (991,'19760805-6','47232966-9','S001','B','04/06/2020',33,13,429);
INSERT INTO venta VALUES (992,'49611325-K','45421301-7','S002','B','16/02/2021',33,15,495);
INSERT INTO venta VALUES (993,'31895487-9','42396509-6','S001','A','29/03/2021',22,14,308);
INSERT INTO venta VALUES (994,'34883780-K','14519212-9','S002','B','23/07/2020',25,12,300);
INSERT INTO venta VALUES (995,'41481417-4','32531450-8','S004','B','18/08/2021',36,14,504);
INSERT INTO venta VALUES (996,'39625992-3','20237862-5','S002','A','13/02/2021',17,14,238);
INSERT INTO venta VALUES (997,'8668552-3','20237862-5','S002','A','09/08/2021',10,15,150);
INSERT INTO venta VALUES (998,'48881410-9','18567395-2','S001','A','15/03/2020',14,13,182);
INSERT INTO venta VALUES (999,'4249839-4','46566450-9','S004','B','19/01/2021',34,13,442);
INSERT INTO venta VALUES (1000,'34170170-8','29374931-0','S002','A','29/01/2020',18,13,234);
INSERT INTO venta VALUES (1001,'22440478-6','8402711-1','S001','A','09/03/2020',22,14,308);
INSERT INTO venta VALUES (1002,'23357588-7','46566450-9','S001','A','05/11/2021',38,14,532);
INSERT INTO venta VALUES (1003,'45162260-9','14519212-9','S002','B','14/04/2020',26,13,338);
INSERT INTO venta VALUES (1004,'43491650-K','14315947-7','S003','A','08/05/2020',27,14,378);
INSERT INTO venta VALUES (1005,'45404268-9','14315947-7','S001','B','17/11/2021',32,12,384);
INSERT INTO venta VALUES (1006,'22252619-1','24180587-5','S005','B','06/03/2021',47,14,658);
INSERT INTO venta VALUES (1007,'19868118-0','20237862-5','S001','B','01/03/2021',34,12,408);
INSERT INTO venta VALUES (1008,'9114642-8','29374931-0','S001','B','21/11/2020',21,13,273);
INSERT INTO venta VALUES (1009,'43302376-5','14315947-7','S003','A','31/12/2021',37,12,444);
INSERT INTO venta VALUES (1010,'41687114-0','8402711-1','S003','A','20/04/2021',46,14,644);
INSERT INTO venta VALUES (1011,'3580221-5','6183303-K','S002','B','21/10/2021',29,15,435);
INSERT INTO venta VALUES (1012,'476801-9','4810357-K','S002','A','17/09/2021',17,12,204);
INSERT INTO venta VALUES (1013,'6490522-8','8402711-1','S004','A','13/06/2020',13,15,195);
INSERT INTO venta VALUES (1014,'21111668-4','14519212-9','S001','B','13/12/2020',11,15,165);
INSERT INTO venta VALUES (1015,'209803-2','47232966-9','S003','B','02/08/2020',18,15,270);
INSERT INTO venta VALUES (1016,'1948800-4','47232966-9','S005','A','06/03/2021',19,15,285);
INSERT INTO venta VALUES (1017,'8149359-6','45421301-7','S005','A','04/07/2021',49,13,637);
INSERT INTO venta VALUES (1018,'25881938-1','46566450-9','S003','A','08/01/2020',21,13,273);
INSERT INTO venta VALUES (1019,'4519275-K','32531450-8','S004','B','28/11/2021',28,13,364);
INSERT INTO venta VALUES (1020,'2340217-3','20237862-5','S004','A','13/10/2020',35,13,455);
INSERT INTO venta VALUES (1021,'43961273-8','29374931-0','S002','A','09/08/2020',17,13,221);
INSERT INTO venta VALUES (1022,'40862490-8','14315947-7','S003','A','14/06/2021',45,12,540);
INSERT INTO venta VALUES (1023,'21906352-0','6183303-K','S001','B','22/01/2021',39,14,546);
INSERT INTO venta VALUES (1024,'3885562-K','20237862-5','S005','A','02/03/2020',27,13,351);
INSERT INTO venta VALUES (1025,'46971708-9','46566450-9','S004','A','01/03/2020',21,12,252);
INSERT INTO venta VALUES (1026,'28816922-5','46566450-9','S005','A','11/06/2020',26,14,364);
INSERT INTO venta VALUES (1027,'24402584-6','8402711-1','S004','B','26/09/2021',50,14,700);
INSERT INTO venta VALUES (1028,'32128153-2','6183303-K','S003','B','09/06/2021',36,15,540);
INSERT INTO venta VALUES (1029,'25427572-7','46566450-9','S005','A','31/10/2020',49,12,588);
INSERT INTO venta VALUES (1030,'21627523-3','6183303-K','S002','B','01/10/2020',49,12,588);
INSERT INTO venta VALUES (1031,'28949956-3','8402711-1','S002','A','07/02/2021',17,15,255);
INSERT INTO venta VALUES (1032,'42395667-4','4810357-K','S002','B','01/01/2021',15,12,180);
INSERT INTO venta VALUES (1033,'41596727-6','20237862-5','S004','A','28/03/2020',33,12,396);
INSERT INTO venta VALUES (1034,'21781255-0','14519212-9','S002','B','09/12/2020',29,15,435);
INSERT INTO venta VALUES (1035,'418771-7','23819125-4','S002','B','20/12/2020',47,14,658);
INSERT INTO venta VALUES (1036,'32733249-K','14315947-7','S005','B','29/08/2020',22,14,308);
INSERT INTO venta VALUES (1037,'33918914-5','20237862-5','S001','A','24/06/2021',19,14,266);
INSERT INTO venta VALUES (1038,'48297406-6','20237862-5','S003','B','21/06/2021',27,14,378);
INSERT INTO venta VALUES (1039,'34857756-5','14519212-9','S001','B','14/10/2020',39,14,546);
INSERT INTO venta VALUES (1040,'45378322-7','14519212-9','S003','A','12/06/2021',49,14,686);
INSERT INTO venta VALUES (1041,'4970818-1','14519212-9','S005','A','21/06/2021',44,12,528);
INSERT INTO venta VALUES (1042,'50659799-4','20237862-5','S002','B','21/02/2020',33,12,396);
INSERT INTO venta VALUES (1043,'5887951-7','18567395-2','S001','B','17/09/2020',40,14,560);
INSERT INTO venta VALUES (1044,'46860748-4','46566450-9','S004','A','01/06/2021',16,12,192);
INSERT INTO venta VALUES (1045,'42362145-1','45421301-7','S001','B','02/06/2020',37,12,444);
INSERT INTO venta VALUES (1046,'11153637-6','24180587-5','S001','B','13/12/2021',50,13,650);
INSERT INTO venta VALUES (1047,'48136294-6','6183303-K','S004','A','01/08/2021',43,13,559);
INSERT INTO venta VALUES (1048,'35509892-3','14519212-9','S001','A','20/07/2021',14,14,196);
INSERT INTO venta VALUES (1049,'4188894-6','32531450-8','S005','B','01/12/2020',27,15,405);
INSERT INTO venta VALUES (1050,'669275-3','46566450-9','S003','B','03/02/2021',18,14,252);
INSERT INTO venta VALUES (1051,'7103400-3','46566450-9','S001','A','13/06/2021',43,13,559);
INSERT INTO venta VALUES (1052,'669939-1','29374931-0','S003','B','01/12/2020',11,15,165);
INSERT INTO venta VALUES (1053,'19746185-3','46566450-9','S001','A','07/12/2021',38,15,570);
INSERT INTO venta VALUES (1054,'44325621-0','23819125-4','S003','A','25/12/2020',24,13,312);
INSERT INTO venta VALUES (1055,'37529936-4','8402711-1','S002','B','21/11/2021',32,15,480);
INSERT INTO venta VALUES (1056,'21566296-9','23819125-4','S002','B','19/02/2021',38,13,494);
INSERT INTO venta VALUES (1057,'24757643-6','42396509-6','S005','B','28/01/2021',17,15,255);
INSERT INTO venta VALUES (1058,'2297775-K','18567395-2','S001','B','16/11/2021',17,12,204);
INSERT INTO venta VALUES (1059,'6812616-9','45421301-7','S004','A','06/02/2020',36,12,432);
INSERT INTO venta VALUES (1060,'40856745-9','45421301-7','S004','B','06/04/2021',17,12,204);
INSERT INTO venta VALUES (1061,'1661689-3','45421301-7','S004','B','11/12/2020',48,14,672);
INSERT INTO venta VALUES (1062,'37678949-7','29374931-0','S001','A','28/10/2021',46,13,598);
INSERT INTO venta VALUES (1063,'4656208-9','23819125-4','S002','B','17/01/2020',26,15,390);
INSERT INTO venta VALUES (1064,'34831845-4','18567395-2','S001','A','30/05/2020',12,13,156);
INSERT INTO venta VALUES (1065,'46492920-7','8402711-1','S004','B','07/05/2020',33,13,429);
INSERT INTO venta VALUES (1066,'16651969-1','18567395-2','S002','B','07/03/2020',14,15,210);
INSERT INTO venta VALUES (1067,'20977585-9','29374931-0','S003','B','02/11/2021',29,15,435);
INSERT INTO venta VALUES (1068,'2332054-1','45421301-7','S004','B','27/11/2021',39,14,546);
INSERT INTO venta VALUES (1069,'35546172-6','23819125-4','S005','A','08/10/2020',38,15,570);
INSERT INTO venta VALUES (1070,'41107182-0','42396509-6','S002','A','24/05/2021',24,15,360);
INSERT INTO venta VALUES (1071,'27507648-1','6183303-K','S002','A','02/02/2020',48,13,624);
INSERT INTO venta VALUES (1072,'4516193-5','18567395-2','S005','B','12/07/2021',41,13,533);
INSERT INTO venta VALUES (1073,'27950903-K','18567395-2','S005','B','23/06/2021',25,12,300);
INSERT INTO venta VALUES (1074,'43178240-5','6183303-K','S005','A','20/10/2020',18,12,216);
INSERT INTO venta VALUES (1075,'2728014-5','45421301-7','S002','A','08/12/2021',20,14,280);
INSERT INTO venta VALUES (1076,'41705665-3','32531450-8','S002','B','07/09/2021',36,13,468);
INSERT INTO venta VALUES (1077,'3420644-9','4810357-K','S003','A','26/08/2020',38,14,532);
INSERT INTO venta VALUES (1078,'30992154-2','42396509-6','S001','B','02/02/2021',50,13,650);
INSERT INTO venta VALUES (1079,'15864421-5','14315947-7','S001','A','07/12/2020',12,13,156);
INSERT INTO venta VALUES (1080,'29993802-6','14519212-9','S002','B','06/04/2021',14,13,182);
INSERT INTO venta VALUES (1081,'16550505-0','29374931-0','S002','A','23/09/2020',36,14,504);
INSERT INTO venta VALUES (1082,'38293936-0','29374931-0','S002','A','26/02/2021',15,14,210);
INSERT INTO venta VALUES (1083,'42457535-6','29374931-0','S004','A','08/02/2021',44,13,572);
INSERT INTO venta VALUES (1084,'29184591-6','23819125-4','S002','A','27/02/2021',44,15,660);
INSERT INTO venta VALUES (1085,'42111192-8','14315947-7','S001','B','27/02/2020',44,13,572);
INSERT INTO venta VALUES (1086,'15820219-0','29374931-0','S002','A','30/01/2020',33,12,396);
INSERT INTO venta VALUES (1087,'44378471-3','45421301-7','S004','A','02/04/2021',50,12,600);
INSERT INTO venta VALUES (1088,'22865149-4','42396509-6','S003','B','10/05/2021',30,14,420);
INSERT INTO venta VALUES (1089,'37616460-8','6183303-K','S005','B','03/07/2021',50,15,750);
INSERT INTO venta VALUES (1090,'3715376-1','14315947-7','S003','B','11/04/2021',31,13,403);
INSERT INTO venta VALUES (1091,'9286910-5','32531450-8','S001','A','05/10/2021',48,14,672);
INSERT INTO venta VALUES (1092,'21532944-5','14519212-9','S001','A','04/01/2020',26,14,364);
INSERT INTO venta VALUES (1093,'36312169-1','14315947-7','S002','B','02/04/2020',41,13,533);
INSERT INTO venta VALUES (1094,'25310777-4','24180587-5','S001','A','29/01/2021',20,15,300);
INSERT INTO venta VALUES (1095,'10214500-3','6183303-K','S003','B','06/08/2020',26,13,338);
INSERT INTO venta VALUES (1096,'38289913-K','14315947-7','S002','A','02/08/2020',10,15,150);
INSERT INTO venta VALUES (1097,'3812560-5','29374931-0','S005','A','24/08/2020',43,15,645);
INSERT INTO venta VALUES (1098,'26529570-3','29374931-0','S004','A','22/02/2020',33,15,495);
INSERT INTO venta VALUES (1099,'8369335-5','4810357-K','S005','B','29/07/2021',49,13,637);
INSERT INTO venta VALUES (1100,'16569116-4','42396509-6','S005','A','01/12/2020',31,15,465);
INSERT INTO venta VALUES (1101,'46708416-K','14519212-9','S005','A','12/10/2021',30,12,360);
INSERT INTO venta VALUES (1102,'23917602-K','18567395-2','S001','A','06/07/2021',16,12,192);
INSERT INTO venta VALUES (1103,'9329970-1','46566450-9','S002','A','14/02/2020',49,14,686);
INSERT INTO venta VALUES (1104,'48260943-0','8402711-1','S005','A','03/10/2020',33,14,462);
INSERT INTO venta VALUES (1105,'10104254-5','8402711-1','S002','B','28/02/2021',28,15,420);
INSERT INTO venta VALUES (1106,'35944113-4','14315947-7','S002','A','04/07/2021',20,12,240);
INSERT INTO venta VALUES (1107,'16222517-0','23819125-4','S002','A','07/09/2020',14,13,182);
INSERT INTO venta VALUES (1108,'2981658-1','42396509-6','S002','A','22/12/2021',24,15,360);
INSERT INTO venta VALUES (1109,'18167520-9','24180587-5','S004','A','30/03/2020',50,14,700);
INSERT INTO venta VALUES (1110,'38707804-5','4810357-K','S001','A','20/04/2021',23,12,276);
INSERT INTO venta VALUES (1111,'34939438-3','46566450-9','S002','A','06/01/2020',39,14,546);
INSERT INTO venta VALUES (1112,'32106584-8','47232966-9','S003','A','06/06/2020',42,14,588);
INSERT INTO venta VALUES (1113,'12887357-0','47232966-9','S005','A','20/09/2020',32,15,480);
INSERT INTO venta VALUES (1114,'6994103-6','23819125-4','S005','B','02/11/2020',19,13,247);
INSERT INTO venta VALUES (1115,'39536781-1','6183303-K','S003','A','08/02/2021',40,12,480);
INSERT INTO venta VALUES (1116,'5113512-1','46566450-9','S001','A','23/05/2020',48,12,576);
INSERT INTO venta VALUES (1117,'8982295-5','8402711-1','S001','B','01/10/2020',36,13,468);
INSERT INTO venta VALUES (1118,'22611724-5','47232966-9','S002','A','01/11/2021',24,13,312);
INSERT INTO venta VALUES (1119,'14509147-0','42396509-6','S001','B','28/10/2020',14,15,210);
INSERT INTO venta VALUES (1120,'21991424-5','23819125-4','S001','B','17/09/2021',31,12,372);
INSERT INTO venta VALUES (1121,'44979297-1','6183303-K','S002','B','12/11/2021',16,13,208);
INSERT INTO venta VALUES (1122,'1987858-9','20237862-5','S005','A','13/12/2021',31,15,465);
INSERT INTO venta VALUES (1123,'7931485-4','4810357-K','S004','B','10/04/2020',41,12,492);
INSERT INTO venta VALUES (1124,'44557542-9','23819125-4','S005','A','27/02/2021',41,13,533);
INSERT INTO venta VALUES (1125,'11229934-3','18567395-2','S005','A','07/06/2020',49,12,588);
INSERT INTO venta VALUES (1126,'45964817-8','14519212-9','S003','B','01/05/2021',38,13,494);
INSERT INTO venta VALUES (1127,'864486-1','46566450-9','S005','A','22/03/2020',17,13,221);
INSERT INTO venta VALUES (1128,'35655499-K','23819125-4','S003','A','19/08/2021',42,14,588);
INSERT INTO venta VALUES (1129,'176096-3','32531450-8','S001','B','16/09/2020',40,13,520);
INSERT INTO venta VALUES (1130,'1686995-3','6183303-K','S001','B','20/05/2020',31,15,465);
INSERT INTO venta VALUES (1131,'8629764-7','6183303-K','S001','A','18/05/2021',27,15,405);
INSERT INTO venta VALUES (1132,'9505134-0','29374931-0','S005','A','15/07/2021',43,12,516);
INSERT INTO venta VALUES (1133,'40165573-5','24180587-5','S004','A','24/04/2020',12,13,156);
INSERT INTO venta VALUES (1134,'30818668-7','32531450-8','S002','A','14/07/2021',33,14,462);
INSERT INTO venta VALUES (1135,'25519598-0','29374931-0','S003','A','08/07/2021',35,15,525);
INSERT INTO venta VALUES (1136,'2682429-K','20237862-5','S002','A','04/02/2020',40,15,600);
INSERT INTO venta VALUES (1137,'2732365-0','46566450-9','S004','A','17/09/2020',25,12,300);
INSERT INTO venta VALUES (1138,'256621-4','45421301-7','S003','B','14/10/2020',10,14,140);
INSERT INTO venta VALUES (1139,'13874392-6','32531450-8','S005','B','05/07/2021',12,12,144);
INSERT INTO venta VALUES (1140,'41681513-5','20237862-5','S005','B','01/12/2020',16,12,192);
INSERT INTO venta VALUES (1141,'36745644-2','20237862-5','S001','B','02/08/2021',23,15,345);
INSERT INTO venta VALUES (1142,'33657353-K','23819125-4','S001','A','17/11/2020',44,14,616);
INSERT INTO venta VALUES (1143,'245375-4','32531450-8','S004','A','11/07/2021',45,14,630);
INSERT INTO venta VALUES (1144,'41513400-2','18567395-2','S005','A','09/10/2021',21,15,315);
INSERT INTO venta VALUES (1145,'36513471-5','14315947-7','S005','A','23/07/2020',46,15,690);
INSERT INTO venta VALUES (1146,'10750875-9','14315947-7','S005','A','27/08/2021',41,12,492);
INSERT INTO venta VALUES (1147,'30415908-1','18567395-2','S001','A','04/01/2021',23,15,345);
INSERT INTO venta VALUES (1148,'3967311-8','29374931-0','S002','B','05/11/2021',25,15,375);
INSERT INTO venta VALUES (1149,'43412697-5','29374931-0','S003','A','05/05/2021',12,13,156);
INSERT INTO venta VALUES (1150,'16275940-K','8402711-1','S002','A','22/04/2021',47,15,705);
INSERT INTO venta VALUES (1151,'2482145-5','45421301-7','S002','A','22/04/2020',30,14,420);
INSERT INTO venta VALUES (1152,'26320512-K','42396509-6','S004','B','27/12/2020',44,13,572);
INSERT INTO venta VALUES (1153,'42404945-K','45421301-7','S001','A','22/06/2020',36,14,504);
INSERT INTO venta VALUES (1154,'7577732-9','14315947-7','S002','B','31/07/2021',45,15,675);
INSERT INTO venta VALUES (1155,'4444931-5','20237862-5','S005','B','26/07/2021',19,12,228);
INSERT INTO venta VALUES (1156,'2421854-6','24180587-5','S002','B','22/08/2021',49,14,686);
INSERT INTO venta VALUES (1157,'3777939-3','23819125-4','S004','B','17/07/2020',22,13,286);
INSERT INTO venta VALUES (1158,'45545183-3','14315947-7','S001','B','02/10/2020',27,13,351);
INSERT INTO venta VALUES (1159,'27212594-5','46566450-9','S005','B','10/06/2021',10,14,140);
INSERT INTO venta VALUES (1160,'40902685-0','18567395-2','S004','A','20/12/2020',26,15,390);
INSERT INTO venta VALUES (1161,'49939348-2','46566450-9','S001','A','23/02/2021',14,12,168);
INSERT INTO venta VALUES (1162,'21839348-9','42396509-6','S003','B','30/09/2020',17,13,221);
INSERT INTO venta VALUES (1163,'4378419-6','42396509-6','S003','A','12/02/2020',43,14,602);
INSERT INTO venta VALUES (1164,'48138947-K','47232966-9','S002','A','19/04/2021',16,13,208);
INSERT INTO venta VALUES (1165,'10649132-1','23819125-4','S005','B','16/07/2020',39,14,546);
INSERT INTO venta VALUES (1166,'43913837-8','24180587-5','S002','A','12/12/2021',10,13,130);
INSERT INTO venta VALUES (1167,'3549109-0','42396509-6','S004','B','31/05/2020',29,12,348);
INSERT INTO venta VALUES (1168,'6160902-4','45421301-7','S003','B','14/04/2021',49,12,588);
INSERT INTO venta VALUES (1169,'45835937-7','23819125-4','S003','A','05/06/2020',16,12,192);
INSERT INTO venta VALUES (1170,'29293421-1','47232966-9','S001','B','13/07/2021',19,15,285);
INSERT INTO venta VALUES (1171,'24379280-0','47232966-9','S004','A','05/10/2020',44,12,528);
INSERT INTO venta VALUES (1172,'7702244-9','24180587-5','S002','B','25/08/2020',24,15,360);
INSERT INTO venta VALUES (1173,'25882590-K','23819125-4','S005','A','14/01/2020',41,13,533);
INSERT INTO venta VALUES (1174,'27956426-K','14519212-9','S001','A','30/01/2020',18,15,270);
INSERT INTO venta VALUES (1175,'13210287-2','46566450-9','S001','A','29/12/2021',26,12,312);
INSERT INTO venta VALUES (1176,'33517217-5','8402711-1','S004','A','18/02/2021',39,15,585);
INSERT INTO venta VALUES (1177,'40459148-7','18567395-2','S005','A','03/02/2020',42,15,630);
INSERT INTO venta VALUES (1178,'1196676-4','20237862-5','S001','A','13/08/2020',13,14,182);
INSERT INTO venta VALUES (1179,'9573685-8','24180587-5','S003','A','30/09/2021',14,13,182);
INSERT INTO venta VALUES (1180,'24537304-K','47232966-9','S005','A','29/08/2020',23,14,322);
INSERT INTO venta VALUES (1181,'32320468-3','18567395-2','S004','B','08/11/2020',17,12,204);
INSERT INTO venta VALUES (1182,'41674397-5','14519212-9','S002','A','28/11/2021',20,14,280);
INSERT INTO venta VALUES (1183,'14674421-4','20237862-5','S002','B','18/03/2020',44,12,528);
INSERT INTO venta VALUES (1184,'40351220-6','4810357-K','S001','A','12/01/2020',42,13,546);
INSERT INTO venta VALUES (1185,'34970231-2','8402711-1','S004','A','16/12/2021',14,14,196);
INSERT INTO venta VALUES (1186,'39278148-K','46566450-9','S005','A','07/07/2020',19,12,228);
INSERT INTO venta VALUES (1187,'49823112-8','24180587-5','S003','B','02/01/2020',16,15,240);
INSERT INTO venta VALUES (1188,'27343927-7','32531450-8','S004','A','24/04/2021',32,12,384);
INSERT INTO venta VALUES (1189,'14149168-7','8402711-1','S002','A','27/12/2021',24,14,336);
INSERT INTO venta VALUES (1190,'19117724-K','29374931-0','S001','A','07/01/2021',45,15,675);
INSERT INTO venta VALUES (1191,'10709505-5','29374931-0','S005','B','12/12/2021',39,15,585);
INSERT INTO venta VALUES (1192,'15691151-8','14519212-9','S002','A','31/08/2020',32,14,448);
INSERT INTO venta VALUES (1193,'38877215-8','18567395-2','S002','A','01/05/2020',45,15,675);
INSERT INTO venta VALUES (1194,'49134102-5','14315947-7','S001','B','16/11/2020',41,12,492);
INSERT INTO venta VALUES (1195,'30430573-8','24180587-5','S004','A','23/03/2021',49,12,588);
INSERT INTO venta VALUES (1196,'19893406-2','24180587-5','S005','A','05/01/2020',19,13,247);
INSERT INTO venta VALUES (1197,'724989-6','14315947-7','S003','B','24/09/2021',11,13,143);
INSERT INTO venta VALUES (1198,'790614-5','23819125-4','S002','B','02/06/2020',24,12,288);
INSERT INTO venta VALUES (1199,'42369767-9','8402711-1','S002','A','03/04/2020',40,13,520);
INSERT INTO venta VALUES (1200,'26379741-8','14315947-7','S005','A','17/07/2020',46,15,690);
INSERT INTO venta VALUES (1201,'19520297-4','20237862-5','S005','B','19/02/2021',12,12,144);
INSERT INTO venta VALUES (1202,'20998996-4','6183303-K','S005','B','26/12/2020',26,13,338);
INSERT INTO venta VALUES (1203,'10121991-7','42396509-6','S004','A','17/07/2021',12,13,156);
INSERT INTO venta VALUES (1204,'24895662-3','23819125-4','S003','A','30/08/2020',24,13,312);
INSERT INTO venta VALUES (1205,'10765522-0','14315947-7','S005','B','01/09/2020',35,13,455);
INSERT INTO venta VALUES (1206,'28103249-6','24180587-5','S005','A','01/01/2021',25,12,300);
INSERT INTO venta VALUES (1207,'24175660-2','4810357-K','S004','A','24/03/2021',35,15,525);
INSERT INTO venta VALUES (1208,'20576710-K','18567395-2','S002','A','26/12/2021',43,15,645);
INSERT INTO venta VALUES (1209,'24468150-6','18567395-2','S003','B','20/10/2021',35,12,420);
INSERT INTO venta VALUES (1210,'41833703-6','42396509-6','S005','B','27/01/2020',19,12,228);
INSERT INTO venta VALUES (1211,'205647-K','14519212-9','S005','B','29/11/2021',16,12,192);
INSERT INTO venta VALUES (1212,'50965225-2','29374931-0','S002','A','02/04/2021',16,15,240);
INSERT INTO venta VALUES (1213,'2527416-4','32531450-8','S004','B','11/09/2021',49,13,637);
INSERT INTO venta VALUES (1214,'29500462-2','47232966-9','S001','B','29/01/2021',14,14,196);
INSERT INTO venta VALUES (1215,'46825615-0','47232966-9','S003','A','01/05/2021',40,12,480);
INSERT INTO venta VALUES (1216,'1838211-3','29374931-0','S003','A','26/01/2021',33,12,396);
INSERT INTO venta VALUES (1217,'35515377-0','14315947-7','S001','A','27/07/2021',26,13,338);
INSERT INTO venta VALUES (1218,'18913941-1','29374931-0','S003','A','12/08/2020',27,13,351);
INSERT INTO venta VALUES (1219,'1095696-K','6183303-K','S003','A','10/03/2021',23,15,345);
INSERT INTO venta VALUES (1220,'10419998-4','6183303-K','S003','B','29/12/2020',13,14,182);
INSERT INTO venta VALUES (1221,'50835664-1','20237862-5','S001','A','02/03/2020',40,15,600);
INSERT INTO venta VALUES (1222,'44655877-3','29374931-0','S002','B','04/11/2021',37,12,444);
INSERT INTO venta VALUES (1223,'49922954-2','47232966-9','S001','A','19/01/2021',49,15,735);
INSERT INTO venta VALUES (1224,'4527408-K','14519212-9','S005','A','14/10/2020',11,15,165);
INSERT INTO venta VALUES (1225,'37587173-4','24180587-5','S001','A','29/09/2021',28,13,364);
INSERT INTO venta VALUES (1226,'4589677-3','42396509-6','S003','B','08/03/2021',43,13,559);
INSERT INTO venta VALUES (1227,'611135-1','4810357-K','S001','B','16/06/2020',13,13,169);
INSERT INTO venta VALUES (1228,'48755443-K','29374931-0','S003','B','21/10/2021',24,15,360);
INSERT INTO venta VALUES (1229,'6878784-K','18567395-2','S003','A','24/06/2020',44,15,660);
INSERT INTO venta VALUES (1230,'20907959-3','46566450-9','S001','A','09/06/2020',19,13,247);
INSERT INTO venta VALUES (1231,'6998668-4','14519212-9','S002','A','20/03/2021',19,13,247);
INSERT INTO venta VALUES (1232,'20555137-9','29374931-0','S004','B','01/08/2021',37,13,481);
INSERT INTO venta VALUES (1233,'43204253-7','46566450-9','S005','B','26/05/2021',45,12,540);
INSERT INTO venta VALUES (1234,'1512309-5','14315947-7','S001','A','08/07/2021',27,12,324);
INSERT INTO venta VALUES (1235,'32578191-2','24180587-5','S002','B','07/12/2020',22,14,308);
INSERT INTO venta VALUES (1236,'28733425-7','14315947-7','S002','A','09/06/2021',15,12,180);
INSERT INTO venta VALUES (1237,'4745875-7','8402711-1','S002','B','28/10/2020',38,15,570);
INSERT INTO venta VALUES (1238,'47172761-K','4810357-K','S001','A','16/11/2021',24,15,360);
INSERT INTO venta VALUES (1239,'11192584-4','14519212-9','S005','B','23/10/2020',14,15,210);
INSERT INTO venta VALUES (1240,'1922374-4','4810357-K','S004','A','09/04/2020',13,15,195);
INSERT INTO venta VALUES (1241,'39789419-3','46566450-9','S001','A','06/06/2021',13,15,195);
INSERT INTO venta VALUES (1242,'22707262-8','32531450-8','S005','A','09/11/2020',42,15,630);
INSERT INTO venta VALUES (1243,'7748411-6','14519212-9','S004','A','23/02/2020',50,14,700);
INSERT INTO venta VALUES (1244,'23967909-9','42396509-6','S002','A','01/01/2021',18,15,270);
INSERT INTO venta VALUES (1245,'39207112-1','29374931-0','S002','A','30/07/2021',35,13,455);
INSERT INTO venta VALUES (1246,'32714245-3','14519212-9','S003','B','10/03/2021',31,14,434);
INSERT INTO venta VALUES (1247,'8642552-1','20237862-5','S004','A','07/03/2020',35,15,525);
INSERT INTO venta VALUES (1248,'847138-K','24180587-5','S005','A','01/05/2020',14,15,210);
INSERT INTO venta VALUES (1249,'29108509-1','18567395-2','S001','B','18/11/2020',45,15,675);
INSERT INTO venta VALUES (1250,'45577353-9','4810357-K','S004','B','04/04/2020',45,15,675);
INSERT INTO venta VALUES (1251,'23842338-4','24180587-5','S005','B','22/03/2020',30,14,420);
INSERT INTO venta VALUES (1252,'40754325-4','42396509-6','S001','A','05/11/2021',31,12,372);
INSERT INTO venta VALUES (1253,'33302996-0','6183303-K','S003','B','14/12/2021',49,14,686);
INSERT INTO venta VALUES (1254,'12196402-3','24180587-5','S004','A','02/07/2021',26,14,364);
INSERT INTO venta VALUES (1255,'49612724-2','20237862-5','S001','B','08/12/2021',31,12,372);
INSERT INTO venta VALUES (1256,'28794269-9','6183303-K','S003','A','01/07/2020',31,12,372);
INSERT INTO venta VALUES (1257,'34739197-2','45421301-7','S005','A','23/04/2021',27,12,324);
INSERT INTO venta VALUES (1258,'15982981-2','8402711-1','S003','A','22/01/2021',50,14,700);
INSERT INTO venta VALUES (1259,'30980326-4','18567395-2','S001','B','21/03/2021',11,15,165);
INSERT INTO venta VALUES (1260,'46386662-7','18567395-2','S003','A','21/06/2020',43,12,516);
INSERT INTO venta VALUES (1261,'4037232-6','47232966-9','S004','A','01/11/2021',17,14,238);
INSERT INTO venta VALUES (1262,'2462890-6','24180587-5','S005','B','03/08/2021',28,15,420);
INSERT INTO venta VALUES (1263,'8163642-7','42396509-6','S001','B','14/04/2021',30,12,360);
INSERT INTO venta VALUES (1264,'26200138-5','42396509-6','S005','B','29/09/2020',19,14,266);
INSERT INTO venta VALUES (1265,'28782909-4','6183303-K','S001','A','10/03/2020',27,13,351);
INSERT INTO venta VALUES (1266,'12276939-9','32531450-8','S005','B','15/10/2020',34,14,476);
INSERT INTO venta VALUES (1267,'47909126-9','42396509-6','S004','A','15/08/2020',26,12,312);
INSERT INTO venta VALUES (1268,'44654639-2','45421301-7','S002','A','21/04/2020',47,12,564);
INSERT INTO venta VALUES (1269,'1612370-6','24180587-5','S001','B','09/02/2021',15,13,195);
INSERT INTO venta VALUES (1270,'8105945-4','32531450-8','S003','A','02/02/2020',16,13,208);
INSERT INTO venta VALUES (1271,'45525237-7','47232966-9','S005','B','18/07/2021',48,13,624);
INSERT INTO venta VALUES (1272,'41135440-7','46566450-9','S003','A','26/08/2020',29,12,348);
INSERT INTO venta VALUES (1273,'11166180-4','20237862-5','S001','A','22/11/2020',49,15,735);
INSERT INTO venta VALUES (1274,'31461243-4','24180587-5','S005','B','15/12/2021',12,12,144);
INSERT INTO venta VALUES (1275,'9870337-3','32531450-8','S003','A','19/02/2021',42,13,546);
INSERT INTO venta VALUES (1276,'10705178-3','14519212-9','S002','A','17/12/2020',13,13,169);
INSERT INTO venta VALUES (1277,'16840781-5','18567395-2','S001','B','12/03/2021',33,14,462);
INSERT INTO venta VALUES (1278,'46552725-0','42396509-6','S002','B','28/05/2020',17,14,238);
INSERT INTO venta VALUES (1279,'33545941-5','42396509-6','S005','A','26/12/2020',15,12,180);
INSERT INTO venta VALUES (1280,'35352332-5','14315947-7','S005','A','27/05/2020',20,14,280);
INSERT INTO venta VALUES (1281,'4930499-4','8402711-1','S002','A','28/10/2020',50,15,750);
INSERT INTO venta VALUES (1282,'3697461-3','46566450-9','S001','B','09/05/2021',49,15,735);
INSERT INTO venta VALUES (1283,'43815173-7','42396509-6','S003','A','29/12/2021',32,13,416);
INSERT INTO venta VALUES (1284,'1689974-7','4810357-K','S004','A','16/11/2021',31,12,372);
INSERT INTO venta VALUES (1285,'29948396-7','4810357-K','S003','A','02/05/2021',46,13,598);
INSERT INTO venta VALUES (1286,'23351141-2','6183303-K','S003','A','29/09/2021',31,14,434);
INSERT INTO venta VALUES (1287,'36797208-4','6183303-K','S002','A','06/05/2020',45,14,630);
INSERT INTO venta VALUES (1288,'2293780-4','47232966-9','S001','B','06/01/2021',43,14,602);
INSERT INTO venta VALUES (1289,'38623758-1','18567395-2','S004','B','15/06/2021',41,14,574);
INSERT INTO venta VALUES (1290,'16179698-0','14519212-9','S005','B','24/10/2021',42,13,546);
INSERT INTO venta VALUES (1291,'25172614-0','46566450-9','S003','A','18/03/2020',31,15,465);
INSERT INTO venta VALUES (1292,'426881-4','14519212-9','S004','B','21/02/2020',39,14,546);
INSERT INTO venta VALUES (1293,'45192223-8','4810357-K','S005','A','24/12/2020',27,13,351);
INSERT INTO venta VALUES (1294,'14163133-0','20237862-5','S002','A','12/09/2021',44,12,528);
INSERT INTO venta VALUES (1295,'28420167-1','42396509-6','S004','B','21/07/2021',20,13,260);
INSERT INTO venta VALUES (1296,'720495-7','14519212-9','S001','A','12/06/2020',27,12,324);
INSERT INTO venta VALUES (1297,'364159-7','46566450-9','S002','A','07/02/2020',14,14,196);
INSERT INTO venta VALUES (1298,'3241083-9','45421301-7','S001','B','24/01/2021',32,15,480);
INSERT INTO venta VALUES (1299,'14162886-0','14519212-9','S001','B','12/11/2020',11,14,154);
INSERT INTO venta VALUES (1300,'33328328-K','47232966-9','S004','B','14/09/2021',33,13,429);
INSERT INTO venta VALUES (1301,'43209574-6','14315947-7','S005','B','17/11/2020',42,12,504);
INSERT INTO venta VALUES (1302,'246815-8','18567395-2','S002','A','10/12/2021',34,15,510);
INSERT INTO venta VALUES (1303,'27941194-3','14315947-7','S005','A','05/08/2020',10,14,140);
INSERT INTO venta VALUES (1304,'6665225-4','20237862-5','S004','A','23/02/2021',35,12,420);
INSERT INTO venta VALUES (1305,'33841927-9','45421301-7','S003','B','06/07/2020',29,12,348);
INSERT INTO venta VALUES (1306,'6401770-5','42396509-6','S001','B','19/11/2020',23,15,345);
INSERT INTO venta VALUES (1307,'14497734-3','45421301-7','S002','B','24/12/2021',41,15,615);
INSERT INTO venta VALUES (1308,'35155993-4','42396509-6','S003','A','25/11/2021',12,15,180);
INSERT INTO venta VALUES (1309,'16965943-5','32531450-8','S003','A','30/08/2020',34,13,442);
INSERT INTO venta VALUES (1310,'2120746-2','45421301-7','S002','B','13/08/2021',41,12,492);
INSERT INTO venta VALUES (1311,'34366568-7','14315947-7','S002','A','23/03/2021',49,13,637);
INSERT INTO venta VALUES (1312,'1933962-9','42396509-6','S001','B','08/06/2021',15,12,180);
INSERT INTO venta VALUES (1313,'39511720-3','32531450-8','S003','B','16/04/2020',46,14,644);
INSERT INTO venta VALUES (1314,'24316748-5','14315947-7','S003','A','09/04/2021',20,14,280);
INSERT INTO venta VALUES (1315,'38440632-7','8402711-1','S001','A','30/06/2020',48,13,624);
INSERT INTO venta VALUES (1316,'44982560-8','6183303-K','S001','B','11/04/2020',44,14,616);
INSERT INTO venta VALUES (1317,'49795706-0','47232966-9','S005','B','03/10/2020',17,15,255);
INSERT INTO venta VALUES (1318,'33463151-6','14315947-7','S001','B','22/06/2021',22,12,264);
INSERT INTO venta VALUES (1319,'33128333-9','46566450-9','S001','A','04/10/2020',17,15,255);
INSERT INTO venta VALUES (1320,'23816992-5','14519212-9','S001','B','01/01/2020',49,14,686);
INSERT INTO venta VALUES (1321,'45142372-K','18567395-2','S002','B','24/07/2021',27,14,378);
INSERT INTO venta VALUES (1322,'369736-3','32531450-8','S004','A','29/05/2020',22,12,264);
INSERT INTO venta VALUES (1323,'1268299-9','24180587-5','S002','A','04/08/2021',15,12,180);
INSERT INTO venta VALUES (1324,'9945408-3','42396509-6','S003','B','05/09/2021',15,14,210);
INSERT INTO venta VALUES (1325,'386825-7','18567395-2','S004','A','11/09/2020',21,15,315);
INSERT INTO venta VALUES (1326,'24220548-0','46566450-9','S001','A','03/02/2020',44,12,528);
INSERT INTO venta VALUES (1327,'4036038-7','24180587-5','S002','A','24/02/2020',12,12,144);
INSERT INTO venta VALUES (1328,'37704108-9','18567395-2','S002','B','13/01/2020',45,14,630);
INSERT INTO venta VALUES (1329,'5654281-7','14315947-7','S001','B','05/09/2021',47,13,611);
INSERT INTO venta VALUES (1330,'15710335-0','46566450-9','S003','B','13/04/2020',50,13,650);
INSERT INTO venta VALUES (1331,'43110454-7','42396509-6','S002','A','16/02/2021',36,15,540);
INSERT INTO venta VALUES (1332,'13339546-6','20237862-5','S005','B','14/10/2020',28,14,392);
INSERT INTO venta VALUES (1333,'6147613-K','4810357-K','S004','A','22/12/2020',32,12,384);
INSERT INTO venta VALUES (1334,'3833312-7','6183303-K','S005','A','08/05/2020',42,14,588);
INSERT INTO venta VALUES (1335,'25179379-4','45421301-7','S004','B','15/01/2020',11,12,132);
INSERT INTO venta VALUES (1336,'4492377-7','32531450-8','S003','B','28/01/2021',10,14,140);
INSERT INTO venta VALUES (1337,'20551757-K','23819125-4','S004','A','23/10/2020',33,14,462);
INSERT INTO venta VALUES (1338,'34526835-9','45421301-7','S001','B','25/08/2020',40,15,600);
INSERT INTO venta VALUES (1339,'25448994-8','14519212-9','S005','A','03/11/2021',34,14,476);
INSERT INTO venta VALUES (1340,'10424274-K','42396509-6','S002','A','12/05/2021',41,12,492);
INSERT INTO venta VALUES (1341,'43736897-K','14315947-7','S002','A','31/12/2021',11,12,132);
INSERT INTO venta VALUES (1342,'34361740-2','46566450-9','S002','A','12/10/2020',35,12,420);
INSERT INTO venta VALUES (1343,'46546512-3','24180587-5','S002','A','22/09/2021',45,15,675);
INSERT INTO venta VALUES (1344,'22722668-4','29374931-0','S005','A','12/05/2020',23,14,322);
INSERT INTO venta VALUES (1345,'48615642-2','32531450-8','S001','B','07/09/2020',16,14,224);
INSERT INTO venta VALUES (1346,'36132951-1','6183303-K','S005','B','06/10/2021',13,15,195);
INSERT INTO venta VALUES (1347,'39145164-8','29374931-0','S004','B','18/07/2020',43,13,559);
INSERT INTO venta VALUES (1348,'305766-6','23819125-4','S004','B','26/05/2021',43,13,559);
INSERT INTO venta VALUES (1349,'43893820-6','47232966-9','S002','A','23/02/2020',27,12,324);
INSERT INTO venta VALUES (1350,'34152442-3','42396509-6','S005','A','06/12/2021',18,15,270);
INSERT INTO venta VALUES (1351,'48341370-K','8402711-1','S001','A','27/03/2020',10,14,140);
INSERT INTO venta VALUES (1352,'26317503-4','8402711-1','S004','B','20/04/2020',46,12,552);
INSERT INTO venta VALUES (1353,'25597469-6','46566450-9','S002','A','02/12/2020',49,13,637);
INSERT INTO venta VALUES (1354,'46976530-K','24180587-5','S005','A','25/07/2021',24,12,288);
INSERT INTO venta VALUES (1355,'31808477-7','29374931-0','S001','A','12/12/2020',34,12,408);
INSERT INTO venta VALUES (1356,'28242182-8','18567395-2','S003','A','12/10/2020',46,14,644);
INSERT INTO venta VALUES (1357,'342047-7','4810357-K','S005','A','05/01/2020',48,15,720);
INSERT INTO venta VALUES (1358,'14150943-8','14315947-7','S005','B','03/06/2021',28,14,392);
INSERT INTO venta VALUES (1359,'45323436-3','29374931-0','S003','A','17/06/2021',46,12,552);
INSERT INTO venta VALUES (1360,'46553638-1','29374931-0','S004','A','07/07/2021',45,13,585);
INSERT INTO venta VALUES (1361,'19378275-2','47232966-9','S003','B','11/10/2020',42,13,546);
INSERT INTO venta VALUES (1362,'35533549-6','46566450-9','S002','B','25/03/2021',46,12,552);
INSERT INTO venta VALUES (1363,'28250909-1','45421301-7','S003','A','04/04/2020',27,12,324);
INSERT INTO venta VALUES (1364,'42744116-4','4810357-K','S003','B','25/05/2021',39,14,546);
INSERT INTO venta VALUES (1365,'21557436-9','18567395-2','S005','A','12/04/2020',30,15,450);
INSERT INTO venta VALUES (1366,'50978449-3','47232966-9','S001','B','22/12/2021',40,14,560);
INSERT INTO venta VALUES (1367,'15640826-3','32531450-8','S001','B','03/09/2020',37,13,481);
INSERT INTO venta VALUES (1368,'35436183-3','42396509-6','S003','B','14/09/2020',39,15,585);
INSERT INTO venta VALUES (1369,'2633712-7','24180587-5','S003','A','11/07/2020',25,14,350);
INSERT INTO venta VALUES (1370,'13474161-9','14315947-7','S002','B','16/12/2021',29,14,406);
INSERT INTO venta VALUES (1371,'43729137-3','23819125-4','S004','B','08/11/2021',31,13,403);
INSERT INTO venta VALUES (1372,'42548544-K','20237862-5','S001','A','28/08/2020',33,12,396);
INSERT INTO venta VALUES (1373,'18864846-0','18567395-2','S003','B','12/11/2020',42,12,504);
INSERT INTO venta VALUES (1374,'11620250-6','45421301-7','S003','B','24/07/2020',22,13,286);
INSERT INTO venta VALUES (1375,'6250910-4','46566450-9','S003','B','11/05/2021',25,12,300);
INSERT INTO venta VALUES (1376,'19356403-8','29374931-0','S004','B','23/04/2020',17,12,204);
INSERT INTO venta VALUES (1377,'21311175-2','6183303-K','S003','B','01/07/2020',44,12,528);
INSERT INTO venta VALUES (1378,'40843415-7','45421301-7','S004','B','02/06/2021',13,15,195);
INSERT INTO venta VALUES (1379,'3825995-4','47232966-9','S003','A','21/08/2021',46,12,552);
INSERT INTO venta VALUES (1380,'22980867-2','24180587-5','S005','A','19/09/2020',24,13,312);
INSERT INTO venta VALUES (1381,'33366831-9','14315947-7','S003','A','18/11/2020',49,13,637);
INSERT INTO venta VALUES (1382,'16470769-5','32531450-8','S003','A','28/04/2021',30,12,360);
INSERT INTO venta VALUES (1383,'86158-8','4810357-K','S005','A','17/05/2020',22,12,264);
INSERT INTO venta VALUES (1384,'19639414-1','45421301-7','S002','A','20/05/2020',36,12,432);
INSERT INTO venta VALUES (1385,'2796251-3','4810357-K','S002','B','08/10/2021',34,12,408);
INSERT INTO venta VALUES (1386,'36211261-3','46566450-9','S001','B','04/12/2020',46,14,644);
INSERT INTO venta VALUES (1387,'35311901-K','24180587-5','S002','B','01/05/2020',26,14,364);
INSERT INTO venta VALUES (1388,'26120343-K','46566450-9','S001','A','11/05/2021',33,14,462);
INSERT INTO venta VALUES (1389,'19191338-8','6183303-K','S002','B','25/07/2021',11,14,154);
INSERT INTO venta VALUES (1390,'1768237-7','20237862-5','S001','A','25/01/2020',49,14,686);
INSERT INTO venta VALUES (1391,'11980759-K','14519212-9','S004','A','15/09/2020',10,15,150);
INSERT INTO venta VALUES (1392,'40624333-8','23819125-4','S002','A','30/12/2020',33,15,495);
INSERT INTO venta VALUES (1393,'36102291-2','29374931-0','S001','A','28/10/2020',48,12,576);
INSERT INTO venta VALUES (1394,'45960155-4','29374931-0','S003','B','06/10/2021',44,14,616);
INSERT INTO venta VALUES (1395,'23596840-1','6183303-K','S002','A','27/06/2020',25,12,300);
INSERT INTO venta VALUES (1396,'23819924-7','4810357-K','S004','B','04/04/2020',27,15,405);
INSERT INTO venta VALUES (1397,'47697102-0','4810357-K','S004','A','10/03/2021',35,12,420);
INSERT INTO venta VALUES (1398,'48975492-4','32531450-8','S001','B','01/05/2020',34,13,442);
INSERT INTO venta VALUES (1399,'37888323-7','18567395-2','S003','B','12/05/2021',18,14,252);
INSERT INTO venta VALUES (1400,'31503767-0','8402711-1','S005','A','16/11/2020',29,12,348);
INSERT INTO venta VALUES (1401,'41605481-9','46566450-9','S002','A','26/01/2021',39,12,468);
INSERT INTO venta VALUES (1402,'35228448-3','6183303-K','S001','B','09/02/2021',36,12,432);
INSERT INTO venta VALUES (1403,'20805704-9','46566450-9','S003','B','22/05/2021',10,15,150);
INSERT INTO venta VALUES (1404,'49121246-2','47232966-9','S005','B','05/12/2020',26,15,390);
INSERT INTO venta VALUES (1405,'39673512-1','14519212-9','S005','B','08/05/2020',26,12,312);
INSERT INTO venta VALUES (1406,'1015653-K','14519212-9','S001','A','05/05/2020',38,12,456);
INSERT INTO venta VALUES (1407,'34465278-3','20237862-5','S005','A','24/04/2020',41,14,574);
INSERT INTO venta VALUES (1408,'38237114-3','4810357-K','S002','B','22/11/2020',45,14,630);
INSERT INTO venta VALUES (1409,'10651656-1','45421301-7','S001','A','08/07/2021',44,12,528);
INSERT INTO venta VALUES (1410,'26706928-K','4810357-K','S001','A','11/07/2021',47,13,611);
INSERT INTO venta VALUES (1411,'46993880-8','6183303-K','S003','A','09/12/2020',36,14,504);
INSERT INTO venta VALUES (1412,'49783544-5','14519212-9','S004','A','07/11/2021',20,13,260);
INSERT INTO venta VALUES (1413,'2066833-4','32531450-8','S004','A','16/06/2020',33,14,462);
INSERT INTO venta VALUES (1414,'47171902-1','18567395-2','S005','A','15/07/2020',30,12,360);
INSERT INTO venta VALUES (1415,'18134333-8','29374931-0','S003','A','12/10/2020',48,12,576);
INSERT INTO venta VALUES (1416,'3222879-8','46566450-9','S001','A','15/09/2020',48,12,576);
INSERT INTO venta VALUES (1417,'1855259-0','6183303-K','S004','B','26/09/2021',25,12,300);
INSERT INTO venta VALUES (1418,'46775870-5','8402711-1','S004','A','18/10/2020',23,12,276);
INSERT INTO venta VALUES (1419,'35463207-1','46566450-9','S003','B','18/12/2021',39,13,507);
INSERT INTO venta VALUES (1420,'970371-3','24180587-5','S003','A','24/05/2021',25,14,350);
INSERT INTO venta VALUES (1421,'691195-1','14315947-7','S003','B','01/12/2020',27,12,324);
INSERT INTO venta VALUES (1422,'26887293-0','8402711-1','S004','A','18/12/2021',47,13,611);
INSERT INTO venta VALUES (1423,'17118761-3','42396509-6','S003','A','16/09/2020',28,13,364);
INSERT INTO venta VALUES (1424,'45770281-7','6183303-K','S005','B','24/01/2020',32,13,416);
INSERT INTO venta VALUES (1425,'14755482-6','42396509-6','S001','B','28/07/2021',35,12,420);
INSERT INTO venta VALUES (1426,'41267841-9','14519212-9','S003','B','22/02/2021',49,14,686);
INSERT INTO venta VALUES (1427,'18185886-9','6183303-K','S004','B','20/04/2020',38,14,532);
INSERT INTO venta VALUES (1428,'9992935-9','18567395-2','S002','B','04/01/2020',35,13,455);
INSERT INTO venta VALUES (1429,'5251167-4','46566450-9','S002','A','09/10/2020',25,13,325);
INSERT INTO venta VALUES (1430,'17477296-7','32531450-8','S002','B','15/12/2020',48,13,624);
INSERT INTO venta VALUES (1431,'7502546-7','14519212-9','S002','B','04/12/2020',21,13,273);
INSERT INTO venta VALUES (1432,'31155273-2','8402711-1','S005','A','12/04/2021',17,13,221);
INSERT INTO venta VALUES (1433,'28348198-0','4810357-K','S001','A','17/04/2020',20,13,260);
INSERT INTO venta VALUES (1434,'41758307-6','6183303-K','S001','A','07/07/2020',32,13,416);
INSERT INTO venta VALUES (1435,'12239734-3','45421301-7','S001','A','31/08/2021',21,15,315);
INSERT INTO venta VALUES (1436,'41193247-8','42396509-6','S002','B','21/05/2020',44,14,616);
INSERT INTO venta VALUES (1437,'1510379-5','6183303-K','S005','A','23/05/2021',33,13,429);
INSERT INTO venta VALUES (1438,'13571851-3','14315947-7','S003','B','26/09/2020',45,14,630);
INSERT INTO venta VALUES (1439,'30742999-3','32531450-8','S004','B','22/11/2020',29,12,348);
INSERT INTO venta VALUES (1440,'46135570-6','42396509-6','S002','B','01/04/2020',13,15,195);
INSERT INTO venta VALUES (1441,'23559841-8','24180587-5','S005','A','23/05/2021',13,12,156);
INSERT INTO venta VALUES (1442,'15218526-K','24180587-5','S004','A','04/03/2020',17,15,255);
INSERT INTO venta VALUES (1443,'25986530-1','42396509-6','S005','A','16/04/2021',31,15,465);
INSERT INTO venta VALUES (1444,'3890733-6','8402711-1','S002','A','25/12/2020',32,12,384);
INSERT INTO venta VALUES (1445,'28865301-1','46566450-9','S004','B','31/01/2020',43,13,559);
INSERT INTO venta VALUES (1446,'36541675-3','29374931-0','S005','B','14/02/2020',33,12,396);
INSERT INTO venta VALUES (1447,'7354658-3','20237862-5','S002','A','22/08/2021',16,15,240);
INSERT INTO venta VALUES (1448,'27591445-2','42396509-6','S002','A','21/09/2020',16,13,208);
INSERT INTO venta VALUES (1449,'23194182-7','46566450-9','S004','B','07/11/2021',17,14,238);
INSERT INTO venta VALUES (1450,'48356856-8','45421301-7','S002','B','22/09/2020',14,13,182);
INSERT INTO venta VALUES (1451,'2757277-4','42396509-6','S003','A','07/03/2021',17,15,255);
INSERT INTO venta VALUES (1452,'18448185-5','6183303-K','S003','B','03/08/2020',15,14,210);
INSERT INTO venta VALUES (1453,'326751-2','8402711-1','S002','A','10/08/2020',18,15,270);
INSERT INTO venta VALUES (1454,'22717906-6','14519212-9','S005','A','13/07/2020',18,14,252);
INSERT INTO venta VALUES (1455,'4619802-6','23819125-4','S005','B','14/01/2021',25,15,375);
INSERT INTO venta VALUES (1456,'16635321-1','18567395-2','S005','B','13/09/2021',33,13,429);
INSERT INTO venta VALUES (1457,'35453366-9','8402711-1','S001','A','25/06/2020',15,15,225);
INSERT INTO venta VALUES (1458,'19543982-6','32531450-8','S002','B','18/07/2020',14,12,168);
INSERT INTO venta VALUES (1459,'35892890-0','45421301-7','S003','A','19/08/2021',15,15,225);
INSERT INTO venta VALUES (1460,'45765540-1','42396509-6','S002','B','01/04/2021',22,15,330);
INSERT INTO venta VALUES (1461,'14117560-2','47232966-9','S001','A','16/04/2020',13,14,182);
INSERT INTO venta VALUES (1462,'16237465-6','14315947-7','S001','A','29/11/2020',20,14,280);
INSERT INTO venta VALUES (1463,'7273625-7','4810357-K','S005','A','27/03/2020',14,15,210);
INSERT INTO venta VALUES (1464,'12795986-2','24180587-5','S005','B','04/10/2021',35,14,490);
INSERT INTO venta VALUES (1465,'19310175-5','32531450-8','S004','A','04/03/2020',49,15,735);
INSERT INTO venta VALUES (1466,'13488196-8','24180587-5','S004','B','08/04/2020',22,14,308);
INSERT INTO venta VALUES (1467,'869272-6','32531450-8','S005','A','25/05/2021',49,14,686);
INSERT INTO venta VALUES (1468,'29869777-7','4810357-K','S003','B','12/09/2020',28,15,420);
INSERT INTO venta VALUES (1469,'21557577-2','8402711-1','S002','A','04/06/2020',43,15,645);
INSERT INTO venta VALUES (1470,'34235492-0','18567395-2','S002','B','08/09/2021',12,13,156);
INSERT INTO venta VALUES (1471,'48956344-4','6183303-K','S001','A','23/03/2021',45,12,540);
INSERT INTO venta VALUES (1472,'36420662-3','18567395-2','S004','A','29/05/2021',11,13,143);
INSERT INTO venta VALUES (1473,'27202724-2','18567395-2','S002','B','09/12/2020',22,13,286);
INSERT INTO venta VALUES (1474,'22479279-4','4810357-K','S004','B','26/08/2020',46,12,552);
INSERT INTO venta VALUES (1475,'13136212-9','46566450-9','S001','B','09/11/2020',40,15,600);
INSERT INTO venta VALUES (1476,'13661914-4','14519212-9','S001','A','14/11/2021',17,13,221);
INSERT INTO venta VALUES (1477,'45417309-0','23819125-4','S001','A','26/01/2021',35,13,455);
INSERT INTO venta VALUES (1478,'13967384-0','46566450-9','S004','B','16/11/2020',46,12,552);
INSERT INTO venta VALUES (1479,'43968887-4','46566450-9','S001','B','17/12/2021',22,13,286);
INSERT INTO venta VALUES (1480,'2848128-4','24180587-5','S001','A','12/07/2021',40,14,560);
INSERT INTO venta VALUES (1481,'4487875-5','4810357-K','S002','B','02/10/2021',43,14,602);
INSERT INTO venta VALUES (1482,'16727458-7','14315947-7','S001','B','10/01/2021',46,13,598);
INSERT INTO venta VALUES (1483,'9799570-2','23819125-4','S002','A','02/03/2020',36,15,540);
INSERT INTO venta VALUES (1484,'29346913-K','47232966-9','S004','A','11/03/2020',32,12,384);
INSERT INTO venta VALUES (1485,'3532103-9','6183303-K','S004','B','28/07/2020',24,15,360);
INSERT INTO venta VALUES (1486,'5729551-1','6183303-K','S005','B','23/06/2021',36,14,504);
INSERT INTO venta VALUES (1487,'33978459-0','6183303-K','S003','B','24/08/2020',48,12,576);
INSERT INTO venta VALUES (1488,'44786603-K','18567395-2','S005','B','09/04/2020',11,15,165);
INSERT INTO venta VALUES (1489,'11980905-3','46566450-9','S001','A','17/05/2021',28,12,336);
INSERT INTO venta VALUES (1490,'40927596-6','20237862-5','S003','A','13/02/2020',41,15,615);
INSERT INTO venta VALUES (1491,'24769666-0','18567395-2','S004','A','22/12/2021',18,14,252);
INSERT INTO venta VALUES (1492,'34605812-9','29374931-0','S003','A','07/11/2020',50,15,750);
INSERT INTO venta VALUES (1493,'419175-7','23819125-4','S002','B','26/06/2021',38,15,570);
INSERT INTO venta VALUES (1494,'764416-7','29374931-0','S003','A','24/09/2021',42,14,588);
INSERT INTO venta VALUES (1495,'12408933-6','6183303-K','S004','B','08/06/2021',16,15,240);
INSERT INTO venta VALUES (1496,'23722716-6','42396509-6','S001','A','20/11/2021',30,12,360);
INSERT INTO venta VALUES (1497,'50235664-K','14315947-7','S001','B','10/08/2021',49,14,686);
INSERT INTO venta VALUES (1498,'20620588-1','42396509-6','S005','A','01/05/2020',39,12,468);
INSERT INTO venta VALUES (1499,'16875962-2','46566450-9','S002','A','10/05/2020',21,14,294);
INSERT INTO venta VALUES (1500,'26734598-8','24180587-5','S005','B','26/04/2020',29,15,435);
INSERT INTO venta VALUES (1501,'42620993-4','42396509-6','S003','A','30/07/2020',20,12,240);
INSERT INTO venta VALUES (1502,'34830491-7','8402711-1','S005','A','26/05/2021',41,12,492);
INSERT INTO venta VALUES (1503,'22762686-0','23819125-4','S003','A','26/04/2021',50,12,600);
INSERT INTO venta VALUES (1504,'22666604-4','42396509-6','S002','B','19/09/2020',39,15,585);
INSERT INTO venta VALUES (1505,'2664874-2','23819125-4','S005','B','09/02/2020',16,14,224);
INSERT INTO venta VALUES (1506,'23473785-6','20237862-5','S003','A','26/05/2021',40,14,560);
INSERT INTO venta VALUES (1507,'22401768-5','4810357-K','S001','B','01/10/2021',12,14,168);
INSERT INTO venta VALUES (1508,'1312320-9','6183303-K','S003','B','26/05/2020',34,15,510);
INSERT INTO venta VALUES (1509,'10652295-2','14519212-9','S002','A','28/10/2020',37,12,444);
INSERT INTO venta VALUES (1510,'48749127-6','24180587-5','S002','A','31/08/2020',15,15,225);
INSERT INTO venta VALUES (1511,'27217276-5','29374931-0','S002','A','30/12/2021',27,12,324);
INSERT INTO venta VALUES (1512,'26932196-2','14519212-9','S003','B','19/03/2020',43,12,516);
INSERT INTO venta VALUES (1513,'3263777-9','20237862-5','S004','A','08/07/2020',41,12,492);
INSERT INTO venta VALUES (1514,'25992177-5','46566450-9','S002','A','11/07/2020',47,12,564);
INSERT INTO venta VALUES (1515,'4499186-1','42396509-6','S003','B','18/07/2021',16,13,208);
INSERT INTO venta VALUES (1516,'42919155-6','46566450-9','S002','A','11/10/2021',42,15,630);
INSERT INTO venta VALUES (1517,'38857310-4','45421301-7','S001','A','05/08/2020',22,14,308);
INSERT INTO venta VALUES (1518,'45343934-8','29374931-0','S002','A','04/11/2021',17,15,255);
INSERT INTO venta VALUES (1519,'26766664-4','14519212-9','S001','B','07/02/2020',46,13,598);
INSERT INTO venta VALUES (1520,'15268632-3','24180587-5','S005','A','06/10/2021',49,12,588);
INSERT INTO venta VALUES (1521,'36696613-7','6183303-K','S002','A','07/12/2021',33,12,396);
INSERT INTO venta VALUES (1522,'7494366-7','32531450-8','S001','A','19/02/2020',36,15,540);
INSERT INTO venta VALUES (1523,'8825642-5','6183303-K','S002','B','29/06/2020',18,14,252);
INSERT INTO venta VALUES (1524,'33495647-4','24180587-5','S001','A','16/08/2021',12,14,168);
INSERT INTO venta VALUES (1525,'9838269-0','47232966-9','S002','B','29/08/2020',34,15,510);
INSERT INTO venta VALUES (1526,'11734682-K','46566450-9','S002','A','09/10/2021',49,13,637);
INSERT INTO venta VALUES (1527,'10883952-K','23819125-4','S004','B','04/04/2021',49,12,588);
INSERT INTO venta VALUES (1528,'35509687-4','32531450-8','S005','B','03/06/2021',49,15,735);
INSERT INTO venta VALUES (1529,'18448491-9','29374931-0','S005','A','29/04/2021',39,13,507);
INSERT INTO venta VALUES (1530,'14343214-9','32531450-8','S003','A','02/09/2021',46,13,598);
INSERT INTO venta VALUES (1531,'22331743-K','29374931-0','S004','A','07/04/2021',19,12,228);
INSERT INTO venta VALUES (1532,'10440146-5','32531450-8','S001','A','01/04/2021',24,12,288);
INSERT INTO venta VALUES (1533,'14515570-3','14519212-9','S002','A','02/04/2020',18,14,252);
INSERT INTO venta VALUES (1534,'37830923-9','23819125-4','S001','B','12/02/2020',20,12,240);
INSERT INTO venta VALUES (1535,'23336716-8','6183303-K','S001','A','03/01/2021',39,12,468);
INSERT INTO venta VALUES (1536,'7963840-4','18567395-2','S004','A','29/10/2021',41,13,533);
INSERT INTO venta VALUES (1537,'23911859-3','29374931-0','S003','A','10/09/2020',46,12,552);
INSERT INTO venta VALUES (1538,'26154119-K','47232966-9','S001','A','04/10/2021',11,12,132);
INSERT INTO venta VALUES (1539,'17211868-2','42396509-6','S005','A','27/05/2020',16,15,240);
INSERT INTO venta VALUES (1540,'14310154-1','4810357-K','S002','A','01/05/2020',11,13,143);
INSERT INTO venta VALUES (1541,'2876163-5','46566450-9','S004','B','15/08/2021',43,13,559);
INSERT INTO venta VALUES (1542,'4836809-3','32531450-8','S003','B','26/06/2021',47,12,564);
INSERT INTO venta VALUES (1543,'6770866-0','29374931-0','S003','A','17/03/2021',43,15,645);
INSERT INTO venta VALUES (1544,'30268781-1','46566450-9','S001','B','27/08/2020',11,12,132);
INSERT INTO venta VALUES (1545,'44370993-2','14315947-7','S004','B','21/08/2020',39,14,546);
INSERT INTO venta VALUES (1546,'9228271-6','23819125-4','S001','A','27/02/2020',38,14,532);
INSERT INTO venta VALUES (1547,'21387757-7','32531450-8','S002','A','07/09/2021',38,13,494);
INSERT INTO venta VALUES (1548,'37575381-2','42396509-6','S002','B','26/06/2021',44,12,528);
INSERT INTO venta VALUES (1549,'1840187-8','14519212-9','S001','B','19/03/2021',41,14,574);
INSERT INTO venta VALUES (1550,'18504853-5','14519212-9','S004','A','31/01/2021',13,12,156);
INSERT INTO venta VALUES (1551,'43641524-9','23819125-4','S004','A','05/12/2021',43,13,559);
INSERT INTO venta VALUES (1552,'4651673-7','24180587-5','S005','A','23/07/2020',14,13,182);
INSERT INTO venta VALUES (1553,'4441359-0','8402711-1','S001','B','02/01/2020',14,12,168);
INSERT INTO venta VALUES (1554,'25511320-8','8402711-1','S005','B','24/05/2021',41,12,492);
INSERT INTO venta VALUES (1555,'16179906-8','14315947-7','S005','A','08/11/2021',22,13,286);
INSERT INTO venta VALUES (1556,'19843558-9','20237862-5','S003','A','02/10/2021',34,14,476);
INSERT INTO venta VALUES (1557,'2811967-4','14519212-9','S002','B','14/11/2020',49,12,588);
INSERT INTO venta VALUES (1558,'28710876-1','4810357-K','S003','A','12/02/2020',27,15,405);
INSERT INTO venta VALUES (1559,'6617860-9','24180587-5','S001','B','09/05/2020',31,15,465);
INSERT INTO venta VALUES (1560,'35243513-9','46566450-9','S004','B','22/08/2021',21,15,315);
INSERT INTO venta VALUES (1561,'7463209-2','47232966-9','S005','B','07/07/2020',29,14,406);
INSERT INTO venta VALUES (1562,'38597729-8','42396509-6','S005','A','09/10/2021',12,15,180);
INSERT INTO venta VALUES (1563,'2123635-7','47232966-9','S003','B','28/05/2021',42,14,588);
INSERT INTO venta VALUES (1564,'2522692-5','14519212-9','S003','B','13/12/2021',12,13,156);
INSERT INTO venta VALUES (1565,'36551983-8','47232966-9','S002','B','30/05/2020',19,15,285);
INSERT INTO venta VALUES (1566,'27722312-0','46566450-9','S003','B','23/08/2021',37,12,444);
INSERT INTO venta VALUES (1567,'20753654-7','42396509-6','S003','B','06/11/2020',38,14,532);
INSERT INTO venta VALUES (1568,'13443951-3','6183303-K','S003','A','23/07/2021',46,14,644);
INSERT INTO venta VALUES (1569,'23136872-8','47232966-9','S003','A','26/12/2020',27,14,378);
INSERT INTO venta VALUES (1570,'4868525-0','29374931-0','S004','B','02/11/2021',43,15,645);
INSERT INTO venta VALUES (1571,'19376838-5','46566450-9','S001','A','26/04/2020',44,13,572);
INSERT INTO venta VALUES (1572,'788177-0','14519212-9','S005','A','02/07/2021',17,12,204);
INSERT INTO venta VALUES (1573,'21828819-7','45421301-7','S003','B','22/04/2021',12,12,144);
INSERT INTO venta VALUES (1574,'32325103-7','23819125-4','S004','A','14/05/2021',20,15,300);
INSERT INTO venta VALUES (1575,'9143968-9','23819125-4','S003','A','16/03/2021',47,12,564);
INSERT INTO venta VALUES (1576,'36354712-5','14315947-7','S002','A','28/03/2020',26,14,364);
INSERT INTO venta VALUES (1577,'7419796-5','14519212-9','S002','B','19/02/2021',42,15,630);
INSERT INTO venta VALUES (1578,'2681769-2','32531450-8','S001','A','18/07/2020',36,12,432);
INSERT INTO venta VALUES (1579,'47552796-8','29374931-0','S003','A','07/05/2021',17,15,255);
INSERT INTO venta VALUES (1580,'22442239-3','32531450-8','S005','B','21/08/2020',34,13,442);
INSERT INTO venta VALUES (1581,'46343501-4','47232966-9','S005','A','28/07/2020',46,12,552);
INSERT INTO venta VALUES (1582,'25789250-6','14519212-9','S003','A','30/04/2021',26,15,390);
INSERT INTO venta VALUES (1583,'4314143-0','24180587-5','S002','B','03/04/2020',47,15,705);
INSERT INTO venta VALUES (1584,'42428940-K','14519212-9','S003','A','15/08/2021',34,12,408);
INSERT INTO venta VALUES (1585,'39775721-8','14519212-9','S002','B','23/08/2020',30,14,420);
INSERT INTO venta VALUES (1586,'4758948-7','46566450-9','S004','B','07/07/2020',11,12,132);
INSERT INTO venta VALUES (1587,'33997149-8','45421301-7','S004','A','24/09/2021',21,14,294);
INSERT INTO venta VALUES (1588,'1122027-4','8402711-1','S003','A','16/06/2020',32,13,416);
INSERT INTO venta VALUES (1589,'46337336-1','14315947-7','S003','B','04/05/2021',19,15,285);
INSERT INTO venta VALUES (1590,'43643180-5','8402711-1','S003','A','02/09/2021',50,13,650);
INSERT INTO venta VALUES (1591,'36596992-2','47232966-9','S003','B','21/12/2021',10,12,120);
INSERT INTO venta VALUES (1592,'41832875-4','29374931-0','S004','A','14/11/2020',19,14,266);
INSERT INTO venta VALUES (1593,'2171656-1','32531450-8','S005','A','12/12/2021',32,15,480);
INSERT INTO venta VALUES (1594,'34267352-K','20237862-5','S005','A','19/06/2021',17,15,255);
INSERT INTO venta VALUES (1595,'631941-6','45421301-7','S005','B','06/01/2021',31,14,434);
INSERT INTO venta VALUES (1596,'45654643-9','23819125-4','S004','A','06/10/2021',41,15,615);
INSERT INTO venta VALUES (1597,'16765562-9','29374931-0','S001','B','01/03/2020',29,14,406);
INSERT INTO venta VALUES (1598,'32270250-7','4810357-K','S001','B','18/04/2021',46,12,552);
INSERT INTO venta VALUES (1599,'11563170-5','8402711-1','S003','A','02/03/2020',31,14,434);
INSERT INTO venta VALUES (1600,'26157537-K','14519212-9','S005','A','25/07/2021',22,15,330);
INSERT INTO venta VALUES (1601,'19271288-2','46566450-9','S001','B','01/07/2021',10,14,140);
INSERT INTO venta VALUES (1602,'5680886-8','45421301-7','S003','A','22/01/2021',15,14,210);
INSERT INTO venta VALUES (1603,'4685879-4','18567395-2','S003','A','10/10/2021',48,15,720);
INSERT INTO venta VALUES (1604,'18513792-9','32531450-8','S004','A','27/06/2021',50,12,600);
INSERT INTO venta VALUES (1605,'15663741-6','42396509-6','S005','A','26/07/2021',47,13,611);
INSERT INTO venta VALUES (1606,'31772728-3','47232966-9','S004','A','27/02/2020',35,15,525);
INSERT INTO venta VALUES (1607,'22660782-K','14315947-7','S004','A','06/09/2021',44,13,572);
INSERT INTO venta VALUES (1608,'19124581-4','20237862-5','S004','B','24/10/2021',12,13,156);
INSERT INTO venta VALUES (1609,'28178116-2','8402711-1','S003','A','01/02/2021',18,12,216);
INSERT INTO venta VALUES (1610,'25633949-8','47232966-9','S004','A','10/10/2021',28,14,392);
INSERT INTO venta VALUES (1611,'49296302-K','29374931-0','S002','A','31/08/2020',14,13,182);
INSERT INTO venta VALUES (1612,'7664889-1','4810357-K','S001','B','07/03/2021',49,13,637);
INSERT INTO venta VALUES (1613,'1741449-6','42396509-6','S002','B','03/03/2021',44,12,528);
INSERT INTO venta VALUES (1614,'2748213-9','29374931-0','S003','B','22/08/2021',15,12,180);
INSERT INTO venta VALUES (1615,'10826186-2','24180587-5','S003','B','17/05/2020',16,14,224);
INSERT INTO venta VALUES (1616,'3438400-2','23819125-4','S005','A','18/03/2021',14,12,168);
INSERT INTO venta VALUES (1617,'9994880-9','45421301-7','S003','B','09/10/2021',43,12,516);
INSERT INTO venta VALUES (1618,'32865337-0','14519212-9','S002','B','08/11/2021',46,12,552);
INSERT INTO venta VALUES (1619,'37849952-6','14315947-7','S003','A','10/02/2021',29,15,435);
INSERT INTO venta VALUES (1620,'8917582-8','23819125-4','S001','A','24/11/2020',14,15,210);
INSERT INTO venta VALUES (1621,'7992294-3','32531450-8','S004','A','12/12/2020',25,15,375);
INSERT INTO venta VALUES (1622,'659110-8','24180587-5','S001','B','17/03/2020',38,15,570);
INSERT INTO venta VALUES (1623,'18766252-4','4810357-K','S001','A','28/10/2021',36,14,504);
INSERT INTO venta VALUES (1624,'22305414-5','47232966-9','S001','A','10/08/2021',44,15,660);
INSERT INTO venta VALUES (1625,'28681326-7','4810357-K','S004','B','07/02/2021',12,13,156);
INSERT INTO venta VALUES (1626,'12800750-4','18567395-2','S005','B','10/07/2020',29,12,348);
INSERT INTO venta VALUES (1627,'43509564-K','45421301-7','S005','B','27/05/2020',42,12,504);
INSERT INTO venta VALUES (1628,'24176673-K','29374931-0','S004','B','02/08/2021',26,13,338);
INSERT INTO venta VALUES (1629,'9454867-5','18567395-2','S002','A','06/03/2021',40,13,520);
INSERT INTO venta VALUES (1630,'30577989-K','29374931-0','S003','A','02/02/2020',49,14,686);
INSERT INTO venta VALUES (1631,'26612311-6','14519212-9','S003','A','10/05/2021',28,14,392);
INSERT INTO venta VALUES (1632,'38445393-7','6183303-K','S003','A','13/12/2020',30,13,390);
INSERT INTO venta VALUES (1633,'13282297-2','18567395-2','S005','B','03/02/2020',42,13,546);
INSERT INTO venta VALUES (1634,'1716359-0','4810357-K','S004','A','29/02/2020',18,13,234);
INSERT INTO venta VALUES (1635,'20504888-K','32531450-8','S002','B','14/06/2020',23,13,299);
INSERT INTO venta VALUES (1636,'38685858-6','45421301-7','S004','A','08/06/2021',16,15,240);
INSERT INTO venta VALUES (1637,'35669888-6','45421301-7','S001','B','21/10/2021',10,14,140);
INSERT INTO venta VALUES (1638,'16820896-0','29374931-0','S002','A','10/03/2020',11,12,132);
INSERT INTO venta VALUES (1639,'77629-7','32531450-8','S004','B','16/07/2020',33,14,462);
INSERT INTO venta VALUES (1640,'36787845-2','29374931-0','S003','B','07/12/2020',12,14,168);
INSERT INTO venta VALUES (1641,'44974580-9','32531450-8','S002','B','16/09/2020',24,15,360);
INSERT INTO venta VALUES (1642,'30936921-1','46566450-9','S004','A','07/05/2020',49,14,686);
INSERT INTO venta VALUES (1643,'26810372-4','20237862-5','S005','A','05/05/2021',19,15,285);
INSERT INTO venta VALUES (1644,'49941275-4','14315947-7','S004','B','06/07/2020',48,12,576);
INSERT INTO venta VALUES (1645,'25291221-5','23819125-4','S004','A','13/04/2020',18,14,252);
INSERT INTO venta VALUES (1646,'15516900-1','18567395-2','S003','A','29/09/2021',21,13,273);
INSERT INTO venta VALUES (1647,'27774169-5','18567395-2','S002','A','25/03/2021',18,15,270);
INSERT INTO venta VALUES (1648,'27714165-5','24180587-5','S002','A','18/01/2020',27,15,405);
INSERT INTO venta VALUES (1649,'3976702-3','32531450-8','S002','A','02/07/2020',21,13,273);
INSERT INTO venta VALUES (1650,'2843191-0','18567395-2','S002','B','14/08/2021',13,12,156);
INSERT INTO venta VALUES (1651,'29362748-7','24180587-5','S002','A','24/10/2021',12,15,180);
INSERT INTO venta VALUES (1652,'7265698-9','24180587-5','S004','A','20/12/2021',14,12,168);
INSERT INTO venta VALUES (1653,'33101952-6','42396509-6','S002','A','22/08/2020',20,15,300);
INSERT INTO venta VALUES (1654,'49867216-7','4810357-K','S003','B','29/04/2020',12,15,180);
INSERT INTO venta VALUES (1655,'5420466-3','14519212-9','S001','B','04/08/2021',18,13,234);
INSERT INTO venta VALUES (1656,'13835414-8','20237862-5','S005','B','07/03/2021',16,15,240);
INSERT INTO venta VALUES (1657,'45621994-2','6183303-K','S003','B','11/05/2020',38,12,456);
INSERT INTO venta VALUES (1658,'23859357-3','4810357-K','S001','A','07/03/2020',40,15,600);
INSERT INTO venta VALUES (1659,'26620304-7','23819125-4','S003','A','26/07/2020',31,14,434);
INSERT INTO venta VALUES (1660,'32180979-0','47232966-9','S001','A','11/01/2020',39,12,468);
INSERT INTO venta VALUES (1661,'10631187-0','23819125-4','S003','A','20/02/2021',16,12,192);
INSERT INTO venta VALUES (1662,'48336413-K','8402711-1','S004','A','19/06/2021',33,13,429);
INSERT INTO venta VALUES (1663,'35457831-K','32531450-8','S004','B','13/10/2020',14,12,168);
INSERT INTO venta VALUES (1664,'25785414-0','32531450-8','S001','A','09/11/2021',29,14,406);
INSERT INTO venta VALUES (1665,'48341931-7','24180587-5','S004','B','18/11/2021',36,12,432);
INSERT INTO venta VALUES (1666,'23299228-K','23819125-4','S005','B','15/04/2021',24,14,336);
INSERT INTO venta VALUES (1667,'12316193-9','4810357-K','S005','B','03/02/2021',42,14,588);
INSERT INTO venta VALUES (1668,'48852-6','46566450-9','S005','B','27/12/2020',43,13,559);
INSERT INTO venta VALUES (1669,'39266461-0','20237862-5','S003','A','04/11/2021',16,12,192);
INSERT INTO venta VALUES (1670,'32546761-4','32531450-8','S005','B','31/08/2020',35,12,420);
INSERT INTO venta VALUES (1671,'48105848-1','45421301-7','S002','A','27/07/2021',28,13,364);
INSERT INTO venta VALUES (1672,'25117198-K','23819125-4','S003','A','21/01/2021',46,12,552);
INSERT INTO venta VALUES (1673,'27326951-7','4810357-K','S002','B','17/11/2021',10,12,120);
INSERT INTO venta VALUES (1674,'33547962-9','47232966-9','S005','B','09/11/2020',43,14,602);
INSERT INTO venta VALUES (1675,'43367850-8','8402711-1','S002','B','27/12/2020',49,14,686);
INSERT INTO venta VALUES (1676,'18473160-6','29374931-0','S001','B','22/07/2020',32,12,384);
INSERT INTO venta VALUES (1677,'29902153-K','46566450-9','S001','B','31/07/2020',45,12,540);
INSERT INTO venta VALUES (1678,'7717517-2','14519212-9','S004','A','08/03/2021',35,13,455);
INSERT INTO venta VALUES (1679,'48466707-1','23819125-4','S001','A','26/10/2021',47,15,705);
INSERT INTO venta VALUES (1680,'43303774-K','14315947-7','S002','A','27/03/2021',25,12,300);
INSERT INTO venta VALUES (1681,'46153150-4','14519212-9','S001','A','10/06/2021',43,12,516);
INSERT INTO venta VALUES (1682,'25902267-3','24180587-5','S005','A','04/04/2021',48,15,720);
INSERT INTO venta VALUES (1683,'25501612-1','14315947-7','S002','A','04/05/2021',38,12,456);
INSERT INTO venta VALUES (1684,'28111191-4','32531450-8','S005','B','01/03/2020',17,13,221);
INSERT INTO venta VALUES (1685,'46656748-5','18567395-2','S004','A','10/11/2021',10,13,130);
INSERT INTO venta VALUES (1686,'26279572-1','29374931-0','S004','A','30/07/2021',23,15,345);
INSERT INTO venta VALUES (1687,'6427641-7','8402711-1','S004','B','19/12/2020',11,15,165);
INSERT INTO venta VALUES (1688,'26484700-1','47232966-9','S001','B','17/07/2020',18,15,270);
INSERT INTO venta VALUES (1689,'18153438-9','14519212-9','S002','A','31/03/2021',30,14,420);
INSERT INTO venta VALUES (1690,'20380351-6','45421301-7','S002','A','31/05/2021',35,14,490);
INSERT INTO venta VALUES (1691,'24204534-3','6183303-K','S001','B','28/06/2020',39,13,507);
INSERT INTO venta VALUES (1692,'26393893-3','6183303-K','S005','A','14/09/2020',36,12,432);
INSERT INTO venta VALUES (1693,'28241890-8','32531450-8','S001','B','06/12/2020',26,13,338);
INSERT INTO venta VALUES (1694,'25342402-8','4810357-K','S001','B','19/08/2021',28,15,420);
INSERT INTO venta VALUES (1695,'38425287-7','46566450-9','S002','B','03/03/2021',37,15,555);
INSERT INTO venta VALUES (1696,'2269681-5','14315947-7','S002','A','06/10/2021',38,12,456);
INSERT INTO venta VALUES (1697,'12906127-8','6183303-K','S001','A','08/11/2021',40,13,520);
INSERT INTO venta VALUES (1698,'12949968-0','14315947-7','S003','B','30/08/2021',45,12,540);
INSERT INTO venta VALUES (1699,'4443244-7','32531450-8','S003','A','10/10/2021',47,14,658);
INSERT INTO venta VALUES (1700,'11482753-3','47232966-9','S003','B','01/03/2021',24,13,312);
INSERT INTO venta VALUES (1701,'464335-6','14519212-9','S002','A','19/07/2021',30,12,360);
INSERT INTO venta VALUES (1702,'36692859-6','47232966-9','S003','A','30/05/2020',39,12,468);
INSERT INTO venta VALUES (1703,'2723837-8','6183303-K','S001','B','30/06/2020',22,14,308);
INSERT INTO venta VALUES (1704,'1890312-1','6183303-K','S004','B','13/01/2020',39,13,507);
INSERT INTO venta VALUES (1705,'12822975-2','45421301-7','S005','B','24/09/2020',35,12,420);
INSERT INTO venta VALUES (1706,'3354319-0','18567395-2','S003','B','26/01/2020',41,13,533);
INSERT INTO venta VALUES (1707,'13327230-5','47232966-9','S001','B','22/11/2020',41,12,492);
INSERT INTO venta VALUES (1708,'44254417-4','6183303-K','S001','B','19/10/2021',21,15,315);
INSERT INTO venta VALUES (1709,'10515997-8','8402711-1','S002','A','08/08/2021',15,15,225);
INSERT INTO venta VALUES (1710,'2560108-4','6183303-K','S005','B','03/05/2021',16,15,240);
INSERT INTO venta VALUES (1711,'33888803-1','23819125-4','S004','A','03/05/2020',42,14,588);
INSERT INTO venta VALUES (1712,'3312803-7','14519212-9','S003','A','07/04/2021',24,12,288);
INSERT INTO venta VALUES (1713,'42224976-1','18567395-2','S003','A','18/04/2021',50,14,700);
INSERT INTO venta VALUES (1714,'22950386-3','14519212-9','S002','A','07/09/2021',24,12,288);
INSERT INTO venta VALUES (1715,'45952563-7','6183303-K','S004','A','15/08/2020',50,15,750);
INSERT INTO venta VALUES (1716,'32678177-0','6183303-K','S001','B','20/04/2020',45,15,675);
INSERT INTO venta VALUES (1717,'44597831-0','18567395-2','S001','B','16/08/2021',34,15,510);
INSERT INTO venta VALUES (1718,'12674508-7','42396509-6','S003','A','11/07/2021',42,13,546);
INSERT INTO venta VALUES (1719,'33723826-2','45421301-7','S004','B','15/06/2020',44,15,660);
INSERT INTO venta VALUES (1720,'2152299-6','4810357-K','S001','A','01/01/2021',11,13,143);
INSERT INTO venta VALUES (1721,'40709835-8','47232966-9','S001','B','02/11/2021',45,15,675);
INSERT INTO venta VALUES (1722,'1934695-1','4810357-K','S001','B','31/12/2020',27,12,324);
INSERT INTO venta VALUES (1723,'17262729-3','32531450-8','S005','A','12/08/2021',10,13,130);
INSERT INTO venta VALUES (1724,'42634999-K','4810357-K','S005','A','09/07/2021',49,15,735);
INSERT INTO venta VALUES (1725,'12868975-3','4810357-K','S001','B','26/04/2020',27,12,324);
INSERT INTO venta VALUES (1726,'19950463-0','4810357-K','S001','B','01/02/2021',42,13,546);
INSERT INTO venta VALUES (1727,'35301718-7','8402711-1','S001','A','01/10/2021',21,15,315);
INSERT INTO venta VALUES (1728,'7697976-6','4810357-K','S005','A','02/03/2021',42,15,630);
INSERT INTO venta VALUES (1729,'39657376-8','29374931-0','S003','A','06/07/2020',33,13,429);
INSERT INTO venta VALUES (1730,'858411-7','14519212-9','S004','B','13/05/2020',14,13,182);
INSERT INTO venta VALUES (1731,'39475237-1','42396509-6','S003','A','06/09/2021',18,12,216);
INSERT INTO venta VALUES (1732,'17162191-7','24180587-5','S002','A','03/04/2020',34,13,442);
INSERT INTO venta VALUES (1733,'4633906-1','23819125-4','S003','A','20/03/2020',34,15,510);
INSERT INTO venta VALUES (1734,'44228716-3','24180587-5','S004','A','14/02/2021',12,14,168);
INSERT INTO venta VALUES (1735,'37850321-3','8402711-1','S005','B','18/07/2021',16,12,192);
INSERT INTO venta VALUES (1736,'7652770-9','42396509-6','S004','B','12/04/2021',28,14,392);
INSERT INTO venta VALUES (1737,'20570733-6','23819125-4','S005','A','31/07/2020',14,13,182);
INSERT INTO venta VALUES (1738,'31373578-8','14519212-9','S001','B','10/11/2020',38,15,570);
INSERT INTO venta VALUES (1739,'13119171-5','29374931-0','S003','A','20/02/2021',36,12,432);
INSERT INTO venta VALUES (1740,'1326116-4','23819125-4','S005','B','19/08/2020',20,13,260);
INSERT INTO venta VALUES (1741,'8471496-8','42396509-6','S005','B','14/12/2021',25,13,325);
INSERT INTO venta VALUES (1742,'45463922-7','6183303-K','S003','A','27/01/2021',23,12,276);
INSERT INTO venta VALUES (1743,'4795965-9','18567395-2','S001','A','14/01/2020',17,13,221);
INSERT INTO venta VALUES (1744,'1985837-5','32531450-8','S001','B','18/02/2020',24,13,312);
INSERT INTO venta VALUES (1745,'2632416-5','46566450-9','S003','A','27/11/2020',40,12,480);
INSERT INTO venta VALUES (1746,'7870174-9','18567395-2','S001','B','17/04/2020',15,15,225);
INSERT INTO venta VALUES (1747,'9640216-3','24180587-5','S002','B','05/10/2021',47,12,564);
INSERT INTO venta VALUES (1748,'323954-3','29374931-0','S003','A','06/02/2020',35,12,420);
INSERT INTO venta VALUES (1749,'3779314-0','23819125-4','S003','B','01/01/2020',29,12,348);
INSERT INTO venta VALUES (1750,'22668708-4','45421301-7','S002','A','04/07/2021',43,14,602);
INSERT INTO venta VALUES (1751,'4363197-7','8402711-1','S002','A','01/05/2020',26,14,364);
INSERT INTO venta VALUES (1752,'17402870-2','46566450-9','S002','B','06/09/2020',27,14,378);
INSERT INTO venta VALUES (1753,'15985913-4','29374931-0','S001','A','19/02/2020',31,14,434);
INSERT INTO venta VALUES (1754,'22962413-K','18567395-2','S002','A','03/03/2021',38,12,456);
INSERT INTO venta VALUES (1755,'784324-0','14519212-9','S001','A','25/07/2021',42,13,546);
INSERT INTO venta VALUES (1756,'46573375-6','20237862-5','S001','B','28/02/2021',17,13,221);
INSERT INTO venta VALUES (1757,'26173173-8','32531450-8','S004','B','16/12/2020',11,12,132);
INSERT INTO venta VALUES (1758,'3777041-8','47232966-9','S001','A','14/11/2021',17,13,221);
INSERT INTO venta VALUES (1759,'37608953-3','46566450-9','S002','B','03/03/2021',21,15,315);
INSERT INTO venta VALUES (1760,'3920779-6','8402711-1','S004','A','05/09/2020',17,15,255);
INSERT INTO venta VALUES (1761,'38693717-6','4810357-K','S002','A','27/03/2021',48,12,576);
INSERT INTO venta VALUES (1762,'27939428-3','29374931-0','S005','A','01/02/2020',50,13,650);
INSERT INTO venta VALUES (1763,'22451273-2','42396509-6','S003','B','18/02/2020',33,15,495);
INSERT INTO venta VALUES (1764,'8521947-2','14315947-7','S003','B','26/08/2021',20,12,240);
INSERT INTO venta VALUES (1765,'9598155-0','45421301-7','S002','B','05/08/2021',43,13,559);
INSERT INTO venta VALUES (1766,'39282475-8','4810357-K','S004','A','03/03/2021',43,12,516);
INSERT INTO venta VALUES (1767,'14649226-6','46566450-9','S001','B','09/07/2020',23,15,345);
INSERT INTO venta VALUES (1768,'45291827-7','45421301-7','S004','A','21/06/2020',24,15,360);
INSERT INTO venta VALUES (1769,'46533262-K','18567395-2','S002','B','21/01/2020',50,12,600);
INSERT INTO venta VALUES (1770,'3771417-8','46566450-9','S002','A','18/07/2020',17,12,204);
INSERT INTO venta VALUES (1771,'33163155-8','18567395-2','S001','A','15/08/2020',19,14,266);
INSERT INTO venta VALUES (1772,'17414897-K','4810357-K','S002','A','07/05/2021',10,12,120);
INSERT INTO venta VALUES (1773,'15197648-4','6183303-K','S002','A','10/10/2021',36,13,468);
INSERT INTO venta VALUES (1774,'724295-6','32531450-8','S001','A','14/01/2020',20,15,300);
INSERT INTO venta VALUES (1775,'15727662-K','42396509-6','S005','A','01/09/2021',48,13,624);
INSERT INTO venta VALUES (1776,'27310657-K','32531450-8','S004','B','21/12/2021',19,12,228);
INSERT INTO venta VALUES (1777,'241344-2','4810357-K','S005','A','06/03/2020',49,13,637);
INSERT INTO venta VALUES (1778,'7690652-1','4810357-K','S004','A','08/09/2021',14,14,196);
INSERT INTO venta VALUES (1779,'36178672-6','46566450-9','S005','A','27/07/2020',41,13,533);
INSERT INTO venta VALUES (1780,'8531489-0','14315947-7','S002','A','04/01/2021',11,14,154);
INSERT INTO venta VALUES (1781,'35707554-8','46566450-9','S001','A','07/11/2020',47,15,705);
INSERT INTO venta VALUES (1782,'18605597-7','32531450-8','S004','A','19/03/2021',32,12,384);
INSERT INTO venta VALUES (1783,'14457237-8','8402711-1','S005','B','14/11/2020',19,15,285);
INSERT INTO venta VALUES (1784,'34905567-8','20237862-5','S001','A','14/11/2020',11,12,132);
INSERT INTO venta VALUES (1785,'2426896-9','18567395-2','S001','A','20/05/2021',21,13,273);
INSERT INTO venta VALUES (1786,'39771947-2','14315947-7','S003','B','25/10/2020',16,14,224);
INSERT INTO venta VALUES (1787,'36697535-7','45421301-7','S003','A','09/12/2021',42,13,546);
INSERT INTO venta VALUES (1788,'50111203-8','29374931-0','S005','A','04/09/2021',30,12,360);
INSERT INTO venta VALUES (1789,'5624553-7','4810357-K','S003','B','01/05/2021',43,12,516);
INSERT INTO venta VALUES (1790,'1723172-3','29374931-0','S001','B','22/09/2021',22,15,330);
INSERT INTO venta VALUES (1791,'40851728-1','47232966-9','S002','A','16/07/2021',47,14,658);
INSERT INTO venta VALUES (1792,'15303262-9','47232966-9','S002','A','16/07/2021',23,12,276);
INSERT INTO venta VALUES (1793,'31272855-9','6183303-K','S001','B','28/02/2020',24,12,288);
INSERT INTO venta VALUES (1794,'24308974-3','29374931-0','S004','A','02/02/2020',34,15,510);
INSERT INTO venta VALUES (1795,'37942920-3','23819125-4','S002','B','02/03/2021',33,15,495);
INSERT INTO venta VALUES (1796,'15976879-1','4810357-K','S005','B','03/06/2021',24,13,312);
INSERT INTO venta VALUES (1797,'22941315-5','18567395-2','S002','A','09/07/2021',35,15,525);
INSERT INTO venta VALUES (1798,'11146117-1','20237862-5','S002','A','19/03/2020',24,14,336);
INSERT INTO venta VALUES (1799,'18993555-2','6183303-K','S004','B','02/11/2020',50,13,650);
INSERT INTO venta VALUES (1800,'6828569-0','14519212-9','S003','B','28/07/2021',22,14,308);
INSERT INTO venta VALUES (1801,'8910706-7','18567395-2','S001','A','25/11/2021',27,14,378);
INSERT INTO venta VALUES (1802,'37538683-6','23819125-4','S004','B','23/11/2021',43,14,602);
INSERT INTO venta VALUES (1803,'49506917-6','6183303-K','S002','B','05/12/2020',40,14,560);
INSERT INTO venta VALUES (1804,'26465143-3','14519212-9','S002','A','27/03/2021',13,13,169);
INSERT INTO venta VALUES (1805,'12863360-K','8402711-1','S002','B','13/07/2020',24,12,288);
INSERT INTO venta VALUES (1806,'35464842-3','14315947-7','S005','B','07/04/2020',20,14,280);
INSERT INTO venta VALUES (1807,'49228383-5','32531450-8','S005','B','24/04/2020',16,12,192);
INSERT INTO venta VALUES (1808,'4843648-K','20237862-5','S001','B','19/01/2020',48,14,672);
INSERT INTO venta VALUES (1809,'36710570-4','14315947-7','S004','A','15/03/2020',42,13,546);
INSERT INTO venta VALUES (1810,'36463590-7','45421301-7','S003','A','23/01/2021',41,13,533);
INSERT INTO venta VALUES (1811,'49261260-K','8402711-1','S005','A','09/10/2020',17,15,255);
INSERT INTO venta VALUES (1812,'67016-2','45421301-7','S001','A','02/06/2021',17,15,255);
INSERT INTO venta VALUES (1813,'17247534-5','4810357-K','S004','A','04/08/2020',17,13,221);
INSERT INTO venta VALUES (1814,'42666994-3','6183303-K','S005','B','02/08/2020',29,13,377);
INSERT INTO venta VALUES (1815,'9513916-7','32531450-8','S004','B','29/09/2020',11,15,165);
INSERT INTO venta VALUES (1816,'50344810-6','47232966-9','S002','A','17/10/2020',47,15,705);
INSERT INTO venta VALUES (1817,'478918-0','14315947-7','S003','B','01/09/2020',19,13,247);
INSERT INTO venta VALUES (1818,'49880234-6','6183303-K','S001','A','29/05/2020',14,15,210);
INSERT INTO venta VALUES (1819,'13931994-K','42396509-6','S003','B','21/12/2021',16,12,192);
INSERT INTO venta VALUES (1820,'46490831-5','14519212-9','S002','A','26/08/2020',34,15,510);
INSERT INTO venta VALUES (1821,'31103598-3','47232966-9','S001','B','15/10/2020',37,13,481);
INSERT INTO venta VALUES (1822,'25918150-K','14519212-9','S005','A','23/05/2020',10,12,120);
INSERT INTO venta VALUES (1823,'3528420-6','18567395-2','S004','A','27/01/2021',10,14,140);
INSERT INTO venta VALUES (1824,'35579147-5','18567395-2','S003','A','25/02/2021',30,15,450);
INSERT INTO venta VALUES (1825,'31603398-9','23819125-4','S005','B','30/01/2021',28,13,364);
INSERT INTO venta VALUES (1826,'33672606-9','14519212-9','S004','A','18/10/2020',15,13,195);
INSERT INTO venta VALUES (1827,'47352241-1','8402711-1','S005','B','02/10/2021',29,14,406);
INSERT INTO venta VALUES (1828,'19928743-5','6183303-K','S005','A','16/02/2020',39,15,585);
INSERT INTO venta VALUES (1829,'43838491-K','14519212-9','S001','A','07/09/2021',23,15,345);
INSERT INTO venta VALUES (1830,'48440778-9','14519212-9','S004','A','09/10/2021',48,15,720);
INSERT INTO venta VALUES (1831,'3596015-5','42396509-6','S001','A','11/04/2021',13,12,156);
INSERT INTO venta VALUES (1832,'41955593-2','47232966-9','S002','A','05/05/2020',12,12,144);
INSERT INTO venta VALUES (1833,'38253942-7','42396509-6','S005','B','17/02/2020',37,12,444);
INSERT INTO venta VALUES (1834,'26671316-9','46566450-9','S002','A','11/04/2021',28,12,336);
INSERT INTO venta VALUES (1835,'8277892-6','45421301-7','S002','A','17/11/2021',23,13,299);
INSERT INTO venta VALUES (1836,'8759565-K','46566450-9','S005','A','09/08/2020',13,14,182);
INSERT INTO venta VALUES (1837,'13869214-0','45421301-7','S001','B','26/10/2021',30,15,450);
INSERT INTO venta VALUES (1838,'6752700-3','45421301-7','S002','A','01/12/2020',19,14,266);
INSERT INTO venta VALUES (1839,'449367-2','14315947-7','S002','B','21/12/2021',15,15,225);
INSERT INTO venta VALUES (1840,'3812859-0','32531450-8','S004','A','22/02/2021',47,12,564);
INSERT INTO venta VALUES (1841,'14258794-7','47232966-9','S001','A','23/11/2021',41,14,574);
INSERT INTO venta VALUES (1842,'46540292-K','47232966-9','S003','B','22/11/2020',24,13,312);
INSERT INTO venta VALUES (1843,'21525102-0','32531450-8','S001','B','26/07/2020',41,12,492);
INSERT INTO venta VALUES (1844,'7333815-8','24180587-5','S003','A','18/10/2021',21,14,294);
INSERT INTO venta VALUES (1845,'19222587-6','47232966-9','S004','B','15/03/2020',21,15,315);
INSERT INTO venta VALUES (1846,'12864837-2','29374931-0','S002','B','12/10/2020',35,15,525);
INSERT INTO venta VALUES (1847,'5807199-4','24180587-5','S002','B','08/12/2021',30,15,450);
INSERT INTO venta VALUES (1848,'34403852-K','18567395-2','S004','B','14/01/2021',49,13,637);
INSERT INTO venta VALUES (1849,'6265249-7','18567395-2','S004','A','06/03/2021',40,15,600);
INSERT INTO venta VALUES (1850,'17861331-6','46566450-9','S001','A','01/11/2020',48,13,624);
INSERT INTO venta VALUES (1851,'40878137-K','46566450-9','S003','A','11/04/2020',48,15,720);
INSERT INTO venta VALUES (1852,'48233981-6','46566450-9','S003','A','31/07/2020',22,14,308);
INSERT INTO venta VALUES (1853,'14388320-5','47232966-9','S005','A','07/12/2021',24,12,288);
INSERT INTO venta VALUES (1854,'21327989-0','20237862-5','S001','B','29/11/2020',33,14,462);
INSERT INTO venta VALUES (1855,'23480965-2','20237862-5','S002','B','09/11/2020',50,14,700);
INSERT INTO venta VALUES (1856,'4726260-7','29374931-0','S005','A','04/11/2020',18,15,270);
INSERT INTO venta VALUES (1857,'2715114-0','8402711-1','S002','B','23/02/2020',15,12,180);
INSERT INTO venta VALUES (1858,'40225788-1','14315947-7','S004','A','26/11/2020',47,14,658);
INSERT INTO venta VALUES (1859,'4679724-8','18567395-2','S003','A','07/10/2021',33,12,396);
INSERT INTO venta VALUES (1860,'20850795-8','47232966-9','S004','A','17/10/2020',48,13,624);
INSERT INTO venta VALUES (1861,'32732475-6','20237862-5','S003','A','02/11/2021',31,14,434);
INSERT INTO venta VALUES (1862,'47753672-7','8402711-1','S002','A','29/01/2021',36,14,504);
INSERT INTO venta VALUES (1863,'17408118-2','20237862-5','S005','B','01/07/2021',11,13,143);
INSERT INTO venta VALUES (1864,'1755469-7','4810357-K','S003','B','16/09/2021',17,14,238);
INSERT INTO venta VALUES (1865,'10401554-9','8402711-1','S001','B','20/05/2021',17,14,238);
INSERT INTO venta VALUES (1866,'48601711-2','23819125-4','S001','B','24/02/2020',15,12,180);
INSERT INTO venta VALUES (1867,'3238865-5','20237862-5','S003','A','02/04/2021',16,13,208);
INSERT INTO venta VALUES (1868,'49668401-K','14315947-7','S004','B','24/04/2020',36,15,540);
INSERT INTO venta VALUES (1869,'5646861-7','32531450-8','S004','A','20/02/2020',42,15,630);
INSERT INTO venta VALUES (1870,'27340343-4','20237862-5','S001','A','04/10/2020',20,15,300);
INSERT INTO venta VALUES (1871,'18246584-4','45421301-7','S004','A','06/08/2020',36,13,468);
INSERT INTO venta VALUES (1872,'2943424-7','42396509-6','S002','A','06/11/2020',37,13,481);
INSERT INTO venta VALUES (1873,'19430883-3','45421301-7','S003','A','21/07/2021',12,15,180);
INSERT INTO venta VALUES (1874,'44924647-0','23819125-4','S005','A','21/06/2020',21,12,252);
INSERT INTO venta VALUES (1875,'29448746-8','24180587-5','S001','A','17/01/2020',20,13,260);
INSERT INTO venta VALUES (1876,'17881496-6','29374931-0','S001','A','17/02/2021',21,14,294);
INSERT INTO venta VALUES (1877,'4280701-K','29374931-0','S001','B','15/07/2020',23,13,299);
INSERT INTO venta VALUES (1878,'17735202-0','47232966-9','S005','B','05/08/2020',12,15,180);
INSERT INTO venta VALUES (1879,'31158390-5','18567395-2','S003','A','05/12/2020',13,14,182);
INSERT INTO venta VALUES (1880,'36735314-7','47232966-9','S003','B','10/01/2020',35,15,525);
INSERT INTO venta VALUES (1881,'49277310-7','42396509-6','S002','B','27/09/2020',32,12,384);
INSERT INTO venta VALUES (1882,'2284443-1','24180587-5','S001','B','09/04/2021',49,14,686);
INSERT INTO venta VALUES (1883,'30626881-3','23819125-4','S005','B','16/01/2021',23,13,299);
INSERT INTO venta VALUES (1884,'34594149-5','8402711-1','S003','B','26/11/2021',26,14,364);
INSERT INTO venta VALUES (1885,'1687382-9','23819125-4','S001','B','12/09/2020',43,14,602);
INSERT INTO venta VALUES (1886,'18180325-8','14519212-9','S001','A','31/12/2020',18,15,270);
INSERT INTO venta VALUES (1887,'43789569-4','24180587-5','S001','A','09/02/2020',37,13,481);
INSERT INTO venta VALUES (1888,'22619294-8','46566450-9','S005','B','23/04/2021',16,15,240);
INSERT INTO venta VALUES (1889,'333681-6','14315947-7','S002','B','01/09/2020',35,13,455);
INSERT INTO venta VALUES (1890,'45515727-7','20237862-5','S003','A','18/03/2021',39,13,507);
INSERT INTO venta VALUES (1891,'19982868-1','47232966-9','S005','A','13/02/2021',27,12,324);
INSERT INTO venta VALUES (1892,'15270546-8','4810357-K','S003','A','01/10/2020',45,15,675);
INSERT INTO venta VALUES (1893,'7528135-8','23819125-4','S005','B','11/10/2020',48,12,576);
INSERT INTO venta VALUES (1894,'2582198-K','14519212-9','S001','B','05/12/2021',26,12,312);
INSERT INTO venta VALUES (1895,'191086-8','45421301-7','S001','B','30/12/2021',29,15,435);
INSERT INTO venta VALUES (1896,'26190571-K','45421301-7','S002','B','01/07/2020',38,12,456);
INSERT INTO venta VALUES (1897,'833293-2','46566450-9','S002','A','20/04/2020',39,15,585);
INSERT INTO venta VALUES (1898,'20724128-8','18567395-2','S003','B','13/07/2021',10,15,150);
INSERT INTO venta VALUES (1899,'9877805-5','4810357-K','S005','B','10/09/2021',46,15,690);
INSERT INTO venta VALUES (1900,'49557213-7','32531450-8','S001','B','08/04/2020',10,12,120);
INSERT INTO venta VALUES (1901,'35647373-6','8402711-1','S002','A','22/03/2021',34,14,476);
INSERT INTO venta VALUES (1902,'29221233-K','6183303-K','S005','A','09/10/2021',13,14,182);
INSERT INTO venta VALUES (1903,'40926907-9','23819125-4','S004','B','03/08/2020',11,14,154);
INSERT INTO venta VALUES (1904,'9258-4','20237862-5','S004','A','03/05/2020',19,15,285);
INSERT INTO venta VALUES (1905,'24832692-1','42396509-6','S005','A','03/02/2020',43,12,516);
INSERT INTO venta VALUES (1906,'26524609-5','46566450-9','S003','A','23/05/2021',19,14,266);
INSERT INTO venta VALUES (1907,'4974648-2','47232966-9','S003','A','03/06/2020',33,13,429);
INSERT INTO venta VALUES (1908,'17989432-7','47232966-9','S005','A','05/06/2020',19,14,266);
INSERT INTO venta VALUES (1909,'25289704-6','24180587-5','S005','B','21/09/2021',32,14,448);
INSERT INTO venta VALUES (1910,'19271288-2','42396509-6','S005','B','20/03/2020',29,15,435);
INSERT INTO venta VALUES (1911,'5680886-8','4810357-K','S003','A','15/11/2021',16,13,208);
INSERT INTO venta VALUES (1912,'4685879-4','6183303-K','S005','B','09/02/2020',17,12,204);
INSERT INTO venta VALUES (1913,'18513792-9','32531450-8','S005','B','02/06/2020',31,14,434);
INSERT INTO venta VALUES (1914,'15663741-6','20237862-5','S002','A','24/12/2021',44,14,616);
INSERT INTO venta VALUES (1915,'31772728-3','14519212-9','S004','B','02/07/2021',19,15,285);
INSERT INTO venta VALUES (1916,'22660782-K','18567395-2','S001','B','27/02/2020',30,12,360);
INSERT INTO venta VALUES (1917,'19124581-4','42396509-6','S003','B','02/12/2020',34,14,476);
INSERT INTO venta VALUES (1918,'28178116-2','29374931-0','S005','A','02/10/2020',10,13,130);
INSERT INTO venta VALUES (1919,'25633949-8','46566450-9','S003','A','01/12/2020',22,14,308);
INSERT INTO venta VALUES (1920,'49296302-K','6183303-K','S005','B','04/09/2021',45,14,630);
INSERT INTO venta VALUES (1921,'7664889-1','29374931-0','S001','A','28/07/2021',27,13,351);
INSERT INTO venta VALUES (1922,'1741449-6','46566450-9','S001','A','08/09/2021',36,13,468);
INSERT INTO venta VALUES (1923,'2748213-9','47232966-9','S004','B','11/05/2021',23,13,299);
INSERT INTO venta VALUES (1924,'10826186-2','20237862-5','S001','A','10/06/2021',26,13,338);
INSERT INTO venta VALUES (1925,'3438400-2','20237862-5','S002','B','09/10/2021',46,14,644);
INSERT INTO venta VALUES (1926,'9994880-9','42396509-6','S004','A','31/07/2020',40,13,520);
INSERT INTO venta VALUES (1927,'32865337-0','46566450-9','S003','A','03/07/2021',37,12,444);
INSERT INTO venta VALUES (1928,'37849952-6','46566450-9','S004','A','27/03/2021',18,13,234);
INSERT INTO venta VALUES (1929,'8917582-8','6183303-K','S002','A','21/10/2020',38,14,532);
INSERT INTO venta VALUES (1930,'7992294-3','6183303-K','S001','B','16/09/2020',11,15,165);
INSERT INTO venta VALUES (1931,'659110-8','32531450-8','S001','B','25/03/2020',49,15,735);
INSERT INTO venta VALUES (1932,'18766252-4','47232966-9','S001','B','17/10/2021',48,15,720);
INSERT INTO venta VALUES (1933,'22305414-5','8402711-1','S004','B','10/10/2021',34,13,442);
INSERT INTO venta VALUES (1934,'28681326-7','24180587-5','S005','B','04/10/2021',21,15,315);
INSERT INTO venta VALUES (1935,'12800750-4','14315947-7','S004','B','29/07/2020',27,14,378);
INSERT INTO venta VALUES (1936,'43509564-K','42396509-6','S002','B','21/06/2020',45,15,675);
INSERT INTO venta VALUES (1937,'24176673-K','8402711-1','S004','B','05/10/2021',14,13,182);
INSERT INTO venta VALUES (1938,'9454867-5','29374931-0','S002','B','09/11/2021',48,13,624);
INSERT INTO venta VALUES (1939,'30577989-K','18567395-2','S005','B','05/06/2020',39,13,507);
INSERT INTO venta VALUES (1940,'26612311-6','42396509-6','S005','B','03/09/2020',29,12,348);
INSERT INTO venta VALUES (1941,'38445393-7','46566450-9','S002','A','11/10/2020',21,13,273);
INSERT INTO venta VALUES (1942,'13282297-2','32531450-8','S005','B','28/12/2021',46,15,690);
INSERT INTO venta VALUES (1943,'1716359-0','20237862-5','S002','A','26/04/2020',13,14,182);
INSERT INTO venta VALUES (1944,'20504888-K','20237862-5','S002','B','06/06/2020',34,14,476);
INSERT INTO venta VALUES (1945,'38685858-6','18567395-2','S003','A','25/05/2021',27,12,324);
INSERT INTO venta VALUES (1946,'35669888-6','20237862-5','S003','A','27/02/2021',39,14,546);
INSERT INTO venta VALUES (1947,'16820896-0','45421301-7','S005','B','30/05/2020',34,12,408);
INSERT INTO venta VALUES (1948,'77629-7','18567395-2','S002','A','27/05/2021',27,13,351);
INSERT INTO venta VALUES (1949,'36787845-2','23819125-4','S001','B','20/06/2021',43,13,559);
INSERT INTO venta VALUES (1950,'44974580-9','47232966-9','S003','A','10/06/2020',28,12,336);
INSERT INTO venta VALUES (1951,'30936921-1','42396509-6','S002','A','30/03/2021',26,14,364);
INSERT INTO venta VALUES (1952,'26810372-4','46566450-9','S005','B','13/03/2021',49,12,588);
INSERT INTO venta VALUES (1953,'49941275-4','42396509-6','S005','A','13/06/2020',21,14,294);
INSERT INTO venta VALUES (1954,'25291221-5','20237862-5','S005','A','03/02/2021',37,15,555);
INSERT INTO venta VALUES (1955,'15516900-1','23819125-4','S001','B','06/09/2021',48,12,576);
INSERT INTO venta VALUES (1956,'27774169-5','45421301-7','S004','A','22/05/2021',46,13,598);
INSERT INTO venta VALUES (1957,'27714165-5','23819125-4','S005','A','01/09/2021',22,13,286);
INSERT INTO venta VALUES (1958,'3976702-3','8402711-1','S001','A','19/11/2020',22,14,308);
INSERT INTO venta VALUES (1959,'2843191-0','18567395-2','S001','B','27/06/2020',30,15,450);
INSERT INTO venta VALUES (1960,'29362748-7','18567395-2','S004','A','23/06/2020',15,14,210);
INSERT INTO venta VALUES (1961,'7265698-9','46566450-9','S004','B','10/04/2021',30,12,360);
INSERT INTO venta VALUES (1962,'33101952-6','47232966-9','S001','A','16/01/2021',45,13,585);
INSERT INTO venta VALUES (1963,'49867216-7','32531450-8','S002','B','11/12/2020',46,13,598);
INSERT INTO venta VALUES (1964,'5420466-3','4810357-K','S002','A','05/10/2021',48,14,672);
INSERT INTO venta VALUES (1965,'13835414-8','20237862-5','S001','A','30/12/2020',28,12,336);
INSERT INTO venta VALUES (1966,'45621994-2','20237862-5','S002','A','22/10/2020',40,13,520);
INSERT INTO venta VALUES (1967,'23859357-3','42396509-6','S004','A','27/11/2021',33,12,396);
INSERT INTO venta VALUES (1968,'26620304-7','45421301-7','S005','B','11/07/2021',39,15,585);
INSERT INTO venta VALUES (1969,'32180979-0','29374931-0','S005','B','23/09/2021',22,15,330);
INSERT INTO venta VALUES (1970,'10631187-0','24180587-5','S005','B','22/11/2020',39,14,546);
INSERT INTO venta VALUES (1971,'48336413-K','46566450-9','S003','A','26/04/2021',33,14,462);
INSERT INTO venta VALUES (1972,'35457831-K','4810357-K','S004','B','01/06/2020',10,13,130);
INSERT INTO venta VALUES (1973,'25785414-0','46566450-9','S005','B','11/02/2021',33,14,462);
INSERT INTO venta VALUES (1974,'48341931-7','32531450-8','S002','A','04/11/2020',25,14,350);
INSERT INTO venta VALUES (1975,'23299228-K','23819125-4','S001','A','15/08/2021',37,14,518);
INSERT INTO venta VALUES (1976,'12316193-9','32531450-8','S005','A','03/08/2020',38,15,570);
INSERT INTO venta VALUES (1977,'48852-6','46566450-9','S001','A','02/04/2021',37,14,518);
INSERT INTO venta VALUES (1978,'39266461-0','29374931-0','S003','B','10/08/2021',25,12,300);
INSERT INTO venta VALUES (1979,'32546761-4','18567395-2','S001','A','05/12/2021',37,15,555);
INSERT INTO venta VALUES (1980,'48105848-1','8402711-1','S001','B','29/03/2021',32,13,416);
INSERT INTO venta VALUES (1981,'25117198-K','18567395-2','S005','B','17/05/2020',48,13,624);
INSERT INTO venta VALUES (1982,'27326951-7','45421301-7','S001','A','31/05/2020',50,12,600);
INSERT INTO venta VALUES (1983,'33547962-9','45421301-7','S005','B','30/04/2021',32,15,480);
INSERT INTO venta VALUES (1984,'43367850-8','47232966-9','S005','B','07/03/2021',50,15,750);
INSERT INTO venta VALUES (1985,'18473160-6','42396509-6','S001','B','11/09/2021',41,14,574);
INSERT INTO venta VALUES (1986,'29902153-K','45421301-7','S003','A','05/01/2021',49,12,588);
INSERT INTO venta VALUES (1987,'7717517-2','6183303-K','S002','A','08/01/2020',14,15,210);
INSERT INTO venta VALUES (1988,'48466707-1','32531450-8','S002','A','22/10/2021',44,12,528);
INSERT INTO venta VALUES (1989,'43303774-K','23819125-4','S002','A','09/07/2021',47,15,705);
INSERT INTO venta VALUES (1990,'46153150-4','6183303-K','S001','A','22/06/2021',19,14,266);
INSERT INTO venta VALUES (1991,'25902267-3','6183303-K','S005','B','26/08/2020',44,13,572);
INSERT INTO venta VALUES (1992,'25501612-1','18567395-2','S002','B','06/07/2020',33,15,495);
INSERT INTO venta VALUES (1993,'28111191-4','42396509-6','S005','A','29/01/2021',43,15,645);
INSERT INTO venta VALUES (1994,'46656748-5','45421301-7','S004','A','11/03/2021',44,14,616);
INSERT INTO venta VALUES (1995,'26279572-1','14519212-9','S005','B','11/10/2020',25,15,375);
INSERT INTO venta VALUES (1996,'6427641-7','46566450-9','S002','A','26/01/2021',19,15,285);
INSERT INTO venta VALUES (1997,'26484700-1','23819125-4','S005','B','10/07/2020',38,12,456);
INSERT INTO venta VALUES (1998,'18153438-9','14519212-9','S003','A','28/07/2020',14,12,168);
INSERT INTO venta VALUES (1999,'20380351-6','32531450-8','S001','B','17/06/2020',21,14,294);
INSERT INTO venta VALUES (2000,'24204534-3','29374931-0','S001','B','20/09/2020',23,13,299);
INSERT INTO venta VALUES (2001,'26393893-3','45421301-7','S002','B','31/08/2021',21,12,252);
INSERT INTO venta VALUES (2002,'28241890-8','14315947-7','S001','A','23/12/2020',24,12,288);
INSERT INTO venta VALUES (2003,'25342402-8','46566450-9','S005','A','19/08/2020',27,14,378);
INSERT INTO venta VALUES (2004,'38425287-7','6183303-K','S004','B','03/12/2020',11,14,154);
INSERT INTO venta VALUES (2005,'2269681-5','42396509-6','S005','B','02/08/2021',49,13,637);
INSERT INTO venta VALUES (2006,'12906127-8','8402711-1','S003','B','03/06/2020',28,14,392);
INSERT INTO venta VALUES (2007,'12949968-0','6183303-K','S002','B','20/06/2021',39,14,546);
INSERT INTO venta VALUES (2008,'4443244-7','46566450-9','S003','A','02/07/2020',44,13,572);
INSERT INTO venta VALUES (2009,'11482753-3','6183303-K','S003','A','17/10/2021',15,13,195);
INSERT INTO venta VALUES (2010,'464335-6','14315947-7','S003','A','18/03/2021',38,13,494);
INSERT INTO venta VALUES (2011,'36692859-6','8402711-1','S004','A','29/06/2020',27,12,324);
INSERT INTO venta VALUES (2012,'2723837-8','29374931-0','S003','A','09/03/2020',29,12,348);
INSERT INTO venta VALUES (2013,'1890312-1','23819125-4','S001','B','17/03/2020',13,14,182);
INSERT INTO venta VALUES (2014,'12822975-2','46566450-9','S001','B','31/07/2021',38,13,494);
INSERT INTO venta VALUES (2015,'3354319-0','14315947-7','S002','B','17/11/2020',27,15,405);
INSERT INTO venta VALUES (2016,'13327230-5','32531450-8','S005','A','04/12/2020',19,12,228);
INSERT INTO venta VALUES (2017,'44254417-4','42396509-6','S005','A','24/11/2021',43,12,516);
INSERT INTO venta VALUES (2018,'10515997-8','29374931-0','S005','A','27/09/2021',34,12,408);
INSERT INTO venta VALUES (2019,'2560108-4','32531450-8','S005','B','15/11/2020',49,14,686);
INSERT INTO venta VALUES (2020,'33888803-1','14315947-7','S003','B','03/03/2021',29,13,377);
INSERT INTO venta VALUES (2021,'3312803-7','18567395-2','S001','A','24/02/2020',40,12,480);
INSERT INTO venta VALUES (2022,'42224976-1','32531450-8','S001','B','15/09/2020',33,15,495);
INSERT INTO venta VALUES (2023,'22950386-3','4810357-K','S002','B','03/03/2020',23,13,299);
INSERT INTO venta VALUES (2024,'45952563-7','32531450-8','S002','B','13/09/2020',45,15,675);
INSERT INTO venta VALUES (2025,'32678177-0','14519212-9','S003','A','11/03/2021',39,12,468);
INSERT INTO venta VALUES (2026,'44597831-0','23819125-4','S004','B','30/07/2020',24,14,336);
INSERT INTO venta VALUES (2027,'12674508-7','8402711-1','S002','B','12/02/2020',32,13,416);
INSERT INTO venta VALUES (2028,'33723826-2','23819125-4','S003','A','17/12/2020',47,14,658);
INSERT INTO venta VALUES (2029,'2152299-6','29374931-0','S004','B','30/09/2020',18,12,216);
INSERT INTO venta VALUES (2030,'40709835-8','29374931-0','S002','A','04/06/2021',39,14,546);
INSERT INTO venta VALUES (2031,'1934695-1','29374931-0','S005','A','21/10/2020',48,12,576);
INSERT INTO venta VALUES (2032,'17262729-3','6183303-K','S003','B','18/12/2020',42,14,588);
INSERT INTO venta VALUES (2033,'42634999-K','8402711-1','S003','A','21/10/2021',17,12,204);
INSERT INTO venta VALUES (2034,'12868975-3','24180587-5','S004','A','20/12/2020',16,14,224);
INSERT INTO venta VALUES (2035,'19950463-0','8402711-1','S003','B','23/06/2021',18,15,270);
INSERT INTO venta VALUES (2036,'35301718-7','23819125-4','S001','A','29/12/2020',28,14,392);
INSERT INTO venta VALUES (2037,'7697976-6','23819125-4','S003','B','10/06/2021',25,13,325);
INSERT INTO venta VALUES (2038,'39657376-8','32531450-8','S004','B','06/09/2021',28,15,420);
INSERT INTO venta VALUES (2039,'858411-7','32531450-8','S003','A','12/11/2020',26,15,390);
INSERT INTO venta VALUES (2040,'39475237-1','18567395-2','S004','A','11/06/2020',47,15,705);
INSERT INTO venta VALUES (2041,'17162191-7','8402711-1','S004','B','23/03/2021',40,15,600);
INSERT INTO venta VALUES (2042,'4633906-1','45421301-7','S004','B','05/03/2020',38,15,570);
INSERT INTO venta VALUES (2043,'44228716-3','18567395-2','S002','A','08/04/2020',12,12,144);
INSERT INTO venta VALUES (2044,'37850321-3','29374931-0','S001','B','17/11/2021',19,14,266);
INSERT INTO venta VALUES (2045,'7652770-9','24180587-5','S002','B','01/06/2020',17,14,238);
INSERT INTO venta VALUES (2046,'20570733-6','14519212-9','S002','A','30/06/2020',49,12,588);
INSERT INTO venta VALUES (2047,'31373578-8','47232966-9','S003','A','09/05/2020',41,14,574);
INSERT INTO venta VALUES (2048,'13119171-5','4810357-K','S004','A','20/08/2020',27,13,351);
INSERT INTO venta VALUES (2049,'1326116-4','24180587-5','S004','A','30/10/2021',24,13,312);
INSERT INTO venta VALUES (2050,'8471496-8','14519212-9','S002','B','18/03/2021',45,12,540);
INSERT INTO venta VALUES (2051,'45463922-7','8402711-1','S005','A','26/02/2021',21,12,252);
INSERT INTO venta VALUES (2052,'4795965-9','4810357-K','S003','A','02/02/2020',37,15,555);
INSERT INTO venta VALUES (2053,'1985837-5','42396509-6','S005','A','11/01/2020',28,12,336);
INSERT INTO venta VALUES (2054,'2632416-5','42396509-6','S004','A','28/03/2021',13,12,156);
INSERT INTO venta VALUES (2055,'7870174-9','8402711-1','S004','B','06/07/2020',43,15,645);
INSERT INTO venta VALUES (2056,'9640216-3','45421301-7','S004','A','28/02/2020',34,14,476);
INSERT INTO venta VALUES (2057,'323954-3','32531450-8','S001','A','20/01/2021',12,12,144);
INSERT INTO venta VALUES (2058,'3779314-0','47232966-9','S005','A','03/04/2020',10,12,120);
INSERT INTO venta VALUES (2059,'22668708-4','32531450-8','S005','B','19/10/2020',38,12,456);
INSERT INTO venta VALUES (2060,'4363197-7','20237862-5','S005','B','22/06/2021',49,15,735);
INSERT INTO venta VALUES (2061,'17402870-2','6183303-K','S005','A','11/05/2021',36,15,540);
INSERT INTO venta VALUES (2062,'15985913-4','14315947-7','S004','B','02/02/2020',46,12,552);
INSERT INTO venta VALUES (2063,'22962413-K','14315947-7','S004','A','02/07/2021',47,13,611);
INSERT INTO venta VALUES (2064,'784324-0','4810357-K','S001','A','18/11/2020',35,14,490);
INSERT INTO venta VALUES (2065,'46573375-6','32531450-8','S005','B','17/10/2021',46,14,644);
INSERT INTO venta VALUES (2066,'26173173-8','45421301-7','S002','B','21/04/2020',23,15,345);
INSERT INTO venta VALUES (2067,'3777041-8','4810357-K','S003','B','07/04/2020',31,15,465);
INSERT INTO venta VALUES (2068,'37608953-3','24180587-5','S005','B','20/04/2021',42,12,504);
INSERT INTO venta VALUES (2069,'3920779-6','8402711-1','S003','B','02/04/2021',32,13,416);
INSERT INTO venta VALUES (2070,'38693717-6','8402711-1','S005','B','20/03/2020',34,13,442);
INSERT INTO venta VALUES (2071,'27939428-3','46566450-9','S001','B','01/12/2021',12,13,156);
INSERT INTO venta VALUES (2072,'22451273-2','14519212-9','S005','B','13/06/2020',49,13,637);
INSERT INTO venta VALUES (2073,'8521947-2','8402711-1','S003','A','10/05/2020',43,14,602);
INSERT INTO venta VALUES (2074,'9598155-0','24180587-5','S001','A','25/08/2021',45,13,585);
INSERT INTO venta VALUES (2075,'39282475-8','42396509-6','S002','B','03/12/2020',31,12,372);
INSERT INTO venta VALUES (2076,'14649226-6','46566450-9','S003','B','01/04/2020',43,14,602);
INSERT INTO venta VALUES (2077,'45291827-7','6183303-K','S001','A','30/08/2021',41,12,492);
INSERT INTO venta VALUES (2078,'46533262-K','14315947-7','S002','A','22/11/2020',29,14,406);
INSERT INTO venta VALUES (2079,'3771417-8','8402711-1','S001','A','28/04/2020',14,13,182);
INSERT INTO venta VALUES (2080,'33163155-8','14519212-9','S001','B','14/04/2021',39,12,468);
INSERT INTO venta VALUES (2081,'17414897-K','42396509-6','S003','B','24/03/2021',39,13,507);
INSERT INTO venta VALUES (2082,'15197648-4','18567395-2','S002','A','13/11/2021',19,12,228);
INSERT INTO venta VALUES (2083,'724295-6','32531450-8','S002','A','01/05/2021',34,12,408);
INSERT INTO venta VALUES (2084,'15727662-K','23819125-4','S004','A','27/07/2020',30,12,360);
INSERT INTO venta VALUES (2085,'27310657-K','29374931-0','S002','B','03/05/2021',47,13,611);
INSERT INTO venta VALUES (2086,'241344-2','46566450-9','S004','B','03/01/2020',33,14,462);
INSERT INTO venta VALUES (2087,'7690652-1','24180587-5','S005','B','01/03/2020',23,13,299);
INSERT INTO venta VALUES (2088,'36178672-6','47232966-9','S001','A','17/09/2021',32,12,384);
INSERT INTO venta VALUES (2089,'8531489-0','24180587-5','S002','A','08/08/2020',33,14,462);
INSERT INTO venta VALUES (2090,'35707554-8','24180587-5','S002','A','05/08/2020',17,15,255);
INSERT INTO venta VALUES (2091,'18605597-7','23819125-4','S005','A','29/07/2020',25,13,325);
INSERT INTO venta VALUES (2092,'14457237-8','42396509-6','S005','A','07/03/2021',44,14,616);
INSERT INTO venta VALUES (2093,'34905567-8','8402711-1','S003','B','22/12/2020',24,15,360);
INSERT INTO venta VALUES (2094,'2426896-9','23819125-4','S002','B','31/07/2020',49,15,735);
INSERT INTO venta VALUES (2095,'39771947-2','14315947-7','S002','B','21/08/2020',24,14,336);
INSERT INTO venta VALUES (2096,'36697535-7','45421301-7','S001','A','30/01/2021',39,12,468);
INSERT INTO venta VALUES (2097,'50111203-8','47232966-9','S001','B','16/02/2021',23,14,322);
INSERT INTO venta VALUES (2098,'5624553-7','32531450-8','S002','B','02/08/2020',23,12,276);
INSERT INTO venta VALUES (2099,'1723172-3','14519212-9','S001','B','23/08/2020',49,14,686);
INSERT INTO venta VALUES (2100,'40851728-1','14315947-7','S004','B','14/07/2021',26,14,364);
INSERT INTO venta VALUES (2101,'15303262-9','47232966-9','S005','B','22/02/2021',28,15,420);
INSERT INTO venta VALUES (2102,'31272855-9','14315947-7','S001','A','11/09/2020',34,13,442);
INSERT INTO venta VALUES (2103,'24308974-3','46566450-9','S003','A','22/09/2020',24,15,360);
INSERT INTO venta VALUES (2104,'37942920-3','45421301-7','S001','A','14/05/2020',14,13,182);
INSERT INTO venta VALUES (2105,'15976879-1','14519212-9','S005','B','08/06/2021',31,14,434);
INSERT INTO venta VALUES (2106,'22941315-5','18567395-2','S002','B','02/03/2020',23,12,276);
INSERT INTO venta VALUES (2107,'11146117-1','18567395-2','S002','A','18/03/2021',33,15,495);
INSERT INTO venta VALUES (2108,'18993555-2','20237862-5','S004','A','14/08/2020',36,14,504);
INSERT INTO venta VALUES (2109,'6828569-0','24180587-5','S004','B','26/11/2021',36,15,540);
INSERT INTO venta VALUES (2110,'8910706-7','18567395-2','S004','A','12/08/2020',49,14,686);
INSERT INTO venta VALUES (2111,'37538683-6','24180587-5','S003','B','13/02/2020',11,15,165);
INSERT INTO venta VALUES (2112,'49506917-6','24180587-5','S005','A','28/04/2021',44,12,528);
INSERT INTO venta VALUES (2113,'26465143-3','14315947-7','S003','A','26/08/2020',18,15,270);
INSERT INTO venta VALUES (2114,'12863360-K','20237862-5','S002','A','26/08/2020',45,14,630);
INSERT INTO venta VALUES (2115,'35464842-3','23819125-4','S001','A','24/07/2020',26,14,364);
INSERT INTO venta VALUES (2116,'49228383-5','14315947-7','S001','B','18/09/2021',15,12,180);
INSERT INTO venta VALUES (2117,'4843648-K','18567395-2','S001','A','04/05/2021',45,15,675);
INSERT INTO venta VALUES (2118,'36710570-4','8402711-1','S004','A','19/10/2021',16,15,240);
INSERT INTO venta VALUES (2119,'36463590-7','14315947-7','S002','A','01/10/2020',26,12,312);
INSERT INTO venta VALUES (2120,'49261260-K','45421301-7','S002','A','25/01/2020',31,13,403);
INSERT INTO venta VALUES (2121,'67016-2','8402711-1','S002','B','16/11/2021',12,13,156);
INSERT INTO venta VALUES (2122,'17247534-5','45421301-7','S005','A','05/03/2021',48,12,576);
INSERT INTO venta VALUES (2123,'42666994-3','45421301-7','S002','B','24/09/2020',39,13,507);
INSERT INTO venta VALUES (2124,'9513916-7','20237862-5','S003','A','19/01/2020',29,12,348);
INSERT INTO venta VALUES (2125,'50344810-6','47232966-9','S002','A','19/11/2020',10,12,120);
INSERT INTO venta VALUES (2126,'478918-0','6183303-K','S001','B','13/03/2021',10,12,120);
INSERT INTO venta VALUES (2127,'49880234-6','42396509-6','S002','B','17/03/2020',16,13,208);
INSERT INTO venta VALUES (2128,'13931994-K','8402711-1','S005','A','01/03/2021',33,15,495);
INSERT INTO venta VALUES (2129,'46490831-5','8402711-1','S004','A','10/09/2020',20,13,260);
INSERT INTO venta VALUES (2130,'31103598-3','14519212-9','S002','A','11/11/2021',29,15,435);
INSERT INTO venta VALUES (2131,'25918150-K','14315947-7','S003','B','26/03/2021',16,14,224);
INSERT INTO venta VALUES (2132,'3528420-6','18567395-2','S004','B','11/08/2020',50,13,650);
INSERT INTO venta VALUES (2133,'35579147-5','14315947-7','S001','B','04/08/2020',40,12,480);
INSERT INTO venta VALUES (2134,'31603398-9','14519212-9','S002','B','01/05/2021',43,12,516);
INSERT INTO venta VALUES (2135,'33672606-9','6183303-K','S002','A','02/07/2020',29,15,435);
INSERT INTO venta VALUES (2136,'47352241-1','8402711-1','S002','A','17/03/2020',12,12,144);
INSERT INTO venta VALUES (2137,'19928743-5','45421301-7','S001','A','09/07/2021',10,12,120);
INSERT INTO venta VALUES (2138,'43838491-K','14315947-7','S003','A','26/01/2021',14,12,168);
INSERT INTO venta VALUES (2139,'48440778-9','14315947-7','S005','B','22/09/2020',26,15,390);
INSERT INTO venta VALUES (2140,'3596015-5','20237862-5','S003','A','10/05/2021',22,14,308);
INSERT INTO venta VALUES (2141,'41955593-2','20237862-5','S004','B','17/11/2021',27,12,324);
INSERT INTO venta VALUES (2142,'38253942-7','6183303-K','S001','B','21/06/2020',43,12,516);
INSERT INTO venta VALUES (2143,'26671316-9','14519212-9','S001','B','11/03/2021',16,14,224);
INSERT INTO venta VALUES (2144,'8277892-6','29374931-0','S004','B','08/06/2020',37,15,555);
INSERT INTO venta VALUES (2145,'8759565-K','24180587-5','S001','B','14/11/2021',29,13,377);
INSERT INTO venta VALUES (2146,'13869214-0','23819125-4','S004','B','22/06/2021',34,12,408);
INSERT INTO venta VALUES (2147,'6752700-3','45421301-7','S004','A','13/08/2021',15,12,180);
INSERT INTO venta VALUES (2148,'449367-2','46566450-9','S004','B','20/05/2020',21,14,294);
INSERT INTO venta VALUES (2149,'3812859-0','4810357-K','S004','A','10/12/2020',33,15,495);
INSERT INTO venta VALUES (2150,'14258794-7','24180587-5','S003','A','23/09/2021',50,12,600);
INSERT INTO venta VALUES (2151,'46540292-K','46566450-9','S001','A','12/11/2021',22,15,330);
INSERT INTO venta VALUES (2152,'21525102-0','8402711-1','S004','A','01/07/2021',39,14,546);
INSERT INTO venta VALUES (2153,'7333815-8','8402711-1','S003','B','25/03/2021',33,15,495);
INSERT INTO venta VALUES (2154,'19222587-6','24180587-5','S004','A','10/06/2021',41,15,615);
INSERT INTO venta VALUES (2155,'12864837-2','8402711-1','S002','B','17/06/2021',20,12,240);
INSERT INTO venta VALUES (2156,'5807199-4','6183303-K','S004','A','10/02/2020',17,15,255);
INSERT INTO venta VALUES (2157,'34403852-K','45421301-7','S003','B','10/10/2020',30,14,420);
INSERT INTO venta VALUES (2158,'6265249-7','14315947-7','S004','A','21/04/2020',26,15,390);
INSERT INTO venta VALUES (2159,'17861331-6','20237862-5','S002','A','28/04/2020',28,15,420);
INSERT INTO venta VALUES (2160,'40878137-K','32531450-8','S003','B','26/12/2021',32,14,448);
INSERT INTO venta VALUES (2161,'48233981-6','6183303-K','S002','B','27/11/2021',24,13,312);
INSERT INTO venta VALUES (2162,'14388320-5','6183303-K','S002','B','09/02/2021',43,14,602);
INSERT INTO venta VALUES (2163,'21327989-0','14519212-9','S004','B','07/10/2021',11,14,154);
INSERT INTO venta VALUES (2164,'23480965-2','46566450-9','S005','B','24/11/2021',20,15,300);
INSERT INTO venta VALUES (2165,'4726260-7','18567395-2','S005','A','04/11/2021',28,13,364);
INSERT INTO venta VALUES (2166,'2715114-0','23819125-4','S001','A','13/06/2020',50,14,700);
INSERT INTO venta VALUES (2167,'40225788-1','23819125-4','S002','A','21/09/2021',28,13,364);
INSERT INTO venta VALUES (2168,'4679724-8','8402711-1','S002','B','17/11/2020',26,15,390);
INSERT INTO venta VALUES (2169,'20850795-8','20237862-5','S005','A','23/06/2020',47,12,564);
INSERT INTO venta VALUES (2170,'32732475-6','8402711-1','S003','B','01/05/2021',42,15,630);
INSERT INTO venta VALUES (2171,'47753672-7','20237862-5','S004','A','13/05/2021',30,12,360);
INSERT INTO venta VALUES (2172,'17408118-2','8402711-1','S002','A','09/02/2021',48,13,624);
INSERT INTO venta VALUES (2173,'1755469-7','6183303-K','S002','B','27/06/2020',17,15,255);
INSERT INTO venta VALUES (2174,'10401554-9','6183303-K','S001','B','21/06/2021',44,13,572);
INSERT INTO venta VALUES (2175,'48601711-2','20237862-5','S001','B','25/04/2020',12,12,144);
INSERT INTO venta VALUES (2176,'3238865-5','14519212-9','S004','A','15/10/2021',49,14,686);
INSERT INTO venta VALUES (2177,'49668401-K','29374931-0','S002','B','18/01/2020',46,14,644);
INSERT INTO venta VALUES (2178,'5646861-7','20237862-5','S001','A','12/11/2020',28,12,336);
INSERT INTO venta VALUES (2179,'27340343-4','20237862-5','S003','B','06/04/2021',11,13,143);
INSERT INTO venta VALUES (2180,'18246584-4','23819125-4','S001','B','29/05/2020',39,14,546);
INSERT INTO venta VALUES (2181,'2943424-7','14519212-9','S002','B','15/11/2020',50,14,700);
INSERT INTO venta VALUES (2182,'19430883-3','45421301-7','S001','A','03/01/2020',29,15,435);
INSERT INTO venta VALUES (2183,'44924647-0','42396509-6','S004','A','25/11/2021',36,14,504);
INSERT INTO venta VALUES (2184,'29448746-8','18567395-2','S005','A','02/07/2021',42,14,588);
INSERT INTO venta VALUES (2185,'17881496-6','14519212-9','S005','A','24/07/2020',12,12,144);
INSERT INTO venta VALUES (2186,'4280701-K','14519212-9','S001','A','13/11/2020',30,14,420);
INSERT INTO venta VALUES (2187,'17735202-0','29374931-0','S005','A','29/03/2021',40,12,480);
INSERT INTO venta VALUES (2188,'31158390-5','47232966-9','S005','B','09/10/2021',12,15,180);
INSERT INTO venta VALUES (2189,'36735314-7','14519212-9','S005','A','02/05/2021',18,13,234);
INSERT INTO venta VALUES (2190,'49277310-7','42396509-6','S002','B','11/03/2020',27,15,405);
INSERT INTO venta VALUES (2191,'2284443-1','18567395-2','S001','A','18/10/2020',11,12,132);
INSERT INTO venta VALUES (2192,'30626881-3','45421301-7','S003','B','21/09/2020',30,13,390);
INSERT INTO venta VALUES (2193,'34594149-5','32531450-8','S003','A','26/06/2021',26,15,390);
INSERT INTO venta VALUES (2194,'1687382-9','46566450-9','S003','A','19/01/2020',25,13,325);
INSERT INTO venta VALUES (2195,'18180325-8','24180587-5','S001','B','03/09/2020',49,14,686);
INSERT INTO venta VALUES (2196,'43789569-4','29374931-0','S001','B','02/04/2020',49,12,588);
INSERT INTO venta VALUES (2197,'22619294-8','14315947-7','S002','A','16/12/2021',44,15,660);
INSERT INTO venta VALUES (2198,'333681-6','23819125-4','S003','A','02/06/2021',14,15,210);
INSERT INTO venta VALUES (2199,'45515727-7','32531450-8','S002','A','25/01/2020',36,12,432);
INSERT INTO venta VALUES (2200,'19982868-1','6183303-K','S002','A','08/11/2021',10,15,150);
INSERT INTO venta VALUES (2201,'15270546-8','47232966-9','S005','A','18/02/2021',25,13,325);
INSERT INTO venta VALUES (2202,'7528135-8','20237862-5','S005','B','08/03/2021',16,12,192);
INSERT INTO venta VALUES (2203,'2582198-K','32531450-8','S004','B','08/06/2021',17,12,204);
INSERT INTO venta VALUES (2204,'191086-8','8402711-1','S005','A','09/04/2020',29,12,348);
INSERT INTO venta VALUES (2205,'26190571-K','23819125-4','S003','B','17/03/2021',26,13,338);
INSERT INTO venta VALUES (2206,'833293-2','32531450-8','S001','A','28/01/2021',19,15,285);
INSERT INTO venta VALUES (2207,'20724128-8','45421301-7','S001','A','18/12/2021',20,13,260);
INSERT INTO venta VALUES (2208,'9877805-5','45421301-7','S003','A','27/12/2020',28,14,392);
INSERT INTO venta VALUES (2209,'49557213-7','8402711-1','S002','A','21/05/2020',50,12,600);
INSERT INTO venta VALUES (2210,'35647373-6','20237862-5','S002','B','11/02/2020',44,15,660);
INSERT INTO venta VALUES (2211,'29221233-K','32531450-8','S002','B','22/07/2020',19,12,228);
INSERT INTO venta VALUES (2212,'40926907-9','29374931-0','S001','B','30/11/2020',48,14,672);
INSERT INTO venta VALUES (2213,'9258-4','46566450-9','S004','B','02/07/2021',47,13,611);
INSERT INTO venta VALUES (2214,'24832692-1','42396509-6','S001','A','02/07/2020',11,15,165);
INSERT INTO venta VALUES (2215,'26524609-5','8402711-1','S004','A','01/07/2021',46,14,644);
INSERT INTO venta VALUES (2216,'4974648-2','14519212-9','S004','B','09/01/2020',36,13,468);
INSERT INTO venta VALUES (2217,'17989432-7','32531450-8','S002','A','12/08/2020',19,15,285);
INSERT INTO venta VALUES (2218,'25289704-6','14519212-9','S002','A','14/01/2020',39,12,468);
INSERT INTO venta VALUES (2219,'46705421-K','4810357-K','S003','A','16/03/2021',28,14,392);
INSERT INTO venta VALUES (2220,'9701205-9','32531450-8','S005','A','12/11/2021',34,13,442);
INSERT INTO venta VALUES (2221,'29230123-5','45421301-7','S004','B','30/04/2021',32,14,448);
INSERT INTO venta VALUES (2222,'19271288-2','14315947-7','S004','A','08/10/2021',11,13,143);
INSERT INTO venta VALUES (2223,'5680886-8','45421301-7','S004','A','24/09/2020',39,15,585);
INSERT INTO venta VALUES (2224,'4685879-4','23819125-4','S002','B','09/09/2021',20,14,280);
INSERT INTO venta VALUES (2225,'18513792-9','6183303-K','S001','A','07/07/2020',13,14,182);
INSERT INTO venta VALUES (2226,'15663741-6','47232966-9','S003','B','21/11/2021',20,13,260);
INSERT INTO venta VALUES (2227,'31772728-3','20237862-5','S005','B','25/07/2020',42,13,546);
INSERT INTO venta VALUES (2228,'22660782-K','32531450-8','S005','B','13/02/2021',15,13,195);
INSERT INTO venta VALUES (2229,'19124581-4','46566450-9','S005','B','04/12/2021',38,14,532);
INSERT INTO venta VALUES (2230,'28178116-2','18567395-2','S004','B','20/07/2021',33,14,462);
INSERT INTO venta VALUES (2231,'25633949-8','14315947-7','S004','B','15/09/2021',14,15,210);
INSERT INTO venta VALUES (2232,'49296302-K','32531450-8','S003','A','11/03/2021',23,13,299);
INSERT INTO venta VALUES (2233,'7664889-1','4810357-K','S003','A','17/04/2020',42,13,546);
INSERT INTO venta VALUES (2234,'1741449-6','47232966-9','S001','B','05/12/2020',21,13,273);
INSERT INTO venta VALUES (2235,'2748213-9','42396509-6','S004','A','11/09/2021',33,12,396);
INSERT INTO venta VALUES (2236,'10826186-2','29374931-0','S004','A','20/02/2020',32,15,480);
INSERT INTO venta VALUES (2237,'3438400-2','42396509-6','S003','A','04/02/2020',32,14,448);
INSERT INTO venta VALUES (2238,'9994880-9','24180587-5','S005','B','24/11/2020',41,15,615);
INSERT INTO venta VALUES (2239,'32865337-0','4810357-K','S002','A','03/01/2020',47,12,564);
INSERT INTO venta VALUES (2240,'37849952-6','18567395-2','S003','B','28/12/2021',23,13,299);
INSERT INTO venta VALUES (2241,'8917582-8','18567395-2','S001','A','28/11/2020',11,13,143);
INSERT INTO venta VALUES (2242,'7992294-3','24180587-5','S004','A','31/10/2020',16,12,192);
INSERT INTO venta VALUES (2243,'659110-8','24180587-5','S002','A','29/05/2021',10,13,130);
INSERT INTO venta VALUES (2244,'18766252-4','18567395-2','S003','A','03/05/2021',31,15,465);
INSERT INTO venta VALUES (2245,'22305414-5','20237862-5','S001','A','23/01/2020',27,15,405);
INSERT INTO venta VALUES (2246,'28681326-7','42396509-6','S002','B','27/10/2021',34,12,408);
INSERT INTO venta VALUES (2247,'12800750-4','14315947-7','S003','B','13/01/2021',25,13,325);
INSERT INTO venta VALUES (2248,'43509564-K','47232966-9','S004','B','29/09/2021',18,15,270);
INSERT INTO venta VALUES (2249,'24176673-K','42396509-6','S001','A','18/05/2021',49,14,686);
INSERT INTO venta VALUES (2250,'9454867-5','23819125-4','S003','A','19/08/2020',28,14,392);
INSERT INTO venta VALUES (2251,'30577989-K','45421301-7','S005','A','11/02/2021',45,13,585);
INSERT INTO venta VALUES (2252,'26612311-6','47232966-9','S002','A','08/06/2020',42,12,504);
INSERT INTO venta VALUES (2253,'38445393-7','42396509-6','S004','A','03/03/2020',28,14,392);
INSERT INTO venta VALUES (2254,'13282297-2','14519212-9','S002','A','02/04/2021',12,15,180);
INSERT INTO venta VALUES (2255,'1716359-0','46566450-9','S004','A','27/01/2021',22,14,308);
INSERT INTO venta VALUES (2256,'20504888-K','6183303-K','S004','B','02/01/2021',43,14,602);
INSERT INTO venta VALUES (2257,'38685858-6','47232966-9','S003','B','06/10/2021',50,15,750);
INSERT INTO venta VALUES (2258,'35669888-6','46566450-9','S003','A','15/07/2020',14,14,196);
INSERT INTO venta VALUES (2259,'16820896-0','24180587-5','S004','B','25/07/2020',10,15,150);
INSERT INTO venta VALUES (2260,'77629-7','42396509-6','S001','A','28/01/2021',50,15,750);
INSERT INTO venta VALUES (2261,'36787845-2','32531450-8','S004','A','30/07/2020',24,15,360);
INSERT INTO venta VALUES (2262,'44974580-9','14519212-9','S003','A','03/08/2020',37,13,481);
INSERT INTO venta VALUES (2263,'30936921-1','14315947-7','S003','B','16/10/2021',22,12,264);
INSERT INTO venta VALUES (2264,'26810372-4','29374931-0','S001','B','01/08/2021',21,15,315);
INSERT INTO venta VALUES (2265,'49941275-4','42396509-6','S001','B','24/08/2021',15,12,180);
INSERT INTO venta VALUES (2266,'25291221-5','46566450-9','S003','B','05/12/2020',43,13,559);
INSERT INTO venta VALUES (2267,'15516900-1','23819125-4','S005','A','19/06/2021',47,15,705);
INSERT INTO venta VALUES (2268,'27774169-5','45421301-7','S001','A','24/07/2021',19,15,285);
INSERT INTO venta VALUES (2269,'27714165-5','29374931-0','S005','A','12/02/2021',28,13,364);
INSERT INTO venta VALUES (2270,'3976702-3','14315947-7','S002','B','02/11/2020',20,15,300);
INSERT INTO venta VALUES (2271,'2843191-0','46566450-9','S003','B','17/10/2021',26,12,312);
INSERT INTO venta VALUES (2272,'29362748-7','23819125-4','S001','A','03/06/2020',42,15,630);
INSERT INTO venta VALUES (2273,'7265698-9','14519212-9','S004','B','21/10/2021',17,14,238);
INSERT INTO venta VALUES (2274,'33101952-6','46566450-9','S003','B','05/11/2020',19,12,228);
INSERT INTO venta VALUES (2275,'49867216-7','29374931-0','S001','A','19/04/2020',13,14,182);
INSERT INTO venta VALUES (2276,'5420466-3','29374931-0','S001','A','18/03/2021',26,14,364);
INSERT INTO venta VALUES (2277,'13835414-8','23819125-4','S002','B','14/05/2020',31,15,465);
INSERT INTO venta VALUES (2278,'45621994-2','4810357-K','S002','A','25/07/2020',18,12,216);
INSERT INTO venta VALUES (2279,'23859357-3','23819125-4','S002','B','23/07/2021',32,14,448);
INSERT INTO venta VALUES (2280,'26620304-7','42396509-6','S005','B','20/11/2021',19,14,266);
INSERT INTO venta VALUES (2281,'32180979-0','6183303-K','S002','B','08/09/2021',13,12,156);
INSERT INTO venta VALUES (2282,'10631187-0','20237862-5','S002','A','19/05/2020',14,12,168);
INSERT INTO venta VALUES (2283,'48336413-K','32531450-8','S003','B','26/11/2020',50,13,650);
INSERT INTO venta VALUES (2284,'35457831-K','42396509-6','S002','A','17/04/2021',19,13,247);
INSERT INTO venta VALUES (2285,'25785414-0','29374931-0','S005','B','22/07/2020',35,14,490);
INSERT INTO venta VALUES (2286,'48341931-7','45421301-7','S002','A','04/11/2020',28,15,420);
INSERT INTO venta VALUES (2287,'23299228-K','47232966-9','S002','B','08/10/2021',37,14,518);
INSERT INTO venta VALUES (2288,'12316193-9','45421301-7','S003','B','09/01/2020',45,14,630);
INSERT INTO venta VALUES (2289,'48852-6','6183303-K','S003','A','27/02/2020',22,15,330);
INSERT INTO venta VALUES (2290,'39266461-0','46566450-9','S005','B','13/10/2021',12,13,156);
INSERT INTO venta VALUES (2291,'32546761-4','18567395-2','S003','B','19/06/2021',15,13,195);
INSERT INTO venta VALUES (2292,'48105848-1','4810357-K','S001','B','27/02/2021',42,15,630);
INSERT INTO venta VALUES (2293,'25117198-K','42396509-6','S004','A','29/01/2021',24,14,336);
INSERT INTO venta VALUES (2294,'27326951-7','8402711-1','S005','B','06/12/2020',30,13,390);
INSERT INTO venta VALUES (2295,'33547962-9','46566450-9','S001','A','12/06/2020',40,12,480);
INSERT INTO venta VALUES (2296,'43367850-8','14519212-9','S002','A','13/08/2021',28,15,420);
INSERT INTO venta VALUES (2297,'18473160-6','14519212-9','S001','B','02/01/2021',37,12,444);
INSERT INTO venta VALUES (2298,'29902153-K','29374931-0','S002','A','15/05/2021',21,15,315);
INSERT INTO venta VALUES (2299,'7717517-2','23819125-4','S003','B','07/04/2020',18,15,270);
INSERT INTO venta VALUES (2300,'48466707-1','24180587-5','S003','A','18/06/2021',14,15,210);
INSERT INTO venta VALUES (2301,'43303774-K','8402711-1','S001','B','24/03/2021',23,14,322);
INSERT INTO venta VALUES (2302,'46153150-4','8402711-1','S001','B','08/05/2021',18,14,252);
INSERT INTO venta VALUES (2303,'25902267-3','46566450-9','S001','B','15/11/2020',22,12,264);
INSERT INTO venta VALUES (2304,'25501612-1','20237862-5','S003','A','09/04/2021',34,13,442);
INSERT INTO venta VALUES (2305,'28111191-4','8402711-1','S005','A','12/01/2021',46,12,552);
INSERT INTO venta VALUES (2306,'46656748-5','45421301-7','S004','B','24/04/2020',48,15,720);
INSERT INTO venta VALUES (2307,'26279572-1','32531450-8','S002','B','11/12/2021',23,13,299);
INSERT INTO venta VALUES (2308,'6427641-7','29374931-0','S005','A','26/07/2020',14,15,210);
INSERT INTO venta VALUES (2309,'26484700-1','23819125-4','S002','B','20/05/2020',48,14,672);
INSERT INTO venta VALUES (2310,'18153438-9','18567395-2','S004','A','01/05/2021',47,14,658);
INSERT INTO venta VALUES (2311,'20380351-6','14315947-7','S002','B','03/07/2021',45,15,675);
INSERT INTO venta VALUES (2312,'24204534-3','23819125-4','S001','A','22/07/2021',24,13,312);
INSERT INTO venta VALUES (2313,'26393893-3','4810357-K','S003','A','06/09/2020',14,14,196);
INSERT INTO venta VALUES (2314,'28241890-8','29374931-0','S003','A','12/06/2020',46,13,598);
INSERT INTO venta VALUES (2315,'25342402-8','23819125-4','S002','A','27/07/2020',34,13,442);
INSERT INTO venta VALUES (2316,'38425287-7','42396509-6','S002','B','16/03/2020',25,13,325);
INSERT INTO venta VALUES (2317,'2269681-5','6183303-K','S001','B','06/02/2021',26,13,338);
INSERT INTO venta VALUES (2318,'12906127-8','14519212-9','S002','B','25/02/2021',15,14,210);
INSERT INTO venta VALUES (2319,'12949968-0','47232966-9','S003','A','13/06/2020',33,13,429);
INSERT INTO venta VALUES (2320,'4443244-7','6183303-K','S003','B','24/03/2020',36,13,468);
INSERT INTO venta VALUES (2321,'11482753-3','29374931-0','S004','B','09/07/2020',15,14,210);
INSERT INTO venta VALUES (2322,'464335-6','24180587-5','S001','B','08/12/2021',32,13,416);
INSERT INTO venta VALUES (2323,'36692859-6','20237862-5','S003','B','21/03/2020',39,12,468);
INSERT INTO venta VALUES (2324,'2723837-8','4810357-K','S001','A','29/01/2020',39,15,585);
INSERT INTO venta VALUES (2325,'1890312-1','23819125-4','S005','B','23/10/2021',40,13,520);
INSERT INTO venta VALUES (2326,'12822975-2','14315947-7','S005','B','17/10/2021',19,13,247);
INSERT INTO venta VALUES (2327,'3354319-0','4810357-K','S004','B','10/11/2020',16,14,224);
INSERT INTO venta VALUES (2328,'13327230-5','29374931-0','S005','A','08/08/2021',27,14,378);
INSERT INTO venta VALUES (2329,'44254417-4','23819125-4','S002','A','25/02/2020',47,14,658);
INSERT INTO venta VALUES (2330,'10515997-8','4810357-K','S001','A','02/07/2020',26,13,338);
INSERT INTO venta VALUES (2331,'2560108-4','24180587-5','S004','A','04/09/2021',39,14,546);
INSERT INTO venta VALUES (2332,'33888803-1','14519212-9','S001','A','22/04/2021',28,13,364);
INSERT INTO venta VALUES (2333,'3312803-7','4810357-K','S002','A','20/11/2021',20,13,260);
INSERT INTO venta VALUES (2334,'42224976-1','8402711-1','S003','B','16/08/2020',27,13,351);
INSERT INTO venta VALUES (2335,'22950386-3','20237862-5','S005','A','07/03/2021',40,13,520);
INSERT INTO venta VALUES (2336,'45952563-7','32531450-8','S003','A','08/08/2020',11,14,154);
INSERT INTO venta VALUES (2337,'32678177-0','14519212-9','S005','B','13/02/2021',43,13,559);
INSERT INTO venta VALUES (2338,'44597831-0','24180587-5','S005','B','16/09/2020',32,12,384);
INSERT INTO venta VALUES (2339,'12674508-7','32531450-8','S001','A','17/09/2020',26,15,390);
INSERT INTO venta VALUES (2340,'33723826-2','20237862-5','S003','A','29/05/2020',12,14,168);
INSERT INTO venta VALUES (2341,'2152299-6','29374931-0','S003','A','19/06/2020',19,14,266);
INSERT INTO venta VALUES (2342,'40709835-8','6183303-K','S003','B','12/09/2020',29,13,377);
INSERT INTO venta VALUES (2343,'1934695-1','46566450-9','S003','B','07/11/2020',38,13,494);
INSERT INTO venta VALUES (2344,'17262729-3','20237862-5','S005','B','14/03/2020',11,13,143);
INSERT INTO venta VALUES (2345,'42634999-K','23819125-4','S002','B','24/02/2021',24,15,360);
INSERT INTO venta VALUES (2346,'12868975-3','47232966-9','S002','A','28/08/2021',17,12,204);
INSERT INTO venta VALUES (2347,'19950463-0','23819125-4','S002','B','13/08/2021',40,12,480);
INSERT INTO venta VALUES (2348,'35301718-7','6183303-K','S001','A','20/05/2020',44,12,528);
INSERT INTO venta VALUES (2349,'7697976-6','45421301-7','S003','A','04/06/2021',34,12,408);
INSERT INTO venta VALUES (2350,'39657376-8','6183303-K','S002','B','08/01/2020',32,13,416);
INSERT INTO venta VALUES (2351,'858411-7','29374931-0','S002','B','22/08/2021',18,13,234);
INSERT INTO venta VALUES (2352,'39475237-1','45421301-7','S002','A','26/12/2020',19,12,228);
INSERT INTO venta VALUES (2353,'17162191-7','45421301-7','S002','A','29/10/2020',25,14,350);
INSERT INTO venta VALUES (2354,'4633906-1','6183303-K','S001','A','23/10/2020',15,15,225);
INSERT INTO venta VALUES (2355,'44228716-3','32531450-8','S003','B','10/02/2021',48,14,672);
INSERT INTO venta VALUES (2356,'37850321-3','6183303-K','S002','A','06/08/2020',11,13,143);
INSERT INTO venta VALUES (2357,'7652770-9','42396509-6','S002','A','21/05/2021',21,13,273);
INSERT INTO venta VALUES (2358,'20570733-6','20237862-5','S002','A','22/02/2021',38,15,570);
INSERT INTO venta VALUES (2359,'31373578-8','14315947-7','S005','A','22/02/2021',38,14,532);
INSERT INTO venta VALUES (2360,'13119171-5','23819125-4','S004','A','01/01/2021',40,15,600);
INSERT INTO venta VALUES (2361,'1326116-4','24180587-5','S003','B','27/06/2020',22,13,286);
INSERT INTO venta VALUES (2362,'8471496-8','45421301-7','S005','A','01/12/2020',17,13,221);
INSERT INTO venta VALUES (2363,'45463922-7','42396509-6','S002','A','01/05/2020',16,15,240);
INSERT INTO venta VALUES (2364,'4795965-9','24180587-5','S002','B','27/09/2021',50,12,600);
INSERT INTO venta VALUES (2365,'1985837-5','42396509-6','S004','A','29/12/2020',38,13,494);
INSERT INTO venta VALUES (2366,'2632416-5','8402711-1','S002','B','28/01/2020',32,15,480);
INSERT INTO venta VALUES (2367,'7870174-9','45421301-7','S002','A','14/06/2020',49,14,686);
INSERT INTO venta VALUES (2368,'9640216-3','6183303-K','S002','B','16/08/2021',15,12,180);
INSERT INTO venta VALUES (2369,'323954-3','29374931-0','S005','A','11/08/2020',35,14,490);
INSERT INTO venta VALUES (2370,'3779314-0','46566450-9','S004','B','20/09/2021',26,14,364);
INSERT INTO venta VALUES (2371,'22668708-4','6183303-K','S005','A','02/06/2021',47,15,705);
INSERT INTO venta VALUES (2372,'4363197-7','18567395-2','S005','B','13/11/2020',50,14,700);
INSERT INTO venta VALUES (2373,'17402870-2','46566450-9','S003','B','25/08/2021',27,12,324);
INSERT INTO venta VALUES (2374,'19271288-2','47232966-9','S004','A','13/10/2020',26,15,390);
INSERT INTO venta VALUES (2375,'5680886-8','45421301-7','S004','B','28/07/2021',39,14,546);
INSERT INTO venta VALUES (2376,'4685879-4','18567395-2','S004','A','25/09/2021',18,14,252);
INSERT INTO venta VALUES (2377,'18513792-9','47232966-9','S005','B','14/05/2020',37,13,481);
INSERT INTO venta VALUES (2378,'15663741-6','20237862-5','S002','A','04/11/2020',32,14,448);
INSERT INTO venta VALUES (2379,'31772728-3','4810357-K','S005','B','26/06/2020',13,13,169);
INSERT INTO venta VALUES (2380,'22660782-K','45421301-7','S001','B','22/08/2020',28,14,392);
INSERT INTO venta VALUES (2381,'19124581-4','18567395-2','S001','A','23/12/2021',35,15,525);
INSERT INTO venta VALUES (2382,'28178116-2','24180587-5','S005','A','29/06/2020',37,15,555);
INSERT INTO venta VALUES (2383,'25633949-8','45421301-7','S002','B','10/03/2021',16,12,192);
INSERT INTO venta VALUES (2384,'49296302-K','47232966-9','S005','B','01/04/2021',13,14,182);
INSERT INTO venta VALUES (2385,'7664889-1','42396509-6','S002','A','10/07/2020',13,12,156);
INSERT INTO venta VALUES (2386,'1741449-6','18567395-2','S001','B','12/08/2021',15,14,210);
INSERT INTO venta VALUES (2387,'2748213-9','42396509-6','S005','B','09/02/2020',25,14,350);
INSERT INTO venta VALUES (2388,'10826186-2','42396509-6','S005','B','24/01/2021',25,13,325);
INSERT INTO venta VALUES (2389,'3438400-2','23819125-4','S005','B','01/06/2021',27,13,351);
INSERT INTO venta VALUES (2390,'9994880-9','6183303-K','S002','B','20/09/2021',14,15,210);
INSERT INTO venta VALUES (2391,'32865337-0','24180587-5','S003','A','23/12/2020',28,13,364);
INSERT INTO venta VALUES (2392,'37849952-6','24180587-5','S003','A','19/11/2021',13,15,195);
INSERT INTO venta VALUES (2393,'8917582-8','45421301-7','S002','A','12/04/2020',35,14,490);
INSERT INTO venta VALUES (2394,'7992294-3','45421301-7','S002','A','12/05/2021',21,15,315);
INSERT INTO venta VALUES (2395,'659110-8','4810357-K','S002','B','27/05/2021',15,12,180);
INSERT INTO venta VALUES (2396,'18766252-4','6183303-K','S001','B','23/08/2020',37,14,518);
INSERT INTO venta VALUES (2397,'22305414-5','8402711-1','S004','A','16/01/2021',30,15,450);
INSERT INTO venta VALUES (2398,'28681326-7','45421301-7','S003','A','15/08/2020',17,13,221);
INSERT INTO venta VALUES (2399,'12800750-4','6183303-K','S005','A','26/10/2020',38,14,532);
INSERT INTO venta VALUES (2400,'43509564-K','32531450-8','S002','B','25/10/2020',45,15,675);
INSERT INTO venta VALUES (2401,'24176673-K','47232966-9','S002','B','05/02/2020',45,15,675);
INSERT INTO venta VALUES (2402,'9454867-5','6183303-K','S002','B','03/04/2020',25,15,375);
INSERT INTO venta VALUES (2403,'30577989-K','20237862-5','S002','B','21/06/2021',23,15,345);
INSERT INTO venta VALUES (2404,'26612311-6','6183303-K','S002','A','11/03/2021',43,13,559);
INSERT INTO venta VALUES (2405,'38445393-7','29374931-0','S005','B','09/12/2020',29,15,435);
INSERT INTO venta VALUES (2406,'13282297-2','45421301-7','S004','A','14/12/2020',21,12,252);
INSERT INTO venta VALUES (2407,'1716359-0','23819125-4','S005','A','28/06/2020',22,15,330);
INSERT INTO venta VALUES (2408,'20504888-K','8402711-1','S005','B','20/05/2021',48,14,672);
INSERT INTO venta VALUES (2409,'38685858-6','32531450-8','S002','B','14/10/2020',33,13,429);
INSERT INTO venta VALUES (2410,'35669888-6','32531450-8','S004','B','13/09/2021',48,15,720);
INSERT INTO venta VALUES (2411,'16820896-0','46566450-9','S001','A','21/05/2020',41,14,574);
INSERT INTO venta VALUES (2412,'77629-7','42396509-6','S004','A','19/09/2020',41,15,615);
INSERT INTO venta VALUES (2413,'36787845-2','14519212-9','S003','B','27/08/2021',30,14,420);
INSERT INTO venta VALUES (2414,'44974580-9','8402711-1','S002','A','24/11/2021',26,15,390);
INSERT INTO venta VALUES (2415,'30936921-1','45421301-7','S005','A','27/12/2021',11,13,143);
INSERT INTO venta VALUES (2416,'26810372-4','46566450-9','S001','A','07/08/2021',22,13,286);
INSERT INTO venta VALUES (2417,'49941275-4','20237862-5','S001','A','27/03/2020',38,15,570);
INSERT INTO venta VALUES (2418,'25291221-5','45421301-7','S003','A','10/10/2020',25,12,300);
INSERT INTO venta VALUES (2419,'15516900-1','45421301-7','S004','A','27/04/2020',19,12,228);
INSERT INTO venta VALUES (2420,'27774169-5','46566450-9','S004','B','02/11/2021',39,15,585);
INSERT INTO venta VALUES (2421,'27714165-5','23819125-4','S001','B','20/04/2020',30,14,420);
INSERT INTO venta VALUES (2422,'3976702-3','20237862-5','S004','B','09/07/2021',11,15,165);
INSERT INTO venta VALUES (2423,'2843191-0','45421301-7','S001','A','04/09/2021',44,13,572);
INSERT INTO venta VALUES (2424,'29362748-7','18567395-2','S004','A','22/07/2020',50,15,750);
INSERT INTO venta VALUES (2425,'7265698-9','42396509-6','S001','B','23/08/2021',37,12,444);
INSERT INTO venta VALUES (2426,'33101952-6','14519212-9','S005','B','25/11/2021',23,13,299);
INSERT INTO venta VALUES (2427,'49867216-7','14315947-7','S001','A','07/06/2020',13,13,169);
INSERT INTO venta VALUES (2428,'5420466-3','8402711-1','S005','A','03/03/2021',36,15,540);
INSERT INTO venta VALUES (2429,'13835414-8','6183303-K','S005','A','13/07/2021',17,15,255);
INSERT INTO venta VALUES (2430,'45621994-2','46566450-9','S003','B','10/02/2021',25,15,375);
INSERT INTO venta VALUES (2431,'23859357-3','42396509-6','S002','A','19/06/2021',42,12,504);
INSERT INTO venta VALUES (2432,'26620304-7','47232966-9','S002','A','11/06/2020',48,14,672);
INSERT INTO venta VALUES (2433,'32180979-0','20237862-5','S004','B','18/02/2020',34,12,408);
INSERT INTO venta VALUES (2434,'10631187-0','32531450-8','S001','A','22/06/2020',22,15,330);
INSERT INTO venta VALUES (2435,'48336413-K','20237862-5','S002','A','25/11/2021',36,12,432);
INSERT INTO venta VALUES (2436,'35457831-K','6183303-K','S004','A','26/04/2020',47,15,705);
INSERT INTO venta VALUES (2437,'25785414-0','20237862-5','S005','A','24/01/2021',29,15,435);
INSERT INTO venta VALUES (2438,'48341931-7','45421301-7','S003','A','21/07/2020',29,12,348);
INSERT INTO venta VALUES (2439,'23299228-K','20237862-5','S001','A','12/03/2021',29,15,435);
INSERT INTO venta VALUES (2440,'12316193-9','42396509-6','S005','A','06/07/2021',14,15,210);
INSERT INTO venta VALUES (2441,'48852-6','45421301-7','S005','A','21/12/2020',17,14,238);
INSERT INTO venta VALUES (2442,'39266461-0','8402711-1','S003','A','19/09/2020',24,13,312);
INSERT INTO venta VALUES (2443,'32546761-4','42396509-6','S004','A','18/08/2020',20,14,280);
INSERT INTO venta VALUES (2444,'48105848-1','32531450-8','S005','A','02/09/2021',22,12,264);
INSERT INTO venta VALUES (2445,'25117198-K','6183303-K','S003','A','09/11/2020',29,15,435);
INSERT INTO venta VALUES (2446,'27326951-7','20237862-5','S002','B','25/08/2020',17,14,238);
INSERT INTO venta VALUES (2447,'33547962-9','23819125-4','S001','A','02/07/2020',36,15,540);
INSERT INTO venta VALUES (2448,'43367850-8','32531450-8','S001','A','01/12/2020',35,13,455);
INSERT INTO venta VALUES (2449,'18473160-6','45421301-7','S004','B','07/10/2020',39,15,585);
INSERT INTO venta VALUES (2450,'29902153-K','47232966-9','S003','A','20/03/2021',42,15,630);
INSERT INTO venta VALUES (2451,'7717517-2','29374931-0','S002','A','06/10/2020',11,13,143);
INSERT INTO venta VALUES (2452,'48466707-1','14315947-7','S001','B','29/09/2020',20,14,280);
INSERT INTO venta VALUES (2453,'43303774-K','46566450-9','S005','B','30/09/2021',32,12,384);
INSERT INTO venta VALUES (2454,'46153150-4','29374931-0','S002','A','30/03/2020',20,14,280);
INSERT INTO venta VALUES (2455,'25902267-3','29374931-0','S004','A','05/11/2020',49,15,735);
INSERT INTO venta VALUES (2456,'25501612-1','14315947-7','S004','B','27/10/2021',35,12,420);
INSERT INTO venta VALUES (2457,'28111191-4','14315947-7','S004','A','21/11/2020',16,13,208);
INSERT INTO venta VALUES (2458,'46656748-5','24180587-5','S003','A','09/02/2021',17,15,255);
INSERT INTO venta VALUES (2459,'26279572-1','6183303-K','S005','B','21/04/2021',25,12,300);
INSERT INTO venta VALUES (2460,'6427641-7','46566450-9','S004','B','17/12/2021',46,13,598);
INSERT INTO venta VALUES (2461,'26484700-1','14519212-9','S004','A','03/09/2020',18,15,270);
INSERT INTO venta VALUES (2462,'18153438-9','29374931-0','S004','A','13/02/2020',17,12,204);
INSERT INTO venta VALUES (2463,'20380351-6','8402711-1','S004','B','27/09/2021',19,13,247);
INSERT INTO venta VALUES (2464,'24204534-3','23819125-4','S005','B','17/10/2020',20,12,240);
INSERT INTO venta VALUES (2465,'26393893-3','14519212-9','S002','A','01/05/2020',42,12,504);
INSERT INTO venta VALUES (2466,'28241890-8','4810357-K','S005','B','14/01/2021',37,15,555);
INSERT INTO venta VALUES (2467,'25342402-8','14315947-7','S003','B','07/09/2020',26,15,390);
INSERT INTO venta VALUES (2468,'38425287-7','23819125-4','S002','A','02/06/2020',17,15,255);
INSERT INTO venta VALUES (2469,'2269681-5','29374931-0','S001','B','16/03/2020',43,14,602);
INSERT INTO venta VALUES (2470,'12906127-8','14315947-7','S004','B','07/11/2021',18,15,270);
INSERT INTO venta VALUES (2471,'12949968-0','18567395-2','S004','A','11/10/2020',44,15,660);
INSERT INTO venta VALUES (2472,'4443244-7','24180587-5','S001','B','04/12/2021',43,12,516);
INSERT INTO venta VALUES (2473,'11482753-3','4810357-K','S001','A','01/02/2020',35,13,455);
INSERT INTO venta VALUES (2474,'464335-6','23819125-4','S001','B','03/07/2020',25,14,350);
INSERT INTO venta VALUES (2475,'36692859-6','14315947-7','S001','B','01/08/2021',24,15,360);
INSERT INTO venta VALUES (2476,'2723837-8','8402711-1','S004','B','13/03/2021',22,15,330);
INSERT INTO venta VALUES (2477,'1890312-1','32531450-8','S004','A','24/08/2021',42,12,504);
INSERT INTO venta VALUES (2478,'12822975-2','24180587-5','S002','A','04/04/2020',12,13,156);
INSERT INTO venta VALUES (2479,'3354319-0','23819125-4','S004','A','01/11/2021',31,14,434);
INSERT INTO venta VALUES (2480,'13327230-5','6183303-K','S001','B','17/04/2021',45,15,675);
INSERT INTO venta VALUES (2481,'44254417-4','14315947-7','S001','B','09/12/2020',28,15,420);
INSERT INTO venta VALUES (2482,'10515997-8','20237862-5','S003','B','01/08/2020',26,12,312);
INSERT INTO venta VALUES (2483,'2560108-4','45421301-7','S004','B','13/02/2020',49,12,588);
INSERT INTO venta VALUES (2484,'33888803-1','8402711-1','S003','B','12/11/2021',38,12,456);
INSERT INTO venta VALUES (2485,'3312803-7','47232966-9','S002','B','16/01/2020',41,15,615);
INSERT INTO venta VALUES (2486,'42224976-1','4810357-K','S001','B','11/05/2020',50,12,600);
INSERT INTO venta VALUES (2487,'22950386-3','18567395-2','S001','B','30/01/2020',27,12,324);
INSERT INTO venta VALUES (2488,'45952563-7','6183303-K','S004','B','15/02/2021',14,15,210);
INSERT INTO venta VALUES (2489,'32678177-0','29374931-0','S005','A','22/09/2020',11,12,132);
INSERT INTO venta VALUES (2490,'44597831-0','46566450-9','S005','A','14/04/2020',24,13,312);
INSERT INTO venta VALUES (2491,'12674508-7','42396509-6','S004','B','23/12/2021',40,13,520);
INSERT INTO venta VALUES (2492,'33723826-2','18567395-2','S002','A','13/11/2020',12,13,156);
INSERT INTO venta VALUES (2493,'2152299-6','46566450-9','S001','B','06/01/2021',25,14,350);
INSERT INTO venta VALUES (2494,'40709835-8','14519212-9','S003','A','08/09/2021',44,14,616);
INSERT INTO venta VALUES (2495,'1934695-1','8402711-1','S005','A','12/10/2021',28,13,364);
INSERT INTO venta VALUES (2496,'17262729-3','18567395-2','S001','A','20/01/2020',37,12,444);
INSERT INTO venta VALUES (2497,'42634999-K','14519212-9','S003','B','28/11/2020',24,12,288);
INSERT INTO venta VALUES (2498,'12868975-3','29374931-0','S003','B','18/10/2020',31,15,465);
INSERT INTO venta VALUES (2499,'19950463-0','8402711-1','S003','B','07/01/2020',25,15,375);
INSERT INTO venta VALUES (2500,'35301718-7','14519212-9','S003','B','13/07/2021',45,13,585);
INSERT INTO venta VALUES (2501,'7697976-6','23819125-4','S003','A','11/11/2020',35,14,490);
INSERT INTO venta VALUES (2502,'39657376-8','23819125-4','S004','A','08/04/2020',50,14,700);
INSERT INTO venta VALUES (2503,'858411-7','42396509-6','S004','A','23/08/2021',37,15,555);
INSERT INTO venta VALUES (2504,'39475237-1','47232966-9','S002','A','07/03/2020',38,14,532);
INSERT INTO venta VALUES (2505,'17162191-7','23819125-4','S005','B','08/04/2021',11,14,154);
INSERT INTO venta VALUES (2506,'4633906-1','46566450-9','S001','B','10/05/2020',15,13,195);
INSERT INTO venta VALUES (2507,'44228716-3','42396509-6','S002','B','06/10/2020',46,14,644);
INSERT INTO venta VALUES (2508,'37850321-3','32531450-8','S005','B','31/10/2021',21,12,252);
INSERT INTO venta VALUES (2509,'7652770-9','8402711-1','S001','A','19/09/2020',12,14,168);
INSERT INTO venta VALUES (2510,'20570733-6','32531450-8','S002','B','14/11/2021',22,13,286);
INSERT INTO venta VALUES (2511,'31373578-8','8402711-1','S003','A','31/08/2021',30,12,360);
INSERT INTO venta VALUES (2512,'13119171-5','32531450-8','S004','A','05/05/2021',49,14,686);
INSERT INTO venta VALUES (2513,'1326116-4','45421301-7','S005','A','16/05/2021',42,12,504);
INSERT INTO venta VALUES (2514,'8471496-8','47232966-9','S004','B','31/01/2021',17,15,255);
INSERT INTO venta VALUES (2515,'45463922-7','46566450-9','S005','A','11/03/2020',37,13,481);
INSERT INTO venta VALUES (2516,'4795965-9','8402711-1','S001','B','15/06/2020',13,13,169);
INSERT INTO venta VALUES (2517,'1985837-5','29374931-0','S005','B','08/05/2021',20,12,240);
INSERT INTO venta VALUES (2518,'2632416-5','4810357-K','S003','A','07/07/2020',34,12,408);
INSERT INTO venta VALUES (2519,'7870174-9','32531450-8','S005','A','05/05/2020',17,14,238);
INSERT INTO venta VALUES (2520,'9640216-3','47232966-9','S002','B','18/11/2020',29,14,406);
INSERT INTO venta VALUES (2521,'323954-3','32531450-8','S004','B','06/03/2020',34,15,510);
INSERT INTO venta VALUES (2522,'3779314-0','42396509-6','S005','A','24/04/2021',46,12,552);
INSERT INTO venta VALUES (2523,'22668708-4','18567395-2','S005','B','09/09/2021',19,12,228);
INSERT INTO venta VALUES (2524,'4363197-7','29374931-0','S004','A','15/04/2021',38,14,532);
INSERT INTO venta VALUES (2525,'17402870-2','8402711-1','S002','A','20/08/2020',10,14,140);
INSERT INTO venta VALUES (2526,'15985913-4','45421301-7','S001','B','12/07/2020',16,15,240);
INSERT INTO venta VALUES (2527,'22962413-K','14519212-9','S002','A','08/11/2020',14,13,182);
INSERT INTO venta VALUES (2528,'784324-0','6183303-K','S003','A','24/05/2021',29,13,377);
INSERT INTO venta VALUES (2529,'46573375-6','24180587-5','S003','B','04/05/2021',41,15,615);
INSERT INTO venta VALUES (2530,'26173173-8','29374931-0','S005','B','21/04/2021',28,14,392);
INSERT INTO venta VALUES (2531,'3777041-8','32531450-8','S003','A','01/12/2020',19,13,247);
INSERT INTO venta VALUES (2532,'37608953-3','45421301-7','S002','A','06/12/2020',47,14,658);
INSERT INTO venta VALUES (2533,'3920779-6','20237862-5','S004','B','10/07/2021',32,15,480);
INSERT INTO venta VALUES (2534,'38693717-6','4810357-K','S004','A','10/12/2021',20,13,260);
INSERT INTO venta VALUES (2535,'27939428-3','46566450-9','S001','A','30/03/2020',46,13,598);
INSERT INTO venta VALUES (2536,'22451273-2','32531450-8','S001','A','02/10/2021',50,15,750);
INSERT INTO venta VALUES (2537,'8521947-2','46566450-9','S001','A','26/06/2021',45,15,675);
INSERT INTO venta VALUES (2538,'9598155-0','47232966-9','S005','B','17/05/2020',50,13,650);
INSERT INTO venta VALUES (2539,'39282475-8','45421301-7','S002','A','27/07/2020',31,14,434);
INSERT INTO venta VALUES (2540,'14649226-6','42396509-6','S001','A','22/02/2021',32,12,384);
INSERT INTO venta VALUES (2541,'45291827-7','45421301-7','S001','B','28/12/2021',19,15,285);
INSERT INTO venta VALUES (2542,'46533262-K','24180587-5','S002','A','15/02/2021',13,14,182);
INSERT INTO venta VALUES (2543,'3771417-8','24180587-5','S004','B','19/05/2020',33,12,396);
INSERT INTO venta VALUES (2544,'33163155-8','46566450-9','S004','A','21/02/2020',47,14,658);
INSERT INTO venta VALUES (2545,'17414897-K','20237862-5','S003','A','12/12/2020',12,14,168);
INSERT INTO venta VALUES (2546,'15197648-4','46566450-9','S002','B','22/08/2020',19,14,266);
INSERT INTO venta VALUES (2547,'724295-6','8402711-1','S002','A','01/05/2020',34,13,442);
INSERT INTO venta VALUES (2548,'15727662-K','14315947-7','S002','A','18/04/2021',10,12,120);
INSERT INTO venta VALUES (2549,'27310657-K','8402711-1','S001','A','19/09/2020',25,15,375);
INSERT INTO venta VALUES (2550,'241344-2','8402711-1','S003','A','18/08/2021',10,13,130);
INSERT INTO venta VALUES (2551,'7690652-1','24180587-5','S002','B','05/11/2021',28,14,392);
INSERT INTO venta VALUES (2552,'36178672-6','14315947-7','S005','A','17/06/2021',31,14,434);
INSERT INTO venta VALUES (2553,'8531489-0','32531450-8','S001','A','15/09/2021',50,12,600);
INSERT INTO venta VALUES (2554,'35707554-8','20237862-5','S003','B','22/06/2021',47,13,611);
INSERT INTO venta VALUES (2555,'18605597-7','6183303-K','S004','B','25/01/2020',38,14,532);
INSERT INTO venta VALUES (2556,'14457237-8','14519212-9','S004','B','03/01/2021',15,15,225);
INSERT INTO venta VALUES (2557,'34905567-8','18567395-2','S004','A','23/11/2021',32,13,416);
INSERT INTO venta VALUES (2558,'2426896-9','29374931-0','S005','A','28/08/2020',48,12,576);
INSERT INTO venta VALUES (2559,'19271288-2','32531450-8','S003','A','30/10/2021',14,15,210);
INSERT INTO venta VALUES (2560,'5680886-8','45421301-7','S005','A','13/08/2021',10,14,140);
INSERT INTO venta VALUES (2561,'4685879-4','47232966-9','S003','B','24/03/2020',13,14,182);
INSERT INTO venta VALUES (2562,'18513792-9','23819125-4','S001','B','27/05/2021',46,13,598);
INSERT INTO venta VALUES (2563,'15663741-6','45421301-7','S003','B','09/07/2021',28,13,364);
INSERT INTO venta VALUES (2564,'31772728-3','29374931-0','S001','A','20/01/2020',38,13,494);
INSERT INTO venta VALUES (2565,'22660782-K','6183303-K','S004','B','24/09/2020',11,14,154);
INSERT INTO venta VALUES (2566,'19124581-4','8402711-1','S005','B','29/02/2020',26,12,312);
INSERT INTO venta VALUES (2567,'28178116-2','47232966-9','S001','B','07/03/2021',42,12,504);
INSERT INTO venta VALUES (2568,'25633949-8','45421301-7','S005','A','16/10/2020',22,12,264);
INSERT INTO venta VALUES (2569,'49296302-K','32531450-8','S005','A','22/10/2020',22,12,264);
INSERT INTO venta VALUES (2570,'7664889-1','14315947-7','S001','B','19/02/2020',23,14,322);
INSERT INTO venta VALUES (2571,'1741449-6','42396509-6','S005','B','07/12/2021',11,15,165);
INSERT INTO venta VALUES (2572,'2748213-9','4810357-K','S005','B','21/01/2020',32,13,416);
INSERT INTO venta VALUES (2573,'10826186-2','24180587-5','S004','A','25/01/2021',26,15,390);
INSERT INTO venta VALUES (2574,'3438400-2','14519212-9','S003','A','28/11/2020',33,15,495);
INSERT INTO venta VALUES (2575,'9994880-9','18567395-2','S001','B','17/01/2020',48,13,624);
INSERT INTO venta VALUES (2576,'32865337-0','20237862-5','S001','A','09/03/2021',23,13,299);
INSERT INTO venta VALUES (2577,'37849952-6','46566450-9','S001','A','22/11/2021',18,12,216);
INSERT INTO venta VALUES (2578,'8917582-8','29374931-0','S004','A','27/06/2021',11,13,143);
INSERT INTO venta VALUES (2579,'7992294-3','23819125-4','S001','A','24/03/2021',33,12,396);
INSERT INTO venta VALUES (2580,'659110-8','32531450-8','S004','B','12/08/2020',30,12,360);
INSERT INTO venta VALUES (2581,'18766252-4','45421301-7','S004','A','03/06/2020',44,15,660);
INSERT INTO venta VALUES (2582,'22305414-5','14315947-7','S001','A','21/05/2021',32,14,448);
INSERT INTO venta VALUES (2583,'28681326-7','32531450-8','S001','B','22/08/2020',45,13,585);
INSERT INTO venta VALUES (2584,'12800750-4','8402711-1','S003','A','17/11/2021',38,12,456);
INSERT INTO venta VALUES (2585,'43509564-K','8402711-1','S005','A','02/01/2021',29,12,348);
INSERT INTO venta VALUES (2586,'24176673-K','47232966-9','S004','B','10/04/2021',50,15,750);
INSERT INTO venta VALUES (2587,'9454867-5','8402711-1','S002','A','02/03/2020',12,12,144);
INSERT INTO venta VALUES (2588,'30577989-K','42396509-6','S005','B','11/06/2020',31,14,434);
INSERT INTO venta VALUES (2589,'26612311-6','20237862-5','S004','A','31/03/2021',39,14,546);
INSERT INTO venta VALUES (2590,'38445393-7','46566450-9','S001','A','03/02/2021',43,14,602);
INSERT INTO venta VALUES (2591,'13282297-2','23819125-4','S003','B','10/12/2021',42,15,630);
INSERT INTO venta VALUES (2592,'1716359-0','8402711-1','S003','A','27/01/2021',16,15,240);
INSERT INTO venta VALUES (2593,'20504888-K','18567395-2','S002','A','15/09/2020',17,13,221);
INSERT INTO venta VALUES (2594,'38685858-6','14315947-7','S002','A','14/05/2020',30,14,420);
INSERT INTO venta VALUES (2595,'35669888-6','18567395-2','S005','A','18/03/2020',10,14,140);
INSERT INTO venta VALUES (2596,'16820896-0','47232966-9','S001','A','19/12/2021',40,13,520);
INSERT INTO venta VALUES (2597,'77629-7','24180587-5','S005','B','29/07/2020',44,12,528);
INSERT INTO venta VALUES (2598,'36787845-2','32531450-8','S004','A','21/06/2021',46,12,552);
INSERT INTO venta VALUES (2599,'44974580-9','20237862-5','S002','A','16/06/2020',29,14,406);
INSERT INTO venta VALUES (2600,'30936921-1','45421301-7','S003','A','12/12/2021',40,13,520);
INSERT INTO venta VALUES (2601,'26810372-4','47232966-9','S003','A','06/12/2021',18,13,234);
INSERT INTO venta VALUES (2602,'49941275-4','14519212-9','S001','A','24/05/2021',17,13,221);
INSERT INTO venta VALUES (2603,'25291221-5','8402711-1','S003','A','30/06/2020',43,13,559);
INSERT INTO venta VALUES (2604,'15516900-1','24180587-5','S004','A','29/09/2020',27,14,378);
INSERT INTO venta VALUES (2605,'27774169-5','8402711-1','S003','A','13/12/2020',13,12,156);
INSERT INTO venta VALUES (2606,'27714165-5','18567395-2','S003','B','09/09/2021',33,15,495);
INSERT INTO venta VALUES (2607,'3976702-3','46566450-9','S004','A','20/01/2020',29,14,406);
INSERT INTO venta VALUES (2608,'2843191-0','20237862-5','S002','A','28/01/2021',42,13,546);
INSERT INTO venta VALUES (2609,'29362748-7','24180587-5','S002','B','17/03/2020',17,13,221);
INSERT INTO venta VALUES (2610,'7265698-9','14315947-7','S003','A','06/04/2021',28,12,336);
INSERT INTO venta VALUES (2611,'33101952-6','32531450-8','S001','B','23/01/2020',22,14,308);
INSERT INTO venta VALUES (2612,'49867216-7','32531450-8','S001','A','16/12/2021',49,12,588);
INSERT INTO venta VALUES (2613,'5420466-3','23819125-4','S001','A','30/08/2020',22,13,286);
INSERT INTO venta VALUES (2614,'13835414-8','4810357-K','S003','A','30/07/2020',43,12,516);
INSERT INTO venta VALUES (2615,'45621994-2','6183303-K','S003','B','22/05/2021',32,15,480);
INSERT INTO venta VALUES (2616,'23859357-3','14315947-7','S001','A','25/12/2020',16,15,240);
INSERT INTO venta VALUES (2617,'26620304-7','8402711-1','S003','B','20/02/2021',22,12,264);
INSERT INTO venta VALUES (2618,'32180979-0','14315947-7','S002','B','26/11/2020',44,13,572);
INSERT INTO venta VALUES (2619,'10631187-0','20237862-5','S004','B','11/10/2021',49,13,637);
INSERT INTO venta VALUES (2620,'48336413-K','4810357-K','S001','B','28/10/2021',50,14,700);
INSERT INTO venta VALUES (2621,'35457831-K','14519212-9','S005','B','21/04/2020',17,13,221);
INSERT INTO venta VALUES (2622,'25785414-0','32531450-8','S002','A','06/03/2020',34,15,510);
INSERT INTO venta VALUES (2623,'48341931-7','18567395-2','S002','A','16/02/2021',18,13,234);
INSERT INTO venta VALUES (2624,'23299228-K','4810357-K','S004','A','02/03/2020',49,15,735);
INSERT INTO venta VALUES (2625,'12316193-9','47232966-9','S005','A','04/05/2021',20,15,300);
INSERT INTO venta VALUES (2626,'48852-6','47232966-9','S005','B','11/04/2021',40,13,520);
INSERT INTO venta VALUES (2627,'39266461-0','6183303-K','S002','B','10/06/2021',29,13,377);
INSERT INTO venta VALUES (2628,'32546761-4','6183303-K','S001','A','03/11/2020',44,15,660);
INSERT INTO venta VALUES (2629,'48105848-1','47232966-9','S002','A','23/09/2020',19,14,266);
INSERT INTO venta VALUES (2630,'25117198-K','29374931-0','S005','B','04/10/2020',27,13,351);
INSERT INTO venta VALUES (2631,'27326951-7','46566450-9','S003','B','12/08/2021',35,12,420);
INSERT INTO venta VALUES (2632,'33547962-9','42396509-6','S003','B','27/09/2020',13,12,156);
INSERT INTO venta VALUES (2633,'43367850-8','6183303-K','S002','A','18/05/2020',31,12,372);
INSERT INTO venta VALUES (2634,'18473160-6','6183303-K','S002','A','22/01/2021',32,13,416);
INSERT INTO venta VALUES (2635,'29902153-K','14519212-9','S004','A','11/01/2021',25,13,325);
INSERT INTO venta VALUES (2636,'7717517-2','18567395-2','S002','A','03/10/2020',25,13,325);
INSERT INTO venta VALUES (2637,'48466707-1','24180587-5','S001','A','21/04/2020',22,13,286);
INSERT INTO venta VALUES (2638,'43303774-K','46566450-9','S005','A','22/10/2021',48,12,576);
INSERT INTO venta VALUES (2639,'46153150-4','8402711-1','S003','A','25/01/2021',12,12,144);
INSERT INTO venta VALUES (2640,'25902267-3','8402711-1','S002','B','15/02/2021',47,12,564);
INSERT INTO venta VALUES (2641,'25501612-1','42396509-6','S003','A','25/03/2021',47,14,658);
INSERT INTO venta VALUES (2642,'28111191-4','29374931-0','S005','B','06/04/2020',38,14,532);
INSERT INTO venta VALUES (2643,'19271288-2','45421301-7','S005','A','24/04/2020',21,13,273);
INSERT INTO venta VALUES (2644,'5680886-8','32531450-8','S002','A','10/02/2020',47,13,611);
INSERT INTO venta VALUES (2645,'4685879-4','14315947-7','S005','A','21/04/2020',45,12,540);
INSERT INTO venta VALUES (2646,'18513792-9','29374931-0','S005','B','13/08/2021',50,14,700);
INSERT INTO venta VALUES (2647,'15663741-6','32531450-8','S003','A','21/12/2021',17,12,204);
INSERT INTO venta VALUES (2648,'31772728-3','32531450-8','S004','A','25/09/2021',10,12,120);
INSERT INTO venta VALUES (2649,'22660782-K','6183303-K','S002','A','23/01/2020',31,12,372);
INSERT INTO venta VALUES (2650,'19124581-4','24180587-5','S005','A','04/07/2021',38,12,456);
INSERT INTO venta VALUES (2651,'28178116-2','14519212-9','S004','B','04/08/2020',24,15,360);
INSERT INTO venta VALUES (2652,'25633949-8','4810357-K','S003','B','13/06/2020',34,14,476);
INSERT INTO venta VALUES (2653,'49296302-K','18567395-2','S003','A','26/10/2020',33,14,462);
INSERT INTO venta VALUES (2654,'7664889-1','32531450-8','S005','B','24/05/2020',35,15,525);
INSERT INTO venta VALUES (2655,'1741449-6','18567395-2','S005','B','23/01/2021',37,12,444);
INSERT INTO venta VALUES (2656,'2748213-9','20237862-5','S005','B','13/02/2021',37,15,555);
INSERT INTO venta VALUES (2657,'10826186-2','29374931-0','S002','A','06/11/2021',26,13,338);
INSERT INTO venta VALUES (2658,'3438400-2','23819125-4','S002','B','07/01/2020',30,14,420);
INSERT INTO venta VALUES (2659,'9994880-9','8402711-1','S001','A','24/02/2020',43,12,516);
INSERT INTO venta VALUES (2660,'32865337-0','4810357-K','S004','B','17/08/2021',11,14,154);
INSERT INTO venta VALUES (2661,'37849952-6','32531450-8','S004','B','24/02/2020',10,14,140);
INSERT INTO venta VALUES (2662,'8917582-8','8402711-1','S005','B','14/02/2021',40,14,560);
INSERT INTO venta VALUES (2663,'7992294-3','32531450-8','S001','A','30/01/2021',42,14,588);
INSERT INTO venta VALUES (2664,'659110-8','20237862-5','S001','B','16/07/2021',29,13,377);
INSERT INTO venta VALUES (2665,'18766252-4','20237862-5','S003','A','30/11/2020',48,13,624);
INSERT INTO venta VALUES (2666,'22305414-5','32531450-8','S001','A','07/07/2020',16,13,208);
INSERT INTO venta VALUES (2667,'28681326-7','4810357-K','S001','B','24/06/2021',13,13,169);
INSERT INTO venta VALUES (2668,'12800750-4','29374931-0','S001','A','01/05/2021',42,13,546);
INSERT INTO venta VALUES (2669,'43509564-K','14315947-7','S005','B','14/05/2020',20,12,240);
INSERT INTO venta VALUES (2670,'24176673-K','6183303-K','S004','B','26/05/2021',15,15,225);
INSERT INTO venta VALUES (2671,'9454867-5','18567395-2','S003','B','18/04/2020',46,15,690);
INSERT INTO venta VALUES (2672,'30577989-K','8402711-1','S002','B','25/04/2020',45,13,585);
INSERT INTO venta VALUES (2673,'26612311-6','32531450-8','S003','B','12/04/2021',42,12,504);
INSERT INTO venta VALUES (2674,'38445393-7','14519212-9','S004','B','03/07/2020',49,15,735);
INSERT INTO venta VALUES (2675,'13282297-2','32531450-8','S003','B','21/07/2021',32,13,416);
INSERT INTO venta VALUES (2676,'1716359-0','46566450-9','S002','B','17/01/2020',49,13,637);
INSERT INTO venta VALUES (2677,'20504888-K','45421301-7','S005','B','03/07/2021',15,15,225);
INSERT INTO venta VALUES (2678,'38685858-6','14315947-7','S005','A','05/06/2021',15,13,195);
INSERT INTO venta VALUES (2679,'35669888-6','23819125-4','S003','B','15/12/2021',12,13,156);
INSERT INTO venta VALUES (2680,'16820896-0','24180587-5','S001','A','01/12/2020',25,13,325);
INSERT INTO venta VALUES (2681,'77629-7','20237862-5','S001','A','20/04/2021',50,12,600);
INSERT INTO venta VALUES (2682,'36787845-2','24180587-5','S001','A','06/08/2021',33,13,429);
INSERT INTO venta VALUES (2683,'44974580-9','42396509-6','S002','B','15/03/2020',29,12,348);
INSERT INTO venta VALUES (2684,'30936921-1','14315947-7','S001','B','18/11/2021',34,14,476);
INSERT INTO venta VALUES (2685,'26810372-4','14519212-9','S004','B','31/01/2020',50,14,700);
INSERT INTO venta VALUES (2686,'49941275-4','42396509-6','S001','B','18/02/2020',24,12,288);
INSERT INTO venta VALUES (2687,'25291221-5','20237862-5','S001','B','03/01/2021',37,12,444);
INSERT INTO venta VALUES (2688,'15516900-1','20237862-5','S001','A','30/12/2021',43,15,645);
INSERT INTO venta VALUES (2689,'27774169-5','24180587-5','S005','A','12/11/2021',47,13,611);
INSERT INTO venta VALUES (2690,'27714165-5','45421301-7','S005','B','27/07/2021',37,13,481);
INSERT INTO venta VALUES (2691,'3976702-3','6183303-K','S003','A','12/05/2020',35,13,455);
INSERT INTO venta VALUES (2692,'2843191-0','20237862-5','S005','B','24/12/2021',12,13,156);
INSERT INTO venta VALUES (2693,'29362748-7','4810357-K','S003','B','06/07/2021',34,14,476);
INSERT INTO venta VALUES (2694,'7265698-9','6183303-K','S005','B','09/03/2020',17,12,204);
INSERT INTO venta VALUES (2695,'33101952-6','24180587-5','S002','B','03/10/2020',12,15,180);
INSERT INTO venta VALUES (2696,'49867216-7','14519212-9','S001','B','24/04/2020',34,15,510);
INSERT INTO venta VALUES (2697,'5420466-3','47232966-9','S004','A','22/11/2020',40,15,600);
INSERT INTO venta VALUES (2698,'13835414-8','8402711-1','S002','B','26/04/2020',30,13,390);
INSERT INTO venta VALUES (2699,'45621994-2','24180587-5','S003','B','21/11/2020',27,14,378);
INSERT INTO venta VALUES (2700,'23859357-3','20237862-5','S004','A','24/09/2021',48,14,672);
INSERT INTO venta VALUES (2701,'26620304-7','6183303-K','S001','B','28/07/2021',27,13,351);
INSERT INTO venta VALUES (2702,'32180979-0','46566450-9','S001','B','26/11/2021',43,13,559);
INSERT INTO venta VALUES (2703,'10631187-0','42396509-6','S001','A','16/02/2020',31,14,434);
INSERT INTO venta VALUES (2704,'48336413-K','14315947-7','S005','B','11/08/2021',24,12,288);
INSERT INTO venta VALUES (2705,'35457831-K','23819125-4','S004','B','03/04/2021',15,12,180);
INSERT INTO venta VALUES (2706,'25785414-0','45421301-7','S003','B','31/01/2020',19,12,228);
INSERT INTO venta VALUES (2707,'48341931-7','23819125-4','S004','A','28/03/2021',32,12,384);
INSERT INTO venta VALUES (2708,'23299228-K','8402711-1','S005','B','26/04/2021',33,13,429);
INSERT INTO venta VALUES (2709,'12316193-9','24180587-5','S005','A','13/06/2020',28,12,336);
INSERT INTO venta VALUES (2710,'48852-6','6183303-K','S004','B','30/10/2021',43,13,559);
INSERT INTO venta VALUES (2711,'39266461-0','47232966-9','S002','A','23/12/2020',22,14,308);
INSERT INTO venta VALUES (2712,'32546761-4','29374931-0','S005','B','29/07/2020',16,12,192);
INSERT INTO venta VALUES (2713,'48105848-1','47232966-9','S005','A','16/07/2020',49,12,588);
INSERT INTO venta VALUES (2714,'25117198-K','18567395-2','S002','B','01/03/2020',29,14,406);
INSERT INTO venta VALUES (2715,'27326951-7','6183303-K','S002','B','12/07/2020',21,13,273);
INSERT INTO venta VALUES (2716,'33547962-9','4810357-K','S001','A','03/11/2021',31,14,434);
INSERT INTO venta VALUES (2717,'43367850-8','47232966-9','S004','A','25/09/2020',16,12,192);
INSERT INTO venta VALUES (2718,'18473160-6','6183303-K','S004','B','17/01/2021',15,15,225);
INSERT INTO venta VALUES (2719,'29902153-K','23819125-4','S001','B','03/12/2020',13,13,169);
INSERT INTO venta VALUES (2720,'7717517-2','46566450-9','S004','B','14/02/2020',33,12,396);
INSERT INTO venta VALUES (2721,'48466707-1','18567395-2','S004','B','04/05/2020',43,14,602);
INSERT INTO venta VALUES (2722,'43303774-K','47232966-9','S005','B','15/08/2020',48,15,720);
INSERT INTO venta VALUES (2723,'46153150-4','8402711-1','S001','B','17/12/2021',46,15,690);
INSERT INTO venta VALUES (2724,'25902267-3','23819125-4','S005','B','02/07/2021',32,15,480);
INSERT INTO venta VALUES (2725,'25501612-1','45421301-7','S001','B','17/11/2020',39,12,468);
INSERT INTO venta VALUES (2726,'28111191-4','46566450-9','S002','A','22/07/2020',13,15,195);
INSERT INTO venta VALUES (2727,'46656748-5','42396509-6','S002','A','25/03/2020',29,14,406);
INSERT INTO venta VALUES (2728,'19271288-2','14315947-7','S005','B','01/04/2020',39,15,585);
INSERT INTO venta VALUES (2729,'5680886-8','46566450-9','S005','B','16/05/2020',48,13,624);
INSERT INTO venta VALUES (2730,'4685879-4','32531450-8','S004','B','17/08/2020',38,13,494);
INSERT INTO venta VALUES (2731,'18513792-9','14519212-9','S002','A','26/04/2021',36,12,432);
INSERT INTO venta VALUES (2732,'15663741-6','47232966-9','S002','A','01/05/2020',17,14,238);
INSERT INTO venta VALUES (2733,'31772728-3','42396509-6','S004','B','04/12/2021',50,13,650);
INSERT INTO venta VALUES (2734,'22660782-K','8402711-1','S003','A','25/01/2020',15,15,225);
INSERT INTO venta VALUES (2735,'19124581-4','46566450-9','S004','A','14/09/2021',20,15,300);
INSERT INTO venta VALUES (2736,'28178116-2','14315947-7','S002','A','14/07/2020',48,14,672);
INSERT INTO venta VALUES (2737,'25633949-8','46566450-9','S001','B','21/10/2021',41,15,615);
INSERT INTO venta VALUES (2738,'49296302-K','8402711-1','S003','B','21/03/2020',47,13,611);
INSERT INTO venta VALUES (2739,'7664889-1','8402711-1','S003','A','17/09/2021',47,14,658);
INSERT INTO venta VALUES (2740,'1741449-6','6183303-K','S001','B','09/10/2020',17,12,204);
INSERT INTO venta VALUES (2741,'2748213-9','6183303-K','S005','B','30/05/2021',15,14,210);
INSERT INTO venta VALUES (2742,'10826186-2','46566450-9','S003','A','31/05/2021',40,12,480);
INSERT INTO venta VALUES (2743,'3438400-2','29374931-0','S001','B','26/11/2020',34,15,510);
INSERT INTO venta VALUES (2744,'9994880-9','8402711-1','S005','A','14/05/2021',43,13,559);
INSERT INTO venta VALUES (2745,'32865337-0','32531450-8','S005','A','22/09/2021',39,13,507);
INSERT INTO venta VALUES (2746,'37849952-6','14519212-9','S002','B','14/03/2021',43,15,645);
INSERT INTO venta VALUES (2747,'8917582-8','18567395-2','S001','A','09/03/2021',39,14,546);
INSERT INTO venta VALUES (2748,'7992294-3','32531450-8','S002','B','26/03/2021',46,13,598);
INSERT INTO venta VALUES (2749,'659110-8','42396509-6','S005','A','13/11/2020',27,14,378);
INSERT INTO venta VALUES (2750,'18766252-4','29374931-0','S001','A','06/08/2020',33,13,429);
INSERT INTO venta VALUES (2751,'22305414-5','18567395-2','S005','A','23/09/2020',43,13,559);
INSERT INTO venta VALUES (2752,'28681326-7','20237862-5','S005','A','28/10/2020',27,12,324);
INSERT INTO venta VALUES (2753,'12800750-4','4810357-K','S005','A','05/12/2021',32,12,384);
INSERT INTO venta VALUES (2754,'43509564-K','18567395-2','S004','B','24/12/2021',20,14,280);
INSERT INTO venta VALUES (2755,'24176673-K','8402711-1','S005','B','27/02/2021',20,15,300);
INSERT INTO venta VALUES (2756,'9454867-5','32531450-8','S003','A','22/08/2020',23,15,345);
INSERT INTO venta VALUES (2757,'30577989-K','45421301-7','S005','B','01/07/2020',25,14,350);
INSERT INTO venta VALUES (2758,'26612311-6','20237862-5','S004','B','01/12/2021',44,13,572);
INSERT INTO venta VALUES (2759,'38445393-7','18567395-2','S002','B','16/08/2021',24,15,360);
INSERT INTO venta VALUES (2760,'13282297-2','8402711-1','S002','A','19/12/2021',33,15,495);
INSERT INTO venta VALUES (2761,'1716359-0','6183303-K','S002','A','10/03/2021',36,13,468);
INSERT INTO venta VALUES (2762,'20504888-K','23819125-4','S005','B','22/08/2021',35,15,525);
INSERT INTO venta VALUES (2763,'38685858-6','14519212-9','S003','B','23/01/2021',20,12,240);
INSERT INTO venta VALUES (2764,'35669888-6','47232966-9','S002','A','21/09/2021',47,13,611);
INSERT INTO venta VALUES (2765,'16820896-0','14315947-7','S001','B','20/11/2021',46,12,552);
INSERT INTO venta VALUES (2766,'77629-7','24180587-5','S005','B','05/10/2021',20,15,300);
INSERT INTO venta VALUES (2767,'36787845-2','24180587-5','S005','A','29/08/2020',22,12,264);
INSERT INTO venta VALUES (2768,'44974580-9','45421301-7','S005','A','25/05/2021',37,14,518);
INSERT INTO venta VALUES (2769,'30936921-1','6183303-K','S003','A','21/08/2021',45,15,675);
INSERT INTO venta VALUES (2770,'26810372-4','24180587-5','S005','B','03/09/2021',35,14,490);
INSERT INTO venta VALUES (2771,'49941275-4','4810357-K','S001','A','04/09/2021',27,15,405);
INSERT INTO venta VALUES (2772,'25291221-5','14519212-9','S001','B','21/01/2021',35,15,525);
INSERT INTO venta VALUES (2773,'15516900-1','29374931-0','S001','A','20/04/2021',45,15,675);
INSERT INTO venta VALUES (2774,'27774169-5','29374931-0','S004','B','01/05/2021',31,12,372);
INSERT INTO venta VALUES (2775,'27714165-5','29374931-0','S004','A','04/12/2021',33,12,396);
INSERT INTO venta VALUES (2776,'3976702-3','14315947-7','S002','B','09/07/2021',46,13,598);
INSERT INTO venta VALUES (2777,'2843191-0','32531450-8','S003','B','26/12/2020',27,13,351);
INSERT INTO venta VALUES (2778,'29362748-7','14519212-9','S003','A','28/03/2020',45,12,540);
INSERT INTO venta VALUES (2779,'7265698-9','6183303-K','S002','B','12/05/2021',45,13,585);
INSERT INTO venta VALUES (2780,'33101952-6','18567395-2','S002','B','05/07/2020',17,13,221);
INSERT INTO venta VALUES (2781,'49867216-7','14315947-7','S002','B','08/09/2021',22,15,330);
INSERT INTO venta VALUES (2782,'5420466-3','47232966-9','S005','A','19/05/2020',47,12,564);
INSERT INTO venta VALUES (2783,'13835414-8','20237862-5','S001','A','29/02/2020',20,14,280);
INSERT INTO venta VALUES (2784,'45621994-2','18567395-2','S005','A','07/02/2020',50,13,650);
INSERT INTO venta VALUES (2785,'23859357-3','20237862-5','S004','A','07/11/2021',35,12,420);
INSERT INTO venta VALUES (2786,'26620304-7','18567395-2','S001','B','12/05/2020',16,13,208);
INSERT INTO venta VALUES (2787,'32180979-0','8402711-1','S004','A','10/03/2021',26,12,312);
INSERT INTO venta VALUES (2788,'10631187-0','18567395-2','S002','B','24/05/2021',36,13,468);
INSERT INTO venta VALUES (2789,'48336413-K','23819125-4','S002','B','01/12/2020',11,14,154);
INSERT INTO venta VALUES (2790,'35457831-K','18567395-2','S005','B','14/02/2021',17,13,221);
INSERT INTO venta VALUES (2791,'25785414-0','18567395-2','S004','A','12/09/2021',25,13,325);
INSERT INTO venta VALUES (2792,'48341931-7','4810357-K','S003','A','04/09/2020',32,15,480);
INSERT INTO venta VALUES (2793,'23299228-K','24180587-5','S001','A','16/12/2020',49,14,686);
INSERT INTO venta VALUES (2794,'12316193-9','4810357-K','S003','B','30/11/2020',45,13,585);
INSERT INTO venta VALUES (2795,'48852-6','14519212-9','S003','A','26/06/2020',40,13,520);
INSERT INTO venta VALUES (2796,'39266461-0','8402711-1','S005','A','06/06/2020',32,12,384);
INSERT INTO venta VALUES (2797,'32546761-4','6183303-K','S003','B','01/02/2021',22,15,330);
INSERT INTO venta VALUES (2798,'48105848-1','6183303-K','S005','A','06/02/2020',36,15,540);
INSERT INTO venta VALUES (2799,'25117198-K','23819125-4','S003','A','05/09/2021',11,15,165);
INSERT INTO venta VALUES (2800,'27326951-7','42396509-6','S005','B','26/05/2021',34,12,408);
INSERT INTO venta VALUES (2801,'33547962-9','14315947-7','S003','B','20/02/2020',13,14,182);
INSERT INTO venta VALUES (2802,'43367850-8','47232966-9','S004','B','05/05/2020',14,13,182);
INSERT INTO venta VALUES (2803,'18473160-6','4810357-K','S004','A','24/02/2020',32,13,416);
INSERT INTO venta VALUES (2804,'29902153-K','46566450-9','S005','B','13/12/2020',28,15,420);
INSERT INTO venta VALUES (2805,'7717517-2','14315947-7','S001','A','14/11/2020',37,14,518);
INSERT INTO venta VALUES (2806,'48466707-1','18567395-2','S003','A','25/06/2020',21,12,252);
INSERT INTO venta VALUES (2807,'43303774-K','6183303-K','S004','A','13/07/2021',18,14,252);
INSERT INTO venta VALUES (2808,'46153150-4','24180587-5','S005','B','09/11/2021',21,13,273);
INSERT INTO venta VALUES (2809,'25902267-3','4810357-K','S001','B','22/01/2021',20,15,300);
INSERT INTO venta VALUES (2810,'25501612-1','23819125-4','S002','A','15/09/2021',12,12,144);
INSERT INTO venta VALUES (2811,'28111191-4','32531450-8','S002','B','10/08/2020',32,13,416);
INSERT INTO venta VALUES (2812,'46656748-5','23819125-4','S001','A','18/11/2020',29,13,377);
INSERT INTO venta VALUES (2813,'26279572-1','32531450-8','S001','A','21/09/2020',39,14,546);
INSERT INTO venta VALUES (2814,'6427641-7','14519212-9','S002','B','11/09/2020',31,13,403);
INSERT INTO venta VALUES (2815,'26484700-1','14315947-7','S002','B','02/06/2020',39,13,507);
INSERT INTO venta VALUES (2816,'18153438-9','18567395-2','S003','A','23/10/2020',27,15,405);
INSERT INTO venta VALUES (2817,'20380351-6','4810357-K','S001','A','02/09/2021',15,13,195);
INSERT INTO venta VALUES (2818,'24204534-3','47232966-9','S002','A','17/08/2021',20,15,300);
INSERT INTO venta VALUES (2819,'26393893-3','14315947-7','S002','B','26/04/2021',16,12,192);
INSERT INTO venta VALUES (2820,'28241890-8','46566450-9','S001','B','22/11/2020',41,13,533);
INSERT INTO venta VALUES (2821,'25342402-8','29374931-0','S003','A','01/09/2020',44,14,616);
INSERT INTO venta VALUES (2822,'38425287-7','4810357-K','S002','B','08/05/2020',46,12,552);
INSERT INTO venta VALUES (2823,'2269681-5','23819125-4','S002','A','01/12/2021',23,12,276);
INSERT INTO venta VALUES (2824,'12906127-8','4810357-K','S002','A','13/12/2021',44,15,660);
INSERT INTO venta VALUES (2825,'12949968-0','42396509-6','S001','A','25/05/2021',38,14,532);
INSERT INTO venta VALUES (2826,'4443244-7','32531450-8','S005','A','05/08/2021',45,15,675);
INSERT INTO venta VALUES (2827,'11482753-3','29374931-0','S004','B','19/11/2020',15,13,195);
INSERT INTO venta VALUES (2828,'464335-6','23819125-4','S005','A','17/05/2020',20,13,260);
INSERT INTO venta VALUES (2829,'36692859-6','14315947-7','S002','B','16/10/2020',30,13,390);
INSERT INTO venta VALUES (2830,'2723837-8','23819125-4','S003','A','28/05/2020',46,12,552);
INSERT INTO venta VALUES (2831,'1890312-1','18567395-2','S002','B','06/02/2021',35,12,420);
INSERT INTO venta VALUES (2832,'12822975-2','6183303-K','S002','A','26/01/2021',33,15,495);
INSERT INTO venta VALUES (2833,'3354319-0','6183303-K','S002','A','30/06/2021',18,13,234);
INSERT INTO venta VALUES (2834,'13327230-5','23819125-4','S003','A','23/07/2021',10,15,150);
INSERT INTO venta VALUES (2835,'44254417-4','29374931-0','S003','B','07/03/2021',44,14,616);
INSERT INTO venta VALUES (2836,'10515997-8','14519212-9','S005','B','09/12/2020',33,12,396);
INSERT INTO venta VALUES (2837,'2560108-4','46566450-9','S004','B','05/04/2020',41,13,533);
INSERT INTO venta VALUES (2838,'33888803-1','8402711-1','S004','A','09/01/2020',48,15,720);
INSERT INTO venta VALUES (2839,'3312803-7','14315947-7','S002','A','04/12/2021',31,12,372);
INSERT INTO venta VALUES (2840,'42224976-1','4810357-K','S003','A','19/01/2020',30,15,450);
INSERT INTO venta VALUES (2841,'22950386-3','14519212-9','S002','A','02/05/2021',17,13,221);
INSERT INTO venta VALUES (2842,'45952563-7','42396509-6','S005','B','07/02/2020',16,13,208);
INSERT INTO venta VALUES (2843,'32678177-0','14315947-7','S002','B','01/04/2020',12,13,156);
INSERT INTO venta VALUES (2844,'44597831-0','46566450-9','S003','A','26/12/2021',37,13,481);
INSERT INTO venta VALUES (2845,'12674508-7','42396509-6','S003','A','25/02/2020',17,15,255);
INSERT INTO venta VALUES (2846,'33723826-2','18567395-2','S001','A','26/04/2020',16,15,240);
INSERT INTO venta VALUES (2847,'2152299-6','6183303-K','S001','A','24/10/2021',26,15,390);
INSERT INTO venta VALUES (2848,'40709835-8','45421301-7','S005','A','10/12/2020',46,12,552);
INSERT INTO venta VALUES (2849,'1934695-1','42396509-6','S005','B','21/04/2021',32,14,448);
INSERT INTO venta VALUES (2850,'17262729-3','23819125-4','S004','B','19/08/2021',36,12,432);
INSERT INTO venta VALUES (2851,'42634999-K','46566450-9','S005','A','25/12/2021',12,14,168);
INSERT INTO venta VALUES (2852,'12868975-3','23819125-4','S001','B','20/06/2021',14,14,196);
INSERT INTO venta VALUES (2853,'19950463-0','32531450-8','S003','A','24/07/2021',10,14,140);
INSERT INTO venta VALUES (2854,'35301718-7','47232966-9','S005','A','17/02/2020',41,12,492);
INSERT INTO venta VALUES (2855,'7697976-6','20237862-5','S003','A','03/10/2020',35,12,420);
INSERT INTO venta VALUES (2856,'39657376-8','24180587-5','S002','A','06/11/2021',43,13,559);
INSERT INTO venta VALUES (2857,'858411-7','32531450-8','S002','A','08/04/2020',31,14,434);
INSERT INTO venta VALUES (2858,'39475237-1','42396509-6','S005','B','08/08/2021',23,13,299);
INSERT INTO venta VALUES (2859,'17162191-7','14315947-7','S005','B','24/10/2021',10,15,150);
INSERT INTO venta VALUES (2860,'4633906-1','29374931-0','S005','B','17/05/2021',34,15,510);
INSERT INTO venta VALUES (2861,'44228716-3','45421301-7','S005','B','27/07/2020',13,15,195);
INSERT INTO venta VALUES (2862,'37850321-3','42396509-6','S003','A','11/03/2020',20,12,240);
INSERT INTO venta VALUES (2863,'7652770-9','20237862-5','S001','A','27/05/2020',38,12,456);
INSERT INTO venta VALUES (2864,'20570733-6','8402711-1','S001','B','17/01/2021',13,12,156);
INSERT INTO venta VALUES (2865,'31373578-8','46566450-9','S002','A','19/03/2021',10,15,150);
INSERT INTO venta VALUES (2866,'13119171-5','29374931-0','S002','B','19/05/2021',43,14,602);
INSERT INTO venta VALUES (2867,'1326116-4','4810357-K','S001','B','02/07/2021',11,14,154);
INSERT INTO venta VALUES (2868,'8471496-8','4810357-K','S004','A','09/08/2021',21,15,315);
INSERT INTO venta VALUES (2869,'45463922-7','6183303-K','S004','B','01/04/2020',25,15,375);
INSERT INTO venta VALUES (2870,'4795965-9','45421301-7','S005','A','04/01/2021',22,13,286);
INSERT INTO venta VALUES (2871,'1985837-5','14315947-7','S001','A','09/02/2021',10,12,120);
INSERT INTO venta VALUES (2872,'2632416-5','45421301-7','S003','B','10/11/2021',45,13,585);
INSERT INTO venta VALUES (2873,'7870174-9','29374931-0','S004','A','03/06/2020',28,14,392);
INSERT INTO venta VALUES (2874,'9640216-3','18567395-2','S005','A','06/11/2021',12,14,168);
INSERT INTO venta VALUES (2875,'323954-3','6183303-K','S001','B','28/09/2021',42,12,504);
INSERT INTO venta VALUES (2876,'3779314-0','47232966-9','S003','A','14/02/2020',33,14,462);
INSERT INTO venta VALUES (2877,'22668708-4','29374931-0','S002','A','21/06/2021',39,12,468);
INSERT INTO venta VALUES (2878,'4363197-7','46566450-9','S001','B','26/03/2020',23,13,299);
INSERT INTO venta VALUES (2879,'17402870-2','45421301-7','S004','B','18/08/2020',23,13,299);
INSERT INTO venta VALUES (2880,'15985913-4','6183303-K','S001','A','23/06/2021',35,14,490);
INSERT INTO venta VALUES (2881,'22962413-K','45421301-7','S002','B','08/05/2020',36,13,468);
INSERT INTO venta VALUES (2882,'784324-0','18567395-2','S001','B','30/06/2020',27,13,351);
INSERT INTO venta VALUES (2883,'46573375-6','8402711-1','S005','B','16/02/2020',25,14,350);
INSERT INTO venta VALUES (2884,'26173173-8','32531450-8','S002','B','17/01/2020',27,15,405);
INSERT INTO venta VALUES (2885,'3777041-8','20237862-5','S004','A','04/05/2020',50,12,600);
INSERT INTO venta VALUES (2886,'37608953-3','14315947-7','S001','B','08/12/2020',40,12,480);
INSERT INTO venta VALUES (2887,'3920779-6','6183303-K','S004','B','23/08/2020',38,14,532);
INSERT INTO venta VALUES (2888,'38693717-6','14519212-9','S002','B','07/08/2020',41,15,615);
INSERT INTO venta VALUES (2889,'27939428-3','47232966-9','S004','B','07/10/2020',18,15,270);
INSERT INTO venta VALUES (2890,'22451273-2','32531450-8','S005','B','20/08/2021',34,14,476);
INSERT INTO venta VALUES (2891,'8521947-2','14519212-9','S004','A','23/06/2021',11,13,143);
INSERT INTO venta VALUES (2892,'9598155-0','47232966-9','S004','B','18/03/2021',13,13,169);
INSERT INTO venta VALUES (2893,'39282475-8','45421301-7','S005','B','14/05/2020',49,12,588);
INSERT INTO venta VALUES (2894,'14649226-6','4810357-K','S005','B','08/12/2020',20,14,280);
INSERT INTO venta VALUES (2895,'45291827-7','29374931-0','S002','A','17/08/2021',25,12,300);
INSERT INTO venta VALUES (2896,'46533262-K','42396509-6','S002','A','10/06/2021',11,13,143);
INSERT INTO venta VALUES (2897,'3771417-8','14315947-7','S005','A','01/02/2020',41,14,574);
INSERT INTO venta VALUES (2898,'33163155-8','24180587-5','S002','A','16/01/2021',37,13,481);
INSERT INTO venta VALUES (2899,'17414897-K','6183303-K','S002','B','13/01/2021',42,13,546);
INSERT INTO venta VALUES (2900,'15197648-4','14315947-7','S004','A','07/05/2021',20,15,300);
INSERT INTO venta VALUES (2901,'724295-6','4810357-K','S003','A','28/09/2020',33,15,495);
INSERT INTO venta VALUES (2902,'15727662-K','47232966-9','S003','A','19/08/2021',40,14,560);
INSERT INTO venta VALUES (2903,'27310657-K','24180587-5','S002','A','26/08/2020',36,14,504);
INSERT INTO venta VALUES (2904,'241344-2','18567395-2','S005','A','18/10/2020',41,15,615);
INSERT INTO venta VALUES (2905,'7690652-1','18567395-2','S002','A','05/01/2021',25,12,300);
INSERT INTO venta VALUES (2906,'36178672-6','42396509-6','S005','A','05/04/2020',31,13,403);
INSERT INTO venta VALUES (2907,'8531489-0','8402711-1','S001','B','15/05/2020',38,14,532);
INSERT INTO venta VALUES (2908,'35707554-8','29374931-0','S001','A','26/05/2020',39,12,468);
INSERT INTO venta VALUES (2909,'18605597-7','29374931-0','S004','B','14/08/2021',32,15,480);
INSERT INTO venta VALUES (2910,'14457237-8','14519212-9','S002','A','24/04/2021',48,14,672);
INSERT INTO venta VALUES (2911,'34905567-8','23819125-4','S002','A','07/08/2021',13,14,182);
INSERT INTO venta VALUES (2912,'2426896-9','46566450-9','S004','B','13/01/2020',42,15,630);
INSERT INTO venta VALUES (2913,'39771947-2','23819125-4','S002','B','05/06/2020',26,15,390);
INSERT INTO venta VALUES (2914,'36697535-7','47232966-9','S004','B','18/05/2021',48,14,672);
INSERT INTO venta VALUES (2915,'50111203-8','24180587-5','S002','A','29/06/2020',28,12,336);
INSERT INTO venta VALUES (2916,'5624553-7','29374931-0','S001','A','22/06/2021',46,13,598);
INSERT INTO venta VALUES (2917,'1723172-3','4810357-K','S004','A','03/03/2021',19,14,266);
INSERT INTO venta VALUES (2918,'40851728-1','20237862-5','S002','B','24/12/2021',10,13,130);
INSERT INTO venta VALUES (2919,'15303262-9','20237862-5','S005','B','29/01/2021',20,12,240);
INSERT INTO venta VALUES (2920,'31272855-9','14315947-7','S005','B','12/12/2020',22,13,286);
INSERT INTO venta VALUES (2921,'24308974-3','6183303-K','S003','A','07/04/2021',16,14,224);
INSERT INTO venta VALUES (2922,'37942920-3','8402711-1','S001','A','23/12/2020',46,15,690);
INSERT INTO venta VALUES (2923,'15976879-1','42396509-6','S005','A','16/02/2020',11,13,143);
INSERT INTO venta VALUES (2924,'22941315-5','14315947-7','S001','B','13/12/2021',30,12,360);
INSERT INTO venta VALUES (2925,'11146117-1','6183303-K','S001','B','04/06/2021',13,13,169);
INSERT INTO venta VALUES (2926,'18993555-2','24180587-5','S005','A','11/05/2020',29,13,377);
INSERT INTO venta VALUES (2927,'6828569-0','32531450-8','S002','B','12/12/2021',42,13,546);
INSERT INTO venta VALUES (2928,'8910706-7','24180587-5','S002','A','29/08/2020',14,15,210);
INSERT INTO venta VALUES (2929,'37538683-6','46566450-9','S003','A','08/02/2021',21,14,294);
INSERT INTO venta VALUES (2930,'49506917-6','20237862-5','S004','A','20/08/2021',29,15,435);
INSERT INTO venta VALUES (2931,'26465143-3','6183303-K','S001','B','11/08/2020',22,13,286);
INSERT INTO venta VALUES (2932,'12863360-K','29374931-0','S003','A','19/01/2020',47,15,705);
INSERT INTO venta VALUES (2933,'35464842-3','42396509-6','S005','A','28/10/2021',42,12,504);
INSERT INTO venta VALUES (2934,'49228383-5','23819125-4','S005','B','30/12/2021',41,13,533);
INSERT INTO venta VALUES (2935,'4843648-K','42396509-6','S004','B','01/05/2020',39,15,585);
INSERT INTO venta VALUES (2936,'36710570-4','42396509-6','S002','A','14/01/2020',24,15,360);
INSERT INTO venta VALUES (2937,'36463590-7','23819125-4','S004','B','09/04/2020',39,13,507);
INSERT INTO venta VALUES (2938,'49261260-K','29374931-0','S004','B','03/03/2021',16,13,208);
INSERT INTO venta VALUES (2939,'67016-2','4810357-K','S003','A','08/12/2021',35,12,420);
INSERT INTO venta VALUES (2940,'17247534-5','32531450-8','S002','B','01/12/2020',27,13,351);
INSERT INTO venta VALUES (2941,'42666994-3','42396509-6','S005','B','16/06/2021',26,15,390);
INSERT INTO venta VALUES (2942,'9513916-7','45421301-7','S001','B','25/06/2021',18,12,216);
INSERT INTO venta VALUES (2943,'50344810-6','6183303-K','S002','A','01/04/2020',14,14,196);
INSERT INTO venta VALUES (2944,'478918-0','18567395-2','S002','B','01/01/2021',33,12,396);
INSERT INTO venta VALUES (2945,'49880234-6','42396509-6','S005','B','18/10/2021',38,15,570);
INSERT INTO venta VALUES (2946,'13931994-K','6183303-K','S001','A','06/03/2021',22,12,264);
INSERT INTO venta VALUES (2947,'46490831-5','32531450-8','S002','B','13/12/2020',39,12,468);
INSERT INTO venta VALUES (2948,'31103598-3','29374931-0','S005','A','31/10/2021',25,12,300);
INSERT INTO venta VALUES (2949,'25918150-K','14519212-9','S004','B','10/01/2021',48,12,576);
INSERT INTO venta VALUES (2950,'3528420-6','46566450-9','S001','B','01/06/2020',10,14,140);
INSERT INTO venta VALUES (2951,'35579147-5','42396509-6','S003','B','30/09/2020',37,14,518);
INSERT INTO venta VALUES (2952,'31603398-9','20237862-5','S001','A','13/08/2021',15,14,210);
INSERT INTO venta VALUES (2953,'33672606-9','6183303-K','S005','B','11/01/2021',27,13,351);
INSERT INTO venta VALUES (2954,'47352241-1','6183303-K','S005','B','18/03/2020',15,14,210);
INSERT INTO venta VALUES (2955,'19928743-5','46566450-9','S005','B','21/06/2021',25,15,375);
INSERT INTO venta VALUES (2956,'43838491-K','14315947-7','S002','B','12/02/2020',23,12,276);
INSERT INTO venta VALUES (2957,'48440778-9','42396509-6','S002','A','09/12/2021',28,12,336);
INSERT INTO venta VALUES (2958,'3596015-5','24180587-5','S001','B','20/01/2021',13,15,195);
INSERT INTO venta VALUES (2959,'41955593-2','46566450-9','S003','A','05/06/2020',33,14,462);
INSERT INTO venta VALUES (2960,'38253942-7','14519212-9','S003','A','09/05/2021',37,13,481);
INSERT INTO venta VALUES (2961,'26671316-9','8402711-1','S001','A','22/11/2021',20,14,280);
INSERT INTO venta VALUES (2962,'8277892-6','32531450-8','S001','B','17/12/2021',19,14,266);
INSERT INTO venta VALUES (2963,'19271288-2','29374931-0','S004','A','17/09/2021',24,14,336);
INSERT INTO venta VALUES (2964,'5680886-8','18567395-2','S005','B','22/02/2021',46,12,552);
INSERT INTO venta VALUES (2965,'4685879-4','47232966-9','S002','B','09/04/2021',19,14,266);
INSERT INTO venta VALUES (2966,'18513792-9','46566450-9','S005','A','14/01/2020',16,15,240);
INSERT INTO venta VALUES (2967,'15663741-6','32531450-8','S001','B','11/04/2021',14,14,196);
INSERT INTO venta VALUES (2968,'31772728-3','18567395-2','S005','A','31/05/2020',21,15,315);
INSERT INTO venta VALUES (2969,'22660782-K','8402711-1','S005','B','07/10/2021',47,12,564);
INSERT INTO venta VALUES (2970,'19124581-4','8402711-1','S005','B','02/03/2020',38,12,456);
INSERT INTO venta VALUES (2971,'28178116-2','14519212-9','S004','B','09/11/2021',11,15,165);
INSERT INTO venta VALUES (2972,'25633949-8','45421301-7','S004','B','07/02/2020',32,12,384);
INSERT INTO venta VALUES (2973,'49296302-K','14519212-9','S003','B','01/01/2021',34,13,442);
INSERT INTO venta VALUES (2974,'7664889-1','6183303-K','S004','A','30/11/2020',11,14,154);
INSERT INTO venta VALUES (2975,'1741449-6','14315947-7','S001','A','19/01/2021',17,15,255);
INSERT INTO venta VALUES (2976,'2748213-9','32531450-8','S005','A','24/12/2020',45,13,585);
INSERT INTO venta VALUES (2977,'10826186-2','6183303-K','S005','B','03/12/2020',25,12,300);
INSERT INTO venta VALUES (2978,'3438400-2','42396509-6','S002','A','23/04/2020',36,14,504);
INSERT INTO venta VALUES (2979,'9994880-9','32531450-8','S004','B','30/07/2021',12,12,144);
INSERT INTO venta VALUES (2980,'32865337-0','6183303-K','S002','B','01/05/2020',47,12,564);
INSERT INTO venta VALUES (2981,'37849952-6','14315947-7','S001','A','05/06/2020',12,12,144);
INSERT INTO venta VALUES (2982,'8917582-8','8402711-1','S003','A','18/03/2020',37,13,481);
INSERT INTO venta VALUES (2983,'7992294-3','6183303-K','S005','A','20/01/2021',33,12,396);
INSERT INTO venta VALUES (2984,'659110-8','8402711-1','S004','B','29/11/2020',23,12,276);
INSERT INTO venta VALUES (2985,'18766252-4','14315947-7','S001','A','12/11/2020',25,15,375);
INSERT INTO venta VALUES (2986,'22305414-5','14519212-9','S005','B','02/04/2020',20,14,280);
INSERT INTO venta VALUES (2987,'28681326-7','23819125-4','S005','A','26/05/2021',46,15,690);
INSERT INTO venta VALUES (2988,'12800750-4','18567395-2','S004','A','26/02/2021',24,14,336);
INSERT INTO venta VALUES (2989,'43509564-K','14315947-7','S002','B','15/08/2021',46,13,598);
INSERT INTO venta VALUES (2990,'24176673-K','29374931-0','S004','A','24/05/2021',21,15,315);
INSERT INTO venta VALUES (2991,'9454867-5','8402711-1','S004','A','01/07/2020',21,12,252);
INSERT INTO venta VALUES (2992,'30577989-K','29374931-0','S002','B','30/06/2021',26,15,390);
INSERT INTO venta VALUES (2993,'26612311-6','14519212-9','S001','B','16/05/2021',26,12,312);
INSERT INTO venta VALUES (2994,'38445393-7','42396509-6','S004','B','08/11/2021',37,13,481);
INSERT INTO venta VALUES (2995,'13282297-2','42396509-6','S004','A','03/11/2020',37,13,481);
INSERT INTO venta VALUES (2996,'1716359-0','47232966-9','S003','B','13/01/2020',37,13,481);
INSERT INTO venta VALUES (2997,'20504888-K','46566450-9','S002','A','27/10/2021',48,14,672);
INSERT INTO venta VALUES (2998,'38685858-6','18567395-2','S003','B','17/06/2021',28,12,336);
INSERT INTO venta VALUES (2999,'35669888-6','42396509-6','S005','A','02/06/2020',26,15,390);
INSERT INTO venta VALUES (3000,'16820896-0','14315947-7','S002','A','01/03/2020',29,12,348);
INSERT INTO venta VALUES (3001,'77629-7','18567395-2','S001','A','31/12/2021',37,14,518);
INSERT INTO venta VALUES (3002,'36787845-2','18567395-2','S005','B','02/02/2020',18,15,270);
INSERT INTO venta VALUES (3003,'44974580-9','14519212-9','S001','B','18/04/2021',48,12,576);
INSERT INTO venta VALUES (3004,'30936921-1','4810357-K','S004','A','07/10/2020',21,12,252);
INSERT INTO venta VALUES (3005,'26810372-4','45421301-7','S003','A','03/02/2020',50,14,700);
INSERT INTO venta VALUES (3006,'49941275-4','45421301-7','S002','A','29/05/2021',24,13,312);
INSERT INTO venta VALUES (3007,'25291221-5','4810357-K','S005','B','16/07/2020',27,13,351);
INSERT INTO venta VALUES (3008,'15516900-1','42396509-6','S002','B','03/09/2020',42,14,588);
INSERT INTO venta VALUES (3009,'27774169-5','24180587-5','S005','A','10/02/2020',34,12,408);
INSERT INTO venta VALUES (3010,'27714165-5','24180587-5','S003','B','17/09/2020',42,13,546);
INSERT INTO venta VALUES (3011,'3976702-3','14315947-7','S005','B','26/10/2020',48,14,672);
INSERT INTO venta VALUES (3012,'2843191-0','14315947-7','S002','A','08/02/2021',36,12,432);
INSERT INTO venta VALUES (3013,'29362748-7','14519212-9','S004','B','20/03/2020',12,12,144);
INSERT INTO venta VALUES (3014,'7265698-9','46566450-9','S001','B','17/01/2020',49,12,588);
INSERT INTO venta VALUES (3015,'33101952-6','20237862-5','S001','A','24/12/2020',38,13,494);
INSERT INTO venta VALUES (3016,'49867216-7','6183303-K','S001','A','01/11/2021',33,12,396);
INSERT INTO venta VALUES (3017,'5420466-3','46566450-9','S002','A','24/02/2021',49,15,735);
INSERT INTO venta VALUES (3018,'13835414-8','24180587-5','S003','B','31/01/2020',49,15,735);
INSERT INTO venta VALUES (3019,'45621994-2','42396509-6','S004','A','23/05/2020',29,14,406);
INSERT INTO venta VALUES (3020,'23859357-3','6183303-K','S005','A','18/02/2021',38,15,570);
INSERT INTO venta VALUES (3021,'26620304-7','14315947-7','S001','A','01/07/2021',50,13,650);
INSERT INTO venta VALUES (3022,'32180979-0','8402711-1','S004','A','19/07/2021',45,12,540);
INSERT INTO venta VALUES (3023,'10631187-0','46566450-9','S002','A','27/04/2021',31,13,403);
INSERT INTO venta VALUES (3024,'48336413-K','46566450-9','S003','B','21/05/2020',21,15,315);
INSERT INTO venta VALUES (3025,'35457831-K','29374931-0','S002','A','14/10/2021',20,12,240);
INSERT INTO venta VALUES (3026,'25785414-0','46566450-9','S004','B','01/11/2020',39,12,468);
INSERT INTO venta VALUES (3027,'48341931-7','4810357-K','S004','B','25/01/2021',10,15,150);
INSERT INTO venta VALUES (3028,'23299228-K','45421301-7','S004','B','21/01/2021',38,13,494);
INSERT INTO venta VALUES (3029,'12316193-9','29374931-0','S002','B','31/05/2020',40,12,480);
INSERT INTO venta VALUES (3030,'48852-6','14519212-9','S002','A','19/03/2020',14,15,210);
INSERT INTO venta VALUES (3031,'39266461-0','6183303-K','S001','A','07/04/2021',32,14,448);
INSERT INTO venta VALUES (3032,'32546761-4','29374931-0','S003','B','26/01/2021',11,13,143);
INSERT INTO venta VALUES (3033,'48105848-1','42396509-6','S001','A','20/12/2021',21,15,315);
INSERT INTO venta VALUES (3034,'25117198-K','24180587-5','S002','B','20/04/2021',27,14,378);
INSERT INTO venta VALUES (3035,'27326951-7','47232966-9','S003','B','02/11/2021',42,14,588);
INSERT INTO venta VALUES (3036,'33547962-9','24180587-5','S005','A','02/07/2021',28,12,336);
INSERT INTO venta VALUES (3037,'43367850-8','4810357-K','S005','A','02/05/2021',27,15,405);
INSERT INTO venta VALUES (3038,'18473160-6','23819125-4','S001','A','17/05/2021',24,15,360);
INSERT INTO venta VALUES (3039,'29902153-K','8402711-1','S003','A','01/02/2020',12,14,168);
INSERT INTO venta VALUES (3040,'7717517-2','14519212-9','S005','B','14/03/2021',10,13,130);
INSERT INTO venta VALUES (3041,'48466707-1','23819125-4','S002','A','16/05/2021',31,14,434);
INSERT INTO venta VALUES (3042,'43303774-K','18567395-2','S001','B','03/01/2020',45,14,630);
INSERT INTO venta VALUES (3043,'46153150-4','4810357-K','S003','B','03/10/2020',31,14,434);
INSERT INTO venta VALUES (3044,'25902267-3','23819125-4','S005','A','23/08/2021',42,15,630);
INSERT INTO venta VALUES (3045,'25501612-1','20237862-5','S004','A','17/08/2020',20,14,280);
INSERT INTO venta VALUES (3046,'28111191-4','46566450-9','S004','A','02/08/2020',31,14,434);
INSERT INTO venta VALUES (3047,'46656748-5','18567395-2','S002','A','01/10/2020',30,12,360);
INSERT INTO venta VALUES (3048,'26279572-1','23819125-4','S004','A','13/06/2020',31,12,372);
INSERT INTO venta VALUES (3049,'6427641-7','46566450-9','S002','A','26/11/2020',44,13,572);
INSERT INTO venta VALUES (3050,'26484700-1','18567395-2','S001','A','21/11/2020',10,12,120);
INSERT INTO venta VALUES (3051,'18153438-9','14315947-7','S003','A','07/08/2021',32,12,384);
INSERT INTO venta VALUES (3052,'20380351-6','18567395-2','S003','A','15/06/2020',17,14,238);
INSERT INTO venta VALUES (3053,'24204534-3','47232966-9','S003','A','31/08/2020',15,14,210);
INSERT INTO venta VALUES (3054,'26393893-3','18567395-2','S004','B','27/10/2021',10,13,130);
INSERT INTO venta VALUES (3055,'28241890-8','6183303-K','S001','A','13/05/2020',48,13,624);
INSERT INTO venta VALUES (3056,'25342402-8','6183303-K','S002','B','07/10/2020',25,15,375);
INSERT INTO venta VALUES (3057,'38425287-7','14315947-7','S001','A','09/04/2020',19,14,266);
INSERT INTO venta VALUES (3058,'2269681-5','24180587-5','S001','B','14/03/2020',41,12,492);
INSERT INTO venta VALUES (3059,'12906127-8','14315947-7','S003','B','25/07/2021',33,15,495);
INSERT INTO venta VALUES (3060,'12949968-0','14519212-9','S005','B','23/10/2020',50,13,650);
INSERT INTO venta VALUES (3061,'4443244-7','20237862-5','S001','A','03/03/2020',21,14,294);
INSERT INTO venta VALUES (3062,'11482753-3','4810357-K','S002','A','01/05/2020',23,13,299);
INSERT INTO venta VALUES (3063,'464335-6','23819125-4','S003','A','01/07/2021',27,12,324);
INSERT INTO venta VALUES (3064,'36692859-6','18567395-2','S002','B','27/03/2021',15,15,225);
INSERT INTO venta VALUES (3065,'2723837-8','24180587-5','S003','A','04/11/2021',31,14,434);
INSERT INTO venta VALUES (3066,'1890312-1','14315947-7','S003','B','28/11/2020',42,14,588);
INSERT INTO venta VALUES (3067,'12822975-2','14315947-7','S005','B','10/02/2020',25,14,350);
INSERT INTO venta VALUES (3068,'3354319-0','14519212-9','S003','A','03/08/2020',44,15,660);
INSERT INTO venta VALUES (3069,'13327230-5','8402711-1','S005','B','03/01/2020',41,12,492);
INSERT INTO venta VALUES (3070,'44254417-4','6183303-K','S002','B','22/11/2021',17,12,204);
INSERT INTO venta VALUES (3071,'10515997-8','42396509-6','S002','A','21/10/2020',18,15,270);
INSERT INTO venta VALUES (3072,'2560108-4','47232966-9','S003','B','25/11/2020',10,15,150);
INSERT INTO venta VALUES (3073,'33888803-1','42396509-6','S003','B','26/10/2020',13,13,169);
INSERT INTO venta VALUES (3074,'3312803-7','46566450-9','S004','B','11/10/2020',35,14,490);
INSERT INTO venta VALUES (3075,'42224976-1','47232966-9','S004','B','05/02/2020',32,14,448);
INSERT INTO venta VALUES (3076,'22950386-3','47232966-9','S003','B','12/07/2020',31,13,403);
INSERT INTO venta VALUES (3077,'45952563-7','46566450-9','S001','B','19/09/2020',43,15,645);
INSERT INTO venta VALUES (3078,'32678177-0','14519212-9','S001','B','03/04/2020',23,15,345);
INSERT INTO venta VALUES (3079,'44597831-0','46566450-9','S002','B','09/01/2020',48,12,576);
INSERT INTO venta VALUES (3080,'12674508-7','47232966-9','S004','B','22/05/2020',12,13,156);
INSERT INTO venta VALUES (3081,'33723826-2','23819125-4','S003','A','08/06/2021',33,14,462);
INSERT INTO venta VALUES (3082,'2152299-6','46566450-9','S001','A','28/02/2020',30,12,360);
INSERT INTO venta VALUES (3083,'40709835-8','45421301-7','S001','A','15/07/2021',49,12,588);
INSERT INTO venta VALUES (3084,'1934695-1','14315947-7','S004','B','19/07/2020',46,13,598);
INSERT INTO venta VALUES (3085,'17262729-3','47232966-9','S001','B','10/12/2020',24,14,336);
INSERT INTO venta VALUES (3086,'42634999-K','45421301-7','S002','B','21/07/2020',17,13,221);
INSERT INTO venta VALUES (3087,'12868975-3','8402711-1','S003','B','04/09/2021',48,15,720);
INSERT INTO venta VALUES (3088,'19950463-0','32531450-8','S004','A','19/09/2021',45,13,585);
INSERT INTO venta VALUES (3089,'35301718-7','47232966-9','S003','B','13/08/2021',11,13,143);
INSERT INTO venta VALUES (3090,'7697976-6','18567395-2','S001','B','11/08/2021',33,14,462);
INSERT INTO venta VALUES (3091,'39657376-8','45421301-7','S001','A','13/12/2020',39,12,468);
INSERT INTO venta VALUES (3092,'858411-7','45421301-7','S005','A','10/03/2020',25,14,350);
INSERT INTO venta VALUES (3093,'39475237-1','14519212-9','S004','B','02/03/2021',35,14,490);
INSERT INTO venta VALUES (3094,'17162191-7','46566450-9','S005','A','02/12/2021',48,15,720);
INSERT INTO venta VALUES (3095,'4633906-1','20237862-5','S003','A','20/09/2020',47,13,611);
INSERT INTO venta VALUES (3096,'44228716-3','20237862-5','S001','A','07/03/2021',48,13,624);
INSERT INTO venta VALUES (3097,'37850321-3','29374931-0','S003','B','10/11/2020',32,15,480);
INSERT INTO venta VALUES (3098,'7652770-9','4810357-K','S002','B','16/09/2021',14,13,182);
INSERT INTO venta VALUES (3099,'20570733-6','47232966-9','S004','B','19/03/2020',10,15,150);
INSERT INTO venta VALUES (3100,'31373578-8','6183303-K','S002','A','24/10/2021',37,12,444);
INSERT INTO venta VALUES (3101,'13119171-5','14519212-9','S003','A','25/10/2021',14,14,196);
INSERT INTO venta VALUES (3102,'1326116-4','42396509-6','S004','A','09/09/2020',48,13,624);
INSERT INTO venta VALUES (3103,'8471496-8','46566450-9','S002','A','12/07/2020',40,12,480);
INSERT INTO venta VALUES (3104,'45463922-7','47232966-9','S001','A','23/08/2021',19,13,247);
INSERT INTO venta VALUES (3105,'4795965-9','14519212-9','S002','A','30/11/2020',49,15,735);
INSERT INTO venta VALUES (3106,'1985837-5','18567395-2','S003','B','15/10/2020',26,12,312);
INSERT INTO venta VALUES (3107,'2632416-5','14315947-7','S004','B','20/09/2020',24,12,288);
INSERT INTO venta VALUES (3108,'7870174-9','47232966-9','S005','B','29/06/2020',10,12,120);
INSERT INTO venta VALUES (3109,'9640216-3','14315947-7','S002','A','06/01/2020',25,13,325);
INSERT INTO venta VALUES (3110,'323954-3','24180587-5','S001','A','18/12/2021',17,15,255);
INSERT INTO venta VALUES (3111,'3779314-0','23819125-4','S005','B','09/04/2021',40,13,520);
INSERT INTO venta VALUES (3112,'22668708-4','45421301-7','S005','A','09/07/2020',49,13,637);
INSERT INTO venta VALUES (3113,'4363197-7','8402711-1','S004','A','06/01/2021',44,12,528);
INSERT INTO venta VALUES (3114,'17402870-2','18567395-2','S001','A','01/12/2020',41,15,615);
INSERT INTO venta VALUES (3115,'15985913-4','46566450-9','S005','B','18/04/2020',32,15,480);
INSERT INTO venta VALUES (3116,'22962413-K','18567395-2','S002','B','23/05/2021',28,15,420);
INSERT INTO venta VALUES (3117,'784324-0','23819125-4','S003','B','23/08/2021',15,15,225);
INSERT INTO venta VALUES (3118,'46573375-6','8402711-1','S005','B','23/12/2021',39,15,585);
INSERT INTO venta VALUES (3119,'26173173-8','24180587-5','S002','B','05/03/2021',10,14,140);
INSERT INTO venta VALUES (3120,'3777041-8','18567395-2','S003','A','03/09/2021',22,13,286);
INSERT INTO venta VALUES (3121,'37608953-3','46566450-9','S001','B','21/03/2021',45,12,540);
INSERT INTO venta VALUES (3122,'3920779-6','6183303-K','S004','A','07/12/2020',50,12,600);
INSERT INTO venta VALUES (3123,'38693717-6','23819125-4','S002','B','22/03/2020',17,12,204);
INSERT INTO venta VALUES (3124,'27939428-3','14519212-9','S005','A','14/07/2020',46,15,690);
INSERT INTO venta VALUES (3125,'22451273-2','47232966-9','S002','A','18/05/2021',15,15,225);
INSERT INTO venta VALUES (3126,'8521947-2','14519212-9','S004','B','06/06/2020',13,13,169);
INSERT INTO venta VALUES (3127,'9598155-0','47232966-9','S005','A','17/12/2021',47,13,611);
INSERT INTO venta VALUES (3128,'39282475-8','14519212-9','S005','A','12/07/2020',32,15,480);
INSERT INTO venta VALUES (3129,'14649226-6','6183303-K','S003','B','20/12/2020',17,12,204);
INSERT INTO venta VALUES (3130,'45291827-7','46566450-9','S005','A','01/05/2021',37,14,518);
INSERT INTO venta VALUES (3131,'46533262-K','24180587-5','S004','A','20/01/2020',13,12,156);
INSERT INTO venta VALUES (3132,'3771417-8','45421301-7','S001','B','26/11/2021',44,13,572);
INSERT INTO venta VALUES (3133,'33163155-8','23819125-4','S003','B','20/01/2021',35,14,490);
INSERT INTO venta VALUES (3134,'17414897-K','14519212-9','S004','A','19/10/2020',46,14,644);
INSERT INTO venta VALUES (3135,'15197648-4','8402711-1','S003','B','19/06/2020',41,13,533);
INSERT INTO venta VALUES (3136,'724295-6','4810357-K','S004','A','11/04/2020',18,15,270);
INSERT INTO venta VALUES (3137,'15727662-K','24180587-5','S005','A','10/10/2020',13,14,182);
INSERT INTO venta VALUES (3138,'27310657-K','42396509-6','S002','A','18/02/2021',50,13,650);
INSERT INTO venta VALUES (3139,'241344-2','6183303-K','S002','A','11/06/2020',31,14,434);
INSERT INTO venta VALUES (3140,'7690652-1','6183303-K','S004','B','06/03/2021',45,15,675);
INSERT INTO venta VALUES (3141,'36178672-6','8402711-1','S004','A','16/06/2021',28,13,364);
INSERT INTO venta VALUES (3142,'8531489-0','24180587-5','S004','B','22/08/2020',48,13,624);
INSERT INTO venta VALUES (3143,'35707554-8','42396509-6','S003','A','04/12/2020',43,12,516);
INSERT INTO venta VALUES (3144,'18605597-7','47232966-9','S004','A','19/11/2021',19,14,266);
INSERT INTO venta VALUES (3145,'14457237-8','6183303-K','S004','A','23/07/2020',22,13,286);
INSERT INTO venta VALUES (3146,'34905567-8','6183303-K','S002','B','21/01/2020',40,13,520);
INSERT INTO venta VALUES (3147,'2426896-9','32531450-8','S002','B','21/10/2021',31,14,434);
INSERT INTO venta VALUES (3148,'39771947-2','8402711-1','S003','B','17/12/2021',15,14,210);
INSERT INTO venta VALUES (3149,'36697535-7','18567395-2','S004','B','13/02/2020',41,13,533);
INSERT INTO venta VALUES (3150,'50111203-8','45421301-7','S001','A','15/05/2020',28,13,364);
INSERT INTO venta VALUES (3151,'5624553-7','42396509-6','S001','A','03/01/2020',10,13,130);
INSERT INTO venta VALUES (3152,'1723172-3','6183303-K','S003','A','14/05/2021',39,15,585);
INSERT INTO venta VALUES (3153,'40851728-1','42396509-6','S004','A','06/03/2021',48,12,576);
INSERT INTO venta VALUES (3154,'15303262-9','32531450-8','S002','A','05/08/2020',10,14,140);
INSERT INTO venta VALUES (3155,'19271288-2','47232966-9','S001','A','05/04/2020',32,14,448);
INSERT INTO venta VALUES (3156,'5680886-8','42396509-6','S002','B','02/06/2020',16,14,224);
INSERT INTO venta VALUES (3157,'4685879-4','29374931-0','S003','A','30/01/2020',28,13,364);
INSERT INTO venta VALUES (3158,'18513792-9','14315947-7','S003','A','09/12/2020',45,13,585);
INSERT INTO venta VALUES (3159,'15663741-6','14519212-9','S003','B','09/02/2020',33,15,495);
INSERT INTO venta VALUES (3160,'31772728-3','14315947-7','S002','A','24/01/2021',31,13,403);
INSERT INTO venta VALUES (3161,'22660782-K','29374931-0','S005','A','18/09/2021',12,15,180);
INSERT INTO venta VALUES (3162,'19124581-4','4810357-K','S002','A','26/11/2020',43,13,559);
INSERT INTO venta VALUES (3163,'28178116-2','14315947-7','S004','B','16/02/2020',36,15,540);
INSERT INTO venta VALUES (3164,'25633949-8','45421301-7','S001','B','11/03/2021',46,12,552);
INSERT INTO venta VALUES (3165,'49296302-K','32531450-8','S004','B','05/01/2021',30,12,360);
INSERT INTO venta VALUES (3166,'7664889-1','4810357-K','S003','B','25/12/2020',15,12,180);
INSERT INTO venta VALUES (3167,'1741449-6','46566450-9','S002','A','25/12/2020',44,13,572);
INSERT INTO venta VALUES (3168,'2748213-9','47232966-9','S002','A','06/01/2020',43,12,516);
INSERT INTO venta VALUES (3169,'10826186-2','46566450-9','S005','B','26/04/2020',12,12,144);
INSERT INTO venta VALUES (3170,'3438400-2','46566450-9','S005','A','25/05/2020',15,14,210);
INSERT INTO venta VALUES (3171,'9994880-9','29374931-0','S003','A','06/08/2021',30,13,390);
INSERT INTO venta VALUES (3172,'32865337-0','47232966-9','S005','A','01/06/2021',26,15,390);
INSERT INTO venta VALUES (3173,'37849952-6','32531450-8','S004','B','22/03/2021',41,14,574);
INSERT INTO venta VALUES (3174,'8917582-8','6183303-K','S003','B','06/08/2020',47,14,658);
INSERT INTO venta VALUES (3175,'7992294-3','20237862-5','S005','B','26/11/2020',41,15,615);
INSERT INTO venta VALUES (3176,'659110-8','8402711-1','S002','A','13/10/2020',29,14,406);
INSERT INTO venta VALUES (3177,'18766252-4','4810357-K','S005','A','22/02/2020',49,15,735);
INSERT INTO venta VALUES (3178,'22305414-5','24180587-5','S002','A','12/08/2020',36,13,468);
INSERT INTO venta VALUES (3179,'28681326-7','45421301-7','S003','A','12/10/2020',37,14,518);
INSERT INTO venta VALUES (3180,'12800750-4','47232966-9','S004','B','22/02/2020',14,13,182);
INSERT INTO venta VALUES (3181,'43509564-K','29374931-0','S003','B','20/11/2020',37,15,555);
INSERT INTO venta VALUES (3182,'24176673-K','14315947-7','S005','B','07/09/2021',33,12,396);
INSERT INTO venta VALUES (3183,'9454867-5','24180587-5','S005','B','26/03/2021',48,15,720);
INSERT INTO venta VALUES (3184,'30577989-K','32531450-8','S005','A','21/08/2020',22,15,330);
INSERT INTO venta VALUES (3185,'26612311-6','45421301-7','S002','A','15/08/2021',12,13,156);
INSERT INTO venta VALUES (3186,'38445393-7','29374931-0','S005','A','29/05/2020',33,14,462);
INSERT INTO venta VALUES (3187,'13282297-2','20237862-5','S001','A','15/08/2020',37,15,555);
INSERT INTO venta VALUES (3188,'1716359-0','6183303-K','S003','A','01/03/2020',34,13,442);
INSERT INTO venta VALUES (3189,'20504888-K','20237862-5','S001','B','03/05/2021',25,13,325);
INSERT INTO venta VALUES (3190,'38685858-6','46566450-9','S005','A','10/08/2021',42,14,588);
INSERT INTO venta VALUES (3191,'35669888-6','4810357-K','S005','B','17/12/2020',31,13,403);
INSERT INTO venta VALUES (3192,'16820896-0','18567395-2','S004','B','25/07/2020',29,14,406);
INSERT INTO venta VALUES (3193,'77629-7','29374931-0','S002','A','04/01/2020',50,15,750);
INSERT INTO venta VALUES (3194,'36787845-2','14519212-9','S003','B','14/02/2020',30,12,360);
INSERT INTO venta VALUES (3195,'44974580-9','32531450-8','S004','A','13/03/2020',30,13,390);
INSERT INTO venta VALUES (3196,'30936921-1','23819125-4','S003','B','12/10/2021',20,15,300);
INSERT INTO venta VALUES (3197,'26810372-4','45421301-7','S004','A','12/10/2020',47,13,611);
INSERT INTO venta VALUES (3198,'49941275-4','45421301-7','S002','A','20/12/2021',15,13,195);
INSERT INTO venta VALUES (3199,'25291221-5','46566450-9','S005','A','28/12/2021',23,15,345);
INSERT INTO venta VALUES (3200,'15516900-1','6183303-K','S002','B','29/11/2021',34,13,442);
INSERT INTO venta VALUES (3201,'27774169-5','46566450-9','S001','A','07/01/2021',30,13,390);
INSERT INTO venta VALUES (3202,'27714165-5','45421301-7','S002','B','05/07/2021',14,12,168);
INSERT INTO venta VALUES (3203,'3976702-3','23819125-4','S001','B','29/12/2021',48,13,624);
INSERT INTO venta VALUES (3204,'2843191-0','45421301-7','S004','A','05/09/2021',14,14,196);
INSERT INTO venta VALUES (3205,'29362748-7','45421301-7','S004','A','01/05/2020',46,15,690);
INSERT INTO venta VALUES (3206,'7265698-9','6183303-K','S001','A','13/07/2021',23,14,322);
INSERT INTO venta VALUES (3207,'33101952-6','6183303-K','S002','B','15/12/2020',46,12,552);
INSERT INTO venta VALUES (3208,'49867216-7','6183303-K','S001','B','17/06/2020',19,13,247);
INSERT INTO venta VALUES (3209,'5420466-3','18567395-2','S004','B','08/04/2020',19,12,228);
INSERT INTO venta VALUES (3210,'13835414-8','14519212-9','S001','B','02/03/2021',19,13,247);
INSERT INTO venta VALUES (3211,'45621994-2','14519212-9','S004','B','12/07/2021',35,15,525);
INSERT INTO venta VALUES (3212,'23859357-3','8402711-1','S003','A','03/10/2021',38,14,532);
INSERT INTO venta VALUES (3213,'26620304-7','32531450-8','S001','A','09/01/2021',22,12,264);
INSERT INTO venta VALUES (3214,'32180979-0','8402711-1','S001','A','01/02/2020',11,14,154);
INSERT INTO venta VALUES (3215,'10631187-0','29374931-0','S005','B','08/08/2020',34,15,510);
INSERT INTO venta VALUES (3216,'48336413-K','20237862-5','S005','A','02/03/2021',28,15,420);
INSERT INTO venta VALUES (3217,'35457831-K','42396509-6','S002','B','17/09/2021',10,12,120);
INSERT INTO venta VALUES (3218,'25785414-0','20237862-5','S004','B','19/08/2021',47,15,705);
INSERT INTO venta VALUES (3219,'48341931-7','47232966-9','S002','A','03/01/2021',25,12,300);
INSERT INTO venta VALUES (3220,'23299228-K','4810357-K','S002','A','08/08/2020',14,14,196);
INSERT INTO venta VALUES (3221,'12316193-9','14519212-9','S005','A','30/08/2021',27,14,378);
INSERT INTO venta VALUES (3222,'48852-6','32531450-8','S005','B','14/12/2021',30,12,360);
INSERT INTO venta VALUES (3223,'39266461-0','23819125-4','S003','B','28/02/2020',21,15,315);
INSERT INTO venta VALUES (3224,'32546761-4','47232966-9','S004','A','22/05/2021',39,15,585);
INSERT INTO venta VALUES (3225,'48105848-1','14519212-9','S002','B','16/03/2020',43,13,559);
INSERT INTO venta VALUES (3226,'25117198-K','42396509-6','S004','A','09/01/2020',42,13,546);
INSERT INTO venta VALUES (3227,'27326951-7','14315947-7','S005','B','28/06/2021',23,12,276);
INSERT INTO venta VALUES (3228,'33547962-9','20237862-5','S001','A','24/01/2021',36,15,540);
INSERT INTO venta VALUES (3229,'43367850-8','42396509-6','S005','A','26/04/2020',45,13,585);
INSERT INTO venta VALUES (3230,'18473160-6','18567395-2','S004','A','24/08/2020',50,15,750);
INSERT INTO venta VALUES (3231,'29902153-K','45421301-7','S002','A','06/09/2021',43,14,602);
INSERT INTO venta VALUES (3232,'7717517-2','32531450-8','S002','A','29/12/2021',23,13,299);
INSERT INTO venta VALUES (3233,'48466707-1','29374931-0','S005','A','28/11/2020',17,12,204);
INSERT INTO venta VALUES (3234,'43303774-K','47232966-9','S004','B','02/04/2020',18,12,216);
INSERT INTO venta VALUES (3235,'46153150-4','14519212-9','S002','A','25/01/2020',20,12,240);
INSERT INTO venta VALUES (3236,'25902267-3','32531450-8','S005','A','25/10/2020',41,14,574);
INSERT INTO venta VALUES (3237,'25501612-1','20237862-5','S004','A','18/04/2021',48,13,624);
INSERT INTO venta VALUES (3238,'28111191-4','24180587-5','S002','B','05/09/2021',30,12,360);
INSERT INTO venta VALUES (3239,'46656748-5','23819125-4','S002','B','15/01/2020',31,13,403);
INSERT INTO venta VALUES (3240,'26279572-1','20237862-5','S004','B','30/09/2021',13,13,169);
INSERT INTO venta VALUES (3241,'6427641-7','29374931-0','S001','A','02/04/2020',39,12,468);
INSERT INTO venta VALUES (3242,'26484700-1','14519212-9','S004','B','01/12/2021',47,12,564);
INSERT INTO venta VALUES (3243,'18153438-9','6183303-K','S002','A','23/09/2020',47,13,611);
INSERT INTO venta VALUES (3244,'20380351-6','45421301-7','S002','B','25/06/2021',20,12,240);
INSERT INTO venta VALUES (3245,'24204534-3','14315947-7','S001','A','11/05/2020',15,12,180);
INSERT INTO venta VALUES (3246,'26393893-3','18567395-2','S004','A','02/09/2021',18,14,252);
INSERT INTO venta VALUES (3247,'28241890-8','45421301-7','S002','A','16/03/2020',50,15,750);
INSERT INTO venta VALUES (3248,'25342402-8','18567395-2','S002','A','21/01/2021',38,12,456);
INSERT INTO venta VALUES (3249,'38425287-7','23819125-4','S005','A','12/09/2020',16,13,208);
INSERT INTO venta VALUES (3250,'2269681-5','29374931-0','S001','A','14/10/2021',37,12,444);
INSERT INTO venta VALUES (3251,'12906127-8','45421301-7','S005','B','18/07/2021',42,14,588);
INSERT INTO venta VALUES (3252,'12949968-0','6183303-K','S005','B','14/04/2021',27,15,405);
INSERT INTO venta VALUES (3253,'4443244-7','23819125-4','S001','A','24/12/2020',26,14,364);
INSERT INTO venta VALUES (3254,'11482753-3','46566450-9','S004','B','13/04/2020',23,15,345);
INSERT INTO venta VALUES (3255,'464335-6','20237862-5','S002','A','05/02/2020',12,14,168);
INSERT INTO venta VALUES (3256,'36692859-6','45421301-7','S004','A','01/10/2021',11,14,154);
INSERT INTO venta VALUES (3257,'2723837-8','32531450-8','S002','B','22/08/2020',41,13,533);
INSERT INTO venta VALUES (3258,'1890312-1','8402711-1','S003','B','01/07/2021',45,14,630);
INSERT INTO venta VALUES (3259,'12822975-2','20237862-5','S001','B','22/09/2021',27,13,351);
INSERT INTO venta VALUES (3260,'3354319-0','24180587-5','S002','B','29/11/2021',13,12,156);
INSERT INTO venta VALUES (3261,'13327230-5','4810357-K','S005','B','09/08/2021',24,15,360);
INSERT INTO venta VALUES (3262,'44254417-4','46566450-9','S003','A','12/04/2021',31,13,403);
INSERT INTO venta VALUES (3263,'10515997-8','14519212-9','S005','B','04/09/2020',37,12,444);
INSERT INTO venta VALUES (3264,'2560108-4','24180587-5','S004','A','12/04/2020',16,13,208);
INSERT INTO venta VALUES (3265,'33888803-1','32531450-8','S005','B','16/11/2020',24,12,288);
INSERT INTO venta VALUES (3266,'3312803-7','14315947-7','S005','A','27/07/2020',32,15,480);
INSERT INTO venta VALUES (3267,'42224976-1','4810357-K','S002','B','09/08/2021',43,12,516);
INSERT INTO venta VALUES (3268,'22950386-3','32531450-8','S003','B','09/01/2021',49,12,588);
INSERT INTO venta VALUES (3269,'45952563-7','14519212-9','S003','A','09/11/2020',21,12,252);
INSERT INTO venta VALUES (3270,'32678177-0','46566450-9','S001','A','11/07/2020',21,15,315);
INSERT INTO venta VALUES (3271,'44597831-0','47232966-9','S002','B','12/02/2021',33,15,495);
INSERT INTO venta VALUES (3272,'12674508-7','29374931-0','S001','A','15/01/2020',31,13,403);
INSERT INTO venta VALUES (3273,'33723826-2','14315947-7','S001','B','16/12/2020',32,13,416);
INSERT INTO venta VALUES (3274,'2152299-6','14315947-7','S001','B','16/04/2021',36,14,504);
INSERT INTO venta VALUES (3275,'40709835-8','24180587-5','S005','A','06/12/2021',10,15,150);
INSERT INTO venta VALUES (3276,'1934695-1','20237862-5','S005','A','27/03/2021',35,15,525);
INSERT INTO venta VALUES (3277,'17262729-3','14519212-9','S002','B','05/12/2021',19,14,266);
INSERT INTO venta VALUES (3278,'42634999-K','6183303-K','S004','B','07/04/2020',41,14,574);
INSERT INTO venta VALUES (3279,'12868975-3','45421301-7','S001','A','23/09/2021',37,15,555);
INSERT INTO venta VALUES (3280,'19950463-0','42396509-6','S001','A','24/05/2020',36,15,540);
INSERT INTO venta VALUES (3281,'35301718-7','47232966-9','S004','A','14/08/2021',12,15,180);
INSERT INTO venta VALUES (3282,'7697976-6','29374931-0','S002','A','04/02/2020',49,12,588);
INSERT INTO venta VALUES (3283,'39657376-8','14315947-7','S002','A','24/02/2021',20,15,300);
INSERT INTO venta VALUES (3284,'858411-7','8402711-1','S002','B','01/11/2021',46,12,552);
INSERT INTO venta VALUES (3285,'39475237-1','29374931-0','S005','B','12/05/2020',15,15,225);
INSERT INTO venta VALUES (3286,'17162191-7','4810357-K','S002','A','15/03/2021',43,14,602);
INSERT INTO venta VALUES (3287,'4633906-1','24180587-5','S003','A','09/05/2021',45,15,675);
INSERT INTO venta VALUES (3288,'44228716-3','47232966-9','S003','B','16/05/2020',21,13,273);
INSERT INTO venta VALUES (3289,'37850321-3','6183303-K','S003','B','07/03/2020',44,14,616);
INSERT INTO venta VALUES (3290,'7652770-9','42396509-6','S005','A','20/01/2020',49,14,686);
INSERT INTO venta VALUES (3291,'20570733-6','4810357-K','S004','B','03/06/2021',17,13,221);
INSERT INTO venta VALUES (3292,'31373578-8','47232966-9','S003','A','28/05/2021',23,12,276);
INSERT INTO venta VALUES (3293,'13119171-5','32531450-8','S003','A','24/03/2020',20,15,300);
INSERT INTO venta VALUES (3294,'1326116-4','24180587-5','S001','A','05/06/2021',36,15,540);
INSERT INTO venta VALUES (3295,'8471496-8','32531450-8','S005','A','06/11/2020',43,13,559);
INSERT INTO venta VALUES (3296,'45463922-7','42396509-6','S005','B','01/12/2021',14,14,196);
INSERT INTO venta VALUES (3297,'4795965-9','6183303-K','S001','A','15/10/2021',17,14,238);
INSERT INTO venta VALUES (3298,'1985837-5','8402711-1','S003','A','19/02/2021',38,12,456);
INSERT INTO venta VALUES (3299,'2632416-5','42396509-6','S005','B','04/05/2020',44,13,572);
INSERT INTO venta VALUES (3300,'7870174-9','4810357-K','S003','A','28/07/2021',16,12,192);
INSERT INTO venta VALUES (3301,'9640216-3','6183303-K','S004','A','13/06/2020',29,14,406);
INSERT INTO venta VALUES (3302,'323954-3','24180587-5','S005','A','22/08/2021',48,12,576);
INSERT INTO venta VALUES (3303,'3779314-0','18567395-2','S005','A','23/01/2020',43,13,559);
INSERT INTO venta VALUES (3304,'22668708-4','42396509-6','S001','A','30/04/2021',40,14,560);
INSERT INTO venta VALUES (3305,'4363197-7','6183303-K','S002','A','04/02/2020',22,13,286);
INSERT INTO venta VALUES (3306,'17402870-2','42396509-6','S004','A','08/08/2021',38,15,570);
INSERT INTO venta VALUES (3307,'15985913-4','32531450-8','S005','B','25/05/2021',19,13,247);
INSERT INTO venta VALUES (3308,'22962413-K','6183303-K','S002','A','17/05/2021',10,12,120);
INSERT INTO venta VALUES (3309,'784324-0','47232966-9','S004','A','16/10/2020',50,13,650);
INSERT INTO venta VALUES (3310,'46573375-6','4810357-K','S003','A','06/03/2020',27,12,324);
INSERT INTO venta VALUES (3311,'26173173-8','42396509-6','S005','B','12/07/2021',23,15,345);
INSERT INTO venta VALUES (3312,'3777041-8','42396509-6','S005','B','19/09/2020',20,13,260);
INSERT INTO venta VALUES (3313,'37608953-3','6183303-K','S005','A','12/08/2021',31,15,465);
INSERT INTO venta VALUES (3314,'3920779-6','45421301-7','S005','A','13/04/2020',32,13,416);
INSERT INTO venta VALUES (3315,'38693717-6','42396509-6','S003','B','05/06/2021',28,15,420);
INSERT INTO venta VALUES (3316,'27939428-3','45421301-7','S003','A','03/10/2020',42,13,546);
INSERT INTO venta VALUES (3317,'22451273-2','29374931-0','S005','B','31/07/2021',11,12,132);
INSERT INTO venta VALUES (3318,'8521947-2','4810357-K','S004','B','17/03/2021',15,14,210);
INSERT INTO venta VALUES (3319,'9598155-0','45421301-7','S004','B','23/10/2020',32,15,480);
INSERT INTO venta VALUES (3320,'39282475-8','24180587-5','S003','B','15/11/2020',37,12,444);
INSERT INTO venta VALUES (3321,'14649226-6','45421301-7','S005','A','17/09/2021',10,15,150);
INSERT INTO venta VALUES (3322,'45291827-7','20237862-5','S005','A','08/06/2020',41,12,492);
INSERT INTO venta VALUES (3323,'46533262-K','47232966-9','S004','B','29/11/2021',46,14,644);
INSERT INTO venta VALUES (3324,'3771417-8','32531450-8','S004','A','22/03/2020',19,15,285);
INSERT INTO venta VALUES (3325,'33163155-8','24180587-5','S001','A','12/03/2021',12,13,156);
INSERT INTO venta VALUES (3326,'17414897-K','24180587-5','S003','A','01/03/2021',18,15,270);
INSERT INTO venta VALUES (3327,'15197648-4','42396509-6','S001','A','15/01/2021',31,14,434);
INSERT INTO venta VALUES (3328,'724295-6','47232966-9','S004','B','21/04/2020',14,15,210);
INSERT INTO venta VALUES (3329,'15727662-K','4810357-K','S002','A','28/10/2021',25,15,375);
INSERT INTO venta VALUES (3330,'27310657-K','23819125-4','S005','A','13/06/2020',35,12,420);
INSERT INTO venta VALUES (3331,'241344-2','24180587-5','S002','A','05/02/2020',24,12,288);
INSERT INTO venta VALUES (3332,'7690652-1','46566450-9','S005','B','09/09/2020',50,12,600);
INSERT INTO venta VALUES (3333,'36178672-6','42396509-6','S005','B','18/10/2020',39,13,507);
INSERT INTO venta VALUES (3334,'8531489-0','42396509-6','S002','B','23/11/2021',23,15,345);
INSERT INTO venta VALUES (3335,'35707554-8','42396509-6','S002','B','23/01/2021',39,14,546);
INSERT INTO venta VALUES (3336,'18605597-7','4810357-K','S001','A','03/11/2021',14,14,196);
INSERT INTO venta VALUES (3337,'14457237-8','29374931-0','S001','A','17/06/2020',34,15,510);
INSERT INTO venta VALUES (3338,'34905567-8','8402711-1','S004','A','12/03/2021',33,13,429);
INSERT INTO venta VALUES (3339,'2426896-9','45421301-7','S005','A','28/04/2020',13,14,182);
INSERT INTO venta VALUES (3340,'39771947-2','47232966-9','S003','B','10/11/2021',10,15,150);
INSERT INTO venta VALUES (3341,'36697535-7','6183303-K','S002','B','29/09/2020',31,13,403);
INSERT INTO venta VALUES (3342,'50111203-8','47232966-9','S004','B','17/02/2021',21,14,294);
INSERT INTO venta VALUES (3343,'5624553-7','14315947-7','S001','A','21/09/2021',42,15,630);
INSERT INTO venta VALUES (3344,'1723172-3','14315947-7','S004','A','21/02/2020',12,12,144);
INSERT INTO venta VALUES (3345,'40851728-1','45421301-7','S001','A','17/08/2021',34,12,408);
INSERT INTO venta VALUES (3346,'15303262-9','14315947-7','S003','B','04/12/2021',39,12,468);
INSERT INTO venta VALUES (3347,'31272855-9','42396509-6','S003','A','08/10/2021',11,13,143);
INSERT INTO venta VALUES (3348,'24308974-3','4810357-K','S004','A','26/01/2021',20,15,300);
INSERT INTO venta VALUES (3349,'37942920-3','14315947-7','S003','A','03/10/2020',42,12,504);
INSERT INTO venta VALUES (3350,'15976879-1','42396509-6','S005','B','02/07/2021',28,15,420);
INSERT INTO venta VALUES (3351,'22941315-5','18567395-2','S004','B','30/07/2020',31,13,403);
INSERT INTO venta VALUES (3352,'11146117-1','24180587-5','S004','A','06/08/2021',45,12,540);
INSERT INTO venta VALUES (3353,'18993555-2','47232966-9','S004','A','25/05/2020',38,14,532);
INSERT INTO venta VALUES (3354,'6828569-0','47232966-9','S005','B','18/03/2021',41,14,574);
INSERT INTO venta VALUES (3355,'8910706-7','14519212-9','S004','A','02/09/2021',33,14,462);
INSERT INTO venta VALUES (3356,'37538683-6','23819125-4','S003','B','01/07/2021',21,13,273);
INSERT INTO venta VALUES (3357,'49506917-6','32531450-8','S005','A','14/07/2020',27,15,405);
INSERT INTO venta VALUES (3358,'26465143-3','42396509-6','S004','A','30/08/2021',11,13,143);
INSERT INTO venta VALUES (3359,'12863360-K','23819125-4','S003','B','30/07/2020',24,13,312);
INSERT INTO venta VALUES (3360,'35464842-3','23819125-4','S001','A','04/04/2021',14,15,210);
INSERT INTO venta VALUES (3361,'49228383-5','24180587-5','S004','B','04/12/2020',18,12,216);
INSERT INTO venta VALUES (3362,'4843648-K','20237862-5','S001','B','18/07/2020',44,15,660);
INSERT INTO venta VALUES (3363,'36710570-4','8402711-1','S001','B','21/03/2021',23,14,322);
INSERT INTO venta VALUES (3364,'36463590-7','32531450-8','S004','A','07/10/2021',36,15,540);
INSERT INTO venta VALUES (3365,'49261260-K','23819125-4','S005','B','26/05/2020',21,13,273);
INSERT INTO venta VALUES (3366,'67016-2','14519212-9','S004','A','08/11/2020',42,12,504);
INSERT INTO venta VALUES (3367,'17247534-5','18567395-2','S003','B','29/09/2020',25,12,300);
INSERT INTO venta VALUES (3368,'42666994-3','24180587-5','S005','A','14/01/2020',19,15,285);
INSERT INTO venta VALUES (3369,'9513916-7','24180587-5','S005','A','20/07/2020',13,12,156);
INSERT INTO venta VALUES (3370,'50344810-6','20237862-5','S001','B','23/11/2020',40,14,560);
INSERT INTO venta VALUES (3371,'478918-0','24180587-5','S004','B','05/09/2021',44,13,572);
INSERT INTO venta VALUES (3372,'49880234-6','4810357-K','S004','A','02/07/2020',21,12,252);
INSERT INTO venta VALUES (3373,'13931994-K','47232966-9','S004','A','29/01/2020',38,14,532);
INSERT INTO venta VALUES (3374,'46490831-5','14519212-9','S004','B','07/09/2021',27,12,324);
INSERT INTO venta VALUES (3375,'31103598-3','23819125-4','S001','B','26/12/2021',19,13,247);
INSERT INTO venta VALUES (3376,'25918150-K','45421301-7','S005','B','11/02/2020',16,15,240);
INSERT INTO venta VALUES (3377,'3528420-6','14519212-9','S004','B','05/09/2021',28,12,336);
INSERT INTO venta VALUES (3378,'35579147-5','20237862-5','S003','B','08/07/2020',17,12,204);
INSERT INTO venta VALUES (3379,'31603398-9','4810357-K','S003','A','18/08/2021',29,12,348);
INSERT INTO venta VALUES (3380,'33672606-9','6183303-K','S001','B','25/08/2021',33,14,462);
INSERT INTO venta VALUES (3381,'47352241-1','46566450-9','S005','B','13/11/2020',28,13,364);
INSERT INTO venta VALUES (3382,'19928743-5','20237862-5','S002','B','08/04/2021',16,15,240);
INSERT INTO venta VALUES (3383,'43838491-K','18567395-2','S003','B','08/02/2020',10,15,150);
INSERT INTO venta VALUES (3384,'48440778-9','45421301-7','S005','A','06/06/2020',24,13,312);
INSERT INTO venta VALUES (3385,'3596015-5','4810357-K','S001','A','13/05/2021',38,12,456);
INSERT INTO venta VALUES (3386,'41955593-2','14519212-9','S005','B','25/04/2020',38,14,532);
INSERT INTO venta VALUES (3387,'38253942-7','14315947-7','S002','B','12/09/2021',26,15,390);
INSERT INTO venta VALUES (3388,'26671316-9','24180587-5','S004','A','14/10/2020',37,15,555);
INSERT INTO venta VALUES (3389,'8277892-6','8402711-1','S005','A','15/04/2020',47,12,564);
INSERT INTO venta VALUES (3390,'8759565-K','4810357-K','S001','B','28/12/2020',11,12,132);
INSERT INTO venta VALUES (3391,'13869214-0','6183303-K','S001','B','11/04/2020',22,12,264);
INSERT INTO venta VALUES (3392,'6752700-3','29374931-0','S001','A','14/12/2021',20,14,280);
INSERT INTO venta VALUES (3393,'449367-2','20237862-5','S001','B','24/05/2021',19,12,228);
INSERT INTO venta VALUES (3394,'3812859-0','23819125-4','S005','A','10/12/2021',37,13,481);
INSERT INTO venta VALUES (3395,'14258794-7','8402711-1','S005','B','10/11/2021',21,14,294);
INSERT INTO venta VALUES (3396,'46540292-K','8402711-1','S004','B','04/12/2021',12,15,180);
INSERT INTO venta VALUES (3397,'21525102-0','24180587-5','S005','A','13/09/2020',38,15,570);
INSERT INTO venta VALUES (3398,'7333815-8','4810357-K','S001','A','31/03/2020',13,14,182);
INSERT INTO venta VALUES (3399,'19222587-6','32531450-8','S005','B','22/10/2020',41,12,492);
INSERT INTO venta VALUES (3400,'12864837-2','46566450-9','S004','B','18/11/2020',47,12,564);
INSERT INTO venta VALUES (3401,'5807199-4','23819125-4','S005','A','02/08/2021',36,13,468);
INSERT INTO venta VALUES (3402,'34403852-K','46566450-9','S003','A','23/06/2021',38,13,494);
INSERT INTO venta VALUES (3403,'6265249-7','23819125-4','S002','B','17/05/2020',17,12,204);
INSERT INTO venta VALUES (3404,'17861331-6','24180587-5','S002','B','17/01/2020',25,14,350);
INSERT INTO venta VALUES (3405,'40878137-K','20237862-5','S001','A','16/03/2021',29,13,377);
INSERT INTO venta VALUES (3406,'48233981-6','29374931-0','S002','B','20/03/2020',31,13,403);
INSERT INTO venta VALUES (3407,'14388320-5','29374931-0','S001','A','15/01/2021',20,15,300);
INSERT INTO venta VALUES (3408,'21327989-0','4810357-K','S004','B','26/07/2021',14,14,196);
INSERT INTO venta VALUES (3409,'23480965-2','20237862-5','S003','A','03/06/2021',10,13,130);
INSERT INTO venta VALUES (3410,'4726260-7','14315947-7','S003','B','01/05/2020',16,15,240);
INSERT INTO venta VALUES (3411,'2715114-0','14519212-9','S002','B','28/06/2021',42,13,546);
INSERT INTO venta VALUES (3412,'40225788-1','46566450-9','S001','B','29/11/2020',13,14,182);
INSERT INTO venta VALUES (3413,'4679724-8','46566450-9','S004','B','08/02/2021',49,12,588);
INSERT INTO venta VALUES (3414,'20850795-8','46566450-9','S005','A','01/10/2021',32,12,384);
INSERT INTO venta VALUES (3415,'32732475-6','24180587-5','S003','B','05/11/2020',38,14,532);
INSERT INTO venta VALUES (3416,'47753672-7','32531450-8','S003','B','24/01/2020',50,15,750);
INSERT INTO venta VALUES (3417,'17408118-2','46566450-9','S002','A','04/09/2021',38,14,532);
INSERT INTO venta VALUES (3418,'1755469-7','45421301-7','S001','B','26/10/2021',28,12,336);
INSERT INTO venta VALUES (3419,'10401554-9','45421301-7','S003','A','31/03/2020',45,15,675);
INSERT INTO venta VALUES (3420,'48601711-2','20237862-5','S004','A','20/07/2020',45,15,675);
INSERT INTO venta VALUES (3421,'3238865-5','6183303-K','S005','A','29/01/2020',46,14,644);
INSERT INTO venta VALUES (3422,'49668401-K','18567395-2','S001','A','06/10/2021',18,14,252);
INSERT INTO venta VALUES (3423,'5646861-7','32531450-8','S001','B','03/08/2020',37,15,555);
INSERT INTO venta VALUES (3424,'27340343-4','8402711-1','S005','B','25/06/2020',36,13,468);
INSERT INTO venta VALUES (3425,'18246584-4','24180587-5','S004','A','25/06/2021',42,13,546);
INSERT INTO venta VALUES (3426,'2943424-7','18567395-2','S002','B','30/12/2020',45,12,540);
INSERT INTO venta VALUES (3427,'19430883-3','45421301-7','S003','A','13/10/2021',11,13,143);
INSERT INTO venta VALUES (3428,'44924647-0','18567395-2','S002','B','14/09/2020',15,13,195);
INSERT INTO venta VALUES (3429,'29448746-8','14519212-9','S001','A','20/06/2021',40,12,480);
INSERT INTO venta VALUES (3430,'17881496-6','46566450-9','S001','B','11/11/2021',33,13,429);
INSERT INTO venta VALUES (3431,'4280701-K','47232966-9','S003','A','11/12/2020',36,13,468);
INSERT INTO venta VALUES (3432,'17735202-0','14519212-9','S004','A','22/08/2020',41,12,492);
INSERT INTO venta VALUES (3433,'31158390-5','8402711-1','S001','B','31/05/2021',31,13,403);
INSERT INTO venta VALUES (3434,'36735314-7','24180587-5','S003','A','24/03/2020',31,12,372);
INSERT INTO venta VALUES (3435,'49277310-7','4810357-K','S005','A','12/09/2021',47,12,564);
INSERT INTO venta VALUES (3436,'2284443-1','45421301-7','S002','A','04/07/2020',40,12,480);
INSERT INTO venta VALUES (3437,'30626881-3','8402711-1','S003','A','09/04/2021',23,13,299);
INSERT INTO venta VALUES (3438,'34594149-5','47232966-9','S004','A','19/01/2020',36,15,540);
INSERT INTO venta VALUES (3439,'1687382-9','20237862-5','S002','B','24/09/2021',14,14,196);
INSERT INTO venta VALUES (3440,'18180325-8','47232966-9','S004','A','27/06/2021',20,12,240);
INSERT INTO venta VALUES (3441,'43789569-4','32531450-8','S001','A','17/10/2021',15,15,225);
INSERT INTO venta VALUES (3442,'22619294-8','14315947-7','S001','A','02/09/2020',12,14,168);
INSERT INTO venta VALUES (3443,'333681-6','46566450-9','S001','A','28/03/2021',27,12,324);
INSERT INTO venta VALUES (3444,'45515727-7','4810357-K','S003','B','30/04/2020',43,15,645);
INSERT INTO venta VALUES (3445,'19982868-1','6183303-K','S005','B','08/06/2020',42,14,588);
INSERT INTO venta VALUES (3446,'15270546-8','46566450-9','S004','B','16/10/2021',16,15,240);
INSERT INTO venta VALUES (3447,'7528135-8','45421301-7','S001','A','06/09/2021',24,12,288);
INSERT INTO venta VALUES (3448,'2582198-K','42396509-6','S004','B','26/02/2020',40,12,480);
INSERT INTO venta VALUES (3449,'191086-8','32531450-8','S005','B','11/02/2020',37,15,555);
INSERT INTO venta VALUES (3450,'26190571-K','18567395-2','S002','A','08/09/2021',47,14,658);
INSERT INTO venta VALUES (3451,'833293-2','6183303-K','S004','A','07/07/2020',31,15,465);
INSERT INTO venta VALUES (3452,'20724128-8','47232966-9','S002','B','06/10/2020',32,14,448);
INSERT INTO venta VALUES (3453,'9877805-5','24180587-5','S001','B','02/07/2020',13,13,169);
INSERT INTO venta VALUES (3454,'49557213-7','20237862-5','S004','A','07/06/2020',27,15,405);
INSERT INTO venta VALUES (3455,'35647373-6','6183303-K','S003','A','11/07/2021',31,12,372);
INSERT INTO venta VALUES (3456,'29221233-K','46566450-9','S004','B','03/06/2021',12,12,144);
INSERT INTO venta VALUES (3457,'40926907-9','46566450-9','S003','A','02/12/2021',28,15,420);
INSERT INTO venta VALUES (3458,'9258-4','20237862-5','S002','B','04/09/2020',31,14,434);
INSERT INTO venta VALUES (3459,'24832692-1','23819125-4','S001','B','14/12/2021',39,14,546);
INSERT INTO venta VALUES (3460,'26524609-5','20237862-5','S003','A','08/11/2021',38,12,456);
INSERT INTO venta VALUES (3461,'4974648-2','32531450-8','S004','B','13/11/2020',47,15,705);
INSERT INTO venta VALUES (3462,'17989432-7','8402711-1','S001','A','31/12/2021',44,14,616);
INSERT INTO venta VALUES (3463,'25289704-6','23819125-4','S001','A','31/03/2021',38,13,494);
INSERT INTO venta VALUES (3464,'46705421-K','46566450-9','S003','B','18/05/2020',17,13,221);
INSERT INTO venta VALUES (3465,'9701205-9','32531450-8','S004','A','12/12/2020',31,15,465);
INSERT INTO venta VALUES (3466,'29230123-5','23819125-4','S002','B','16/05/2020',32,15,480);
INSERT INTO venta VALUES (3467,'13894560-K','24180587-5','S001','B','14/04/2021',20,15,300);
INSERT INTO venta VALUES (3468,'28499290-3','46566450-9','S001','A','08/12/2020',31,12,372);
INSERT INTO venta VALUES (3469,'12167726-1','32531450-8','S002','B','03/09/2021',20,14,280);
INSERT INTO venta VALUES (3470,'41726403-5','8402711-1','S001','A','27/05/2021',46,14,644);
INSERT INTO venta VALUES (3471,'19399800-3','14519212-9','S004','B','23/05/2020',47,15,705);
INSERT INTO venta VALUES (3472,'27974329-6','18567395-2','S005','A','07/06/2021',48,12,576);
INSERT INTO venta VALUES (3473,'38706583-0','29374931-0','S004','A','29/11/2021',18,15,270);
INSERT INTO venta VALUES (3474,'10334386-0','18567395-2','S004','A','20/11/2021',33,12,396);
INSERT INTO venta VALUES (3475,'1710194-3','18567395-2','S004','A','06/11/2021',22,14,308);
INSERT INTO venta VALUES (3476,'41897708-6','14519212-9','S004','B','25/09/2020',33,14,462);
INSERT INTO venta VALUES (3477,'18569629-4','18567395-2','S002','B','13/04/2020',31,15,465);
INSERT INTO venta VALUES (3478,'34836330-1','4810357-K','S004','A','03/07/2020',35,14,490);
INSERT INTO venta VALUES (3479,'4030140-2','14315947-7','S001','B','12/12/2020',10,14,140);
INSERT INTO venta VALUES (3480,'193052-4','45421301-7','S002','A','01/05/2021',40,13,520);
INSERT INTO venta VALUES (3481,'28548464-2','14519212-9','S001','A','24/11/2020',45,12,540);
INSERT INTO venta VALUES (3482,'19347620-1','14519212-9','S005','B','24/09/2020',50,14,700);
INSERT INTO venta VALUES (3483,'19868588-7','24180587-5','S002','A','11/08/2020',48,12,576);
INSERT INTO venta VALUES (3484,'11779135-1','6183303-K','S001','B','20/12/2020',45,12,540);
INSERT INTO venta VALUES (3485,'3987147-5','42396509-6','S003','A','23/06/2020',41,13,533);
INSERT INTO venta VALUES (3486,'9524316-9','42396509-6','S003','B','28/08/2020',24,13,312);
INSERT INTO venta VALUES (3487,'9181501-K','32531450-8','S003','B','09/01/2020',43,13,559);
INSERT INTO venta VALUES (3488,'25859399-5','8402711-1','S001','B','20/03/2021',14,13,182);
INSERT INTO venta VALUES (3489,'33653809-2','14519212-9','S004','B','20/12/2020',29,13,377);
INSERT INTO venta VALUES (3490,'29990933-6','46566450-9','S004','A','09/10/2020',32,12,384);
INSERT INTO venta VALUES (3491,'22445920-3','45421301-7','S003','B','30/07/2021',32,13,416);
INSERT INTO venta VALUES (3492,'11946670-9','45421301-7','S005','B','18/03/2020',19,12,228);
INSERT INTO venta VALUES (3493,'6664486-3','46566450-9','S005','B','26/11/2021',41,15,615);
INSERT INTO venta VALUES (3494,'6130291-3','23819125-4','S002','A','05/03/2021',18,12,216);
INSERT INTO venta VALUES (3495,'5877180-5','42396509-6','S004','A','27/10/2020',49,13,637);
INSERT INTO venta VALUES (3496,'262851-1','8402711-1','S001','A','08/04/2020',23,15,345);
INSERT INTO venta VALUES (3497,'1490295-3','20237862-5','S001','B','30/04/2021',16,14,224);
INSERT INTO venta VALUES (3498,'36872343-6','14315947-7','S005','B','10/08/2020',12,14,168);
INSERT INTO venta VALUES (3499,'22512684-4','18567395-2','S001','B','28/06/2021',13,12,156);
INSERT INTO venta VALUES (3500,'211762-2','23819125-4','S003','A','25/08/2020',41,14,574);
INSERT INTO venta VALUES (3501,'49139862-0','42396509-6','S001','A','28/04/2021',40,13,520);
INSERT INTO venta VALUES (3502,'19271288-2','47232966-9','S004','A','02/08/2021',45,13,585);
INSERT INTO venta VALUES (3503,'5680886-8','4810357-K','S001','B','07/10/2020',38,13,494);
INSERT INTO venta VALUES (3504,'4685879-4','6183303-K','S005','B','23/02/2020',50,13,650);
INSERT INTO venta VALUES (3505,'18513792-9','6183303-K','S003','B','20/10/2020',24,13,312);
INSERT INTO venta VALUES (3506,'15663741-6','32531450-8','S004','B','21/12/2021',39,15,585);
INSERT INTO venta VALUES (3507,'31772728-3','32531450-8','S005','A','30/06/2020',16,13,208);
INSERT INTO venta VALUES (3508,'22660782-K','4810357-K','S004','B','15/07/2021',25,14,350);
INSERT INTO venta VALUES (3509,'19124581-4','32531450-8','S005','B','25/07/2021',15,12,180);
INSERT INTO venta VALUES (3510,'28178116-2','46566450-9','S001','A','14/04/2020',47,14,658);
INSERT INTO venta VALUES (3511,'25633949-8','8402711-1','S003','B','29/06/2020',31,13,403);
INSERT INTO venta VALUES (3512,'49296302-K','8402711-1','S003','B','11/09/2021',14,14,196);
INSERT INTO venta VALUES (3513,'7664889-1','46566450-9','S004','B','12/09/2021',15,15,225);
INSERT INTO venta VALUES (3514,'1741449-6','4810357-K','S004','B','01/02/2020',11,12,132);
INSERT INTO venta VALUES (3515,'2748213-9','6183303-K','S005','B','05/04/2021',29,13,377);
INSERT INTO venta VALUES (3516,'10826186-2','14315947-7','S002','A','30/08/2020',46,14,644);
INSERT INTO venta VALUES (3517,'3438400-2','23819125-4','S005','B','22/09/2021',10,14,140);
INSERT INTO venta VALUES (3518,'9994880-9','14315947-7','S004','B','22/01/2020',33,12,396);
INSERT INTO venta VALUES (3519,'32865337-0','46566450-9','S005','B','13/01/2020',45,15,675);
INSERT INTO venta VALUES (3520,'37849952-6','14519212-9','S005','A','05/04/2021',36,15,540);
INSERT INTO venta VALUES (3521,'8917582-8','14519212-9','S002','A','18/10/2021',29,12,348);
INSERT INTO venta VALUES (3522,'7992294-3','42396509-6','S001','B','01/12/2020',43,13,559);
INSERT INTO venta VALUES (3523,'659110-8','32531450-8','S003','A','07/05/2020',38,12,456);
INSERT INTO venta VALUES (3524,'18766252-4','4810357-K','S005','B','24/05/2021',18,15,270);
INSERT INTO venta VALUES (3525,'22305414-5','4810357-K','S005','A','01/12/2021',37,14,518);
INSERT INTO venta VALUES (3526,'28681326-7','24180587-5','S001','A','21/03/2021',13,13,169);
INSERT INTO venta VALUES (3527,'12800750-4','14315947-7','S001','B','13/07/2021',19,14,266);
INSERT INTO venta VALUES (3528,'43509564-K','42396509-6','S004','A','19/01/2020',10,13,130);
INSERT INTO venta VALUES (3529,'24176673-K','20237862-5','S001','A','27/02/2021',41,13,533);
INSERT INTO venta VALUES (3530,'9454867-5','42396509-6','S005','B','26/05/2021',47,14,658);
INSERT INTO venta VALUES (3531,'30577989-K','23819125-4','S005','B','10/01/2021',50,15,750);
INSERT INTO venta VALUES (3532,'26612311-6','45421301-7','S001','B','05/12/2020',31,15,465);
INSERT INTO venta VALUES (3533,'38445393-7','32531450-8','S001','A','08/06/2020',18,14,252);
INSERT INTO venta VALUES (3534,'13282297-2','24180587-5','S001','B','28/04/2021',49,14,686);
INSERT INTO venta VALUES (3535,'1716359-0','8402711-1','S004','B','28/05/2021',30,12,360);
INSERT INTO venta VALUES (3536,'20504888-K','14315947-7','S001','B','20/12/2021',35,14,490);
INSERT INTO venta VALUES (3537,'38685858-6','14315947-7','S005','A','28/02/2020',24,13,312);
INSERT INTO venta VALUES (3538,'35669888-6','47232966-9','S003','B','25/04/2021',11,12,132);
INSERT INTO venta VALUES (3539,'16820896-0','14519212-9','S003','A','09/02/2020',12,14,168);
INSERT INTO venta VALUES (3540,'77629-7','20237862-5','S003','B','12/10/2021',26,14,364);
INSERT INTO venta VALUES (3541,'36787845-2','8402711-1','S003','B','29/07/2020',10,12,120);
INSERT INTO venta VALUES (3542,'44974580-9','23819125-4','S004','B','22/06/2020',42,15,630);
INSERT INTO venta VALUES (3543,'30936921-1','45421301-7','S005','B','01/03/2020',46,14,644);
INSERT INTO venta VALUES (3544,'26810372-4','42396509-6','S004','A','12/01/2020',29,12,348);
INSERT INTO venta VALUES (3545,'49941275-4','42396509-6','S002','A','18/10/2021',46,13,598);
INSERT INTO venta VALUES (3546,'25291221-5','20237862-5','S002','B','17/05/2020',23,14,322);
INSERT INTO venta VALUES (3547,'15516900-1','47232966-9','S005','A','30/09/2021',29,12,348);
INSERT INTO venta VALUES (3548,'27774169-5','42396509-6','S001','B','19/12/2020',42,15,630);
INSERT INTO venta VALUES (3549,'27714165-5','4810357-K','S003','B','29/08/2020',48,15,720);
INSERT INTO venta VALUES (3550,'3976702-3','6183303-K','S004','A','15/03/2020',49,15,735);
INSERT INTO venta VALUES (3551,'2843191-0','20237862-5','S005','A','27/01/2021',30,15,450);
INSERT INTO venta VALUES (3552,'29362748-7','42396509-6','S001','B','23/01/2020',42,13,546);
INSERT INTO venta VALUES (3553,'7265698-9','42396509-6','S001','A','26/06/2020',44,13,572);
INSERT INTO venta VALUES (3554,'33101952-6','20237862-5','S005','B','08/06/2020',20,12,240);
INSERT INTO venta VALUES (3555,'49867216-7','24180587-5','S005','A','18/11/2021',39,14,546);
INSERT INTO venta VALUES (3556,'5420466-3','45421301-7','S002','A','04/04/2020',12,13,156);
INSERT INTO venta VALUES (3557,'13835414-8','23819125-4','S003','B','28/05/2021',29,13,377);
INSERT INTO venta VALUES (3558,'45621994-2','46566450-9','S002','B','15/11/2020',38,14,532);
INSERT INTO venta VALUES (3559,'23859357-3','47232966-9','S005','A','24/03/2021',40,12,480);
INSERT INTO venta VALUES (3560,'26620304-7','29374931-0','S004','A','28/01/2021',46,15,690);
INSERT INTO venta VALUES (3561,'32180979-0','47232966-9','S002','A','01/02/2020',44,13,572);
INSERT INTO venta VALUES (3562,'10631187-0','45421301-7','S003','B','16/05/2021',49,15,735);
INSERT INTO venta VALUES (3563,'48336413-K','6183303-K','S004','A','18/07/2021',12,13,156);
INSERT INTO venta VALUES (3564,'35457831-K','18567395-2','S002','B','17/03/2020',11,12,132);
INSERT INTO venta VALUES (3565,'25785414-0','24180587-5','S003','A','30/11/2020',46,13,598);
INSERT INTO venta VALUES (3566,'48341931-7','4810357-K','S002','A','01/05/2020',42,15,630);
INSERT INTO venta VALUES (3567,'23299228-K','4810357-K','S001','A','03/09/2020',47,15,705);
INSERT INTO venta VALUES (3568,'12316193-9','45421301-7','S001','B','06/11/2021',14,12,168);
INSERT INTO venta VALUES (3569,'48852-6','47232966-9','S001','A','17/02/2021',48,15,720);
INSERT INTO venta VALUES (3570,'39266461-0','42396509-6','S003','B','04/01/2020',31,13,403);
INSERT INTO venta VALUES (3571,'32546761-4','14315947-7','S003','B','06/10/2021',28,13,364);
INSERT INTO venta VALUES (3572,'48105848-1','6183303-K','S003','B','15/03/2020',30,15,450);
INSERT INTO venta VALUES (3573,'25117198-K','29374931-0','S005','A','02/06/2021',37,13,481);
INSERT INTO venta VALUES (3574,'27326951-7','23819125-4','S002','A','08/01/2020',38,14,532);
INSERT INTO venta VALUES (3575,'33547962-9','47232966-9','S002','A','02/03/2020',43,12,516);
INSERT INTO venta VALUES (3576,'43367850-8','29374931-0','S003','A','29/08/2020',29,15,435);
INSERT INTO venta VALUES (3577,'18473160-6','47232966-9','S004','A','08/08/2021',22,15,330);
INSERT INTO venta VALUES (3578,'29902153-K','42396509-6','S005','A','18/01/2020',34,14,476);
INSERT INTO venta VALUES (3579,'7717517-2','24180587-5','S004','A','02/12/2021',39,13,507);
INSERT INTO venta VALUES (3580,'48466707-1','23819125-4','S004','A','09/08/2021',46,12,552);
INSERT INTO venta VALUES (3581,'43303774-K','23819125-4','S005','A','29/08/2020',11,13,143);
INSERT INTO venta VALUES (3582,'46153150-4','18567395-2','S003','B','15/07/2020',45,14,630);
INSERT INTO venta VALUES (3583,'25902267-3','45421301-7','S001','B','25/05/2020',46,15,690);
INSERT INTO venta VALUES (3584,'25501612-1','4810357-K','S003','A','11/12/2020',30,12,360);
INSERT INTO venta VALUES (3585,'28111191-4','32531450-8','S004','A','21/06/2021',28,13,364);
INSERT INTO venta VALUES (3586,'46656748-5','23819125-4','S004','B','13/10/2021',46,13,598);
INSERT INTO venta VALUES (3587,'26279572-1','32531450-8','S001','A','21/12/2020',31,13,403);
INSERT INTO venta VALUES (3588,'6427641-7','45421301-7','S002','B','22/10/2021',17,14,238);
INSERT INTO venta VALUES (3589,'26484700-1','23819125-4','S005','B','23/09/2020',43,12,516);
INSERT INTO venta VALUES (3590,'18153438-9','23819125-4','S005','A','01/12/2020',40,15,600);
INSERT INTO venta VALUES (3591,'20380351-6','18567395-2','S004','B','31/07/2021',24,13,312);
INSERT INTO venta VALUES (3592,'24204534-3','18567395-2','S002','A','01/05/2020',19,12,228);
INSERT INTO venta VALUES (3593,'26393893-3','8402711-1','S001','B','02/01/2021',24,13,312);
INSERT INTO venta VALUES (3594,'28241890-8','24180587-5','S003','B','08/12/2021',28,13,364);
INSERT INTO venta VALUES (3595,'25342402-8','46566450-9','S002','A','03/08/2020',35,14,490);
INSERT INTO venta VALUES (3596,'38425287-7','4810357-K','S003','A','02/02/2021',32,13,416);
INSERT INTO venta VALUES (3597,'2269681-5','14519212-9','S004','A','25/09/2021',39,13,507);
INSERT INTO venta VALUES (3598,'12906127-8','47232966-9','S004','B','22/06/2020',49,15,735);
INSERT INTO venta VALUES (3599,'12949968-0','47232966-9','S003','B','25/06/2021',13,14,182);
INSERT INTO venta VALUES (3600,'4443244-7','32531450-8','S003','A','08/03/2021',50,14,700);
INSERT INTO venta VALUES (3601,'11482753-3','4810357-K','S001','A','13/10/2021',29,13,377);
INSERT INTO venta VALUES (3602,'464335-6','18567395-2','S003','A','01/02/2021',14,13,182);
INSERT INTO venta VALUES (3603,'36692859-6','47232966-9','S001','B','09/10/2020',18,15,270);
INSERT INTO venta VALUES (3604,'2723837-8','23819125-4','S003','A','13/02/2020',11,15,165);
INSERT INTO venta VALUES (3605,'1890312-1','18567395-2','S002','B','27/07/2020',35,13,455);
INSERT INTO venta VALUES (3606,'12822975-2','32531450-8','S003','B','24/11/2020',20,12,240);
INSERT INTO venta VALUES (3607,'3354319-0','29374931-0','S005','A','22/03/2021',25,14,350);
INSERT INTO venta VALUES (3608,'13327230-5','23819125-4','S005','B','19/08/2021',37,14,518);
INSERT INTO venta VALUES (3609,'44254417-4','46566450-9','S005','A','13/06/2020',36,13,468);
INSERT INTO venta VALUES (3610,'10515997-8','45421301-7','S002','A','07/08/2021',25,12,300);
INSERT INTO venta VALUES (3611,'2560108-4','20237862-5','S002','B','23/02/2020',38,13,494);
INSERT INTO venta VALUES (3612,'33888803-1','42396509-6','S001','A','25/12/2021',24,12,288);
INSERT INTO venta VALUES (3613,'3312803-7','14519212-9','S002','A','06/04/2021',27,12,324);
INSERT INTO venta VALUES (3614,'42224976-1','23819125-4','S002','A','20/07/2021',37,12,444);
INSERT INTO venta VALUES (3615,'22950386-3','14315947-7','S005','B','01/10/2021',50,12,600);
INSERT INTO venta VALUES (3616,'45952563-7','18567395-2','S001','B','03/04/2021',25,14,350);
INSERT INTO venta VALUES (3617,'32678177-0','47232966-9','S004','B','24/10/2020',26,12,312);
INSERT INTO venta VALUES (3618,'44597831-0','14519212-9','S005','A','04/03/2021',17,13,221);
INSERT INTO venta VALUES (3619,'12674508-7','18567395-2','S005','A','14/06/2021',48,12,576);
INSERT INTO venta VALUES (3620,'33723826-2','8402711-1','S003','B','27/02/2021',33,15,495);
INSERT INTO venta VALUES (3621,'2152299-6','42396509-6','S003','B','23/06/2020',44,12,528);
INSERT INTO venta VALUES (3622,'40709835-8','6183303-K','S001','B','20/07/2021',10,12,120);
INSERT INTO venta VALUES (3623,'1934695-1','32531450-8','S004','B','07/08/2020',44,13,572);
INSERT INTO venta VALUES (3624,'17262729-3','42396509-6','S004','A','16/02/2020',11,13,143);
INSERT INTO venta VALUES (3625,'42634999-K','29374931-0','S004','B','19/01/2020',23,13,299);
INSERT INTO venta VALUES (3626,'12868975-3','45421301-7','S004','A','17/04/2020',43,14,602);
INSERT INTO venta VALUES (3627,'19950463-0','42396509-6','S003','A','09/02/2020',45,15,675);
INSERT INTO venta VALUES (3628,'35301718-7','14315947-7','S001','A','17/03/2020',35,14,490);
INSERT INTO venta VALUES (3629,'7697976-6','23819125-4','S001','B','15/06/2020',46,15,690);
INSERT INTO venta VALUES (3630,'39657376-8','4810357-K','S002','B','02/04/2020',11,14,154);
INSERT INTO venta VALUES (3631,'858411-7','23819125-4','S004','A','02/06/2021',26,15,390);
INSERT INTO venta VALUES (3632,'39475237-1','20237862-5','S005','B','04/12/2021',32,12,384);
INSERT INTO venta VALUES (3633,'17162191-7','18567395-2','S002','A','22/07/2020',41,15,615);
INSERT INTO venta VALUES (3634,'4633906-1','18567395-2','S001','A','17/06/2021',38,14,532);
INSERT INTO venta VALUES (3635,'44228716-3','45421301-7','S002','A','26/08/2020',46,15,690);
INSERT INTO venta VALUES (3636,'37850321-3','4810357-K','S002','A','15/12/2020',35,14,490);
INSERT INTO venta VALUES (3637,'7652770-9','4810357-K','S002','B','11/11/2021',27,12,324);
INSERT INTO venta VALUES (3638,'20570733-6','42396509-6','S004','A','25/04/2021',29,12,348);
INSERT INTO venta VALUES (3639,'31373578-8','24180587-5','S005','A','06/08/2020',14,13,182);
INSERT INTO venta VALUES (3640,'13119171-5','20237862-5','S001','A','03/07/2020',33,15,495);
INSERT INTO venta VALUES (3641,'1326116-4','42396509-6','S003','B','23/11/2021',28,13,364);
INSERT INTO venta VALUES (3642,'8471496-8','32531450-8','S001','A','31/12/2021',18,15,270);
INSERT INTO venta VALUES (3643,'45463922-7','4810357-K','S004','A','23/10/2021',22,15,330);
INSERT INTO venta VALUES (3644,'4795965-9','4810357-K','S004','A','25/10/2021',37,15,555);
INSERT INTO venta VALUES (3645,'1985837-5','42396509-6','S002','B','26/04/2020',45,15,675);
INSERT INTO venta VALUES (3646,'2632416-5','47232966-9','S005','B','21/12/2020',15,12,180);
INSERT INTO venta VALUES (3647,'7870174-9','29374931-0','S004','A','29/12/2021',50,15,750);
INSERT INTO venta VALUES (3648,'9640216-3','45421301-7','S002','B','27/10/2021',40,15,600);
INSERT INTO venta VALUES (3649,'323954-3','20237862-5','S003','A','29/05/2020',34,12,408);
INSERT INTO venta VALUES (3650,'3779314-0','8402711-1','S005','B','19/05/2021',43,15,645);
INSERT INTO venta VALUES (3651,'22668708-4','14519212-9','S001','A','26/12/2020',29,14,406);
INSERT INTO venta VALUES (3652,'4363197-7','29374931-0','S005','B','30/06/2020',20,15,300);
INSERT INTO venta VALUES (3653,'17402870-2','32531450-8','S001','A','01/07/2021',10,14,140);
INSERT INTO venta VALUES (3654,'15985913-4','14315947-7','S001','B','30/12/2021',22,15,330);
INSERT INTO venta VALUES (3655,'22962413-K','46566450-9','S005','A','17/10/2021',15,13,195);
INSERT INTO venta VALUES (3656,'784324-0','14315947-7','S002','B','03/12/2020',16,12,192);
INSERT INTO venta VALUES (3657,'46573375-6','29374931-0','S003','A','24/04/2021',14,12,168);
INSERT INTO venta VALUES (3658,'26173173-8','8402711-1','S004','B','31/07/2020',39,14,546);
INSERT INTO venta VALUES (3659,'3777041-8','20237862-5','S003','B','28/12/2021',41,12,492);
INSERT INTO venta VALUES (3660,'37608953-3','29374931-0','S005','B','07/05/2021',47,13,611);
INSERT INTO venta VALUES (3661,'3920779-6','32531450-8','S003','B','30/05/2020',19,12,228);
INSERT INTO venta VALUES (3662,'38693717-6','4810357-K','S002','A','29/09/2020',42,14,588);
INSERT INTO venta VALUES (3663,'27939428-3','14315947-7','S001','A','06/04/2020',38,14,532);
INSERT INTO venta VALUES (3664,'22451273-2','20237862-5','S004','B','01/06/2020',33,13,429);
INSERT INTO venta VALUES (3665,'8521947-2','4810357-K','S004','A','06/05/2020',21,14,294);
INSERT INTO venta VALUES (3666,'9598155-0','42396509-6','S001','A','17/09/2020',33,14,462);
INSERT INTO venta VALUES (3667,'39282475-8','20237862-5','S001','A','16/12/2021',41,13,533);
INSERT INTO venta VALUES (3668,'14649226-6','8402711-1','S001','A','08/06/2021',18,12,216);
INSERT INTO venta VALUES (3669,'45291827-7','6183303-K','S005','A','01/11/2020',50,12,600);
INSERT INTO venta VALUES (3670,'46533262-K','18567395-2','S004','B','28/10/2021',43,12,516);
INSERT INTO venta VALUES (3671,'3771417-8','32531450-8','S002','B','16/07/2021',41,15,615);
INSERT INTO venta VALUES (3672,'33163155-8','6183303-K','S003','B','14/07/2020',40,14,560);
INSERT INTO venta VALUES (3673,'17414897-K','42396509-6','S001','A','12/08/2021',26,14,364);
INSERT INTO venta VALUES (3674,'15197648-4','4810357-K','S002','B','19/08/2021',38,15,570);
INSERT INTO venta VALUES (3675,'724295-6','14315947-7','S003','A','14/03/2020',27,15,405);
INSERT INTO venta VALUES (3676,'15727662-K','6183303-K','S001','B','07/11/2021',11,13,143);
INSERT INTO venta VALUES (3677,'27310657-K','6183303-K','S003','B','09/03/2021',30,15,450);
INSERT INTO venta VALUES (3678,'241344-2','8402711-1','S002','B','26/02/2020',18,15,270);
INSERT INTO venta VALUES (3679,'7690652-1','29374931-0','S002','A','09/03/2021',44,15,660);
INSERT INTO venta VALUES (3680,'36178672-6','23819125-4','S005','B','17/04/2020',41,13,533);
INSERT INTO venta VALUES (3681,'8531489-0','32531450-8','S004','A','24/07/2021',12,12,144);
INSERT INTO venta VALUES (3682,'35707554-8','14315947-7','S002','A','04/12/2020',49,13,637);
INSERT INTO venta VALUES (3683,'18605597-7','8402711-1','S001','B','20/01/2020',11,13,143);
INSERT INTO venta VALUES (3684,'14457237-8','32531450-8','S001','B','06/01/2020',22,13,286);
INSERT INTO venta VALUES (3685,'34905567-8','20237862-5','S005','A','25/07/2020',13,15,195);
INSERT INTO venta VALUES (3686,'2426896-9','14519212-9','S005','B','27/02/2021',22,13,286);
INSERT INTO venta VALUES (3687,'39771947-2','8402711-1','S001','B','11/12/2020',23,15,345);
INSERT INTO venta VALUES (3688,'36697535-7','6183303-K','S004','B','27/05/2020',45,15,675);
INSERT INTO venta VALUES (3689,'19271288-2','6183303-K','S003','A','29/01/2020',38,13,494);
INSERT INTO venta VALUES (3690,'5680886-8','20237862-5','S004','A','10/02/2021',29,15,435);
INSERT INTO venta VALUES (3691,'4685879-4','18567395-2','S004','B','20/02/2020',18,12,216);
INSERT INTO venta VALUES (3692,'18513792-9','20237862-5','S005','A','21/08/2021',47,14,658);
INSERT INTO venta VALUES (3693,'15663741-6','8402711-1','S003','B','29/05/2021',23,12,276);
INSERT INTO venta VALUES (3694,'31772728-3','4810357-K','S003','B','23/01/2021',42,15,630);
INSERT INTO venta VALUES (3695,'22660782-K','24180587-5','S005','A','20/08/2021',24,12,288);
INSERT INTO venta VALUES (3696,'19124581-4','46566450-9','S001','B','20/03/2020',35,14,490);
INSERT INTO venta VALUES (3697,'28178116-2','14519212-9','S005','A','05/06/2020',33,12,396);
INSERT INTO venta VALUES (3698,'25633949-8','23819125-4','S003','A','28/04/2020',43,13,559);
INSERT INTO venta VALUES (3699,'49296302-K','4810357-K','S005','A','04/08/2020',45,13,585);
INSERT INTO venta VALUES (3700,'7664889-1','29374931-0','S004','A','04/12/2020',10,15,150);
INSERT INTO venta VALUES (3701,'1741449-6','47232966-9','S005','A','06/06/2021',34,13,442);
INSERT INTO venta VALUES (3702,'2748213-9','23819125-4','S001','B','27/06/2021',39,12,468);
INSERT INTO venta VALUES (3703,'10826186-2','47232966-9','S004','B','09/06/2020',41,15,615);
INSERT INTO venta VALUES (3704,'3438400-2','8402711-1','S005','B','07/07/2020',15,15,225);
INSERT INTO venta VALUES (3705,'9994880-9','20237862-5','S001','A','12/09/2021',45,14,630);
INSERT INTO venta VALUES (3706,'32865337-0','46566450-9','S003','B','14/05/2021',41,12,492);
INSERT INTO venta VALUES (3707,'37849952-6','23819125-4','S005','A','09/04/2021',36,15,540);
INSERT INTO venta VALUES (3708,'8917582-8','8402711-1','S003','A','20/11/2020',31,13,403);
INSERT INTO venta VALUES (3709,'7992294-3','8402711-1','S003','B','06/01/2020',27,12,324);
INSERT INTO venta VALUES (3710,'659110-8','46566450-9','S001','B','18/05/2020',31,12,372);
INSERT INTO venta VALUES (3711,'18766252-4','32531450-8','S001','B','19/02/2021',21,15,315);
INSERT INTO venta VALUES (3712,'22305414-5','23819125-4','S003','A','03/12/2021',26,14,364);
INSERT INTO venta VALUES (3713,'28681326-7','42396509-6','S004','B','29/12/2021',26,14,364);
INSERT INTO venta VALUES (3714,'12800750-4','46566450-9','S004','A','23/03/2020',38,12,456);
INSERT INTO venta VALUES (3715,'43509564-K','23819125-4','S004','A','27/12/2020',19,13,247);
INSERT INTO venta VALUES (3716,'24176673-K','47232966-9','S001','A','15/01/2020',29,14,406);
INSERT INTO venta VALUES (3717,'9454867-5','23819125-4','S003','B','09/01/2020',26,13,338);
INSERT INTO venta VALUES (3718,'30577989-K','4810357-K','S005','B','29/09/2021',21,15,315);
INSERT INTO venta VALUES (3719,'26612311-6','20237862-5','S003','A','23/11/2021',42,12,504);
INSERT INTO venta VALUES (3720,'38445393-7','8402711-1','S003','B','26/05/2021',42,14,588);
INSERT INTO venta VALUES (3721,'13282297-2','47232966-9','S001','B','30/06/2021',13,15,195);
INSERT INTO venta VALUES (3722,'1716359-0','29374931-0','S001','B','22/03/2020',36,15,540);
INSERT INTO venta VALUES (3723,'20504888-K','6183303-K','S002','A','07/04/2021',28,13,364);
INSERT INTO venta VALUES (3724,'38685858-6','29374931-0','S004','B','30/06/2020',16,12,192);
INSERT INTO venta VALUES (3725,'35669888-6','8402711-1','S004','A','02/03/2021',36,13,468);
INSERT INTO venta VALUES (3726,'16820896-0','45421301-7','S002','B','02/08/2020',41,12,492);
INSERT INTO venta VALUES (3727,'77629-7','45421301-7','S003','B','11/04/2020',48,12,576);
INSERT INTO venta VALUES (3728,'36787845-2','32531450-8','S003','B','03/01/2020',19,12,228);
INSERT INTO venta VALUES (3729,'44974580-9','20237862-5','S002','A','21/01/2020',23,12,276);
INSERT INTO venta VALUES (3730,'30936921-1','42396509-6','S001','A','22/06/2021',17,15,255);
INSERT INTO venta VALUES (3731,'26810372-4','46566450-9','S005','A','15/11/2021',49,13,637);
INSERT INTO venta VALUES (3732,'49941275-4','14519212-9','S001','A','19/06/2020',34,15,510);
INSERT INTO venta VALUES (3733,'25291221-5','23819125-4','S003','A','30/09/2020',14,13,182);
INSERT INTO venta VALUES (3734,'15516900-1','18567395-2','S005','B','16/01/2020',20,13,260);
INSERT INTO venta VALUES (3735,'27774169-5','14315947-7','S001','B','01/10/2020',32,15,480);
INSERT INTO venta VALUES (3736,'27714165-5','4810357-K','S002','A','05/10/2020',35,15,525);
INSERT INTO venta VALUES (3737,'3976702-3','14519212-9','S002','B','15/11/2021',13,13,169);
INSERT INTO venta VALUES (3738,'2843191-0','18567395-2','S001','B','31/12/2020',49,15,735);
INSERT INTO venta VALUES (3739,'29362748-7','14519212-9','S001','A','14/03/2021',19,15,285);
INSERT INTO venta VALUES (3740,'7265698-9','6183303-K','S001','B','31/03/2021',14,13,182);
INSERT INTO venta VALUES (3741,'33101952-6','24180587-5','S005','A','12/01/2020',27,15,405);
INSERT INTO venta VALUES (3742,'49867216-7','42396509-6','S002','A','10/05/2021',34,12,408);
INSERT INTO venta VALUES (3743,'5420466-3','4810357-K','S004','B','26/06/2021',40,13,520);
INSERT INTO venta VALUES (3744,'13835414-8','32531450-8','S002','B','26/07/2020',46,12,552);
INSERT INTO venta VALUES (3745,'45621994-2','23819125-4','S001','A','25/09/2020',43,14,602);
INSERT INTO venta VALUES (3746,'23859357-3','46566450-9','S003','B','17/01/2021',23,12,276);
INSERT INTO venta VALUES (3747,'26620304-7','20237862-5','S004','A','16/12/2021',39,15,585);
INSERT INTO venta VALUES (3748,'32180979-0','8402711-1','S002','B','12/01/2020',13,13,169);
INSERT INTO venta VALUES (3749,'10631187-0','29374931-0','S001','B','10/06/2020',38,12,456);
INSERT INTO venta VALUES (3750,'48336413-K','42396509-6','S001','B','21/08/2020',37,12,444);
INSERT INTO venta VALUES (3751,'35457831-K','8402711-1','S005','B','01/07/2020',29,13,377);
INSERT INTO venta VALUES (3752,'25785414-0','24180587-5','S001','A','16/11/2021',18,15,270);
INSERT INTO venta VALUES (3753,'48341931-7','14519212-9','S005','B','16/07/2020',29,14,406);
INSERT INTO venta VALUES (3754,'23299228-K','46566450-9','S005','A','03/04/2020',40,12,480);
INSERT INTO venta VALUES (3755,'12316193-9','29374931-0','S001','A','04/02/2021',39,12,468);
INSERT INTO venta VALUES (3756,'48852-6','45421301-7','S001','B','01/05/2020',33,15,495);
INSERT INTO venta VALUES (3757,'39266461-0','32531450-8','S003','B','09/11/2021',43,15,645);
INSERT INTO venta VALUES (3758,'32546761-4','23819125-4','S004','B','24/04/2021',10,14,140);
INSERT INTO venta VALUES (3759,'48105848-1','4810357-K','S005','A','02/08/2021',39,15,585);
INSERT INTO venta VALUES (3760,'25117198-K','24180587-5','S003','B','23/08/2020',42,13,546);
INSERT INTO venta VALUES (3761,'27326951-7','29374931-0','S004','A','01/05/2021',28,15,420);
INSERT INTO venta VALUES (3762,'33547962-9','8402711-1','S003','B','12/05/2020',34,13,442);
INSERT INTO venta VALUES (3763,'43367850-8','29374931-0','S004','B','16/02/2021',50,14,700);
INSERT INTO venta VALUES (3764,'18473160-6','20237862-5','S001','B','15/12/2021',49,14,686);
INSERT INTO venta VALUES (3765,'29902153-K','32531450-8','S003','A','09/10/2020',35,13,455);
INSERT INTO venta VALUES (3766,'7717517-2','20237862-5','S001','A','06/03/2021',25,15,375);
INSERT INTO venta VALUES (3767,'48466707-1','18567395-2','S004','B','20/11/2020',27,12,324);
INSERT INTO venta VALUES (3768,'43303774-K','47232966-9','S003','A','05/03/2020',42,12,504);
INSERT INTO venta VALUES (3769,'46153150-4','14315947-7','S004','B','26/07/2021',41,13,533);
INSERT INTO venta VALUES (3770,'25902267-3','42396509-6','S001','A','12/10/2020',19,14,266);
INSERT INTO venta VALUES (3771,'25501612-1','6183303-K','S003','B','11/04/2021',29,13,377);
INSERT INTO venta VALUES (3772,'28111191-4','42396509-6','S004','A','01/12/2021',43,12,516);
INSERT INTO venta VALUES (3773,'46656748-5','45421301-7','S003','B','05/09/2020',49,13,637);
INSERT INTO venta VALUES (3774,'26279572-1','14519212-9','S005','B','26/04/2021',35,13,455);
INSERT INTO venta VALUES (3775,'6427641-7','23819125-4','S004','B','14/02/2021',22,12,264);
INSERT INTO venta VALUES (3776,'26484700-1','29374931-0','S004','B','24/12/2020',35,13,455);
INSERT INTO venta VALUES (3777,'18153438-9','14519212-9','S003','B','11/07/2020',14,12,168);
INSERT INTO venta VALUES (3778,'20380351-6','29374931-0','S004','A','03/05/2021',34,13,442);
INSERT INTO venta VALUES (3779,'24204534-3','14315947-7','S003','B','26/11/2020',14,12,168);
INSERT INTO venta VALUES (3780,'26393893-3','18567395-2','S005','A','17/03/2021',32,15,480);
INSERT INTO venta VALUES (3781,'28241890-8','42396509-6','S005','B','29/08/2021',34,13,442);
INSERT INTO venta VALUES (3782,'25342402-8','14519212-9','S003','B','30/03/2021',39,13,507);
INSERT INTO venta VALUES (3783,'38425287-7','8402711-1','S005','A','18/04/2021',15,12,180);
INSERT INTO venta VALUES (3784,'2269681-5','20237862-5','S002','A','15/11/2021',41,12,492);
INSERT INTO venta VALUES (3785,'12906127-8','24180587-5','S001','B','15/05/2020',29,12,348);
INSERT INTO venta VALUES (3786,'12949968-0','29374931-0','S001','A','12/04/2020',14,14,196);
INSERT INTO venta VALUES (3787,'4443244-7','42396509-6','S001','A','24/04/2021',17,15,255);
INSERT INTO venta VALUES (3788,'11482753-3','4810357-K','S004','A','02/08/2020',20,13,260);
INSERT INTO venta VALUES (3789,'464335-6','20237862-5','S003','B','02/01/2021',37,13,481);
INSERT INTO venta VALUES (3790,'36692859-6','46566450-9','S004','A','08/11/2021',32,14,448);
INSERT INTO venta VALUES (3791,'2723837-8','18567395-2','S005','B','29/08/2020',22,13,286);
INSERT INTO venta VALUES (3792,'1890312-1','23819125-4','S004','A','23/05/2020',46,12,552);
INSERT INTO venta VALUES (3793,'12822975-2','42396509-6','S004','A','31/03/2020',35,15,525);
INSERT INTO venta VALUES (3794,'3354319-0','32531450-8','S005','A','19/02/2021',17,15,255);
INSERT INTO venta VALUES (3795,'13327230-5','8402711-1','S002','A','01/03/2020',29,15,435);
INSERT INTO venta VALUES (3796,'44254417-4','47232966-9','S002','A','07/10/2020',12,12,144);
INSERT INTO venta VALUES (3797,'10515997-8','42396509-6','S005','B','14/06/2020',35,14,490);
INSERT INTO venta VALUES (3798,'2560108-4','23819125-4','S003','A','12/01/2020',12,13,156);
INSERT INTO venta VALUES (3799,'33888803-1','47232966-9','S003','B','24/12/2020',21,15,315);
INSERT INTO venta VALUES (3800,'3312803-7','23819125-4','S002','B','14/07/2020',14,15,210);
INSERT INTO venta VALUES (3801,'42224976-1','6183303-K','S001','B','21/09/2020',13,15,195);
INSERT INTO venta VALUES (3802,'22950386-3','29374931-0','S003','A','13/05/2021',35,14,490);
INSERT INTO venta VALUES (3803,'45952563-7','29374931-0','S001','A','19/08/2020',17,14,238);
INSERT INTO venta VALUES (3804,'32678177-0','18567395-2','S002','A','04/01/2021',43,14,602);
INSERT INTO venta VALUES (3805,'44597831-0','20237862-5','S002','A','02/09/2021',37,15,555);
INSERT INTO venta VALUES (3806,'12674508-7','29374931-0','S004','A','10/03/2020',19,15,285);
INSERT INTO venta VALUES (3807,'33723826-2','45421301-7','S003','A','09/08/2021',47,13,611);
INSERT INTO venta VALUES (3808,'2152299-6','29374931-0','S003','B','20/01/2020',45,15,675);
INSERT INTO venta VALUES (3809,'40709835-8','23819125-4','S004','B','29/03/2020',37,12,444);
INSERT INTO venta VALUES (3810,'1934695-1','47232966-9','S004','A','30/04/2020',22,12,264);
INSERT INTO venta VALUES (3811,'17262729-3','47232966-9','S003','B','04/12/2021',26,13,338);
INSERT INTO venta VALUES (3812,'42634999-K','6183303-K','S004','B','10/06/2021',28,14,392);
INSERT INTO venta VALUES (3813,'12868975-3','14519212-9','S005','B','01/10/2021',30,15,450);
INSERT INTO venta VALUES (3814,'19950463-0','4810357-K','S005','B','02/11/2020',49,12,588);
INSERT INTO venta VALUES (3815,'35301718-7','42396509-6','S005','A','23/09/2020',12,12,144);
INSERT INTO venta VALUES (3816,'7697976-6','18567395-2','S003','A','22/01/2020',25,12,300);
INSERT INTO venta VALUES (3817,'39657376-8','20237862-5','S004','A','25/01/2021',40,12,480);
INSERT INTO venta VALUES (3818,'858411-7','47232966-9','S002','B','08/06/2021',12,12,144);
INSERT INTO venta VALUES (3819,'39475237-1','45421301-7','S004','A','05/10/2021',21,12,252);
INSERT INTO venta VALUES (3820,'17162191-7','47232966-9','S001','B','26/06/2021',28,12,336);
INSERT INTO venta VALUES (3821,'4633906-1','18567395-2','S004','A','09/10/2021',27,12,324);
INSERT INTO venta VALUES (3822,'44228716-3','14519212-9','S005','B','28/02/2021',31,12,372);
INSERT INTO venta VALUES (3823,'37850321-3','6183303-K','S005','B','09/09/2021',31,12,372);
INSERT INTO venta VALUES (3824,'7652770-9','47232966-9','S005','A','13/04/2020',46,14,644);
INSERT INTO venta VALUES (3825,'20570733-6','29374931-0','S003','A','10/10/2021',41,13,533);
INSERT INTO venta VALUES (3826,'31373578-8','23819125-4','S002','A','04/05/2020',27,13,351);
INSERT INTO venta VALUES (3827,'13119171-5','23819125-4','S004','B','05/04/2020',16,13,208);
INSERT INTO venta VALUES (3828,'1326116-4','4810357-K','S001','B','27/06/2020',16,14,224);
INSERT INTO venta VALUES (3829,'8471496-8','46566450-9','S001','B','28/12/2021',25,12,300);
INSERT INTO venta VALUES (3830,'45463922-7','14315947-7','S002','B','04/07/2020',13,14,182);
INSERT INTO venta VALUES (3831,'4795965-9','32531450-8','S001','B','23/07/2021',31,15,465);
INSERT INTO venta VALUES (3832,'1985837-5','24180587-5','S003','A','11/01/2021',30,14,420);
INSERT INTO venta VALUES (3833,'2632416-5','45421301-7','S002','B','01/08/2021',33,15,495);
INSERT INTO venta VALUES (3834,'7870174-9','45421301-7','S001','A','23/08/2020',21,12,252);
INSERT INTO venta VALUES (3835,'19271288-2','24180587-5','S001','A','08/07/2021',36,13,468);
INSERT INTO venta VALUES (3836,'5680886-8','4810357-K','S005','A','07/03/2021',32,13,416);
INSERT INTO venta VALUES (3837,'4685879-4','23819125-4','S005','B','24/07/2021',44,12,528);
INSERT INTO venta VALUES (3838,'18513792-9','4810357-K','S003','A','15/10/2020',11,13,143);
INSERT INTO venta VALUES (3839,'15663741-6','6183303-K','S003','B','05/05/2021',45,13,585);
INSERT INTO venta VALUES (3840,'31772728-3','46566450-9','S001','A','17/06/2020',33,13,429);
INSERT INTO venta VALUES (3841,'22660782-K','24180587-5','S002','A','10/07/2021',50,14,700);
INSERT INTO venta VALUES (3842,'19124581-4','14315947-7','S003','B','01/10/2021',37,13,481);
INSERT INTO venta VALUES (3843,'28178116-2','23819125-4','S005','A','21/10/2020',43,13,559);
INSERT INTO venta VALUES (3844,'25633949-8','14519212-9','S002','B','09/12/2020',13,15,195);
INSERT INTO venta VALUES (3845,'49296302-K','14519212-9','S001','A','15/04/2020',35,15,525);
INSERT INTO venta VALUES (3846,'7664889-1','45421301-7','S003','B','09/01/2020',17,12,204);
INSERT INTO venta VALUES (3847,'1741449-6','46566450-9','S005','B','11/04/2020',14,13,182);
INSERT INTO venta VALUES (3848,'2748213-9','8402711-1','S004','A','19/11/2021',16,12,192);
INSERT INTO venta VALUES (3849,'10826186-2','23819125-4','S003','A','01/09/2021',46,12,552);
INSERT INTO venta VALUES (3850,'3438400-2','32531450-8','S001','B','01/01/2021',36,12,432);
INSERT INTO venta VALUES (3851,'9994880-9','46566450-9','S002','B','18/11/2020',20,13,260);
INSERT INTO venta VALUES (3852,'32865337-0','32531450-8','S004','A','14/01/2020',30,12,360);
INSERT INTO venta VALUES (3853,'37849952-6','32531450-8','S005','B','04/12/2021',41,15,615);
INSERT INTO venta VALUES (3854,'8917582-8','8402711-1','S005','A','04/02/2021',20,12,240);
INSERT INTO venta VALUES (3855,'7992294-3','47232966-9','S003','B','24/04/2020',43,13,559);
INSERT INTO venta VALUES (3856,'659110-8','42396509-6','S003','A','23/05/2021',12,13,156);
INSERT INTO venta VALUES (3857,'18766252-4','18567395-2','S002','A','05/05/2021',30,13,390);
INSERT INTO venta VALUES (3858,'22305414-5','45421301-7','S001','A','12/12/2021',22,15,330);
INSERT INTO venta VALUES (3859,'28681326-7','47232966-9','S001','B','28/12/2020',23,12,276);
INSERT INTO venta VALUES (3860,'12800750-4','47232966-9','S004','B','01/01/2021',18,15,270);
INSERT INTO venta VALUES (3861,'43509564-K','24180587-5','S005','A','08/08/2021',27,15,405);
INSERT INTO venta VALUES (3862,'24176673-K','14519212-9','S002','A','23/02/2020',39,13,507);
INSERT INTO venta VALUES (3863,'9454867-5','14519212-9','S001','A','09/12/2021',15,13,195);
INSERT INTO venta VALUES (3864,'30577989-K','20237862-5','S003','A','11/06/2021',46,14,644);
INSERT INTO venta VALUES (3865,'26612311-6','14519212-9','S004','B','07/07/2020',27,13,351);
INSERT INTO venta VALUES (3866,'38445393-7','29374931-0','S005','A','15/10/2020',41,14,574);
INSERT INTO venta VALUES (3867,'13282297-2','4810357-K','S001','A','19/09/2021',19,14,266);
INSERT INTO venta VALUES (3868,'1716359-0','4810357-K','S002','B','28/07/2020',24,15,360);
INSERT INTO venta VALUES (3869,'20504888-K','14519212-9','S004','B','25/01/2020',21,14,294);
INSERT INTO venta VALUES (3870,'38685858-6','20237862-5','S005','A','04/05/2021',25,15,375);
INSERT INTO venta VALUES (3871,'35669888-6','14519212-9','S004','B','18/01/2020',18,14,252);
INSERT INTO venta VALUES (3872,'16820896-0','18567395-2','S002','A','10/01/2020',17,12,204);
INSERT INTO venta VALUES (3873,'77629-7','32531450-8','S004','A','21/06/2020',31,12,372);
INSERT INTO venta VALUES (3874,'36787845-2','4810357-K','S002','A','23/01/2021',31,15,465);
INSERT INTO venta VALUES (3875,'44974580-9','45421301-7','S004','B','08/08/2021',24,14,336);
INSERT INTO venta VALUES (3876,'30936921-1','6183303-K','S003','A','07/12/2021',31,14,434);
INSERT INTO venta VALUES (3877,'26810372-4','32531450-8','S003','A','21/02/2020',32,14,448);
INSERT INTO venta VALUES (3878,'49941275-4','8402711-1','S002','B','22/03/2021',21,12,252);
INSERT INTO venta VALUES (3879,'25291221-5','24180587-5','S002','B','21/02/2021',13,14,182);
INSERT INTO venta VALUES (3880,'15516900-1','32531450-8','S002','A','02/01/2021',50,14,700);
INSERT INTO venta VALUES (3881,'27774169-5','29374931-0','S003','B','06/02/2021',10,13,130);
INSERT INTO venta VALUES (3882,'27714165-5','47232966-9','S005','A','20/05/2020',33,12,396);
INSERT INTO venta VALUES (3883,'3976702-3','8402711-1','S001','A','17/07/2021',25,15,375);
INSERT INTO venta VALUES (3884,'2843191-0','42396509-6','S002','A','12/05/2020',35,14,490);
INSERT INTO venta VALUES (3885,'29362748-7','45421301-7','S002','A','28/09/2021',36,13,468);
INSERT INTO venta VALUES (3886,'7265698-9','45421301-7','S001','B','18/08/2020',44,13,572);
INSERT INTO venta VALUES (3887,'33101952-6','14315947-7','S004','A','28/08/2021',18,13,234);
INSERT INTO venta VALUES (3888,'49867216-7','46566450-9','S005','A','02/10/2020',23,14,322);
INSERT INTO venta VALUES (3889,'5420466-3','45421301-7','S002','A','28/08/2021',31,14,434);
INSERT INTO venta VALUES (3890,'13835414-8','8402711-1','S002','B','13/09/2020',34,12,408);
INSERT INTO venta VALUES (3891,'45621994-2','46566450-9','S001','B','15/07/2020',18,13,234);
INSERT INTO venta VALUES (3892,'23859357-3','29374931-0','S004','A','16/11/2021',35,14,490);
INSERT INTO venta VALUES (3893,'26620304-7','46566450-9','S002','B','17/11/2020',15,13,195);
INSERT INTO venta VALUES (3894,'32180979-0','20237862-5','S004','A','03/11/2021',10,14,140);
INSERT INTO venta VALUES (3895,'10631187-0','32531450-8','S003','A','06/03/2020',10,15,150);
INSERT INTO venta VALUES (3896,'48336413-K','29374931-0','S005','A','31/05/2021',19,14,266);
INSERT INTO venta VALUES (3897,'35457831-K','14315947-7','S002','A','05/03/2020',44,13,572);
INSERT INTO venta VALUES (3898,'25785414-0','8402711-1','S005','B','25/05/2021',50,13,650);
INSERT INTO venta VALUES (3899,'48341931-7','23819125-4','S002','B','13/11/2021',34,13,442);
INSERT INTO venta VALUES (3900,'23299228-K','45421301-7','S004','A','24/03/2020',25,15,375);
INSERT INTO venta VALUES (3901,'12316193-9','20237862-5','S002','B','11/12/2020',13,15,195);
INSERT INTO venta VALUES (3902,'48852-6','23819125-4','S003','A','20/10/2021',24,13,312);
INSERT INTO venta VALUES (3903,'39266461-0','47232966-9','S004','A','06/11/2020',22,14,308);
INSERT INTO venta VALUES (3904,'32546761-4','14519212-9','S002','B','22/11/2021',34,15,510);
INSERT INTO venta VALUES (3905,'48105848-1','6183303-K','S005','A','10/11/2020',45,12,540);
INSERT INTO venta VALUES (3906,'25117198-K','18567395-2','S001','A','16/11/2020',50,13,650);
INSERT INTO venta VALUES (3907,'27326951-7','46566450-9','S003','B','20/10/2020',46,13,598);
INSERT INTO venta VALUES (3908,'33547962-9','4810357-K','S003','A','17/10/2020',37,15,555);
INSERT INTO venta VALUES (3909,'43367850-8','47232966-9','S001','B','24/02/2020',38,14,532);
INSERT INTO venta VALUES (3910,'18473160-6','14519212-9','S004','B','02/11/2020',12,14,168);
INSERT INTO venta VALUES (3911,'29902153-K','42396509-6','S005','A','13/03/2021',36,14,504);
INSERT INTO venta VALUES (3912,'7717517-2','32531450-8','S005','A','06/05/2020',42,14,588);
INSERT INTO venta VALUES (3913,'48466707-1','18567395-2','S005','A','12/10/2021',18,12,216);
INSERT INTO venta VALUES (3914,'43303774-K','42396509-6','S002','B','31/12/2021',23,14,322);
INSERT INTO venta VALUES (3915,'46153150-4','24180587-5','S004','B','01/11/2021',48,12,576);
INSERT INTO venta VALUES (3916,'25902267-3','42396509-6','S005','A','26/12/2021',29,14,406);
INSERT INTO venta VALUES (3917,'25501612-1','6183303-K','S002','B','23/07/2020',43,14,602);
INSERT INTO venta VALUES (3918,'28111191-4','46566450-9','S004','A','08/05/2020',24,15,360);
INSERT INTO venta VALUES (3919,'46656748-5','20237862-5','S002','A','17/02/2021',20,15,300);
INSERT INTO venta VALUES (3920,'26279572-1','14519212-9','S003','A','05/08/2021',41,13,533);
INSERT INTO venta VALUES (3921,'6427641-7','42396509-6','S004','B','30/07/2020',46,14,644);
INSERT INTO venta VALUES (3922,'26484700-1','6183303-K','S005','A','13/09/2020',17,15,255);
INSERT INTO venta VALUES (3923,'18153438-9','14519212-9','S005','B','20/11/2020',45,12,540);
INSERT INTO venta VALUES (3924,'20380351-6','46566450-9','S003','A','02/04/2020',47,14,658);
INSERT INTO venta VALUES (3925,'24204534-3','4810357-K','S002','B','24/06/2020',29,14,406);
INSERT INTO venta VALUES (3926,'26393893-3','18567395-2','S003','B','26/09/2020',46,15,690);
INSERT INTO venta VALUES (3927,'28241890-8','46566450-9','S002','B','22/09/2021',15,15,225);
INSERT INTO venta VALUES (3928,'25342402-8','47232966-9','S002','A','17/06/2021',38,13,494);
INSERT INTO venta VALUES (3929,'38425287-7','14315947-7','S005','B','16/04/2021',28,12,336);
INSERT INTO venta VALUES (3930,'2269681-5','24180587-5','S001','A','14/02/2020',44,12,528);
INSERT INTO venta VALUES (3931,'12906127-8','24180587-5','S004','B','06/07/2020',41,12,492);
INSERT INTO venta VALUES (3932,'12949968-0','4810357-K','S004','B','13/07/2021',17,14,238);
INSERT INTO venta VALUES (3933,'4443244-7','45421301-7','S002','B','14/12/2021',34,14,476);
INSERT INTO venta VALUES (3934,'11482753-3','29374931-0','S001','B','30/06/2020',46,15,690);
INSERT INTO venta VALUES (3935,'464335-6','4810357-K','S003','A','15/05/2020',46,12,552);
INSERT INTO venta VALUES (3936,'36692859-6','47232966-9','S003','A','02/01/2021',12,13,156);
INSERT INTO venta VALUES (3937,'2723837-8','20237862-5','S005','B','19/05/2021',40,15,600);
INSERT INTO venta VALUES (3938,'1890312-1','45421301-7','S001','B','03/10/2021',38,12,456);
INSERT INTO venta VALUES (3939,'12822975-2','8402711-1','S001','B','12/12/2021',42,12,504);
INSERT INTO venta VALUES (3940,'3354319-0','20237862-5','S001','A','01/12/2020',27,15,405);
INSERT INTO venta VALUES (3941,'13327230-5','4810357-K','S002','B','10/11/2021',26,14,364);
INSERT INTO venta VALUES (3942,'44254417-4','42396509-6','S003','A','26/01/2020',32,15,480);
INSERT INTO venta VALUES (3943,'10515997-8','4810357-K','S003','A','27/10/2021',27,13,351);
INSERT INTO venta VALUES (3944,'2560108-4','29374931-0','S005','A','15/11/2020',41,14,574);
INSERT INTO venta VALUES (3945,'33888803-1','18567395-2','S002','B','31/07/2021',16,12,192);
INSERT INTO venta VALUES (3946,'3312803-7','23819125-4','S005','B','07/08/2020',47,13,611);
INSERT INTO venta VALUES (3947,'42224976-1','18567395-2','S002','A','17/01/2020',41,12,492);
INSERT INTO venta VALUES (3948,'22950386-3','32531450-8','S004','B','18/04/2020',22,12,264);
INSERT INTO venta VALUES (3949,'45952563-7','14315947-7','S003','A','30/11/2021',39,12,468);
INSERT INTO venta VALUES (3950,'32678177-0','29374931-0','S005','B','03/06/2021',32,14,448);
INSERT INTO venta VALUES (3951,'44597831-0','18567395-2','S004','A','09/06/2021',20,15,300);
INSERT INTO venta VALUES (3952,'12674508-7','6183303-K','S003','A','23/11/2021',43,14,602);
INSERT INTO venta VALUES (3953,'33723826-2','4810357-K','S005','B','29/01/2020',26,14,364);
INSERT INTO venta VALUES (3954,'2152299-6','14519212-9','S004','B','10/07/2020',17,15,255);
INSERT INTO venta VALUES (3955,'40709835-8','20237862-5','S004','A','10/01/2020',16,14,224);
INSERT INTO venta VALUES (3956,'1934695-1','14315947-7','S003','B','22/04/2021',38,13,494);
INSERT INTO venta VALUES (3957,'17262729-3','29374931-0','S005','B','04/04/2020',23,14,322);
INSERT INTO venta VALUES (3958,'42634999-K','46566450-9','S001','A','31/12/2020',48,13,624);
INSERT INTO venta VALUES (3959,'12868975-3','23819125-4','S004','A','20/10/2020',34,14,476);
INSERT INTO venta VALUES (3960,'19950463-0','14315947-7','S003','B','30/01/2021',29,13,377);
INSERT INTO venta VALUES (3961,'35301718-7','14315947-7','S002','B','24/11/2020',42,14,588);
INSERT INTO venta VALUES (3962,'7697976-6','8402711-1','S005','B','09/05/2020',21,13,273);
INSERT INTO venta VALUES (3963,'39657376-8','8402711-1','S002','A','04/12/2021',38,14,532);
INSERT INTO venta VALUES (3964,'858411-7','24180587-5','S005','B','03/03/2021',40,14,560);
INSERT INTO venta VALUES (3965,'39475237-1','4810357-K','S001','A','25/04/2020',16,15,240);
INSERT INTO venta VALUES (3966,'17162191-7','14315947-7','S001','A','02/01/2020',15,15,225);
INSERT INTO venta VALUES (3967,'4633906-1','45421301-7','S002','A','22/02/2021',16,12,192);
INSERT INTO venta VALUES (3968,'44228716-3','6183303-K','S001','A','02/09/2020',41,12,492);
INSERT INTO venta VALUES (3969,'37850321-3','14519212-9','S002','A','25/10/2020',20,13,260);
INSERT INTO venta VALUES (3970,'7652770-9','47232966-9','S001','B','02/06/2021',30,12,360);
INSERT INTO venta VALUES (3971,'20570733-6','4810357-K','S005','A','03/04/2020',11,12,132);
INSERT INTO venta VALUES (3972,'31373578-8','6183303-K','S001','B','13/05/2020',14,12,168);
INSERT INTO venta VALUES (3973,'13119171-5','14315947-7','S004','B','15/09/2020',47,12,564);
INSERT INTO venta VALUES (3974,'1326116-4','32531450-8','S002','B','08/07/2021',26,15,390);
INSERT INTO venta VALUES (3975,'8471496-8','47232966-9','S005','A','29/12/2020',28,14,392);
INSERT INTO venta VALUES (3976,'45463922-7','20237862-5','S003','B','07/09/2021',28,15,420);
INSERT INTO venta VALUES (3977,'4795965-9','29374931-0','S003','A','10/03/2020',41,13,533);
INSERT INTO venta VALUES (3978,'1985837-5','32531450-8','S005','A','24/11/2020',33,13,429);
INSERT INTO venta VALUES (3979,'2632416-5','20237862-5','S001','A','06/08/2021',38,13,494);
INSERT INTO venta VALUES (3980,'7870174-9','20237862-5','S005','A','01/10/2020',44,12,528);
INSERT INTO venta VALUES (3981,'9640216-3','24180587-5','S002','B','28/03/2021',28,13,364);
INSERT INTO venta VALUES (3982,'323954-3','24180587-5','S003','A','05/10/2021',10,14,140);
INSERT INTO venta VALUES (3983,'3779314-0','23819125-4','S004','A','30/10/2020',47,13,611);
INSERT INTO venta VALUES (3984,'22668708-4','8402711-1','S001','B','29/08/2020',37,15,555);
INSERT INTO venta VALUES (3985,'4363197-7','46566450-9','S001','B','07/04/2020',49,12,588);
INSERT INTO venta VALUES (3986,'17402870-2','4810357-K','S004','A','02/04/2021',30,14,420);
INSERT INTO venta VALUES (3987,'15985913-4','14519212-9','S002','A','10/02/2021',34,12,408);
INSERT INTO venta VALUES (3988,'22962413-K','14315947-7','S003','B','15/04/2020',17,15,255);
INSERT INTO venta VALUES (3989,'784324-0','6183303-K','S004','A','21/02/2020',36,13,468);
INSERT INTO venta VALUES (3990,'46573375-6','46566450-9','S003','B','30/10/2021',30,12,360);
INSERT INTO venta VALUES (3991,'26173173-8','18567395-2','S003','A','16/02/2021',28,12,336);
INSERT INTO venta VALUES (3992,'3777041-8','14519212-9','S004','A','12/01/2020',42,12,504);
INSERT INTO venta VALUES (3993,'37608953-3','45421301-7','S005','B','23/06/2020',12,13,156);
INSERT INTO venta VALUES (3994,'3920779-6','42396509-6','S002','B','25/07/2021',29,14,406);
INSERT INTO venta VALUES (3995,'38693717-6','47232966-9','S004','B','02/12/2021',12,13,156);
INSERT INTO venta VALUES (3996,'27939428-3','24180587-5','S001','A','29/07/2021',42,14,588);
INSERT INTO venta VALUES (3997,'22451273-2','42396509-6','S002','B','12/12/2020',27,15,405);
INSERT INTO venta VALUES (3998,'8521947-2','14315947-7','S004','A','31/08/2020',41,13,533);
INSERT INTO venta VALUES (3999,'9598155-0','20237862-5','S003','A','21/03/2021',19,12,228);
INSERT INTO venta VALUES (4000,'39282475-8','47232966-9','S002','A','22/09/2021',18,13,234);
INSERT INTO venta VALUES (4001,'14649226-6','42396509-6','S001','B','11/07/2021',22,15,330);
INSERT INTO venta VALUES (4002,'45291827-7','14315947-7','S004','B','01/09/2020',24,13,312);
INSERT INTO venta VALUES (4003,'46533262-K','42396509-6','S003','A','29/04/2021',12,13,156);
INSERT INTO venta VALUES (4004,'3771417-8','20237862-5','S004','B','20/08/2020',32,15,480);
INSERT INTO venta VALUES (4005,'33163155-8','47232966-9','S004','B','01/12/2020',45,15,675);
INSERT INTO venta VALUES (4006,'17414897-K','47232966-9','S002','A','28/12/2021',18,13,234);
INSERT INTO venta VALUES (4007,'15197648-4','45421301-7','S005','B','02/02/2020',14,13,182);
INSERT INTO venta VALUES (4008,'724295-6','14315947-7','S004','A','28/04/2020',21,15,315);
INSERT INTO venta VALUES (4009,'15727662-K','4810357-K','S001','A','02/09/2021',23,14,322);
INSERT INTO venta VALUES (4010,'27310657-K','4810357-K','S002','B','24/09/2021',23,13,299);
INSERT INTO venta VALUES (4011,'241344-2','6183303-K','S002','A','12/01/2021',18,15,270);
INSERT INTO venta VALUES (4012,'7690652-1','4810357-K','S005','B','28/12/2021',49,12,588);
INSERT INTO venta VALUES (4013,'36178672-6','32531450-8','S002','B','13/06/2021',34,13,442);
INSERT INTO venta VALUES (4014,'8531489-0','6183303-K','S005','B','12/11/2020',23,12,276);
INSERT INTO venta VALUES (4015,'35707554-8','32531450-8','S003','B','29/06/2021',46,15,690);
INSERT INTO venta VALUES (4016,'18605597-7','46566450-9','S002','B','01/12/2021',20,12,240);
INSERT INTO venta VALUES (4017,'14457237-8','8402711-1','S003','B','13/07/2020',50,13,650);
INSERT INTO venta VALUES (4018,'34905567-8','46566450-9','S005','B','30/08/2021',12,14,168);
INSERT INTO venta VALUES (4019,'2426896-9','4810357-K','S002','A','17/04/2020',38,13,494);
INSERT INTO venta VALUES (4020,'39771947-2','24180587-5','S004','A','12/10/2021',31,13,403);
INSERT INTO venta VALUES (4021,'36697535-7','4810357-K','S002','A','20/03/2021',34,13,442);
INSERT INTO venta VALUES (4022,'50111203-8','14519212-9','S005','A','28/11/2021',10,13,130);
INSERT INTO venta VALUES (4023,'5624553-7','14519212-9','S003','A','08/02/2020',34,13,442);
INSERT INTO venta VALUES (4024,'1723172-3','14519212-9','S001','A','14/11/2021',42,14,588);
INSERT INTO venta VALUES (4025,'40851728-1','46566450-9','S002','B','20/10/2021',26,13,338);
INSERT INTO venta VALUES (4026,'15303262-9','45421301-7','S004','A','28/02/2020',16,14,224);
INSERT INTO venta VALUES (4027,'31272855-9','42396509-6','S005','A','04/01/2020',32,14,448);
INSERT INTO venta VALUES (4028,'24308974-3','6183303-K','S005','A','08/11/2021',47,13,611);
INSERT INTO venta VALUES (4029,'37942920-3','18567395-2','S002','A','09/05/2020',39,14,546);
INSERT INTO venta VALUES (4030,'15976879-1','47232966-9','S002','B','19/06/2020',32,14,448);
INSERT INTO venta VALUES (4031,'22941315-5','29374931-0','S002','A','25/02/2020',29,14,406);
INSERT INTO venta VALUES (4032,'11146117-1','23819125-4','S005','B','06/06/2020',13,14,182);
INSERT INTO venta VALUES (4033,'18993555-2','14519212-9','S002','B','23/10/2020',15,13,195);
INSERT INTO venta VALUES (4034,'6828569-0','29374931-0','S005','A','09/05/2021',11,14,154);
INSERT INTO venta VALUES (4035,'8910706-7','46566450-9','S001','A','03/03/2021',35,13,455);
INSERT INTO venta VALUES (4036,'37538683-6','45421301-7','S002','B','11/12/2020',35,13,455);
INSERT INTO venta VALUES (4037,'49506917-6','47232966-9','S005','B','04/12/2021',32,12,384);
INSERT INTO venta VALUES (4038,'26465143-3','6183303-K','S005','A','10/03/2021',31,13,403);
INSERT INTO venta VALUES (4039,'12863360-K','32531450-8','S002','A','18/11/2021',43,15,645);
INSERT INTO venta VALUES (4040,'35464842-3','14519212-9','S005','B','27/02/2020',20,14,280);
INSERT INTO venta VALUES (4041,'49228383-5','14315947-7','S001','A','25/07/2020',50,13,650);
INSERT INTO venta VALUES (4042,'4843648-K','4810357-K','S004','A','02/01/2020',36,12,432);
INSERT INTO venta VALUES (4043,'36710570-4','32531450-8','S003','B','07/11/2021',25,14,350);
INSERT INTO venta VALUES (4044,'36463590-7','32531450-8','S002','A','01/10/2021',14,15,210);
INSERT INTO venta VALUES (4045,'49261260-K','42396509-6','S004','A','10/03/2020',33,12,396);
INSERT INTO venta VALUES (4046,'67016-2','14315947-7','S002','A','13/05/2021',27,13,351);
INSERT INTO venta VALUES (4047,'17247534-5','20237862-5','S003','A','03/08/2021',13,14,182);
INSERT INTO venta VALUES (4048,'42666994-3','45421301-7','S004','B','20/08/2021',12,12,144);
INSERT INTO venta VALUES (4049,'9513916-7','8402711-1','S002','B','06/12/2020',12,12,144);
INSERT INTO venta VALUES (4050,'50344810-6','45421301-7','S005','A','02/10/2021',19,14,266);
INSERT INTO venta VALUES (4051,'478918-0','23819125-4','S002','A','11/01/2020',19,14,266);
INSERT INTO venta VALUES (4052,'49880234-6','47232966-9','S005','A','22/01/2020',35,13,455);
INSERT INTO venta VALUES (4053,'13931994-K','24180587-5','S004','A','20/04/2021',10,15,150);
INSERT INTO venta VALUES (4054,'46490831-5','20237862-5','S003','A','22/08/2021',46,12,552);
INSERT INTO venta VALUES (4055,'31103598-3','32531450-8','S003','A','09/07/2021',11,13,143);
INSERT INTO venta VALUES (4056,'25918150-K','24180587-5','S005','A','20/07/2020',11,15,165);
INSERT INTO venta VALUES (4057,'3528420-6','32531450-8','S004','B','12/11/2020',40,14,560);
INSERT INTO venta VALUES (4058,'35579147-5','18567395-2','S004','A','02/09/2021',34,12,408);
INSERT INTO venta VALUES (4059,'31603398-9','24180587-5','S004','B','26/03/2020',46,13,598);
INSERT INTO venta VALUES (4060,'33672606-9','46566450-9','S005','A','26/01/2020',44,14,616);
INSERT INTO venta VALUES (4061,'47352241-1','32531450-8','S001','B','18/12/2020',23,15,345);
INSERT INTO venta VALUES (4062,'19928743-5','14315947-7','S005','A','19/08/2020',27,12,324);
INSERT INTO venta VALUES (4063,'43838491-K','8402711-1','S004','A','18/06/2020',34,12,408);
INSERT INTO venta VALUES (4064,'48440778-9','14315947-7','S005','A','02/08/2021',41,15,615);
INSERT INTO venta VALUES (4065,'3596015-5','4810357-K','S002','A','20/01/2021',29,13,377);
INSERT INTO venta VALUES (4066,'41955593-2','24180587-5','S001','A','06/01/2020',19,15,285);
INSERT INTO venta VALUES (4067,'38253942-7','45421301-7','S003','A','22/07/2021',22,14,308);
INSERT INTO venta VALUES (4068,'26671316-9','32531450-8','S005','B','04/04/2020',30,14,420);
INSERT INTO venta VALUES (4069,'8277892-6','14315947-7','S001','A','15/01/2021',17,14,238);
INSERT INTO venta VALUES (4070,'8759565-K','14315947-7','S003','A','20/08/2020',44,15,660);
INSERT INTO venta VALUES (4071,'13869214-0','14519212-9','S004','A','09/10/2021',24,15,360);
INSERT INTO venta VALUES (4072,'6752700-3','29374931-0','S001','A','01/03/2021',14,12,168);
INSERT INTO venta VALUES (4073,'449367-2','18567395-2','S005','A','09/01/2020',29,14,406);
INSERT INTO venta VALUES (4074,'3812859-0','23819125-4','S004','B','04/01/2021',24,14,336);
INSERT INTO venta VALUES (4075,'14258794-7','45421301-7','S004','B','19/03/2021',42,14,588);
INSERT INTO venta VALUES (4076,'46540292-K','6183303-K','S005','A','25/04/2020',25,14,350);
INSERT INTO venta VALUES (4077,'21525102-0','8402711-1','S003','B','05/06/2021',18,12,216);
INSERT INTO venta VALUES (4078,'7333815-8','23819125-4','S005','A','08/12/2021',22,15,330);
INSERT INTO venta VALUES (4079,'19222587-6','6183303-K','S001','A','22/10/2021',15,14,210);
INSERT INTO venta VALUES (4080,'12864837-2','14315947-7','S004','B','12/09/2020',41,13,533);
INSERT INTO venta VALUES (4081,'5807199-4','42396509-6','S005','A','02/02/2021',17,14,238);
INSERT INTO venta VALUES (4082,'34403852-K','23819125-4','S004','B','28/11/2021',33,12,396);
INSERT INTO venta VALUES (4083,'6265249-7','24180587-5','S002','B','26/06/2020',43,12,516);
INSERT INTO venta VALUES (4084,'17861331-6','45421301-7','S004','A','28/11/2021',33,15,495);
INSERT INTO venta VALUES (4085,'40878137-K','23819125-4','S001','A','03/03/2021',31,12,372);
INSERT INTO venta VALUES (4086,'48233981-6','8402711-1','S002','B','01/07/2020',13,14,182);
INSERT INTO venta VALUES (4087,'14388320-5','14315947-7','S003','A','10/07/2020',39,12,468);
INSERT INTO venta VALUES (4088,'21327989-0','14315947-7','S004','B','15/07/2020',31,15,465);
INSERT INTO venta VALUES (4089,'23480965-2','46566450-9','S001','B','05/12/2021',49,15,735);
INSERT INTO venta VALUES (4090,'4726260-7','14315947-7','S005','A','16/02/2021',17,12,204);
INSERT INTO venta VALUES (4091,'2715114-0','14315947-7','S005','B','03/04/2021',15,13,195);
INSERT INTO venta VALUES (4092,'40225788-1','46566450-9','S002','A','03/01/2021',31,12,372);
INSERT INTO venta VALUES (4093,'4679724-8','24180587-5','S003','B','10/12/2020',14,13,182);
INSERT INTO venta VALUES (4094,'20850795-8','14315947-7','S001','A','24/12/2021',33,14,462);
INSERT INTO venta VALUES (4095,'32732475-6','46566450-9','S002','B','16/09/2021',44,15,660);
INSERT INTO venta VALUES (4096,'47753672-7','20237862-5','S002','B','03/11/2021',31,13,403);
INSERT INTO venta VALUES (4097,'17408118-2','8402711-1','S003','A','14/07/2020',13,15,195);
INSERT INTO venta VALUES (4098,'1755469-7','46566450-9','S001','B','10/03/2020',11,14,154);
INSERT INTO venta VALUES (4099,'10401554-9','47232966-9','S003','A','18/01/2021',45,13,585);
INSERT INTO venta VALUES (4100,'48601711-2','42396509-6','S001','B','22/02/2020',46,13,598);
INSERT INTO venta VALUES (4101,'3238865-5','29374931-0','S001','A','02/11/2020',46,14,644);
INSERT INTO venta VALUES (4102,'49668401-K','29374931-0','S002','B','13/03/2021',23,14,322);
INSERT INTO venta VALUES (4103,'5646861-7','20237862-5','S001','B','04/11/2020',30,13,390);
INSERT INTO venta VALUES (4104,'27340343-4','20237862-5','S005','B','25/04/2020',24,15,360);
INSERT INTO venta VALUES (4105,'18246584-4','46566450-9','S005','B','30/05/2020',36,15,540);
INSERT INTO venta VALUES (4106,'2943424-7','46566450-9','S005','A','27/12/2020',22,15,330);
INSERT INTO venta VALUES (4107,'19430883-3','46566450-9','S004','A','08/02/2021',23,14,322);
INSERT INTO venta VALUES (4108,'44924647-0','20237862-5','S004','B','24/05/2021',41,13,533);
INSERT INTO venta VALUES (4109,'29448746-8','42396509-6','S003','B','30/01/2020',31,15,465);
INSERT INTO venta VALUES (4110,'17881496-6','46566450-9','S005','A','30/07/2021',11,12,132);
INSERT INTO venta VALUES (4111,'4280701-K','46566450-9','S002','A','04/06/2020',36,15,540);
INSERT INTO venta VALUES (4112,'17735202-0','20237862-5','S005','B','16/07/2020',40,15,600);
INSERT INTO venta VALUES (4113,'31158390-5','14315947-7','S005','A','01/05/2021',45,13,585);
INSERT INTO venta VALUES (4114,'36735314-7','4810357-K','S001','A','09/09/2021',44,13,572);
INSERT INTO venta VALUES (4115,'49277310-7','6183303-K','S003','A','06/05/2021',35,13,455);
INSERT INTO venta VALUES (4116,'2284443-1','32531450-8','S001','B','13/07/2020',25,13,325);
INSERT INTO venta VALUES (4117,'30626881-3','46566450-9','S002','A','30/03/2020',15,14,210);
INSERT INTO venta VALUES (4118,'34594149-5','45421301-7','S005','A','26/01/2020',22,12,264);
INSERT INTO venta VALUES (4119,'1687382-9','45421301-7','S003','B','24/10/2020',30,12,360);
INSERT INTO venta VALUES (4120,'18180325-8','46566450-9','S003','A','05/11/2020',22,15,330);
INSERT INTO venta VALUES (4121,'43789569-4','6183303-K','S003','A','22/05/2020',30,12,360);
INSERT INTO venta VALUES (4122,'22619294-8','24180587-5','S003','A','25/06/2020',10,12,120);
INSERT INTO venta VALUES (4123,'333681-6','46566450-9','S005','B','11/11/2020',41,14,574);
INSERT INTO venta VALUES (4124,'45515727-7','8402711-1','S002','B','30/10/2021',14,13,182);
INSERT INTO venta VALUES (4125,'19982868-1','18567395-2','S002','A','11/08/2021',35,14,490);
INSERT INTO venta VALUES (4126,'15270546-8','20237862-5','S005','A','19/07/2020',17,14,238);
INSERT INTO venta VALUES (4127,'7528135-8','29374931-0','S001','A','16/08/2020',50,15,750);
INSERT INTO venta VALUES (4128,'2582198-K','47232966-9','S004','B','28/11/2021',25,14,350);
INSERT INTO venta VALUES (4129,'191086-8','42396509-6','S003','A','20/07/2020',13,15,195);
INSERT INTO venta VALUES (4130,'26190571-K','6183303-K','S001','A','14/07/2020',16,14,224);
INSERT INTO venta VALUES (4131,'833293-2','24180587-5','S003','A','03/01/2020',30,14,420);
INSERT INTO venta VALUES (4132,'20724128-8','32531450-8','S004','B','09/04/2021',14,12,168);
INSERT INTO venta VALUES (4133,'9877805-5','23819125-4','S001','A','31/10/2021',19,13,247);
INSERT INTO venta VALUES (4134,'49557213-7','14315947-7','S001','B','30/10/2021',40,15,600);
INSERT INTO venta VALUES (4135,'35647373-6','20237862-5','S002','A','15/05/2020',49,12,588);
INSERT INTO venta VALUES (4136,'29221233-K','42396509-6','S002','B','11/02/2020',18,12,216);
INSERT INTO venta VALUES (4137,'40926907-9','20237862-5','S004','A','31/03/2020',50,15,750);
INSERT INTO venta VALUES (4138,'9258-4','18567395-2','S005','A','05/11/2021',32,12,384);
INSERT INTO venta VALUES (4139,'24832692-1','46566450-9','S004','B','01/12/2020',49,15,735);
INSERT INTO venta VALUES (4140,'26524609-5','24180587-5','S004','A','26/12/2021',29,12,348);
INSERT INTO venta VALUES (4141,'4974648-2','45421301-7','S002','B','23/03/2021',38,13,494);
INSERT INTO venta VALUES (4142,'17989432-7','29374931-0','S003','B','13/10/2020',29,14,406);
INSERT INTO venta VALUES (4143,'25289704-6','23819125-4','S002','B','28/04/2020',20,15,300);
INSERT INTO venta VALUES (4144,'46705421-K','42396509-6','S003','A','05/06/2021',41,15,615);
INSERT INTO venta VALUES (4145,'9701205-9','23819125-4','S001','B','12/04/2021',23,13,299);
INSERT INTO venta VALUES (4146,'29230123-5','24180587-5','S005','A','04/02/2020',12,13,156);
INSERT INTO venta VALUES (4147,'13894560-K','6183303-K','S002','A','18/01/2021',20,14,280);
INSERT INTO venta VALUES (4148,'28499290-3','20237862-5','S005','A','27/09/2021',40,13,520);
INSERT INTO venta VALUES (4149,'12167726-1','29374931-0','S003','A','22/02/2021',41,14,574);
INSERT INTO venta VALUES (4150,'41726403-5','14315947-7','S002','B','08/01/2020',10,12,120);
INSERT INTO venta VALUES (4151,'19399800-3','42396509-6','S002','A','14/02/2020',21,15,315);
INSERT INTO venta VALUES (4152,'27974329-6','6183303-K','S001','A','29/07/2021',45,14,630);
INSERT INTO venta VALUES (4153,'38706583-0','6183303-K','S005','B','15/02/2020',14,15,210);
INSERT INTO venta VALUES (4154,'10334386-0','14519212-9','S002','B','09/09/2021',11,13,143);
INSERT INTO venta VALUES (4155,'1710194-3','23819125-4','S002','B','24/05/2020',46,14,644);
INSERT INTO venta VALUES (4156,'41897708-6','20237862-5','S004','A','28/05/2021',42,14,588);
INSERT INTO venta VALUES (4157,'18569629-4','14315947-7','S004','A','06/12/2020',23,12,276);
INSERT INTO venta VALUES (4158,'34836330-1','29374931-0','S002','B','13/04/2021',10,15,150);
INSERT INTO venta VALUES (4159,'4030140-2','14315947-7','S004','B','30/12/2020',37,14,518);
INSERT INTO venta VALUES (4160,'193052-4','14519212-9','S004','A','21/10/2021',44,12,528);
INSERT INTO venta VALUES (4161,'28548464-2','6183303-K','S005','B','30/06/2021',28,12,336);
INSERT INTO venta VALUES (4162,'19347620-1','42396509-6','S002','B','19/12/2020',10,12,120);
INSERT INTO venta VALUES (4163,'19868588-7','14519212-9','S002','B','10/09/2020',44,13,572);
INSERT INTO venta VALUES (4164,'11779135-1','4810357-K','S004','B','25/09/2020',47,13,611);
INSERT INTO venta VALUES (4165,'3987147-5','8402711-1','S003','B','01/05/2021',28,12,336);
INSERT INTO venta VALUES (4166,'9524316-9','8402711-1','S004','B','06/11/2021',22,12,264);
INSERT INTO venta VALUES (4167,'9181501-K','18567395-2','S002','A','21/12/2021',41,13,533);
INSERT INTO venta VALUES (4168,'25859399-5','45421301-7','S002','A','12/03/2021',50,15,750);
INSERT INTO venta VALUES (4169,'33653809-2','24180587-5','S001','A','28/10/2020',40,14,560);
INSERT INTO venta VALUES (4170,'29990933-6','24180587-5','S005','A','27/10/2021',21,15,315);
INSERT INTO venta VALUES (4171,'22445920-3','4810357-K','S002','B','06/06/2020',35,12,420);
INSERT INTO venta VALUES (4172,'11946670-9','42396509-6','S004','B','31/03/2020',18,14,252);
INSERT INTO venta VALUES (4173,'6664486-3','14315947-7','S001','A','01/07/2021',40,14,560);
INSERT INTO venta VALUES (4174,'6130291-3','42396509-6','S005','A','22/07/2021',15,14,210);
INSERT INTO venta VALUES (4175,'5877180-5','42396509-6','S005','A','21/08/2021',41,15,615);
INSERT INTO venta VALUES (4176,'262851-1','24180587-5','S005','A','22/01/2021',38,13,494);
INSERT INTO venta VALUES (4177,'1490295-3','14519212-9','S003','B','25/09/2020',34,15,510);
INSERT INTO venta VALUES (4178,'36872343-6','6183303-K','S005','B','16/06/2021',17,12,204);
INSERT INTO venta VALUES (4179,'22512684-4','23819125-4','S004','B','21/01/2021',23,15,345);
INSERT INTO venta VALUES (4180,'211762-2','24180587-5','S005','B','06/07/2021',36,15,540);
INSERT INTO venta VALUES (4181,'49139862-0','46566450-9','S002','B','22/01/2021',29,12,348);
INSERT INTO venta VALUES (4182,'10768595-2','29374931-0','S001','A','20/04/2020',36,14,504);
INSERT INTO venta VALUES (4183,'4636416-3','18567395-2','S004','A','14/07/2020',17,12,204);
INSERT INTO venta VALUES (4184,'699856-9','4810357-K','S003','B','07/07/2021',20,13,260);
INSERT INTO venta VALUES (4185,'2094344-0','46566450-9','S005','A','06/11/2021',28,15,420);
INSERT INTO venta VALUES (4186,'32401464-0','46566450-9','S002','B','16/03/2020',14,12,168);
INSERT INTO venta VALUES (4187,'19462698-3','14519212-9','S003','A','30/04/2021',45,14,630);
INSERT INTO venta VALUES (4188,'36852256-2','24180587-5','S001','B','21/02/2020',24,14,336);
INSERT INTO venta VALUES (4189,'15348739-1','8402711-1','S001','A','09/04/2020',13,12,156);
INSERT INTO venta VALUES (4190,'4465683-3','14315947-7','S003','A','10/11/2020',26,12,312);
INSERT INTO venta VALUES (4191,'5857429-5','29374931-0','S001','A','01/09/2020',36,13,468);
INSERT INTO venta VALUES (4192,'33580846-0','32531450-8','S005','B','21/12/2021',41,12,492);
INSERT INTO venta VALUES (4193,'34947618-5','23819125-4','S003','A','27/07/2020',48,12,576);
INSERT INTO venta VALUES (4194,'19521645-2','14519212-9','S002','B','19/09/2020',25,12,300);
INSERT INTO venta VALUES (4195,'22139765-7','47232966-9','S001','A','11/09/2021',34,15,510);
INSERT INTO venta VALUES (4196,'6123580-9','45421301-7','S002','B','17/05/2020',32,15,480);
INSERT INTO venta VALUES (4197,'20367714-6','46566450-9','S005','B','05/08/2020',38,12,456);
INSERT INTO venta VALUES (4198,'42253705-8','32531450-8','S003','A','14/08/2021',38,14,532);
INSERT INTO venta VALUES (4199,'18659182-8','6183303-K','S001','B','08/06/2021',21,12,252);
INSERT INTO venta VALUES (4200,'19841889-7','8402711-1','S003','A','19/12/2021',48,15,720);
INSERT INTO venta VALUES (4201,'19548419-8','47232966-9','S001','B','01/04/2021',40,14,560);
INSERT INTO venta VALUES (4202,'9615511-5','6183303-K','S001','A','02/09/2020',27,12,324);
INSERT INTO venta VALUES (4203,'3331594-5','6183303-K','S003','A','16/01/2020',24,12,288);
INSERT INTO venta VALUES (4204,'4219724-6','20237862-5','S005','B','02/05/2021',24,14,336);
INSERT INTO venta VALUES (4205,'47326912-0','32531450-8','S001','B','15/10/2021',16,15,240);
INSERT INTO venta VALUES (4206,'35293727-4','14519212-9','S001','A','22/02/2021',26,14,364);
INSERT INTO venta VALUES (4207,'14490911-9','46566450-9','S001','B','19/05/2021',17,12,204);
INSERT INTO venta VALUES (4208,'1692470-9','24180587-5','S001','B','20/10/2020',24,14,336);
INSERT INTO venta VALUES (4209,'42328379-3','20237862-5','S002','B','31/07/2021',15,13,195);
INSERT INTO venta VALUES (4210,'28613404-1','45421301-7','S002','B','03/10/2020',38,15,570);
INSERT INTO venta VALUES (4211,'50895130-2','47232966-9','S002','B','06/01/2020',35,13,455);
INSERT INTO venta VALUES (4212,'30823535-1','32531450-8','S001','A','31/01/2020',10,12,120);
INSERT INTO venta VALUES (4213,'6726517-3','8402711-1','S004','B','24/06/2020',33,14,462);
INSERT INTO venta VALUES (4214,'17351174-4','18567395-2','S003','A','15/09/2020',50,13,650);
INSERT INTO venta VALUES (4215,'36325501-9','23819125-4','S001','A','21/05/2021',44,12,528);
INSERT INTO venta VALUES (4216,'9652662-8','24180587-5','S005','B','15/02/2021',35,12,420);
INSERT INTO venta VALUES (4217,'19977253-8','45421301-7','S005','B','08/08/2021',16,14,224);
INSERT INTO venta VALUES (4218,'21248383-4','18567395-2','S003','A','25/09/2021',33,13,429);
INSERT INTO venta VALUES (4219,'40926275-9','14315947-7','S001','B','18/05/2020',17,14,238);
INSERT INTO venta VALUES (4220,'37852447-4','45421301-7','S002','A','29/05/2021',44,13,572);
INSERT INTO venta VALUES (4221,'47322107-1','42396509-6','S004','A','11/01/2021',39,14,546);
INSERT INTO venta VALUES (4222,'48159709-9','45421301-7','S005','A','19/04/2020',36,13,468);
INSERT INTO venta VALUES (4223,'40282355-0','45421301-7','S003','B','11/12/2021',16,14,224);
INSERT INTO venta VALUES (4224,'4946636-6','20237862-5','S004','A','25/06/2020',31,14,434);
INSERT INTO venta VALUES (4225,'16522716-6','20237862-5','S005','A','18/04/2020',45,15,675);
INSERT INTO venta VALUES (4226,'9445289-9','18567395-2','S002','A','18/03/2021',11,15,165);
INSERT INTO venta VALUES (4227,'36425613-2','42396509-6','S004','B','21/12/2020',50,15,750);
INSERT INTO venta VALUES (4228,'28165498-5','18567395-2','S003','B','02/05/2020',21,15,315);
INSERT INTO venta VALUES (4229,'45581817-6','18567395-2','S005','A','27/05/2020',42,12,504);
INSERT INTO venta VALUES (4230,'28831857-3','4810357-K','S005','A','27/02/2021',22,14,308);
INSERT INTO venta VALUES (4231,'4066844-6','46566450-9','S003','B','09/01/2020',41,12,492);
INSERT INTO venta VALUES (4232,'27983572-7','47232966-9','S002','A','29/08/2021',26,12,312);
INSERT INTO venta VALUES (4233,'35952296-7','6183303-K','S002','B','17/07/2020',25,12,300);
INSERT INTO venta VALUES (4234,'31355479-1','20237862-5','S004','B','18/10/2021',20,15,300);
INSERT INTO venta VALUES (4235,'11672123-6','14519212-9','S004','A','02/10/2021',11,15,165);
INSERT INTO venta VALUES (4236,'184553-5','4810357-K','S001','A','16/11/2020',11,15,165);
INSERT INTO venta VALUES (4237,'485659-7','32531450-8','S004','B','10/03/2020',46,13,598);
INSERT INTO venta VALUES (4238,'3942286-7','18567395-2','S001','B','09/08/2020',23,14,322);
INSERT INTO venta VALUES (4239,'9231563-0','14519212-9','S003','A','16/05/2020',46,13,598);
INSERT INTO venta VALUES (4240,'30530472-7','29374931-0','S003','A','05/10/2020',48,13,624);
INSERT INTO venta VALUES (4241,'41705700-5','46566450-9','S003','B','01/02/2021',18,14,252);
INSERT INTO venta VALUES (4242,'25602595-7','20237862-5','S005','A','26/11/2021',10,13,130);
INSERT INTO venta VALUES (4243,'29128884-7','47232966-9','S001','B','24/12/2021',43,12,516);
INSERT INTO venta VALUES (4244,'35188629-3','14519212-9','S001','A','30/08/2021',11,14,154);
INSERT INTO venta VALUES (4245,'48199641-4','20237862-5','S005','A','31/10/2020',45,12,540);
INSERT INTO venta VALUES (4246,'31650106-0','18567395-2','S002','B','15/06/2020',39,12,468);
INSERT INTO venta VALUES (4247,'36194931-5','8402711-1','S004','B','10/06/2021',45,13,585);
INSERT INTO venta VALUES (4248,'45409742-4','8402711-1','S002','A','05/12/2021',49,15,735);
INSERT INTO venta VALUES (4249,'13433430-4','14315947-7','S002','B','08/03/2021',21,15,315);
INSERT INTO venta VALUES (4250,'4127855-2','23819125-4','S003','A','12/10/2021',46,15,690);
INSERT INTO venta VALUES (4251,'14433334-9','24180587-5','S001','A','16/01/2020',26,14,364);
INSERT INTO venta VALUES (4252,'20657476-3','45421301-7','S004','A','20/04/2020',40,15,600);
INSERT INTO venta VALUES (4253,'46349688-9','6183303-K','S003','B','04/07/2020',18,14,252);
INSERT INTO venta VALUES (4254,'46482781-1','18567395-2','S005','A','05/04/2021',50,15,750);
INSERT INTO venta VALUES (4255,'25634130-1','14315947-7','S002','B','05/08/2021',33,13,429);
INSERT INTO venta VALUES (4256,'10135385-0','8402711-1','S004','B','04/10/2021',22,15,330);
INSERT INTO venta VALUES (4257,'9207589-3','47232966-9','S005','B','17/05/2021',20,14,280);
INSERT INTO venta VALUES (4258,'35758837-5','29374931-0','S001','A','18/07/2021',16,13,208);
INSERT INTO venta VALUES (4259,'41620941-3','47232966-9','S002','A','30/03/2020',35,15,525);
INSERT INTO venta VALUES (4260,'44435994-3','45421301-7','S002','B','19/08/2020',45,15,675);
INSERT INTO venta VALUES (4261,'31215293-2','18567395-2','S001','A','05/09/2020',34,14,476);
INSERT INTO venta VALUES (4262,'21760843-0','18567395-2','S002','B','11/05/2020',21,12,252);
INSERT INTO venta VALUES (4263,'44678730-6','29374931-0','S005','A','17/10/2021',16,13,208);
INSERT INTO venta VALUES (4264,'17225783-6','32531450-8','S005','A','01/10/2021',10,12,120);
INSERT INTO venta VALUES (4265,'47896624-5','20237862-5','S005','B','06/01/2021',33,12,396);
INSERT INTO venta VALUES (4266,'1752833-5','14315947-7','S005','A','04/02/2021',23,12,276);
INSERT INTO venta VALUES (4267,'516872-4','6183303-K','S004','A','23/07/2020',49,14,686);
INSERT INTO venta VALUES (4268,'22593462-2','32531450-8','S001','B','13/07/2020',12,14,168);
INSERT INTO venta VALUES (4269,'27461769-1','14519212-9','S004','A','27/07/2021',50,14,700);
INSERT INTO venta VALUES (4270,'22878544-K','8402711-1','S004','B','21/02/2021',24,13,312);
INSERT INTO venta VALUES (4271,'1967209-3','24180587-5','S004','B','20/02/2021',48,14,672);
INSERT INTO venta VALUES (4272,'12912158-0','32531450-8','S005','B','26/09/2020',14,15,210);
INSERT INTO venta VALUES (4273,'20775400-5','24180587-5','S004','B','14/04/2020',34,13,442);
INSERT INTO venta VALUES (4274,'4798516-1','8402711-1','S003','A','05/09/2021',15,14,210);
INSERT INTO venta VALUES (4275,'3164380-5','32531450-8','S002','A','21/10/2021',16,12,192);
INSERT INTO venta VALUES (4276,'33233451-4','32531450-8','S003','B','10/02/2021',37,12,444);
INSERT INTO venta VALUES (4277,'1279941-1','29374931-0','S001','A','02/06/2020',43,12,516);
INSERT INTO venta VALUES (4278,'853081-5','47232966-9','S004','A','24/01/2020',15,12,180);
INSERT INTO venta VALUES (4279,'30164623-2','20237862-5','S005','A','31/08/2021',32,15,480);
INSERT INTO venta VALUES (4280,'48355525-3','20237862-5','S003','A','17/07/2020',30,13,390);
INSERT INTO venta VALUES (4281,'10991680-3','42396509-6','S004','A','13/03/2021',16,13,208);
INSERT INTO venta VALUES (4282,'30991564-K','47232966-9','S004','B','08/12/2020',28,12,336);
INSERT INTO venta VALUES (4283,'3188611-2','23819125-4','S005','A','17/06/2021',48,14,672);
INSERT INTO venta VALUES (4284,'47991225-4','24180587-5','S005','B','23/01/2020',45,15,675);
INSERT INTO venta VALUES (4285,'46561623-7','6183303-K','S002','A','05/12/2021',15,14,210);
INSERT INTO venta VALUES (4286,'47344357-0','23819125-4','S005','B','26/02/2020',33,15,495);
INSERT INTO venta VALUES (4287,'37117210-6','24180587-5','S001','A','14/02/2021',38,14,532);
INSERT INTO venta VALUES (4288,'166555-3','8402711-1','S001','B','20/03/2020',11,15,165);
INSERT INTO venta VALUES (4289,'33383834-6','14519212-9','S001','A','31/01/2021',32,12,384);
INSERT INTO venta VALUES (4290,'3776541-4','42396509-6','S005','B','13/09/2021',27,14,378);
INSERT INTO venta VALUES (4291,'37518785-K','45421301-7','S002','B','17/10/2020',49,14,686);
INSERT INTO venta VALUES (4292,'4171020-9','14315947-7','S003','A','22/07/2020',37,12,444);
INSERT INTO venta VALUES (4293,'1585526-6','20237862-5','S001','A','23/12/2020',42,13,546);
INSERT INTO venta VALUES (4294,'32779247-4','18567395-2','S002','A','06/09/2020',41,14,574);
INSERT INTO venta VALUES (4295,'3067793-5','24180587-5','S001','A','16/04/2021',46,13,598);
INSERT INTO venta VALUES (4296,'35807970-9','4810357-K','S005','A','02/08/2020',45,15,675);
INSERT INTO venta VALUES (4297,'30499287-5','24180587-5','S001','A','19/01/2020',11,12,132);
INSERT INTO venta VALUES (4298,'41482774-8','45421301-7','S001','B','21/03/2020',38,12,456);
INSERT INTO venta VALUES (4299,'13137805-K','46566450-9','S002','B','25/01/2020',35,14,490);
INSERT INTO venta VALUES (4300,'4795390-1','8402711-1','S005','A','21/11/2020',19,12,228);
INSERT INTO venta VALUES (4301,'17942842-3','23819125-4','S005','B','01/06/2020',34,14,476);
INSERT INTO venta VALUES (4302,'48539519-9','4810357-K','S004','B','27/02/2020',32,14,448);
INSERT INTO venta VALUES (4303,'23279332-5','20237862-5','S004','B','21/09/2020',31,13,403);
INSERT INTO venta VALUES (4304,'7982126-8','46566450-9','S004','B','26/09/2021',35,13,455);
INSERT INTO venta VALUES (4305,'15914648-0','46566450-9','S002','B','17/06/2021',47,13,611);
INSERT INTO venta VALUES (4306,'49264703-9','14519212-9','S001','B','10/09/2021',38,15,570);
INSERT INTO venta VALUES (4307,'13237645-K','18567395-2','S004','B','07/05/2020',50,12,600);
INSERT INTO venta VALUES (4308,'25803929-7','8402711-1','S004','B','01/06/2021',44,15,660);
INSERT INTO venta VALUES (4309,'6457981-9','20237862-5','S005','A','30/03/2021',11,14,154);
INSERT INTO venta VALUES (4310,'40836252-0','4810357-K','S004','B','07/12/2021',43,13,559);
INSERT INTO venta VALUES (4311,'9363313-K','45421301-7','S005','A','07/07/2020',24,14,336);
INSERT INTO venta VALUES (4312,'14884125-K','24180587-5','S005','A','15/07/2020',32,13,416);
INSERT INTO venta VALUES (4313,'27211344-0','46566450-9','S003','B','07/07/2021',18,12,216);
INSERT INTO venta VALUES (4314,'9435908-2','8402711-1','S003','A','18/07/2021',23,13,299);
INSERT INTO venta VALUES (4315,'26844560-9','47232966-9','S003','B','01/03/2020',44,13,572);
INSERT INTO venta VALUES (4316,'29937285-5','6183303-K','S002','A','03/08/2021',31,13,403);
INSERT INTO venta VALUES (4317,'26119415-5','46566450-9','S001','B','13/08/2020',31,12,372);
INSERT INTO venta VALUES (4318,'12987352-3','6183303-K','S003','B','02/12/2021',20,14,280);
INSERT INTO venta VALUES (4319,'27908982-0','18567395-2','S005','A','06/09/2021',23,15,345);
INSERT INTO venta VALUES (4320,'8739321-6','29374931-0','S005','B','06/06/2021',35,12,420);
INSERT INTO venta VALUES (4321,'36511172-3','4810357-K','S002','A','09/07/2021',23,14,322);
INSERT INTO venta VALUES (4322,'30980702-2','20237862-5','S003','A','09/11/2020',50,14,700);
INSERT INTO venta VALUES (4323,'3683177-4','20237862-5','S001','B','30/04/2020',32,12,384);
INSERT INTO venta VALUES (4324,'19581251-9','47232966-9','S005','B','01/09/2020',41,12,492);
INSERT INTO venta VALUES (4325,'14172121-6','29374931-0','S005','B','07/09/2021',24,15,360);
INSERT INTO venta VALUES (4326,'2158143-7','29374931-0','S005','A','27/02/2020',49,12,588);
INSERT INTO venta VALUES (4327,'7868853-K','23819125-4','S003','A','25/01/2020',36,12,432);
INSERT INTO venta VALUES (4328,'7848839-5','4810357-K','S001','A','26/12/2021',45,15,675);
INSERT INTO venta VALUES (4329,'38849321-6','20237862-5','S005','B','23/04/2020',20,14,280);
INSERT INTO venta VALUES (4330,'33469193-4','24180587-5','S003','B','24/08/2020',49,13,637);
INSERT INTO venta VALUES (4331,'32373825-4','4810357-K','S002','B','29/01/2020',16,14,224);
INSERT INTO venta VALUES (4332,'18752594-2','29374931-0','S002','A','02/06/2020',33,14,462);
INSERT INTO venta VALUES (4333,'33308807-K','24180587-5','S002','B','26/12/2021',36,13,468);
INSERT INTO venta VALUES (4334,'3912162-K','42396509-6','S003','A','17/08/2021',50,14,700);
INSERT INTO venta VALUES (4335,'16797971-8','4810357-K','S002','B','03/03/2021',16,12,192);
INSERT INTO venta VALUES (4336,'49705222-K','24180587-5','S003','A','16/03/2020',47,14,658);
INSERT INTO venta VALUES (4337,'22831763-2','45421301-7','S003','A','15/09/2021',37,15,555);
INSERT INTO venta VALUES (4338,'23229895-2','18567395-2','S003','A','07/08/2021',13,14,182);
INSERT INTO venta VALUES (4339,'3035147-9','47232966-9','S003','A','03/11/2021',50,13,650);
INSERT INTO venta VALUES (4340,'5010410-9','46566450-9','S004','B','21/07/2020',34,12,408);
INSERT INTO venta VALUES (4341,'43795905-6','18567395-2','S003','A','28/05/2020',50,15,750);
INSERT INTO venta VALUES (4342,'27287723-8','18567395-2','S005','A','17/11/2021',33,12,396);
INSERT INTO venta VALUES (4343,'22302853-5','14315947-7','S005','A','15/10/2021',44,14,616);
INSERT INTO venta VALUES (4344,'40432581-7','23819125-4','S005','B','28/01/2021',44,15,660);
INSERT INTO venta VALUES (4345,'43299614-K','46566450-9','S002','A','04/11/2020',21,14,294);
INSERT INTO venta VALUES (4346,'31327804-2','8402711-1','S004','B','12/04/2020',20,12,240);
INSERT INTO venta VALUES (4347,'8438464-K','46566450-9','S002','A','21/12/2021',49,12,588);
INSERT INTO venta VALUES (4348,'49300337-2','45421301-7','S004','B','21/10/2020',29,12,348);
INSERT INTO venta VALUES (4349,'18991347-8','20237862-5','S002','B','29/06/2021',43,13,559);
INSERT INTO venta VALUES (4350,'24468163-8','47232966-9','S003','B','24/07/2021',13,14,182);
INSERT INTO venta VALUES (4351,'13687859-K','4810357-K','S003','A','24/08/2020',39,13,507);
INSERT INTO venta VALUES (4352,'25987913-2','18567395-2','S005','A','01/09/2020',46,12,552);
INSERT INTO venta VALUES (4353,'2717454-K','42396509-6','S001','B','17/02/2021',33,13,429);
INSERT INTO venta VALUES (4354,'34834484-6','8402711-1','S004','A','19/06/2021',50,13,650);
INSERT INTO venta VALUES (4355,'12313445-1','8402711-1','S001','B','21/03/2020',19,14,266);
INSERT INTO venta VALUES (4356,'48866469-7','4810357-K','S004','A','02/11/2020',25,15,375);
INSERT INTO venta VALUES (4357,'22308493-1','20237862-5','S005','A','15/09/2021',37,14,518);
INSERT INTO venta VALUES (4358,'24598287-9','42396509-6','S004','B','01/11/2021',11,13,143);
INSERT INTO venta VALUES (4359,'32124950-7','14315947-7','S001','A','09/05/2020',24,14,336);
INSERT INTO venta VALUES (4360,'31190681-K','18567395-2','S002','B','25/04/2021',29,15,435);
INSERT INTO venta VALUES (4361,'41496577-6','45421301-7','S004','B','31/03/2020',42,13,546);
INSERT INTO venta VALUES (4362,'1348136-9','14519212-9','S005','B','27/08/2020',25,13,325);
INSERT INTO venta VALUES (4363,'12406417-1','47232966-9','S001','B','26/11/2021',36,13,468);
INSERT INTO venta VALUES (4364,'31599959-6','14315947-7','S005','A','20/09/2020',40,13,520);
INSERT INTO venta VALUES (4365,'25145191-5','29374931-0','S001','A','16/07/2021',14,12,168);
INSERT INTO venta VALUES (4366,'11989123-K','8402711-1','S003','B','28/05/2021',39,13,507);
INSERT INTO venta VALUES (4367,'21900978-K','18567395-2','S002','B','13/06/2021',27,14,378);
INSERT INTO venta VALUES (4368,'28199367-4','46566450-9','S003','B','25/01/2020',20,13,260);
INSERT INTO venta VALUES (4369,'37758315-9','46566450-9','S005','A','19/04/2020',26,12,312);
INSERT INTO venta VALUES (4370,'44858513-1','42396509-6','S002','B','23/03/2020',17,15,255);
INSERT INTO venta VALUES (4371,'3424618-1','14315947-7','S002','A','22/12/2021',32,13,416);
INSERT INTO venta VALUES (4372,'39579783-2','32531450-8','S001','A','03/02/2021',42,13,546);
INSERT INTO venta VALUES (4373,'13131628-3','32531450-8','S003','B','28/07/2021',41,13,533);
INSERT INTO venta VALUES (4374,'23225926-4','47232966-9','S001','A','31/10/2020',10,13,130);
INSERT INTO venta VALUES (4375,'23304982-4','42396509-6','S005','B','12/11/2021',47,12,564);
INSERT INTO venta VALUES (4376,'6872702-2','29374931-0','S001','A','04/11/2021',45,15,675);
INSERT INTO venta VALUES (4377,'29164861-4','20237862-5','S005','B','24/10/2020',50,13,650);
INSERT INTO venta VALUES (4378,'20482820-2','42396509-6','S001','A','08/01/2021',41,14,574);
INSERT INTO venta VALUES (4379,'6481317-K','45421301-7','S003','A','14/07/2021',44,13,572);
INSERT INTO venta VALUES (4380,'29187358-8','24180587-5','S003','B','21/08/2020',39,14,546);
INSERT INTO venta VALUES (4381,'10973664-3','47232966-9','S001','B','08/05/2020',50,12,600);
INSERT INTO venta VALUES (4382,'40517647-5','23819125-4','S002','A','23/01/2020',29,13,377);
INSERT INTO venta VALUES (4383,'3438540-8','45421301-7','S004','A','21/05/2020',47,13,611);
INSERT INTO venta VALUES (4384,'826525-9','14519212-9','S003','B','20/01/2021',36,15,540);
INSERT INTO venta VALUES (4385,'24898840-1','4810357-K','S002','B','24/05/2020',22,15,330);
INSERT INTO venta VALUES (4386,'3929541-5','8402711-1','S003','A','21/06/2021',20,13,260);
INSERT INTO venta VALUES (4387,'7652481-5','14315947-7','S002','B','27/11/2020',22,14,308);
INSERT INTO venta VALUES (4388,'18173588-0','32531450-8','S005','A','10/09/2021',26,12,312);
INSERT INTO venta VALUES (4389,'33565321-1','8402711-1','S004','B','11/03/2021',36,14,504);
INSERT INTO venta VALUES (4390,'8991625-9','20237862-5','S001','A','20/12/2020',17,12,204);
INSERT INTO venta VALUES (4391,'31959798-0','46566450-9','S003','A','22/07/2021',24,12,288);
INSERT INTO venta VALUES (4392,'22863314-3','29374931-0','S004','B','30/04/2020',10,14,140);
INSERT INTO venta VALUES (4393,'19228285-3','32531450-8','S002','A','20/09/2020',49,14,686);
INSERT INTO venta VALUES (4394,'34282783-7','45421301-7','S005','B','28/12/2020',41,13,533);
INSERT INTO venta VALUES (4395,'4228336-3','42396509-6','S003','A','11/08/2020',24,15,360);
INSERT INTO venta VALUES (4396,'20671560-K','8402711-1','S004','A','22/11/2021',45,14,630);
INSERT INTO venta VALUES (4397,'880234-3','47232966-9','S004','B','10/02/2021',12,15,180);
INSERT INTO venta VALUES (4398,'27199649-7','42396509-6','S002','A','20/01/2020',11,13,143);
INSERT INTO venta VALUES (4399,'6815957-1','23819125-4','S004','B','12/01/2020',25,13,325);
INSERT INTO venta VALUES (4400,'33775772-3','23819125-4','S002','A','16/08/2021',15,15,225);
INSERT INTO venta VALUES (4401,'14452129-3','6183303-K','S001','A','29/10/2021',19,15,285);
INSERT INTO venta VALUES (4402,'16979672-6','24180587-5','S004','A','01/02/2021',32,12,384);
INSERT INTO venta VALUES (4403,'23758412-0','8402711-1','S002','B','23/02/2020',46,14,644);
INSERT INTO venta VALUES (4404,'1477054-2','47232966-9','S003','B','26/06/2021',28,12,336);
INSERT INTO venta VALUES (4405,'27187851-6','45421301-7','S001','B','05/11/2021',25,12,300);
INSERT INTO venta VALUES (4406,'34280409-8','18567395-2','S002','A','28/11/2020',17,14,238);
INSERT INTO venta VALUES (4407,'48198255-3','46566450-9','S005','A','04/01/2021',17,13,221);
INSERT INTO venta VALUES (4408,'39327767-K','47232966-9','S005','A','08/05/2021',29,13,377);
INSERT INTO venta VALUES (4409,'2946275-5','18567395-2','S003','A','05/03/2021',35,13,455);
INSERT INTO venta VALUES (4410,'1453762-7','20237862-5','S005','A','17/07/2021',44,14,616);
INSERT INTO venta VALUES (4411,'7143634-9','14519212-9','S001','B','07/02/2020',15,12,180);
INSERT INTO venta VALUES (4412,'21372862-8','18567395-2','S001','B','28/03/2021',48,14,672);
INSERT INTO venta VALUES (4413,'3514192-8','47232966-9','S005','A','17/11/2021',42,13,546);
INSERT INTO venta VALUES (4414,'6533418-6','32531450-8','S002','A','02/10/2021',22,15,330);
INSERT INTO venta VALUES (4415,'7939774-1','42396509-6','S005','A','17/01/2021',17,13,221);
INSERT INTO venta VALUES (4416,'6451342-7','14315947-7','S004','A','19/12/2021',48,13,624);
INSERT INTO venta VALUES (4417,'28863789-K','46566450-9','S004','A','02/03/2020',43,13,559);
INSERT INTO venta VALUES (4418,'43375473-5','42396509-6','S001','B','05/03/2020',35,15,525);
INSERT INTO venta VALUES (4419,'42800519-8','32531450-8','S004','A','30/10/2020',39,14,546);
INSERT INTO venta VALUES (4420,'32817752-8','42396509-6','S004','B','05/01/2021',42,13,546);
INSERT INTO venta VALUES (4421,'30727189-3','14519212-9','S002','A','27/05/2021',25,13,325);
INSERT INTO venta VALUES (4422,'35546545-4','14315947-7','S004','A','25/06/2021',34,15,510);
INSERT INTO venta VALUES (4423,'8628742-0','32531450-8','S004','A','12/07/2021',27,15,405);
INSERT INTO venta VALUES (4424,'10831281-5','8402711-1','S003','A','18/02/2021',46,13,598);
INSERT INTO venta VALUES (4425,'32722242-2','46566450-9','S001','B','17/04/2021',47,13,611);
INSERT INTO venta VALUES (4426,'42196749-0','23819125-4','S005','A','04/08/2021',35,15,525);
INSERT INTO venta VALUES (4427,'44920337-2','8402711-1','S002','A','10/05/2021',37,13,481);
INSERT INTO venta VALUES (4428,'10284189-1','14519212-9','S001','B','01/12/2020',26,13,338);
INSERT INTO venta VALUES (4429,'16884278-3','14315947-7','S002','A','08/03/2021',32,14,448);
INSERT INTO venta VALUES (4430,'40737419-3','32531450-8','S004','A','22/11/2021',18,14,252);
INSERT INTO venta VALUES (4431,'27214424-9','47232966-9','S003','B','25/12/2021',45,13,585);
INSERT INTO venta VALUES (4432,'6272892-2','14315947-7','S001','A','08/02/2021',31,12,372);
INSERT INTO venta VALUES (4433,'39586197-2','8402711-1','S004','B','13/12/2020',14,13,182);
INSERT INTO venta VALUES (4434,'49199378-2','24180587-5','S003','A','23/04/2020',12,15,180);
INSERT INTO venta VALUES (4435,'1396687-7','32531450-8','S004','A','15/03/2021',23,14,322);
INSERT INTO venta VALUES (4436,'42618974-7','14519212-9','S004','B','11/09/2021',37,14,518);
INSERT INTO venta VALUES (4437,'24584998-2','23819125-4','S001','B','18/03/2020',40,15,600);
INSERT INTO venta VALUES (4438,'234166-2','6183303-K','S002','B','21/07/2021',25,12,300);
INSERT INTO venta VALUES (4439,'19980328-K','14315947-7','S002','A','20/03/2021',17,13,221);
INSERT INTO venta VALUES (4440,'34678840-2','45421301-7','S004','B','29/12/2021',41,13,533);
INSERT INTO venta VALUES (4441,'46461804-K','20237862-5','S002','B','08/06/2021',48,14,672);
INSERT INTO venta VALUES (4442,'22363485-0','32531450-8','S002','B','09/08/2021',33,13,429);
INSERT INTO venta VALUES (4443,'34267828-9','14315947-7','S005','B','22/07/2020',14,15,210);
INSERT INTO venta VALUES (4444,'352622-4','18567395-2','S004','A','13/04/2021',35,12,420);
INSERT INTO venta VALUES (4445,'9818708-1','29374931-0','S001','A','19/02/2020',31,12,372);
INSERT INTO venta VALUES (4446,'286688-9','47232966-9','S005','A','30/12/2020',10,12,120);
INSERT INTO venta VALUES (4447,'22578559-7','45421301-7','S004','A','08/05/2021',23,14,322);
INSERT INTO venta VALUES (4448,'16282689-1','45421301-7','S003','A','05/08/2020',17,15,255);
INSERT INTO venta VALUES (4449,'13505226-4','14519212-9','S005','B','10/03/2021',20,15,300);
INSERT INTO venta VALUES (4450,'47866625-K','20237862-5','S004','A','24/01/2020',20,15,300);
INSERT INTO venta VALUES (4451,'5063452-3','47232966-9','S005','A','18/10/2020',29,13,377);
INSERT INTO venta VALUES (4452,'42885656-2','6183303-K','S004','A','23/08/2020',20,13,260);
INSERT INTO venta VALUES (4453,'1187551-3','46566450-9','S005','B','20/07/2021',45,13,585);
INSERT INTO venta VALUES (4454,'2417256-2','14315947-7','S001','A','04/07/2020',47,13,611);
INSERT INTO venta VALUES (4455,'13853750-1','24180587-5','S004','B','02/03/2021',31,13,403);
INSERT INTO venta VALUES (4456,'1293679-6','6183303-K','S005','A','20/05/2020',26,12,312);
INSERT INTO venta VALUES (4457,'49948496-8','23819125-4','S003','A','02/04/2020',20,15,300);
INSERT INTO venta VALUES (4458,'23573163-0','32531450-8','S001','A','17/02/2021',11,13,143);
INSERT INTO venta VALUES (4459,'6465342-3','24180587-5','S003','A','18/11/2020',12,14,168);
INSERT INTO venta VALUES (4460,'35465402-4','6183303-K','S004','A','07/08/2020',25,12,300);
INSERT INTO venta VALUES (4461,'15892285-1','4810357-K','S002','B','26/05/2021',31,12,372);
INSERT INTO venta VALUES (4462,'48381691-K','47232966-9','S002','B','17/07/2021',12,14,168);
INSERT INTO venta VALUES (4463,'32977875-4','45421301-7','S002','A','29/04/2020',48,12,576);
INSERT INTO venta VALUES (4464,'2139758-K','23819125-4','S001','B','31/03/2020',41,12,492);
INSERT INTO venta VALUES (4465,'17923606-0','14315947-7','S004','B','21/03/2021',28,15,420);
INSERT INTO venta VALUES (4466,'35753112-8','23819125-4','S005','B','05/03/2021',26,12,312);
INSERT INTO venta VALUES (4467,'32442161-0','45421301-7','S003','A','10/10/2020',49,13,637);
INSERT INTO venta VALUES (4468,'3836630-0','24180587-5','S003','B','01/12/2021',49,14,686);
INSERT INTO venta VALUES (4469,'19290599-0','46566450-9','S005','A','20/05/2021',36,13,468);
INSERT INTO venta VALUES (4470,'37277479-7','46566450-9','S002','A','26/06/2021',32,12,384);
INSERT INTO venta VALUES (4471,'44379948-6','18567395-2','S004','A','04/04/2020',48,13,624);
INSERT INTO venta VALUES (4472,'40128587-3','47232966-9','S001','A','02/01/2020',39,13,507);
INSERT INTO venta VALUES (4473,'34310228-3','32531450-8','S005','B','03/05/2021',10,13,130);
INSERT INTO venta VALUES (4474,'10706379-K','14315947-7','S003','A','15/11/2021',31,12,372);
INSERT INTO venta VALUES (4475,'18650194-2','6183303-K','S004','B','17/10/2021',42,13,546);
INSERT INTO venta VALUES (4476,'311538-0','6183303-K','S005','A','17/01/2021',38,15,570);
INSERT INTO venta VALUES (4477,'42453287-8','32531450-8','S005','B','14/11/2020',25,15,375);
INSERT INTO venta VALUES (4478,'50707777-3','46566450-9','S004','B','23/03/2021',10,12,120);
INSERT INTO venta VALUES (4479,'10346114-6','47232966-9','S001','A','15/05/2020',12,13,156);
INSERT INTO venta VALUES (4480,'46691665-K','20237862-5','S003','A','02/09/2020',20,13,260);
INSERT INTO venta VALUES (4481,'18996592-3','47232966-9','S003','A','24/04/2021',28,15,420);
INSERT INTO venta VALUES (4482,'19619789-3','8402711-1','S001','A','06/02/2021',48,12,576);
INSERT INTO venta VALUES (4483,'26351763-6','24180587-5','S002','A','29/05/2020',35,12,420);
INSERT INTO venta VALUES (4484,'25522713-0','20237862-5','S002','B','18/08/2021',24,15,360);
INSERT INTO venta VALUES (4485,'29475335-4','47232966-9','S003','B','11/08/2021',27,12,324);
INSERT INTO venta VALUES (4486,'38504455-0','45421301-7','S001','B','24/05/2020',37,12,444);
INSERT INTO venta VALUES (4487,'40523969-8','20237862-5','S003','B','11/07/2020',25,13,325);
INSERT INTO venta VALUES (4488,'26352495-0','32531450-8','S004','B','24/02/2020',23,12,276);
INSERT INTO venta VALUES (4489,'17669273-1','14519212-9','S002','B','02/03/2021',47,14,658);
INSERT INTO venta VALUES (4490,'20255908-5','14315947-7','S001','B','25/09/2020',17,12,204);
INSERT INTO venta VALUES (4491,'18565531-8','47232966-9','S001','B','16/04/2021',38,13,494);
INSERT INTO venta VALUES (4492,'13962214-6','29374931-0','S005','B','22/05/2020',21,13,273);
INSERT INTO venta VALUES (4493,'32379629-7','47232966-9','S003','B','13/10/2021',31,12,372);
INSERT INTO venta VALUES (4494,'25724244-7','29374931-0','S003','B','05/11/2020',31,12,372);
INSERT INTO venta VALUES (4495,'861660-4','47232966-9','S002','A','15/11/2020',30,15,450);
INSERT INTO venta VALUES (4496,'50427790-9','29374931-0','S002','A','11/01/2021',44,13,572);
INSERT INTO venta VALUES (4497,'16841887-6','46566450-9','S004','A','18/08/2021',22,12,264);
INSERT INTO venta VALUES (4498,'46371192-5','14519212-9','S004','B','23/03/2020',28,12,336);
INSERT INTO venta VALUES (4499,'32843926-3','4810357-K','S005','B','24/01/2021',34,14,476);
INSERT INTO venta VALUES (4500,'34181117-1','32531450-8','S005','B','23/09/2021',43,14,602);
INSERT INTO venta VALUES (4501,'25238461-8','14519212-9','S005','A','12/11/2020',11,12,132);
INSERT INTO venta VALUES (4502,'45450359-7','8402711-1','S005','B','21/05/2021',21,12,252);
INSERT INTO venta VALUES (4503,'6415906-2','46566450-9','S002','B','22/03/2021',47,13,611);
INSERT INTO venta VALUES (4504,'30252467-K','45421301-7','S005','A','16/12/2021',23,15,345);
INSERT INTO venta VALUES (4505,'2986816-6','14519212-9','S001','B','19/01/2021',29,14,406);
INSERT INTO venta VALUES (4506,'5633934-5','8402711-1','S001','A','05/09/2020',26,15,390);
INSERT INTO venta VALUES (4507,'14582575-K','4810357-K','S003','A','09/09/2020',27,14,378);
INSERT INTO venta VALUES (4508,'1399243-6','18567395-2','S005','B','12/06/2020',12,15,180);
INSERT INTO venta VALUES (4509,'17542480-6','45421301-7','S003','A','09/06/2020',26,14,364);
INSERT INTO venta VALUES (4510,'23453878-0','46566450-9','S004','A','03/06/2020',15,13,195);
INSERT INTO venta VALUES (4511,'3344038-3','32531450-8','S001','B','25/02/2021',39,15,585);
INSERT INTO venta VALUES (4512,'29477102-6','8402711-1','S001','A','21/08/2021',32,12,384);
INSERT INTO venta VALUES (4513,'25814227-6','42396509-6','S003','B','20/12/2021',46,12,552);
INSERT INTO venta VALUES (4514,'42508559-K','47232966-9','S005','B','28/08/2021',40,14,560);
INSERT INTO venta VALUES (4515,'1617703-2','14519212-9','S005','A','30/01/2020',34,12,408);
INSERT INTO venta VALUES (4516,'2718614-9','18567395-2','S004','B','13/03/2021',17,15,255);
INSERT INTO venta VALUES (4517,'4348833-3','8402711-1','S002','B','15/07/2020',44,15,660);
INSERT INTO venta VALUES (4518,'622622-1','24180587-5','S003','A','16/01/2020',17,13,221);
INSERT INTO venta VALUES (4519,'3787833-2','29374931-0','S003','A','24/10/2021',49,13,637);
INSERT INTO venta VALUES (4520,'47229731-7','46566450-9','S003','A','21/11/2021',49,13,637);
INSERT INTO venta VALUES (4521,'579393-9','20237862-5','S002','B','07/10/2020',38,15,570);
INSERT INTO venta VALUES (4522,'31463680-5','47232966-9','S002','B','30/03/2020',39,12,468);
INSERT INTO venta VALUES (4523,'6864554-9','20237862-5','S002','B','17/07/2020',47,13,611);
INSERT INTO venta VALUES (4524,'39988545-0','23819125-4','S003','A','30/11/2021',27,13,351);
INSERT INTO venta VALUES (4525,'33782557-5','24180587-5','S002','B','28/11/2020',41,15,615);
INSERT INTO venta VALUES (4526,'43425922-3','23819125-4','S005','B','26/03/2020',43,14,602);
INSERT INTO venta VALUES (4527,'49836924-3','6183303-K','S001','A','09/06/2020',19,15,285);
INSERT INTO venta VALUES (4528,'1253946-0','8402711-1','S004','B','22/05/2020',32,12,384);
INSERT INTO venta VALUES (4529,'37341101-9','47232966-9','S001','A','13/10/2021',44,13,572);
INSERT INTO venta VALUES (4530,'20667594-2','47232966-9','S001','A','23/05/2021',42,14,588);
INSERT INTO venta VALUES (4531,'38393890-2','4810357-K','S001','B','01/12/2020',43,14,602);
INSERT INTO venta VALUES (4532,'33926788-K','14315947-7','S004','B','05/11/2021',47,12,564);
INSERT INTO venta VALUES (4533,'42961871-1','42396509-6','S004','A','22/01/2020',30,12,360);
INSERT INTO venta VALUES (4534,'28686792-8','24180587-5','S005','A','17/03/2021',38,14,532);
INSERT INTO venta VALUES (4535,'10219714-3','23819125-4','S001','A','01/08/2020',34,14,476);
INSERT INTO venta VALUES (4536,'35878746-0','29374931-0','S004','A','26/06/2020',50,13,650);
INSERT INTO venta VALUES (4537,'23473511-K','47232966-9','S005','A','20/06/2021',46,15,690);
INSERT INTO venta VALUES (4538,'34701221-1','46566450-9','S002','B','30/09/2020',38,12,456);
INSERT INTO venta VALUES (4539,'12309415-8','23819125-4','S003','A','05/01/2020',33,14,462);
INSERT INTO venta VALUES (4540,'39619954-8','47232966-9','S003','B','07/01/2021',50,15,750);
INSERT INTO venta VALUES (4541,'47263493-3','46566450-9','S004','A','02/10/2020',48,14,672);
INSERT INTO venta VALUES (4542,'53395-5','20237862-5','S003','B','31/05/2021',27,13,351);
INSERT INTO venta VALUES (4543,'27347975-9','14315947-7','S005','A','30/11/2020',33,13,429);
INSERT INTO venta VALUES (4544,'9896230-1','42396509-6','S003','B','06/03/2020',19,12,228);
INSERT INTO venta VALUES (4545,'37667154-2','14315947-7','S005','B','24/11/2020',47,14,658);
INSERT INTO venta VALUES (4546,'49131271-8','14315947-7','S002','B','01/07/2021',41,14,574);
INSERT INTO venta VALUES (4547,'28279548-5','32531450-8','S001','B','03/08/2020',10,12,120);
INSERT INTO venta VALUES (4548,'46910506-7','45421301-7','S005','B','11/04/2021',46,15,690);
INSERT INTO venta VALUES (4549,'10962530-2','18567395-2','S003','A','01/04/2020',39,15,585);
INSERT INTO venta VALUES (4550,'34388372-2','32531450-8','S001','B','18/07/2021',27,15,405);
INSERT INTO venta VALUES (4551,'5184508-0','6183303-K','S002','A','29/07/2020',18,12,216);
INSERT INTO venta VALUES (4552,'39578339-4','14519212-9','S005','B','19/04/2021',45,12,540);
INSERT INTO venta VALUES (4553,'33783997-5','32531450-8','S004','B','03/03/2021',44,12,528);
INSERT INTO venta VALUES (4554,'14775706-9','8402711-1','S002','B','24/08/2021',35,12,420);
INSERT INTO venta VALUES (4555,'10889671-K','14315947-7','S001','A','28/07/2020',15,13,195);
INSERT INTO venta VALUES (4556,'17256368-6','32531450-8','S004','A','17/10/2020',15,12,180);
INSERT INTO venta VALUES (4557,'16949388-K','4810357-K','S001','B','11/07/2021',12,14,168);
INSERT INTO venta VALUES (4558,'11125584-9','6183303-K','S004','B','18/06/2021',20,13,260);
INSERT INTO venta VALUES (4559,'32599126-7','4810357-K','S004','A','25/09/2021',28,14,392);
INSERT INTO venta VALUES (4560,'18352275-2','24180587-5','S003','B','01/06/2020',38,12,456);
INSERT INTO venta VALUES (4561,'25864978-8','45421301-7','S002','A','12/02/2020',22,14,308);
INSERT INTO venta VALUES (4562,'29968348-6','23819125-4','S005','B','18/03/2021',48,14,672);
INSERT INTO venta VALUES (4563,'11988320-2','46566450-9','S002','A','06/01/2020',27,15,405);
INSERT INTO venta VALUES (4564,'4686762-9','20237862-5','S005','B','12/09/2021',11,15,165);
INSERT INTO venta VALUES (4565,'16543524-9','6183303-K','S004','A','26/12/2020',42,12,504);
INSERT INTO venta VALUES (4566,'7980123-2','20237862-5','S005','B','01/03/2021',14,13,182);
INSERT INTO venta VALUES (4567,'11128351-6','4810357-K','S003','A','01/02/2020',23,14,322);
INSERT INTO venta VALUES (4568,'35636383-3','20237862-5','S003','A','20/06/2020',31,14,434);
INSERT INTO venta VALUES (4569,'25414315-4','23819125-4','S003','A','28/12/2020',33,14,462);
INSERT INTO venta VALUES (4570,'33330984-K','14315947-7','S001','A','10/05/2020',50,12,600);
INSERT INTO venta VALUES (4571,'1281503-4','14519212-9','S005','A','17/12/2020',29,12,348);
INSERT INTO venta VALUES (4572,'38460966-K','14315947-7','S003','A','01/11/2021',25,12,300);
INSERT INTO venta VALUES (4573,'19857451-1','32531450-8','S003','A','04/09/2020',10,13,130);
INSERT INTO venta VALUES (4574,'37467881-7','47232966-9','S003','B','22/01/2021',22,15,330);
INSERT INTO venta VALUES (4575,'33371630-5','6183303-K','S002','B','19/10/2021',49,13,637);
INSERT INTO venta VALUES (4576,'10886477-K','20237862-5','S003','A','21/07/2020',37,12,444);
INSERT INTO venta VALUES (4577,'97034-4','24180587-5','S003','B','23/06/2021',23,15,345);
INSERT INTO venta VALUES (4578,'1648971-9','14519212-9','S001','B','02/02/2020',30,14,420);
INSERT INTO venta VALUES (4579,'32642704-7','46566450-9','S001','A','27/12/2020',10,13,130);
INSERT INTO venta VALUES (4580,'27617748-6','32531450-8','S002','A','03/10/2020',32,15,480);
INSERT INTO venta VALUES (4581,'6893141-K','18567395-2','S001','A','03/08/2021',18,12,216);
INSERT INTO venta VALUES (4582,'6237730-5','18567395-2','S002','B','27/02/2021',31,12,372);
INSERT INTO venta VALUES (4583,'47578117-1','47232966-9','S001','A','08/04/2020',16,14,224);
INSERT INTO venta VALUES (4584,'6328185-9','29374931-0','S003','B','22/11/2021',29,13,377);
INSERT INTO venta VALUES (4585,'15670796-1','45421301-7','S005','A','17/08/2020',10,14,140);
INSERT INTO venta VALUES (4586,'3641462-6','14315947-7','S005','B','29/05/2020',34,13,442);
INSERT INTO venta VALUES (4587,'7175488-K','20237862-5','S001','B','25/09/2020',12,14,168);
INSERT INTO venta VALUES (4588,'34883250-6','29374931-0','S005','A','19/04/2020',10,15,150);
INSERT INTO venta VALUES (4589,'31206779-K','6183303-K','S004','A','02/03/2021',31,12,372);
INSERT INTO venta VALUES (4590,'46608268-6','8402711-1','S001','A','29/08/2020',11,12,132);
INSERT INTO venta VALUES (4591,'36751859-6','47232966-9','S004','B','16/08/2020',19,12,228);
INSERT INTO venta VALUES (4592,'22592713-8','4810357-K','S001','A','23/11/2021',43,13,559);
INSERT INTO venta VALUES (4593,'37516398-5','32531450-8','S001','B','17/04/2021',43,12,516);
INSERT INTO venta VALUES (4594,'15784570-5','6183303-K','S005','B','10/02/2020',14,13,182);
INSERT INTO venta VALUES (4595,'27301426-8','6183303-K','S002','B','03/09/2020',20,13,260);
INSERT INTO venta VALUES (4596,'654214-K','24180587-5','S004','B','17/03/2021',27,15,405);
INSERT INTO venta VALUES (4597,'12397181-7','14315947-7','S005','B','01/05/2020',11,15,165);
INSERT INTO venta VALUES (4598,'11826891-1','14315947-7','S004','B','23/04/2021',50,12,600);
INSERT INTO venta VALUES (4599,'4284840-9','4810357-K','S003','B','10/12/2020',12,15,180);
INSERT INTO venta VALUES (4600,'3948172-3','4810357-K','S002','B','10/03/2021',48,12,576);
INSERT INTO venta VALUES (4601,'46862498-2','14315947-7','S001','A','02/05/2021',25,14,350);
INSERT INTO venta VALUES (4602,'31933998-1','6183303-K','S001','B','30/04/2020',41,12,492);
INSERT INTO venta VALUES (4603,'42927751-5','24180587-5','S004','A','26/01/2021',25,14,350);
INSERT INTO venta VALUES (4604,'10103950-1','24180587-5','S001','A','13/09/2021',11,12,132);
INSERT INTO venta VALUES (4605,'30513489-9','4810357-K','S002','B','10/06/2020',43,14,602);
INSERT INTO venta VALUES (4606,'36516726-5','29374931-0','S001','B','28/12/2020',32,14,448);
INSERT INTO venta VALUES (4607,'6346816-9','32531450-8','S003','B','11/08/2021',16,15,240);
INSERT INTO venta VALUES (4608,'95828-K','47232966-9','S002','A','09/10/2020',15,12,180);
INSERT INTO venta VALUES (4609,'1629139-0','47232966-9','S002','A','19/03/2020',35,13,455);
INSERT INTO venta VALUES (4610,'48337467-4','29374931-0','S004','B','08/10/2020',42,13,546);
INSERT INTO venta VALUES (4611,'4519732-8','4810357-K','S001','A','04/05/2020',39,13,507);
INSERT INTO venta VALUES (4612,'298349-4','47232966-9','S002','A','28/10/2021',36,14,504);
INSERT INTO venta VALUES (4613,'8882892-5','42396509-6','S002','B','22/03/2020',10,12,120);
INSERT INTO venta VALUES (4614,'23724566-0','42396509-6','S001','A','02/12/2021',19,12,228);
INSERT INTO venta VALUES (4615,'13677701-7','14519212-9','S004','B','30/05/2021',29,13,377);
INSERT INTO venta VALUES (4616,'15467298-2','6183303-K','S002','B','08/10/2020',30,13,390);
INSERT INTO venta VALUES (4617,'10837675-9','46566450-9','S004','A','26/02/2021',27,14,378);
INSERT INTO venta VALUES (4618,'42310596-8','8402711-1','S001','B','19/02/2021',44,12,528);
INSERT INTO venta VALUES (4619,'21251401-2','45421301-7','S001','B','23/02/2020',24,13,312);
INSERT INTO venta VALUES (4620,'45456811-7','14519212-9','S001','B','19/11/2021',41,12,492);
INSERT INTO venta VALUES (4621,'34614323-1','14519212-9','S001','A','01/07/2020',47,15,705);
INSERT INTO venta VALUES (4622,'24908689-4','20237862-5','S001','A','21/07/2020',46,13,598);
INSERT INTO venta VALUES (4623,'38888491-6','6183303-K','S004','A','03/06/2021',20,13,260);
INSERT INTO venta VALUES (4624,'823358-6','24180587-5','S004','B','09/09/2021',40,15,600);
INSERT INTO venta VALUES (4625,'29235193-3','42396509-6','S001','A','19/09/2020',25,15,375);
INSERT INTO venta VALUES (4626,'27126195-0','20237862-5','S001','A','09/05/2020',34,13,442);
INSERT INTO venta VALUES (4627,'33404901-9','42396509-6','S004','A','11/04/2021',26,12,312);
INSERT INTO venta VALUES (4628,'48971155-9','32531450-8','S005','B','08/09/2021',40,13,520);
INSERT INTO venta VALUES (4629,'4896751-5','14315947-7','S004','A','18/07/2021',31,15,465);
INSERT INTO venta VALUES (4630,'42175995-2','46566450-9','S002','B','17/06/2021',34,14,476);
INSERT INTO venta VALUES (4631,'13564265-7','45421301-7','S003','A','26/01/2020',10,15,150);
INSERT INTO venta VALUES (4632,'38540198-1','20237862-5','S001','B','07/02/2020',29,12,348);
INSERT INTO venta VALUES (4633,'33796533-4','32531450-8','S004','A','09/04/2020',10,13,130);
INSERT INTO venta VALUES (4634,'44370765-4','18567395-2','S005','A','23/02/2021',47,15,705);
INSERT INTO venta VALUES (4635,'18799165-K','8402711-1','S005','A','04/08/2021',48,15,720);
INSERT INTO venta VALUES (4636,'461852-1','47232966-9','S004','B','10/08/2020',22,12,264);
INSERT INTO venta VALUES (4637,'3365978-4','14519212-9','S005','B','05/02/2021',31,13,403);
INSERT INTO venta VALUES (4638,'41777347-9','20237862-5','S002','A','06/12/2020',18,14,252);
INSERT INTO venta VALUES (4639,'10344755-0','14519212-9','S001','A','27/05/2020',31,12,372);
INSERT INTO venta VALUES (4640,'15827626-7','23819125-4','S001','A','31/05/2021',21,15,315);
INSERT INTO venta VALUES (4641,'36218685-4','45421301-7','S002','A','11/05/2020',44,12,528);
INSERT INTO venta VALUES (4642,'31512203-1','14315947-7','S002','B','17/07/2020',43,12,516);
INSERT INTO venta VALUES (4643,'38862398-5','4810357-K','S001','A','18/05/2021',20,14,280);
INSERT INTO venta VALUES (4644,'17518858-4','32531450-8','S004','B','20/09/2020',37,15,555);
INSERT INTO venta VALUES (4645,'3249722-5','6183303-K','S001','A','08/07/2020',12,14,168);
INSERT INTO venta VALUES (4646,'47799176-9','46566450-9','S002','B','11/09/2021',32,12,384);
INSERT INTO venta VALUES (4647,'20962990-9','20237862-5','S002','A','28/07/2021',21,12,252);
INSERT INTO venta VALUES (4648,'34605201-5','32531450-8','S003','B','26/06/2021',29,13,377);
INSERT INTO venta VALUES (4649,'362596-6','47232966-9','S004','B','01/03/2020',17,14,238);
INSERT INTO venta VALUES (4650,'17375952-5','20237862-5','S003','A','18/02/2020',38,15,570);
INSERT INTO venta VALUES (4651,'10937332-K','23819125-4','S004','B','23/05/2020',38,13,494);
INSERT INTO venta VALUES (4652,'48821618-K','4810357-K','S003','A','23/12/2020',16,12,192);
INSERT INTO venta VALUES (4653,'33862339-9','14315947-7','S001','A','01/09/2020',10,12,120);
INSERT INTO venta VALUES (4654,'21532819-8','46566450-9','S004','A','15/09/2021',37,15,555);
INSERT INTO venta VALUES (4655,'33862361-5','14519212-9','S002','B','18/10/2021',25,12,300);
INSERT INTO venta VALUES (4656,'36306890-1','8402711-1','S005','A','09/06/2020',17,12,204);
INSERT INTO venta VALUES (4657,'22914299-2','42396509-6','S005','A','27/11/2021',18,13,234);
INSERT INTO venta VALUES (4658,'1615409-1','18567395-2','S005','A','26/06/2020',30,15,450);
INSERT INTO venta VALUES (4659,'4095870-3','18567395-2','S001','A','08/08/2021',34,14,476);
INSERT INTO venta VALUES (4660,'16177145-7','14315947-7','S004','B','07/09/2020',47,13,611);
INSERT INTO venta VALUES (4661,'6710818-3','42396509-6','S002','A','04/05/2020',12,15,180);
INSERT INTO venta VALUES (4662,'1124366-5','18567395-2','S001','A','11/03/2020',13,12,156);
INSERT INTO venta VALUES (4663,'1925053-9','32531450-8','S001','A','23/07/2020',18,15,270);
INSERT INTO venta VALUES (4664,'47506426-7','20237862-5','S003','A','22/07/2020',18,12,216);
INSERT INTO venta VALUES (4665,'4497765-6','8402711-1','S004','A','16/11/2021',49,15,735);
INSERT INTO venta VALUES (4666,'10773220-9','4810357-K','S001','B','25/03/2021',45,13,585);
INSERT INTO venta VALUES (4667,'29893435-3','47232966-9','S004','A','19/01/2021',42,15,630);
INSERT INTO venta VALUES (4668,'20252144-4','47232966-9','S005','A','08/08/2020',50,12,600);
INSERT INTO venta VALUES (4669,'1771105-9','18567395-2','S004','A','31/03/2021',15,13,195);
INSERT INTO venta VALUES (4670,'48105159-2','47232966-9','S005','B','27/02/2021',13,13,169);
INSERT INTO venta VALUES (4671,'3970336-K','42396509-6','S002','A','23/01/2020',40,13,520);
INSERT INTO venta VALUES (4672,'4132063-K','14315947-7','S005','A','14/09/2020',32,13,416);
INSERT INTO venta VALUES (4673,'26886840-2','45421301-7','S001','B','12/03/2020',28,15,420);
INSERT INTO venta VALUES (4674,'4924292-1','47232966-9','S002','A','05/02/2020',50,13,650);
INSERT INTO venta VALUES (4675,'2593595-0','18567395-2','S005','A','12/03/2020',18,15,270);
INSERT INTO venta VALUES (4676,'38912466-4','6183303-K','S002','A','17/04/2020',14,13,182);
INSERT INTO venta VALUES (4677,'11903114-1','14519212-9','S002','A','30/12/2021',16,12,192);
INSERT INTO venta VALUES (4678,'38484150-3','24180587-5','S004','B','18/06/2021',37,15,555);
INSERT INTO venta VALUES (4679,'19336750-K','18567395-2','S005','B','14/04/2021',37,15,555);
INSERT INTO venta VALUES (4680,'45361803-K','14519212-9','S002','B','10/04/2021',47,14,658);
INSERT INTO venta VALUES (4681,'14707264-3','14519212-9','S004','A','08/09/2020',39,14,546);
INSERT INTO venta VALUES (4682,'20246700-8','42396509-6','S001','A','01/10/2020',23,14,322);
INSERT INTO venta VALUES (4683,'7915833-K','45421301-7','S002','B','09/09/2020',20,12,240);
INSERT INTO venta VALUES (4684,'18279580-1','32531450-8','S004','B','15/09/2021',11,12,132);
INSERT INTO venta VALUES (4685,'32696732-7','46566450-9','S002','A','13/04/2020',43,12,516);
INSERT INTO venta VALUES (4686,'8586875-6','14315947-7','S005','A','27/03/2021',10,14,140);
INSERT INTO venta VALUES (4687,'1786143-3','29374931-0','S003','B','09/04/2020',44,13,572);
INSERT INTO venta VALUES (4688,'18608315-6','29374931-0','S005','A','27/09/2021',30,13,390);
INSERT INTO venta VALUES (4689,'42777897-5','24180587-5','S001','A','12/05/2021',49,12,588);
INSERT INTO venta VALUES (4690,'2317726-9','24180587-5','S004','A','05/06/2020',22,13,286);
INSERT INTO venta VALUES (4691,'18507970-8','14315947-7','S001','B','24/08/2021',28,12,336);
INSERT INTO venta VALUES (4692,'41684322-8','23819125-4','S004','A','30/06/2020',43,14,602);
INSERT INTO venta VALUES (4693,'37766603-8','4810357-K','S005','B','13/09/2020',29,14,406);
INSERT INTO venta VALUES (4694,'11742919-9','14519212-9','S004','B','24/10/2021',34,14,476);
INSERT INTO venta VALUES (4695,'48139555-0','8402711-1','S002','B','08/11/2021',32,15,480);
INSERT INTO venta VALUES (4696,'1865675-2','20237862-5','S001','B','06/07/2020',30,12,360);
INSERT INTO venta VALUES (4697,'47110134-6','14315947-7','S003','B','01/10/2020',23,14,322);
INSERT INTO venta VALUES (4698,'21759649-1','29374931-0','S002','B','21/12/2020',25,12,300);
INSERT INTO venta VALUES (4699,'3740972-3','23819125-4','S004','A','25/12/2021',38,13,494);
INSERT INTO venta VALUES (4700,'22975731-8','47232966-9','S003','B','26/08/2021',48,12,576);
INSERT INTO venta VALUES (4701,'34709987-2','45421301-7','S003','B','15/04/2021',26,14,364);
INSERT INTO venta VALUES (4702,'33473373-4','46566450-9','S003','A','15/01/2021',50,15,750);
INSERT INTO venta VALUES (4703,'35137234-6','24180587-5','S004','B','21/07/2021',39,15,585);
INSERT INTO venta VALUES (4704,'21184458-2','20237862-5','S004','A','01/12/2021',30,15,450);
INSERT INTO venta VALUES (4705,'4857214-6','4810357-K','S003','A','23/12/2020',45,12,540);
INSERT INTO venta VALUES (4706,'31248750-0','6183303-K','S002','A','24/11/2021',24,15,360);
INSERT INTO venta VALUES (4707,'33100793-5','20237862-5','S001','B','02/03/2021',37,13,481);
INSERT INTO venta VALUES (4708,'27799616-2','29374931-0','S002','B','30/11/2020',50,12,600);
INSERT INTO venta VALUES (4709,'1528456-0','6183303-K','S002','B','01/10/2021',49,12,588);
INSERT INTO venta VALUES (4710,'42648311-4','14315947-7','S004','A','25/09/2021',31,12,372);
INSERT INTO venta VALUES (4711,'36874751-3','29374931-0','S003','B','25/04/2020',22,15,330);
INSERT INTO venta VALUES (4712,'22499113-4','23819125-4','S005','B','10/01/2020',21,13,273);
INSERT INTO venta VALUES (4713,'4528653-3','23819125-4','S004','A','28/09/2020',39,13,507);
INSERT INTO venta VALUES (4714,'30967752-8','47232966-9','S002','B','12/09/2020',33,15,495);
INSERT INTO venta VALUES (4715,'16410532-6','47232966-9','S003','A','13/11/2020',17,12,204);
INSERT INTO venta VALUES (4716,'21560113-7','29374931-0','S002','A','29/08/2020',49,15,735);
INSERT INTO venta VALUES (4717,'26638892-6','8402711-1','S005','B','03/05/2021',16,15,240);
INSERT INTO venta VALUES (4718,'1179973-6','32531450-8','S004','A','12/08/2020',28,13,364);
INSERT INTO venta VALUES (4719,'2877565-2','14519212-9','S002','A','28/02/2020',34,12,408);
INSERT INTO venta VALUES (4720,'36781566-3','29374931-0','S001','B','28/05/2020',35,13,455);
INSERT INTO venta VALUES (4721,'4288088-4','23819125-4','S001','A','09/02/2020',47,12,564);
INSERT INTO venta VALUES (4722,'2775313-2','20237862-5','S001','A','02/11/2020',40,12,480);
INSERT INTO venta VALUES (4723,'49813676-1','6183303-K','S002','A','16/12/2021',39,12,468);
INSERT INTO venta VALUES (4724,'35918199-K','14519212-9','S001','B','14/01/2020',43,13,559);
INSERT INTO venta VALUES (4725,'11306566-4','29374931-0','S002','B','23/02/2021',24,15,360);
INSERT INTO venta VALUES (4726,'325008-3','32531450-8','S005','B','10/10/2020',21,12,252);
INSERT INTO venta VALUES (4727,'13701252-9','47232966-9','S002','B','03/12/2021',15,15,225);
INSERT INTO venta VALUES (4728,'11940741-9','42396509-6','S004','A','01/07/2021',37,13,481);
INSERT INTO venta VALUES (4729,'3862487-3','6183303-K','S001','B','14/05/2020',31,15,465);
INSERT INTO venta VALUES (4730,'25491389-8','29374931-0','S004','B','01/04/2021',31,12,372);
INSERT INTO venta VALUES (4731,'18753887-4','14519212-9','S005','A','15/06/2020',23,13,299);
INSERT INTO venta VALUES (4732,'38906790-3','6183303-K','S002','B','31/07/2020',41,15,615);
INSERT INTO venta VALUES (4733,'50148857-7','4810357-K','S004','B','30/05/2020',26,15,390);
INSERT INTO venta VALUES (4734,'33205809-6','47232966-9','S001','B','25/03/2020',41,13,533);
INSERT INTO venta VALUES (4735,'45319792-1','45421301-7','S001','B','05/04/2021',22,14,308);
INSERT INTO venta VALUES (4736,'18634364-6','18567395-2','S003','B','30/10/2021',29,13,377);
INSERT INTO venta VALUES (4737,'27356797-6','32531450-8','S004','B','09/10/2021',49,15,735);
INSERT INTO venta VALUES (4738,'6648449-1','23819125-4','S005','B','25/12/2021',10,13,130);
INSERT INTO venta VALUES (4739,'47307353-6','6183303-K','S005','B','14/03/2021',18,12,216);
INSERT INTO venta VALUES (4740,'45718276-7','18567395-2','S002','B','10/03/2021',26,12,312);
INSERT INTO venta VALUES (4741,'32751281-1','18567395-2','S001','B','20/11/2021',21,14,294);
INSERT INTO venta VALUES (4742,'9848752-2','4810357-K','S005','B','20/04/2021',27,13,351);
INSERT INTO venta VALUES (4743,'24909505-2','23819125-4','S005','A','15/01/2021',15,15,225);
INSERT INTO venta VALUES (4744,'711151-7','20237862-5','S002','A','13/03/2021',39,15,585);
INSERT INTO venta VALUES (4745,'46309313-K','4810357-K','S002','B','29/02/2020',34,15,510);
INSERT INTO venta VALUES (4746,'20287539-4','8402711-1','S003','A','11/12/2020',45,13,585);
INSERT INTO venta VALUES (4747,'47911723-3','32531450-8','S004','B','09/01/2020',44,13,572);
INSERT INTO venta VALUES (4748,'45338344-K','4810357-K','S003','B','24/11/2020',45,13,585);
INSERT INTO venta VALUES (4749,'29258107-6','45421301-7','S003','A','07/02/2021',47,15,705);
INSERT INTO venta VALUES (4750,'24642835-2','45421301-7','S002','A','23/12/2020',39,14,546);
INSERT INTO venta VALUES (4751,'15739680-3','4810357-K','S005','A','12/07/2021',32,13,416);
INSERT INTO venta VALUES (4752,'43954539-9','24180587-5','S004','B','19/11/2021',41,12,492);
INSERT INTO venta VALUES (4753,'24601674-7','4810357-K','S005','A','29/08/2021',47,12,564);
INSERT INTO venta VALUES (4754,'22998973-1','23819125-4','S004','A','08/06/2020',29,12,348);
INSERT INTO venta VALUES (4755,'44858821-1','24180587-5','S002','B','03/06/2021',10,13,130);
INSERT INTO venta VALUES (4756,'12412988-5','45421301-7','S001','A','16/06/2020',13,13,169);
INSERT INTO venta VALUES (4757,'39868199-1','4810357-K','S005','A','04/12/2021',23,15,345);
INSERT INTO venta VALUES (4758,'36229320-0','4810357-K','S001','B','14/11/2021',15,12,180);
INSERT INTO venta VALUES (4759,'22692321-7','14519212-9','S001','B','11/09/2020',30,15,450);
INSERT INTO venta VALUES (4760,'48119975-1','42396509-6','S001','B','11/03/2021',29,12,348);
INSERT INTO venta VALUES (4761,'1493416-2','8402711-1','S003','B','10/09/2021',37,12,444);
INSERT INTO venta VALUES (4762,'9763747-4','32531450-8','S002','A','25/02/2021',34,13,442);
INSERT INTO venta VALUES (4763,'15125302-4','45421301-7','S002','B','14/06/2021',14,14,196);
INSERT INTO venta VALUES (4764,'32667506-7','18567395-2','S002','B','28/04/2020',27,14,378);
INSERT INTO venta VALUES (4765,'8959786-2','6183303-K','S001','A','27/12/2020',31,13,403);
INSERT INTO venta VALUES (4766,'24920513-3','20237862-5','S005','A','03/11/2020',24,15,360);
INSERT INTO venta VALUES (4767,'3144784-4','47232966-9','S002','A','01/05/2020',13,14,182);
INSERT INTO venta VALUES (4768,'33289189-8','29374931-0','S001','A','25/10/2021',10,14,140);
INSERT INTO venta VALUES (4769,'1642943-0','18567395-2','S005','A','16/08/2021',43,13,559);
INSERT INTO venta VALUES (4770,'307495-1','42396509-6','S004','A','11/08/2020',28,12,336);
INSERT INTO venta VALUES (4771,'50606168-7','8402711-1','S005','B','13/08/2021',11,12,132);
INSERT INTO venta VALUES (4772,'8931618-9','46566450-9','S002','A','14/09/2020',25,13,325);
INSERT INTO venta VALUES (4773,'31193617-4','14519212-9','S001','B','30/11/2021',36,13,468);
INSERT INTO venta VALUES (4774,'19760805-6','20237862-5','S002','B','12/03/2020',50,12,600);
INSERT INTO venta VALUES (4775,'49611325-K','4810357-K','S001','A','06/10/2020',21,12,252);
INSERT INTO venta VALUES (4776,'31895487-9','4810357-K','S001','A','13/01/2020',17,15,255);
INSERT INTO venta VALUES (4777,'34883780-K','18567395-2','S004','A','04/06/2021',28,15,420);
INSERT INTO venta VALUES (4778,'41481417-4','23819125-4','S003','A','09/03/2020',44,15,660);
INSERT INTO venta VALUES (4779,'39625992-3','18567395-2','S002','B','13/12/2020',43,13,559);
INSERT INTO venta VALUES (4780,'8668552-3','8402711-1','S003','A','24/04/2020',31,14,434);
INSERT INTO venta VALUES (4781,'48881410-9','4810357-K','S001','A','14/05/2021',10,15,150);
INSERT INTO venta VALUES (4782,'4249839-4','42396509-6','S004','A','02/02/2020',39,13,507);
INSERT INTO venta VALUES (4783,'34170170-8','29374931-0','S002','A','30/04/2021',48,12,576);
INSERT INTO venta VALUES (4784,'22440478-6','32531450-8','S002','A','09/05/2020',22,12,264);
INSERT INTO venta VALUES (4785,'23357588-7','20237862-5','S002','A','10/03/2020',15,14,210);
INSERT INTO venta VALUES (4786,'45162260-9','14519212-9','S003','A','11/04/2021',36,15,540);
INSERT INTO venta VALUES (4787,'43491650-K','29374931-0','S002','B','04/07/2020',36,13,468);
INSERT INTO venta VALUES (4788,'45404268-9','20237862-5','S004','A','15/07/2021',48,15,720);
INSERT INTO venta VALUES (4789,'22252619-1','47232966-9','S004','B','17/10/2020',34,12,408);
INSERT INTO venta VALUES (4790,'19868118-0','14519212-9','S002','A','26/06/2020',15,15,225);
INSERT INTO venta VALUES (4791,'9114642-8','32531450-8','S005','A','14/11/2021',32,14,448);
INSERT INTO venta VALUES (4792,'43302376-5','46566450-9','S002','A','11/10/2021',21,12,252);
INSERT INTO venta VALUES (4793,'41687114-0','20237862-5','S003','B','07/04/2021',47,12,564);
INSERT INTO venta VALUES (4794,'3580221-5','20237862-5','S005','B','14/09/2020',47,14,658);
INSERT INTO venta VALUES (4795,'476801-9','24180587-5','S001','A','07/05/2021',23,14,322);
INSERT INTO venta VALUES (4796,'6490522-8','47232966-9','S003','B','15/10/2021',15,14,210);
INSERT INTO venta VALUES (4797,'21111668-4','14519212-9','S001','B','12/01/2021',47,12,564);
INSERT INTO venta VALUES (4798,'209803-2','47232966-9','S001','B','17/06/2020',46,14,644);
INSERT INTO venta VALUES (4799,'1948800-4','4810357-K','S003','A','22/09/2020',32,13,416);
INSERT INTO venta VALUES (4800,'8149359-6','24180587-5','S004','B','08/04/2020',30,12,360);
INSERT INTO venta VALUES (4801,'25881938-1','20237862-5','S001','A','24/11/2021',32,15,480);
INSERT INTO venta VALUES (4802,'4519275-K','6183303-K','S001','A','10/05/2020',13,12,156);
INSERT INTO venta VALUES (4803,'2340217-3','18567395-2','S005','B','16/09/2020',36,14,504);
INSERT INTO venta VALUES (4804,'43961273-8','14519212-9','S005','A','23/01/2020',35,13,455);
INSERT INTO venta VALUES (4805,'40862490-8','18567395-2','S001','A','18/06/2020',47,13,611);
INSERT INTO venta VALUES (4806,'21906352-0','8402711-1','S004','A','29/10/2021',29,12,348);
INSERT INTO venta VALUES (4807,'3885562-K','6183303-K','S003','B','19/12/2020',19,14,266);
INSERT INTO venta VALUES (4808,'46971708-9','24180587-5','S003','B','25/07/2020',42,12,504);
INSERT INTO venta VALUES (4809,'28816922-5','29374931-0','S001','A','14/01/2021',34,15,510);
INSERT INTO venta VALUES (4810,'24402584-6','24180587-5','S001','B','24/05/2021',10,13,130);
INSERT INTO venta VALUES (4811,'32128153-2','6183303-K','S003','A','13/11/2021',37,14,518);
INSERT INTO venta VALUES (4812,'25427572-7','46566450-9','S004','A','13/04/2020',22,13,286);
INSERT INTO venta VALUES (4813,'21627523-3','32531450-8','S004','A','15/11/2020',35,15,525);
INSERT INTO venta VALUES (4814,'28949956-3','4810357-K','S001','B','20/10/2021',12,13,156);
INSERT INTO venta VALUES (4815,'42395667-4','6183303-K','S005','A','30/06/2021',17,14,238);
INSERT INTO venta VALUES (4816,'41596727-6','45421301-7','S003','A','22/10/2020',25,15,375);
INSERT INTO venta VALUES (4817,'21781255-0','24180587-5','S005','A','10/06/2021',23,14,322);
INSERT INTO venta VALUES (4818,'418771-7','45421301-7','S001','A','17/02/2021',50,14,700);
INSERT INTO venta VALUES (4819,'32733249-K','14315947-7','S001','B','18/03/2021',25,14,350);
INSERT INTO venta VALUES (4820,'33918914-5','14315947-7','S003','B','06/05/2021',16,12,192);
INSERT INTO venta VALUES (4821,'48297406-6','8402711-1','S003','B','20/10/2021',39,12,468);
INSERT INTO venta VALUES (4822,'34857756-5','8402711-1','S001','A','06/06/2020',20,15,300);
INSERT INTO venta VALUES (4823,'45378322-7','32531450-8','S004','B','02/01/2021',43,15,645);
INSERT INTO venta VALUES (4824,'4970818-1','14519212-9','S005','B','09/10/2020',24,15,360);
INSERT INTO venta VALUES (4825,'50659799-4','14519212-9','S002','A','07/10/2021',35,13,455);
INSERT INTO venta VALUES (4826,'5887951-7','14519212-9','S004','A','11/07/2021',49,12,588);
INSERT INTO venta VALUES (4827,'46860748-4','14519212-9','S001','B','23/06/2020',13,14,182);
INSERT INTO venta VALUES (4828,'42362145-1','47232966-9','S005','B','21/09/2020',15,15,225);
INSERT INTO venta VALUES (4829,'11153637-6','42396509-6','S002','A','16/03/2021',43,14,602);
INSERT INTO venta VALUES (4830,'48136294-6','42396509-6','S002','B','22/05/2020',42,12,504);
INSERT INTO venta VALUES (4831,'35509892-3','20237862-5','S004','B','24/06/2020',27,15,405);
INSERT INTO venta VALUES (4832,'4188894-6','32531450-8','S001','B','18/07/2021',38,12,456);
INSERT INTO venta VALUES (4833,'669275-3','4810357-K','S002','A','06/03/2020',45,15,675);
INSERT INTO venta VALUES (4834,'7103400-3','45421301-7','S005','B','10/03/2020',10,14,140);
INSERT INTO venta VALUES (4835,'669939-1','4810357-K','S003','A','25/04/2021',19,15,285);
INSERT INTO venta VALUES (4836,'19746185-3','18567395-2','S001','B','28/05/2021',47,12,564);
INSERT INTO venta VALUES (4837,'44325621-0','23819125-4','S003','B','23/06/2020',46,14,644);
INSERT INTO venta VALUES (4838,'37529936-4','24180587-5','S001','B','08/12/2021',29,14,406);
INSERT INTO venta VALUES (4839,'21566296-9','47232966-9','S001','B','13/04/2021',47,15,705);
INSERT INTO venta VALUES (4840,'24757643-6','20237862-5','S005','B','26/11/2021',32,12,384);
INSERT INTO venta VALUES (4841,'2297775-K','6183303-K','S003','B','16/01/2020',41,15,615);
INSERT INTO venta VALUES (4842,'6812616-9','47232966-9','S001','B','14/07/2020',16,12,192);
INSERT INTO venta VALUES (4843,'40856745-9','20237862-5','S004','A','17/01/2020',39,12,468);
INSERT INTO venta VALUES (4844,'1661689-3','46566450-9','S004','A','02/11/2021',23,15,345);
INSERT INTO venta VALUES (4845,'37678949-7','14315947-7','S001','B','05/01/2021',29,15,435);
INSERT INTO venta VALUES (4846,'4656208-9','18567395-2','S001','A','14/12/2020',33,12,396);
INSERT INTO venta VALUES (4847,'34831845-4','14519212-9','S003','A','20/04/2020',39,15,585);
INSERT INTO venta VALUES (4848,'46492920-7','8402711-1','S004','B','19/03/2021',39,15,585);
INSERT INTO venta VALUES (4849,'16651969-1','47232966-9','S001','B','16/04/2021',48,12,576);
INSERT INTO venta VALUES (4850,'20977585-9','8402711-1','S004','B','11/06/2021',43,15,645);
INSERT INTO venta VALUES (4851,'2332054-1','45421301-7','S002','B','28/03/2021',31,12,372);
INSERT INTO venta VALUES (4852,'35546172-6','24180587-5','S002','B','23/03/2021',20,13,260);
INSERT INTO venta VALUES (4853,'41107182-0','23819125-4','S001','A','28/03/2021',15,12,180);
INSERT INTO venta VALUES (4854,'27507648-1','4810357-K','S002','A','10/01/2020',49,15,735);
INSERT INTO venta VALUES (4855,'4516193-5','18567395-2','S003','B','15/06/2021',11,15,165);
INSERT INTO venta VALUES (4856,'27950903-K','24180587-5','S002','A','02/03/2021',25,15,375);
INSERT INTO venta VALUES (4857,'43178240-5','20237862-5','S001','A','14/11/2021',14,13,182);
INSERT INTO venta VALUES (4858,'2728014-5','24180587-5','S005','A','10/06/2021',35,14,490);
INSERT INTO venta VALUES (4859,'41705665-3','29374931-0','S002','A','13/07/2021',41,14,574);
INSERT INTO venta VALUES (4860,'3420644-9','14315947-7','S003','B','04/03/2020',37,15,555);
INSERT INTO venta VALUES (4861,'30992154-2','6183303-K','S003','B','14/02/2021',30,15,450);
INSERT INTO venta VALUES (4862,'15864421-5','24180587-5','S003','B','18/02/2020',40,15,600);
INSERT INTO venta VALUES (4863,'29993802-6','47232966-9','S005','B','20/07/2020',14,13,182);
INSERT INTO venta VALUES (4864,'16550505-0','18567395-2','S001','B','31/05/2021',16,13,208);
INSERT INTO venta VALUES (4865,'38293936-0','14519212-9','S003','A','03/02/2020',15,12,180);
INSERT INTO venta VALUES (4866,'42457535-6','20237862-5','S003','B','19/08/2021',44,12,528);
INSERT INTO venta VALUES (4867,'29184591-6','8402711-1','S003','A','03/03/2020',35,12,420);
INSERT INTO venta VALUES (4868,'42111192-8','42396509-6','S002','B','20/08/2021',30,15,450);
INSERT INTO venta VALUES (4869,'15820219-0','32531450-8','S005','A','25/06/2021',46,12,552);
INSERT INTO venta VALUES (4870,'44378471-3','29374931-0','S002','B','17/10/2021',17,13,221);
INSERT INTO venta VALUES (4871,'22865149-4','14315947-7','S004','B','24/05/2020',37,14,518);
INSERT INTO venta VALUES (4872,'37616460-8','8402711-1','S003','A','22/09/2021',33,14,462);
INSERT INTO venta VALUES (4873,'3715376-1','47232966-9','S001','B','19/08/2020',48,14,672);
INSERT INTO venta VALUES (4874,'9286910-5','42396509-6','S005','A','23/08/2021',48,14,672);
INSERT INTO venta VALUES (4875,'21532944-5','8402711-1','S001','B','15/06/2020',37,15,555);
INSERT INTO venta VALUES (4876,'36312169-1','8402711-1','S004','A','29/07/2020',28,12,336);
INSERT INTO venta VALUES (4877,'25310777-4','20237862-5','S003','A','15/05/2020',21,12,252);
INSERT INTO venta VALUES (4878,'10214500-3','32531450-8','S004','B','01/03/2021',44,14,616);
INSERT INTO venta VALUES (4879,'38289913-K','14315947-7','S004','A','12/10/2021',24,12,288);
INSERT INTO venta VALUES (4880,'3812560-5','6183303-K','S004','B','20/08/2020',40,12,480);
INSERT INTO venta VALUES (4881,'26529570-3','8402711-1','S003','B','27/10/2020',14,15,210);
INSERT INTO venta VALUES (4882,'8369335-5','32531450-8','S002','B','21/02/2021',38,12,456);
INSERT INTO venta VALUES (4883,'16569116-4','42396509-6','S005','A','29/04/2020',38,13,494);
INSERT INTO venta VALUES (4884,'46708416-K','24180587-5','S003','A','08/07/2020',49,12,588);
INSERT INTO venta VALUES (4885,'23917602-K','14315947-7','S004','B','11/01/2021',35,12,420);
INSERT INTO venta VALUES (4886,'9329970-1','14315947-7','S003','A','22/10/2021',23,12,276);
INSERT INTO venta VALUES (4887,'48260943-0','45421301-7','S004','B','15/02/2020',41,14,574);
INSERT INTO venta VALUES (4888,'10104254-5','8402711-1','S001','B','29/01/2020',46,14,644);
INSERT INTO venta VALUES (4889,'35944113-4','23819125-4','S002','B','24/02/2020',34,14,476);
INSERT INTO venta VALUES (4890,'16222517-0','46566450-9','S005','A','29/04/2020',38,13,494);
INSERT INTO venta VALUES (4891,'2981658-1','18567395-2','S002','B','10/09/2020',41,12,492);
INSERT INTO venta VALUES (4892,'18167520-9','32531450-8','S001','A','30/07/2020',50,14,700);
INSERT INTO venta VALUES (4893,'38707804-5','45421301-7','S004','B','10/09/2020',16,14,224);
INSERT INTO venta VALUES (4894,'34939438-3','46566450-9','S002','A','06/07/2020',46,12,552);
INSERT INTO venta VALUES (4895,'32106584-8','6183303-K','S004','A','14/06/2021',25,15,375);
INSERT INTO venta VALUES (4896,'12887357-0','6183303-K','S005','A','21/05/2021',24,12,288);
INSERT INTO venta VALUES (4897,'6994103-6','14519212-9','S003','B','06/06/2020',42,13,546);
INSERT INTO venta VALUES (4898,'39536781-1','46566450-9','S001','B','08/06/2020',48,12,576);
INSERT INTO venta VALUES (4899,'5113512-1','24180587-5','S001','B','14/02/2021',30,15,450);
INSERT INTO venta VALUES (4900,'8982295-5','47232966-9','S003','A','05/02/2021',50,12,600);
INSERT INTO venta VALUES (4901,'22611724-5','46566450-9','S004','A','05/02/2021',29,15,435);
INSERT INTO venta VALUES (4902,'14509147-0','14519212-9','S001','A','01/05/2021',10,14,140);
INSERT INTO venta VALUES (4903,'21991424-5','14519212-9','S005','B','11/04/2021',49,13,637);
INSERT INTO venta VALUES (4904,'44979297-1','8402711-1','S002','A','21/02/2020',36,14,504);
INSERT INTO venta VALUES (4905,'1987858-9','24180587-5','S001','B','01/01/2020',10,12,120);
INSERT INTO venta VALUES (4906,'7931485-4','32531450-8','S003','A','27/12/2020',45,15,675);
INSERT INTO venta VALUES (4907,'44557542-9','6183303-K','S005','B','02/06/2020',35,15,525);
INSERT INTO venta VALUES (4908,'11229934-3','24180587-5','S001','B','09/04/2021',36,14,504);
INSERT INTO venta VALUES (4909,'45964817-8','42396509-6','S003','B','27/09/2020',10,15,150);
INSERT INTO venta VALUES (4910,'864486-1','45421301-7','S004','B','21/10/2021',35,14,490);
INSERT INTO venta VALUES (4911,'35655499-K','18567395-2','S005','B','16/06/2020',46,13,598);
INSERT INTO venta VALUES (4912,'176096-3','46566450-9','S002','A','11/01/2020',34,12,408);
INSERT INTO venta VALUES (4913,'1686995-3','20237862-5','S005','A','14/09/2020',13,13,169);
INSERT INTO venta VALUES (4914,'8629764-7','8402711-1','S001','B','11/03/2021',33,13,429);
INSERT INTO venta VALUES (4915,'9505134-0','24180587-5','S001','A','24/01/2021',10,13,130);
INSERT INTO venta VALUES (4916,'40165573-5','47232966-9','S001','A','18/06/2020',46,14,644);
INSERT INTO venta VALUES (4917,'30818668-7','47232966-9','S005','B','03/01/2020',48,15,720);
INSERT INTO venta VALUES (4918,'25519598-0','20237862-5','S003','B','19/10/2020',25,13,325);
INSERT INTO venta VALUES (4919,'2682429-K','29374931-0','S004','B','18/10/2020',38,12,456);
INSERT INTO venta VALUES (4920,'2732365-0','14315947-7','S005','A','21/05/2020',47,15,705);
INSERT INTO venta VALUES (4921,'256621-4','42396509-6','S005','B','24/08/2021',36,13,468);
INSERT INTO venta VALUES (4922,'13874392-6','32531450-8','S003','A','17/02/2021',12,13,156);
INSERT INTO venta VALUES (4923,'41681513-5','42396509-6','S003','B','27/09/2021',40,14,560);
INSERT INTO venta VALUES (4924,'36745644-2','20237862-5','S004','A','13/08/2020',15,13,195);
INSERT INTO venta VALUES (4925,'33657353-K','47232966-9','S003','B','29/12/2021',25,14,350);
INSERT INTO venta VALUES (4926,'245375-4','18567395-2','S003','B','01/06/2020',11,15,165);
INSERT INTO venta VALUES (4927,'41513400-2','14315947-7','S003','B','23/07/2021',45,14,630);
INSERT INTO venta VALUES (4928,'36513471-5','32531450-8','S003','A','13/01/2021',45,14,630);
INSERT INTO venta VALUES (4929,'10750875-9','46566450-9','S005','B','06/05/2020',25,14,350);
INSERT INTO venta VALUES (4930,'30415908-1','29374931-0','S003','A','28/11/2020',33,15,495);
INSERT INTO venta VALUES (4931,'3967311-8','14315947-7','S003','B','14/03/2020',20,15,300);
INSERT INTO venta VALUES (4932,'43412697-5','4810357-K','S002','A','06/02/2020',19,12,228);
INSERT INTO venta VALUES (4933,'16275940-K','8402711-1','S001','A','19/02/2020',15,13,195);
INSERT INTO venta VALUES (4934,'2482145-5','14519212-9','S004','B','17/01/2021',35,15,525);
INSERT INTO venta VALUES (4935,'26320512-K','32531450-8','S003','B','22/05/2021',37,14,518);
INSERT INTO venta VALUES (4936,'42404945-K','47232966-9','S002','B','17/10/2021',40,14,560);
INSERT INTO venta VALUES (4937,'7577732-9','20237862-5','S001','B','02/10/2020',38,15,570);
INSERT INTO venta VALUES (4938,'4444931-5','29374931-0','S005','A','08/05/2020',38,13,494);
INSERT INTO venta VALUES (4939,'2421854-6','8402711-1','S001','A','01/10/2021',40,13,520);
INSERT INTO venta VALUES (4940,'3777939-3','32531450-8','S005','A','07/05/2020',21,15,315);
INSERT INTO venta VALUES (4941,'45545183-3','42396509-6','S004','B','20/09/2021',29,14,406);
INSERT INTO venta VALUES (4942,'27212594-5','8402711-1','S005','B','15/12/2021',42,15,630);
INSERT INTO venta VALUES (4943,'40902685-0','4810357-K','S003','A','26/10/2020',46,12,552);
INSERT INTO venta VALUES (4944,'49939348-2','29374931-0','S004','A','11/05/2020',16,13,208);
INSERT INTO venta VALUES (4945,'21839348-9','8402711-1','S005','B','19/02/2021',35,13,455);
INSERT INTO venta VALUES (4946,'4378419-6','29374931-0','S005','B','17/02/2021',28,13,364);
INSERT INTO venta VALUES (4947,'48138947-K','47232966-9','S003','A','04/12/2021',20,12,240);
INSERT INTO venta VALUES (4948,'10649132-1','29374931-0','S005','B','28/02/2021',28,14,392);
INSERT INTO venta VALUES (4949,'43913837-8','14315947-7','S004','A','21/02/2020',37,13,481);
INSERT INTO venta VALUES (4950,'3549109-0','20237862-5','S005','A','07/06/2020',31,14,434);
INSERT INTO venta VALUES (4951,'6160902-4','42396509-6','S003','B','09/04/2020',46,15,690);
INSERT INTO venta VALUES (4952,'45835937-7','8402711-1','S003','B','22/05/2020',28,12,336);
INSERT INTO venta VALUES (4953,'29293421-1','42396509-6','S004','A','16/05/2021',13,14,182);
INSERT INTO venta VALUES (4954,'24379280-0','42396509-6','S004','B','30/08/2021',23,12,276);
INSERT INTO venta VALUES (4955,'7702244-9','18567395-2','S001','B','13/09/2020',30,14,420);
INSERT INTO venta VALUES (4956,'25882590-K','29374931-0','S005','A','05/11/2021',19,12,228);
INSERT INTO venta VALUES (4957,'27956426-K','14519212-9','S003','B','29/01/2021',27,12,324);
INSERT INTO venta VALUES (4958,'13210287-2','20237862-5','S004','A','22/12/2020',26,15,390);
INSERT INTO venta VALUES (4959,'33517217-5','14315947-7','S005','A','24/01/2021',28,15,420);
INSERT INTO venta VALUES (4960,'40459148-7','14519212-9','S001','B','30/12/2020',27,15,405);
INSERT INTO venta VALUES (4961,'1196676-4','18567395-2','S004','B','24/05/2020',41,13,533);
INSERT INTO venta VALUES (4962,'9573685-8','4810357-K','S002','A','18/03/2021',13,15,195);
INSERT INTO venta VALUES (4963,'24537304-K','47232966-9','S001','B','08/01/2021',18,13,234);
INSERT INTO venta VALUES (4964,'32320468-3','8402711-1','S004','B','27/03/2020',34,14,476);
INSERT INTO venta VALUES (4965,'41674397-5','47232966-9','S005','B','02/03/2021',22,15,330);
INSERT INTO venta VALUES (4966,'14674421-4','6183303-K','S005','B','21/06/2020',28,15,420);
INSERT INTO venta VALUES (4967,'40351220-6','32531450-8','S001','A','11/01/2021',19,12,228);
INSERT INTO venta VALUES (4968,'34970231-2','24180587-5','S003','A','05/08/2020',10,14,140);
INSERT INTO venta VALUES (4969,'39278148-K','14519212-9','S001','A','28/03/2020',28,13,364);
INSERT INTO venta VALUES (4970,'49823112-8','4810357-K','S003','B','12/08/2020',33,14,462);
INSERT INTO venta VALUES (4971,'27343927-7','42396509-6','S004','B','17/06/2020',15,12,180);
INSERT INTO venta VALUES (4972,'14149168-7','14315947-7','S004','B','14/09/2020',36,15,540);
INSERT INTO venta VALUES (4973,'19117724-K','6183303-K','S002','A','16/04/2020',47,13,611);
INSERT INTO venta VALUES (4974,'10709505-5','32531450-8','S002','A','15/10/2020',39,12,468);
INSERT INTO venta VALUES (4975,'15691151-8','45421301-7','S004','A','12/08/2020',39,14,546);
INSERT INTO venta VALUES (4976,'38877215-8','18567395-2','S005','B','17/08/2020',33,13,429);
INSERT INTO venta VALUES (4977,'49134102-5','8402711-1','S004','A','15/10/2020',26,12,312);
INSERT INTO venta VALUES (4978,'30430573-8','14315947-7','S003','A','20/08/2020',42,13,546);
INSERT INTO venta VALUES (4979,'19893406-2','47232966-9','S005','B','28/12/2020',34,15,510);
INSERT INTO venta VALUES (4980,'724989-6','18567395-2','S002','A','26/01/2021',41,15,615);
INSERT INTO venta VALUES (4981,'790614-5','47232966-9','S005','B','28/12/2020',47,15,705);
INSERT INTO venta VALUES (4982,'42369767-9','47232966-9','S001','A','17/01/2020',24,12,288);
INSERT INTO venta VALUES (4983,'26379741-8','29374931-0','S002','A','11/12/2020',13,12,156);
INSERT INTO venta VALUES (4984,'19520297-4','47232966-9','S003','A','21/05/2020',18,15,270);
INSERT INTO venta VALUES (4985,'20998996-4','47232966-9','S004','B','22/12/2020',42,13,546);
INSERT INTO venta VALUES (4986,'10121991-7','14315947-7','S001','A','15/04/2021',40,15,600);
INSERT INTO venta VALUES (4987,'24895662-3','47232966-9','S004','B','24/05/2021',26,13,338);
INSERT INTO venta VALUES (4988,'10765522-0','14315947-7','S001','A','17/10/2021',34,15,510);
INSERT INTO venta VALUES (4989,'28103249-6','42396509-6','S001','B','31/10/2020',44,14,616);
INSERT INTO venta VALUES (4990,'24175660-2','23819125-4','S004','B','16/06/2021',20,14,280);
INSERT INTO venta VALUES (4991,'20576710-K','47232966-9','S004','A','07/10/2021',19,15,285);
INSERT INTO venta VALUES (4992,'24468150-6','23819125-4','S002','A','22/08/2020',38,14,532);
INSERT INTO venta VALUES (4993,'41833703-6','45421301-7','S003','B','02/12/2021',32,13,416);
INSERT INTO venta VALUES (4994,'205647-K','14315947-7','S002','B','13/06/2020',44,14,616);
INSERT INTO venta VALUES (4995,'50965225-2','29374931-0','S002','A','27/08/2020',32,14,448);
INSERT INTO venta VALUES (4996,'2527416-4','46566450-9','S002','B','28/10/2020',32,15,480);
INSERT INTO venta VALUES (4997,'29500462-2','29374931-0','S001','A','04/11/2020',37,12,444);
INSERT INTO venta VALUES (4998,'46825615-0','20237862-5','S002','A','14/08/2020',28,12,336);
INSERT INTO venta VALUES (4999,'1838211-3','18567395-2','S005','A','12/03/2020',24,12,288);
INSERT INTO venta VALUES (5000,'35515377-0','14519212-9','S002','A','30/03/2021',39,12,468);
INSERT INTO venta VALUES (5001,'18913941-1','45421301-7','S005','A','12/11/2021',25,12,300);
INSERT INTO venta VALUES (5002,'1095696-K','14315947-7','S002','B','01/03/2020',18,13,234);
INSERT INTO venta VALUES (5003,'10419998-4','46566450-9','S005','A','14/09/2020',30,15,450);
INSERT INTO venta VALUES (5004,'50835664-1','46566450-9','S002','B','24/09/2021',37,12,444);
INSERT INTO venta VALUES (5005,'44655877-3','47232966-9','S003','B','17/10/2021',32,14,448);
INSERT INTO venta VALUES (5006,'49922954-2','29374931-0','S005','A','13/11/2021',12,14,168);
INSERT INTO venta VALUES (5007,'4527408-K','24180587-5','S004','B','07/11/2021',44,14,616);
INSERT INTO venta VALUES (5008,'37587173-4','14519212-9','S004','A','28/01/2020',28,12,336);
INSERT INTO venta VALUES (5009,'4589677-3','24180587-5','S005','B','22/03/2021',27,15,405);
INSERT INTO venta VALUES (5010,'611135-1','29374931-0','S004','B','28/12/2020',23,14,322);
INSERT INTO venta VALUES (5011,'48755443-K','32531450-8','S002','B','30/07/2020',27,12,324);
INSERT INTO venta VALUES (5012,'6878784-K','29374931-0','S001','B','01/06/2020',12,13,156);
INSERT INTO venta VALUES (5013,'20907959-3','20237862-5','S003','B','02/02/2021',38,15,570);
INSERT INTO venta VALUES (5014,'6998668-4','6183303-K','S004','A','23/02/2020',20,15,300);
INSERT INTO venta VALUES (5015,'20555137-9','23819125-4','S004','A','24/08/2020',45,14,630);
INSERT INTO venta VALUES (5016,'43204253-7','18567395-2','S002','A','31/08/2021',17,15,255);
INSERT INTO venta VALUES (5017,'1512309-5','8402711-1','S003','B','19/05/2021',20,12,240);
INSERT INTO venta VALUES (5018,'32578191-2','4810357-K','S003','B','01/03/2020',12,15,180);
INSERT INTO venta VALUES (5019,'28733425-7','14519212-9','S005','A','26/07/2020',21,14,294);
INSERT INTO venta VALUES (5020,'4745875-7','32531450-8','S004','A','15/10/2021',33,13,429);
INSERT INTO venta VALUES (5021,'47172761-K','32531450-8','S005','A','10/11/2021',49,15,735);
INSERT INTO venta VALUES (5022,'11192584-4','18567395-2','S004','B','05/01/2021',48,13,624);
INSERT INTO venta VALUES (5023,'1922374-4','24180587-5','S005','A','11/10/2020',48,14,672);
INSERT INTO venta VALUES (5024,'39789419-3','14519212-9','S001','B','02/07/2020',31,12,372);
INSERT INTO venta VALUES (5025,'22707262-8','29374931-0','S004','B','06/03/2020',24,13,312);
INSERT INTO venta VALUES (5026,'7748411-6','23819125-4','S004','A','14/04/2021',27,15,405);
INSERT INTO venta VALUES (5027,'23967909-9','47232966-9','S005','A','26/01/2021',35,15,525);
INSERT INTO venta VALUES (5028,'39207112-1','14315947-7','S005','B','27/12/2020',40,15,600);
INSERT INTO venta VALUES (5029,'32714245-3','6183303-K','S001','B','12/04/2021',15,12,180);
INSERT INTO venta VALUES (5030,'8642552-1','14315947-7','S001','A','01/05/2021',19,15,285);
INSERT INTO venta VALUES (5031,'847138-K','24180587-5','S002','A','15/03/2020',24,15,360);
INSERT INTO venta VALUES (5032,'29108509-1','32531450-8','S002','B','25/10/2020',32,13,416);
INSERT INTO venta VALUES (5033,'45577353-9','6183303-K','S005','B','25/09/2020',50,13,650);
INSERT INTO venta VALUES (5034,'23842338-4','4810357-K','S004','B','14/08/2020',30,14,420);
INSERT INTO venta VALUES (5035,'40754325-4','47232966-9','S003','B','04/08/2020',12,13,156);
INSERT INTO venta VALUES (5036,'33302996-0','45421301-7','S001','B','14/12/2021',39,15,585);
INSERT INTO venta VALUES (5037,'12196402-3','14519212-9','S002','A','27/09/2021',49,14,686);
INSERT INTO venta VALUES (5038,'49612724-2','46566450-9','S004','B','27/04/2020',11,13,143);
INSERT INTO venta VALUES (5039,'28794269-9','46566450-9','S002','B','28/01/2021',44,14,616);
INSERT INTO venta VALUES (5040,'34739197-2','46566450-9','S004','B','30/04/2021',14,15,210);
INSERT INTO venta VALUES (5041,'15982981-2','24180587-5','S004','B','02/01/2020',35,12,420);
INSERT INTO venta VALUES (5042,'30980326-4','18567395-2','S003','A','14/11/2021',28,13,364);
INSERT INTO venta VALUES (5043,'46386662-7','32531450-8','S001','B','21/08/2020',19,14,266);
INSERT INTO venta VALUES (5044,'4037232-6','45421301-7','S004','B','11/04/2020',21,15,315);
INSERT INTO venta VALUES (5045,'2462890-6','46566450-9','S001','B','01/02/2020',19,13,247);
INSERT INTO venta VALUES (5046,'8163642-7','46566450-9','S003','B','14/11/2020',31,15,465);
INSERT INTO venta VALUES (5047,'26200138-5','6183303-K','S003','B','25/07/2020',31,15,465);
INSERT INTO venta VALUES (5048,'28782909-4','42396509-6','S001','B','28/06/2020',13,14,182);
INSERT INTO venta VALUES (5049,'12276939-9','47232966-9','S002','A','02/02/2020',39,12,468);
INSERT INTO venta VALUES (5050,'47909126-9','20237862-5','S003','A','22/02/2020',31,15,465);
INSERT INTO venta VALUES (5051,'44654639-2','6183303-K','S005','B','20/09/2021',16,14,224);
INSERT INTO venta VALUES (5052,'1612370-6','18567395-2','S005','A','08/01/2021',41,12,492);
INSERT INTO venta VALUES (5053,'8105945-4','6183303-K','S001','B','05/05/2021',49,15,735);
INSERT INTO venta VALUES (5054,'45525237-7','23819125-4','S003','A','29/01/2021',30,14,420);
INSERT INTO venta VALUES (5055,'41135440-7','45421301-7','S002','A','28/12/2020',22,13,286);
INSERT INTO venta VALUES (5056,'11166180-4','18567395-2','S002','B','19/11/2020',39,14,546);
INSERT INTO venta VALUES (5057,'31461243-4','45421301-7','S004','A','24/01/2021',39,13,507);
INSERT INTO venta VALUES (5058,'9870337-3','45421301-7','S004','B','02/03/2020',37,14,518);
INSERT INTO venta VALUES (5059,'10705178-3','14519212-9','S005','B','24/09/2020',15,15,225);
INSERT INTO venta VALUES (5060,'16840781-5','14315947-7','S003','A','07/04/2021',42,14,588);
INSERT INTO venta VALUES (5061,'46552725-0','4810357-K','S002','A','21/03/2021',23,14,322);
INSERT INTO venta VALUES (5062,'33545941-5','4810357-K','S002','B','29/01/2021',48,15,720);
INSERT INTO venta VALUES (5063,'35352332-5','47232966-9','S004','A','25/08/2021',21,15,315);
INSERT INTO venta VALUES (5064,'4930499-4','24180587-5','S004','B','24/05/2021',40,12,480);
INSERT INTO venta VALUES (5065,'3697461-3','29374931-0','S001','B','10/12/2020',11,15,165);
INSERT INTO venta VALUES (5066,'43815173-7','29374931-0','S002','B','21/02/2021',28,13,364);
INSERT INTO venta VALUES (5067,'1689974-7','6183303-K','S003','A','29/06/2021',31,15,465);
INSERT INTO venta VALUES (5068,'29948396-7','45421301-7','S003','A','14/01/2020',30,13,390);
INSERT INTO venta VALUES (5069,'23351141-2','46566450-9','S005','A','14/12/2021',49,12,588);
INSERT INTO venta VALUES (5070,'36797208-4','4810357-K','S001','B','29/10/2021',16,12,192);
INSERT INTO venta VALUES (5071,'2293780-4','46566450-9','S001','B','24/08/2021',48,13,624);
INSERT INTO venta VALUES (5072,'38623758-1','23819125-4','S004','B','12/08/2021',23,13,299);
INSERT INTO venta VALUES (5073,'16179698-0','23819125-4','S005','A','22/03/2020',26,12,312);
INSERT INTO venta VALUES (5074,'25172614-0','29374931-0','S002','A','05/12/2021',41,14,574);
INSERT INTO venta VALUES (5075,'426881-4','20237862-5','S001','B','01/06/2021',46,13,598);
INSERT INTO venta VALUES (5076,'45192223-8','14315947-7','S005','A','28/10/2020',37,14,518);
INSERT INTO venta VALUES (5077,'14163133-0','8402711-1','S004','A','28/03/2021',48,13,624);
INSERT INTO venta VALUES (5078,'28420167-1','47232966-9','S004','A','21/01/2021',10,15,150);
INSERT INTO venta VALUES (5079,'720495-7','6183303-K','S002','B','31/05/2020',35,13,455);
INSERT INTO venta VALUES (5080,'364159-7','14519212-9','S004','A','27/04/2021',25,14,350);
INSERT INTO venta VALUES (5081,'3241083-9','24180587-5','S003','A','28/05/2021',20,13,260);
INSERT INTO venta VALUES (5082,'14162886-0','20237862-5','S002','A','27/04/2020',47,14,658);
INSERT INTO venta VALUES (5083,'33328328-K','4810357-K','S005','A','20/08/2021',42,13,546);
INSERT INTO venta VALUES (5084,'43209574-6','32531450-8','S005','B','23/02/2021',26,12,312);
INSERT INTO venta VALUES (5085,'246815-8','6183303-K','S004','A','24/01/2020',26,12,312);
INSERT INTO venta VALUES (5086,'27941194-3','20237862-5','S005','A','24/08/2021',10,15,150);
INSERT INTO venta VALUES (5087,'6665225-4','24180587-5','S001','A','23/08/2021',48,12,576);
INSERT INTO venta VALUES (5088,'33841927-9','32531450-8','S003','B','24/02/2020',13,13,169);
INSERT INTO venta VALUES (5089,'6401770-5','24180587-5','S002','B','25/05/2020',11,12,132);
INSERT INTO venta VALUES (5090,'14497734-3','20237862-5','S002','B','16/05/2021',33,15,495);
INSERT INTO venta VALUES (5091,'35155993-4','14519212-9','S002','A','18/01/2021',28,14,392);
INSERT INTO venta VALUES (5092,'16965943-5','47232966-9','S002','A','12/05/2021',11,12,132);
INSERT INTO venta VALUES (5093,'2120746-2','14315947-7','S001','B','18/12/2020',17,12,204);
INSERT INTO venta VALUES (5094,'34366568-7','4810357-K','S001','A','08/08/2021',25,14,350);
INSERT INTO venta VALUES (5095,'1933962-9','32531450-8','S002','A','19/02/2021',29,13,377);
INSERT INTO venta VALUES (5096,'39511720-3','8402711-1','S004','B','20/02/2020',47,13,611);
INSERT INTO venta VALUES (5097,'24316748-5','8402711-1','S001','A','22/02/2021',38,13,494);
INSERT INTO venta VALUES (5098,'38440632-7','8402711-1','S004','A','04/10/2021',38,15,570);
INSERT INTO venta VALUES (5099,'44982560-8','14315947-7','S002','B','12/05/2020',10,14,140);
INSERT INTO venta VALUES (5100,'49795706-0','45421301-7','S001','A','05/09/2020',12,15,180);
INSERT INTO venta VALUES (5101,'33463151-6','6183303-K','S003','A','08/09/2021',48,12,576);
INSERT INTO venta VALUES (5102,'33128333-9','29374931-0','S005','B','17/02/2021',49,15,735);
INSERT INTO venta VALUES (5103,'23816992-5','32531450-8','S003','A','23/07/2020',26,14,364);
INSERT INTO venta VALUES (5104,'45142372-K','14519212-9','S005','A','30/09/2021',48,14,672);
INSERT INTO venta VALUES (5105,'369736-3','29374931-0','S003','A','14/05/2021',50,14,700);
INSERT INTO venta VALUES (5106,'1268299-9','32531450-8','S002','A','16/12/2021',22,14,308);
INSERT INTO venta VALUES (5107,'9945408-3','42396509-6','S004','A','17/12/2020',40,15,600);
INSERT INTO venta VALUES (5108,'386825-7','14519212-9','S001','A','02/11/2021',43,15,645);
INSERT INTO venta VALUES (5109,'24220548-0','14519212-9','S004','B','22/05/2021',14,14,196);
INSERT INTO venta VALUES (5110,'4036038-7','45421301-7','S005','B','09/03/2020',40,12,480);
INSERT INTO venta VALUES (5111,'37704108-9','6183303-K','S005','A','27/06/2020',46,13,598);
INSERT INTO venta VALUES (5112,'5654281-7','18567395-2','S005','A','27/04/2020',22,14,308);
INSERT INTO venta VALUES (5113,'15710335-0','24180587-5','S005','B','01/08/2020',37,12,444);
INSERT INTO venta VALUES (5114,'43110454-7','18567395-2','S002','A','14/12/2020',32,14,448);
INSERT INTO venta VALUES (5115,'13339546-6','47232966-9','S002','B','23/02/2021',17,15,255);
INSERT INTO venta VALUES (5116,'6147613-K','14315947-7','S005','B','15/09/2021',46,15,690);
INSERT INTO venta VALUES (5117,'3833312-7','24180587-5','S001','A','23/10/2021',27,14,378);
INSERT INTO venta VALUES (5118,'25179379-4','4810357-K','S005','B','16/03/2020',29,12,348);
INSERT INTO venta VALUES (5119,'4492377-7','6183303-K','S003','B','14/04/2020',26,12,312);
INSERT INTO venta VALUES (5120,'20551757-K','23819125-4','S004','A','04/10/2021',28,15,420);
INSERT INTO venta VALUES (5121,'34526835-9','18567395-2','S002','A','01/09/2020',46,13,598);
INSERT INTO venta VALUES (5122,'25448994-8','8402711-1','S005','B','20/07/2020',16,13,208);
INSERT INTO venta VALUES (5123,'10424274-K','47232966-9','S004','A','10/09/2021',44,12,528);
INSERT INTO venta VALUES (5124,'43736897-K','23819125-4','S004','A','09/03/2020',35,15,525);
INSERT INTO venta VALUES (5125,'34361740-2','4810357-K','S002','B','01/11/2021',27,14,378);
INSERT INTO venta VALUES (5126,'46546512-3','47232966-9','S005','B','12/06/2021',39,12,468);
INSERT INTO venta VALUES (5127,'22722668-4','47232966-9','S001','A','03/07/2020',15,14,210);
INSERT INTO venta VALUES (5128,'48615642-2','20237862-5','S001','A','03/12/2020',43,15,645);
INSERT INTO venta VALUES (5129,'36132951-1','20237862-5','S001','B','11/12/2021',27,14,378);
INSERT INTO venta VALUES (5130,'39145164-8','6183303-K','S002','B','24/06/2020',36,12,432);
INSERT INTO venta VALUES (5131,'305766-6','24180587-5','S002','A','02/08/2020',23,13,299);
INSERT INTO venta VALUES (5132,'43893820-6','6183303-K','S001','A','06/11/2021',46,14,644);
INSERT INTO venta VALUES (5133,'34152442-3','6183303-K','S005','A','03/02/2020',36,13,468);
INSERT INTO venta VALUES (5134,'48341370-K','45421301-7','S003','A','03/02/2021',43,14,602);
INSERT INTO venta VALUES (5135,'26317503-4','45421301-7','S004','A','21/01/2021',44,12,528);
INSERT INTO venta VALUES (5136,'25597469-6','20237862-5','S005','B','20/04/2021',11,13,143);
INSERT INTO venta VALUES (5137,'46976530-K','45421301-7','S004','A','14/11/2020',45,15,675);
INSERT INTO venta VALUES (5138,'31808477-7','45421301-7','S002','B','10/06/2021',27,12,324);
INSERT INTO venta VALUES (5139,'28242182-8','46566450-9','S003','A','15/08/2020',30,12,360);
INSERT INTO venta VALUES (5140,'342047-7','14315947-7','S005','B','17/02/2021',12,15,180);
INSERT INTO venta VALUES (5141,'14150943-8','6183303-K','S004','A','25/07/2021',37,14,518);
INSERT INTO venta VALUES (5142,'45323436-3','18567395-2','S002','A','24/04/2020',39,12,468);
INSERT INTO venta VALUES (5143,'46553638-1','20237862-5','S001','B','27/04/2021',24,14,336);
INSERT INTO venta VALUES (5144,'19378275-2','29374931-0','S003','A','13/10/2021',23,14,322);
INSERT INTO venta VALUES (5145,'35533549-6','8402711-1','S001','A','11/01/2021',39,14,546);
INSERT INTO venta VALUES (5146,'28250909-1','6183303-K','S004','B','22/03/2020',43,14,602);
INSERT INTO venta VALUES (5147,'42744116-4','24180587-5','S003','B','08/07/2020',18,12,216);
INSERT INTO venta VALUES (5148,'21557436-9','4810357-K','S001','A','29/05/2020',48,15,720);
INSERT INTO venta VALUES (5149,'50978449-3','6183303-K','S001','A','28/07/2020',20,15,300);
INSERT INTO venta VALUES (5150,'15640826-3','42396509-6','S002','B','26/01/2021',11,12,132);
INSERT INTO venta VALUES (5151,'35436183-3','20237862-5','S001','B','24/04/2020',49,13,637);
INSERT INTO venta VALUES (5152,'2633712-7','14315947-7','S003','B','26/07/2020',45,13,585);
INSERT INTO venta VALUES (5153,'13474161-9','14519212-9','S003','B','05/10/2021',31,15,465);
INSERT INTO venta VALUES (5154,'43729137-3','45421301-7','S003','A','03/10/2020',19,13,247);
INSERT INTO venta VALUES (5155,'42548544-K','29374931-0','S004','B','06/08/2021',16,14,224);
INSERT INTO venta VALUES (5156,'18864846-0','8402711-1','S002','A','04/06/2021',24,15,360);
INSERT INTO venta VALUES (5157,'11620250-6','23819125-4','S002','B','23/06/2021',48,13,624);
INSERT INTO venta VALUES (5158,'6250910-4','14315947-7','S001','B','01/01/2020',14,12,168);
INSERT INTO venta VALUES (5159,'19356403-8','18567395-2','S003','A','20/01/2020',42,13,546);
INSERT INTO venta VALUES (5160,'21311175-2','42396509-6','S004','A','12/06/2020',46,14,644);
INSERT INTO venta VALUES (5161,'40843415-7','47232966-9','S005','B','11/09/2021',47,13,611);
INSERT INTO venta VALUES (5162,'3825995-4','47232966-9','S003','B','05/03/2020',19,12,228);
INSERT INTO venta VALUES (5163,'22980867-2','8402711-1','S002','A','19/02/2020',32,12,384);
INSERT INTO venta VALUES (5164,'33366831-9','4810357-K','S005','B','14/02/2021',42,15,630);
INSERT INTO venta VALUES (5165,'16470769-5','47232966-9','S004','A','03/03/2021',18,13,234);
INSERT INTO venta VALUES (5166,'86158-8','8402711-1','S002','B','13/01/2021',40,12,480);
INSERT INTO venta VALUES (5167,'19639414-1','32531450-8','S005','B','22/11/2020',33,14,462);
INSERT INTO venta VALUES (5168,'2796251-3','42396509-6','S004','A','14/01/2021',24,12,288);
INSERT INTO venta VALUES (5169,'36211261-3','6183303-K','S001','A','20/01/2020',22,13,286);
INSERT INTO venta VALUES (5170,'35311901-K','32531450-8','S002','B','02/09/2020',17,15,255);
INSERT INTO venta VALUES (5171,'26120343-K','42396509-6','S001','B','05/04/2020',35,13,455);
INSERT INTO venta VALUES (5172,'19191338-8','4810357-K','S002','A','20/12/2021',25,15,375);
INSERT INTO venta VALUES (5173,'1768237-7','20237862-5','S002','A','17/01/2021',30,14,420);
INSERT INTO venta VALUES (5174,'11980759-K','45421301-7','S003','B','02/09/2020',49,14,686);
INSERT INTO venta VALUES (5175,'40624333-8','6183303-K','S002','A','06/11/2020',28,14,392);
INSERT INTO venta VALUES (5176,'36102291-2','8402711-1','S004','B','10/02/2020',18,15,270);
INSERT INTO venta VALUES (5177,'45960155-4','23819125-4','S001','A','22/06/2021',10,13,130);
INSERT INTO venta VALUES (5178,'23596840-1','4810357-K','S003','A','31/01/2020',31,14,434);
INSERT INTO venta VALUES (5179,'23819924-7','4810357-K','S005','A','03/06/2020',49,13,637);
INSERT INTO venta VALUES (5180,'47697102-0','47232966-9','S003','A','10/05/2020',45,14,630);
INSERT INTO venta VALUES (5181,'48975492-4','8402711-1','S004','A','11/09/2020',21,15,315);
INSERT INTO venta VALUES (5182,'37888323-7','29374931-0','S005','B','25/09/2020',14,15,210);
INSERT INTO venta VALUES (5183,'31503767-0','14315947-7','S002','B','17/11/2021',10,15,150);
INSERT INTO venta VALUES (5184,'41605481-9','4810357-K','S002','B','23/11/2021',41,14,574);
INSERT INTO venta VALUES (5185,'35228448-3','6183303-K','S002','B','08/01/2020',19,13,247);
INSERT INTO venta VALUES (5186,'20805704-9','4810357-K','S005','B','26/04/2021',40,15,600);
INSERT INTO venta VALUES (5187,'49121246-2','8402711-1','S004','A','12/11/2020',46,14,644);
INSERT INTO venta VALUES (5188,'39673512-1','47232966-9','S002','A','17/05/2020',32,15,480);
INSERT INTO venta VALUES (5189,'1015653-K','6183303-K','S003','B','14/05/2021',17,15,255);
INSERT INTO venta VALUES (5190,'34465278-3','46566450-9','S004','A','24/04/2021',18,12,216);
INSERT INTO venta VALUES (5191,'38237114-3','32531450-8','S002','B','19/09/2020',13,13,169);
INSERT INTO venta VALUES (5192,'10651656-1','47232966-9','S003','A','04/08/2020',50,14,700);
INSERT INTO venta VALUES (5193,'26706928-K','29374931-0','S001','B','27/09/2020',11,12,132);
INSERT INTO venta VALUES (5194,'46993880-8','8402711-1','S005','B','11/05/2020',22,13,286);
INSERT INTO venta VALUES (5195,'49783544-5','29374931-0','S005','A','06/02/2021',42,15,630);
INSERT INTO venta VALUES (5196,'2066833-4','20237862-5','S004','B','26/08/2021',13,13,169);
INSERT INTO venta VALUES (5197,'47171902-1','14315947-7','S004','B','27/05/2021',12,12,144);
INSERT INTO venta VALUES (5198,'18134333-8','45421301-7','S005','A','25/06/2020',38,14,532);
INSERT INTO venta VALUES (5199,'3222879-8','23819125-4','S001','A','14/02/2020',17,12,204);
INSERT INTO venta VALUES (5200,'1855259-0','47232966-9','S004','B','29/11/2021',17,12,204);
INSERT INTO venta VALUES (5201,'46775870-5','29374931-0','S001','A','18/10/2020',14,12,168);
INSERT INTO venta VALUES (5202,'35463207-1','32531450-8','S003','A','15/03/2020',39,13,507);
INSERT INTO venta VALUES (5203,'970371-3','46566450-9','S004','B','30/08/2021',11,14,154);
INSERT INTO venta VALUES (5204,'691195-1','6183303-K','S005','A','17/07/2021',45,14,630);
INSERT INTO venta VALUES (5205,'26887293-0','46566450-9','S001','B','17/06/2020',16,15,240);
INSERT INTO venta VALUES (5206,'17118761-3','46566450-9','S004','A','29/08/2021',16,12,192);
INSERT INTO venta VALUES (5207,'45770281-7','32531450-8','S003','B','29/09/2021',18,15,270);
INSERT INTO venta VALUES (5208,'14755482-6','6183303-K','S003','B','11/12/2021',48,14,672);
INSERT INTO venta VALUES (5209,'41267841-9','4810357-K','S002','A','20/10/2021',46,12,552);
INSERT INTO venta VALUES (5210,'18185886-9','14315947-7','S002','B','23/09/2021',42,13,546);
INSERT INTO venta VALUES (5211,'9992935-9','24180587-5','S005','A','24/08/2020',19,13,247);
INSERT INTO venta VALUES (5212,'5251167-4','4810357-K','S001','A','29/03/2021',15,15,225);
INSERT INTO venta VALUES (5213,'17477296-7','29374931-0','S001','A','16/08/2021',38,12,456);
INSERT INTO venta VALUES (5214,'7502546-7','46566450-9','S005','A','20/11/2021',15,15,225);
INSERT INTO venta VALUES (5215,'31155273-2','6183303-K','S004','B','18/10/2020',15,12,180);
INSERT INTO venta VALUES (5216,'28348198-0','14315947-7','S004','A','18/12/2020',11,14,154);
INSERT INTO venta VALUES (5217,'41758307-6','46566450-9','S002','A','27/11/2020',27,13,351);
INSERT INTO venta VALUES (5218,'12239734-3','18567395-2','S003','B','05/01/2021',36,14,504);
INSERT INTO venta VALUES (5219,'41193247-8','29374931-0','S002','A','26/07/2020',12,12,144);
INSERT INTO venta VALUES (5220,'1510379-5','14519212-9','S001','A','01/04/2020',31,15,465);
INSERT INTO venta VALUES (5221,'13571851-3','14315947-7','S003','A','01/07/2020',24,15,360);
INSERT INTO venta VALUES (5222,'30742999-3','6183303-K','S004','B','23/08/2021',37,14,518);
INSERT INTO venta VALUES (5223,'46135570-6','6183303-K','S002','B','06/10/2020',44,15,660);
INSERT INTO venta VALUES (5224,'23559841-8','42396509-6','S001','A','05/06/2021',26,13,338);
INSERT INTO venta VALUES (5225,'15218526-K','46566450-9','S001','A','26/01/2021',14,15,210);
INSERT INTO venta VALUES (5226,'25986530-1','29374931-0','S001','B','26/09/2020',20,14,280);
INSERT INTO venta VALUES (5227,'3890733-6','47232966-9','S001','B','17/08/2021',38,13,494);
INSERT INTO venta VALUES (5228,'28865301-1','24180587-5','S001','B','22/12/2021',23,15,345);
INSERT INTO venta VALUES (5229,'36541675-3','46566450-9','S002','B','05/10/2020',12,14,168);
INSERT INTO venta VALUES (5230,'7354658-3','4810357-K','S003','B','23/11/2021',24,13,312);
INSERT INTO venta VALUES (5231,'27591445-2','4810357-K','S001','A','11/11/2021',42,12,504);
INSERT INTO venta VALUES (5232,'23194182-7','42396509-6','S004','B','12/10/2021',34,12,408);
INSERT INTO venta VALUES (5233,'48356856-8','14315947-7','S001','B','29/09/2021',49,15,735);
INSERT INTO venta VALUES (5234,'2757277-4','23819125-4','S001','A','01/02/2021',49,12,588);
INSERT INTO venta VALUES (5235,'18448185-5','18567395-2','S001','A','17/08/2021',28,13,364);
INSERT INTO venta VALUES (5236,'326751-2','20237862-5','S004','B','15/03/2020',14,13,182);
INSERT INTO venta VALUES (5237,'22717906-6','6183303-K','S005','B','25/09/2020',18,13,234);
INSERT INTO venta VALUES (5238,'4619802-6','8402711-1','S003','A','29/09/2021',10,13,130);
INSERT INTO venta VALUES (5239,'16635321-1','46566450-9','S004','B','30/10/2020',36,14,504);
INSERT INTO venta VALUES (5240,'35453366-9','23819125-4','S003','A','08/10/2021',39,15,585);
INSERT INTO venta VALUES (5241,'19543982-6','4810357-K','S001','B','09/04/2021',46,15,690);
INSERT INTO venta VALUES (5242,'35892890-0','46566450-9','S003','B','25/01/2020',27,13,351);
INSERT INTO venta VALUES (5243,'45765540-1','14519212-9','S002','A','19/05/2020',40,14,560);
INSERT INTO venta VALUES (5244,'14117560-2','47232966-9','S003','A','18/01/2020',32,13,416);
INSERT INTO venta VALUES (5245,'16237465-6','20237862-5','S005','B','11/11/2020',21,13,273);
INSERT INTO venta VALUES (5246,'7273625-7','18567395-2','S003','A','17/05/2021',18,14,252);
INSERT INTO venta VALUES (5247,'12795986-2','14315947-7','S001','A','19/03/2020',14,14,196);
INSERT INTO venta VALUES (5248,'19310175-5','29374931-0','S004','A','13/04/2021',44,14,616);
INSERT INTO venta VALUES (5249,'13488196-8','8402711-1','S005','B','09/06/2021',17,15,255);
INSERT INTO venta VALUES (5250,'869272-6','6183303-K','S002','B','02/09/2021',39,12,468);
INSERT INTO venta VALUES (5251,'29869777-7','42396509-6','S002','B','30/01/2020',47,14,658);
INSERT INTO venta VALUES (5252,'21557577-2','18567395-2','S004','A','26/10/2021',29,13,377);
INSERT INTO venta VALUES (5253,'34235492-0','46566450-9','S004','A','18/06/2021',46,12,552);
INSERT INTO venta VALUES (5254,'48956344-4','18567395-2','S004','B','02/08/2020',47,13,611);
INSERT INTO venta VALUES (5255,'36420662-3','45421301-7','S001','A','18/12/2020',16,12,192);
INSERT INTO venta VALUES (5256,'27202724-2','42396509-6','S004','A','23/01/2021',22,13,286);
INSERT INTO venta VALUES (5257,'22479279-4','4810357-K','S005','A','17/11/2020',12,13,156);
INSERT INTO venta VALUES (5258,'13136212-9','8402711-1','S003','B','29/05/2020',16,15,240);
INSERT INTO venta VALUES (5259,'13661914-4','6183303-K','S005','B','17/11/2021',42,14,588);
INSERT INTO venta VALUES (5260,'45417309-0','14519212-9','S003','B','31/12/2021',16,13,208);
INSERT INTO venta VALUES (5261,'13967384-0','8402711-1','S002','A','12/04/2021',34,12,408);
INSERT INTO venta VALUES (5262,'43968887-4','14519212-9','S001','A','16/07/2020',47,12,564);
INSERT INTO venta VALUES (5263,'2848128-4','6183303-K','S002','B','23/01/2021',43,14,602);
INSERT INTO venta VALUES (5264,'4487875-5','18567395-2','S001','A','30/09/2020',46,13,598);
INSERT INTO venta VALUES (5265,'16727458-7','29374931-0','S003','B','29/07/2020',49,14,686);
INSERT INTO venta VALUES (5266,'9799570-2','14519212-9','S001','B','04/07/2021',48,15,720);
INSERT INTO venta VALUES (5267,'29346913-K','42396509-6','S004','A','13/12/2021',50,13,650);
INSERT INTO venta VALUES (5268,'3532103-9','45421301-7','S003','A','28/03/2021',15,12,180);
INSERT INTO venta VALUES (5269,'5729551-1','6183303-K','S005','A','29/11/2020',46,14,644);
INSERT INTO venta VALUES (5270,'33978459-0','23819125-4','S004','A','29/05/2021',38,15,570);
INSERT INTO venta VALUES (5271,'44786603-K','24180587-5','S003','B','06/03/2020',33,14,462);
INSERT INTO venta VALUES (5272,'11980905-3','6183303-K','S001','A','09/06/2021',18,12,216);
INSERT INTO venta VALUES (5273,'40927596-6','32531450-8','S001','B','24/04/2020',13,13,169);
INSERT INTO venta VALUES (5274,'24769666-0','47232966-9','S005','A','29/05/2020',20,13,260);
INSERT INTO venta VALUES (5275,'34605812-9','47232966-9','S002','A','31/08/2021',15,12,180);
INSERT INTO venta VALUES (5276,'419175-7','8402711-1','S001','B','17/01/2020',20,12,240);
INSERT INTO venta VALUES (5277,'764416-7','23819125-4','S002','A','20/04/2020',47,15,705);
INSERT INTO venta VALUES (5278,'12408933-6','20237862-5','S001','A','16/09/2021',12,14,168);
INSERT INTO venta VALUES (5279,'23722716-6','45421301-7','S005','A','11/06/2021',18,13,234);
INSERT INTO venta VALUES (5280,'50235664-K','14315947-7','S003','A','08/12/2021',49,12,588);
INSERT INTO venta VALUES (5281,'20620588-1','18567395-2','S004','B','22/10/2020',27,12,324);
INSERT INTO venta VALUES (5282,'16875962-2','18567395-2','S005','A','26/11/2021',15,14,210);
INSERT INTO venta VALUES (5283,'26734598-8','14315947-7','S003','B','26/11/2020',37,12,444);
INSERT INTO venta VALUES (5284,'42620993-4','4810357-K','S002','A','09/03/2020',29,15,435);
INSERT INTO venta VALUES (5285,'34830491-7','47232966-9','S001','A','27/12/2021',29,13,377);
INSERT INTO venta VALUES (5286,'22762686-0','42396509-6','S001','A','01/08/2020',16,13,208);
INSERT INTO venta VALUES (5287,'22666604-4','32531450-8','S004','B','15/11/2021',33,15,495);
INSERT INTO venta VALUES (5288,'2664874-2','32531450-8','S002','B','15/07/2020',39,12,468);
INSERT INTO venta VALUES (5289,'23473785-6','23819125-4','S002','B','23/10/2021',43,14,602);
INSERT INTO venta VALUES (5290,'22401768-5','6183303-K','S005','B','24/02/2021',47,12,564);
INSERT INTO venta VALUES (5291,'1312320-9','20237862-5','S002','B','31/03/2020',43,15,645);
INSERT INTO venta VALUES (5292,'10652295-2','45421301-7','S002','A','08/10/2021',15,15,225);
INSERT INTO venta VALUES (5293,'48749127-6','20237862-5','S004','B','11/07/2021',19,12,228);
INSERT INTO venta VALUES (5294,'27217276-5','24180587-5','S002','A','07/06/2020',44,13,572);
INSERT INTO venta VALUES (5295,'26932196-2','6183303-K','S002','B','27/10/2020',13,15,195);
INSERT INTO venta VALUES (5296,'3263777-9','29374931-0','S001','B','23/04/2020',25,15,375);
INSERT INTO venta VALUES (5297,'25992177-5','20237862-5','S003','B','02/10/2020',16,13,208);
INSERT INTO venta VALUES (5298,'4499186-1','14519212-9','S003','B','21/08/2021',39,12,468);
INSERT INTO venta VALUES (5299,'42919155-6','42396509-6','S004','A','04/03/2021',40,12,480);
INSERT INTO venta VALUES (5300,'38857310-4','14519212-9','S005','A','04/03/2020',18,13,234);
INSERT INTO venta VALUES (5301,'45343934-8','46566450-9','S001','A','30/03/2021',43,14,602);
INSERT INTO venta VALUES (5302,'26766664-4','45421301-7','S001','A','02/05/2021',33,13,429);
INSERT INTO venta VALUES (5303,'15268632-3','32531450-8','S001','A','03/08/2020',50,15,750);
INSERT INTO venta VALUES (5304,'36696613-7','24180587-5','S001','A','29/07/2020',18,14,252);
INSERT INTO venta VALUES (5305,'7494366-7','45421301-7','S003','B','16/07/2020',15,14,210);
INSERT INTO venta VALUES (5306,'8825642-5','8402711-1','S001','B','03/09/2021',33,12,396);
INSERT INTO venta VALUES (5307,'33495647-4','20237862-5','S004','A','01/05/2021',46,12,552);
INSERT INTO venta VALUES (5308,'9838269-0','20237862-5','S004','A','14/06/2021',11,14,154);
INSERT INTO venta VALUES (5309,'11734682-K','6183303-K','S005','A','01/05/2020',44,12,528);
INSERT INTO venta VALUES (5310,'10883952-K','42396509-6','S002','B','10/11/2020',17,13,221);
INSERT INTO venta VALUES (5311,'35509687-4','24180587-5','S005','A','13/09/2020',17,15,255);
INSERT INTO venta VALUES (5312,'18448491-9','8402711-1','S003','A','03/07/2021',25,15,375);
INSERT INTO venta VALUES (5313,'14343214-9','18567395-2','S001','B','13/02/2021',44,14,616);
INSERT INTO venta VALUES (5314,'22331743-K','42396509-6','S002','A','29/10/2021',17,15,255);
INSERT INTO venta VALUES (5315,'10440146-5','4810357-K','S004','A','12/08/2021',20,14,280);
INSERT INTO venta VALUES (5316,'14515570-3','42396509-6','S003','B','09/09/2020',26,15,390);
INSERT INTO venta VALUES (5317,'37830923-9','45421301-7','S002','A','06/06/2020',32,12,384);
INSERT INTO venta VALUES (5318,'23336716-8','23819125-4','S002','B','19/12/2021',13,12,156);
INSERT INTO venta VALUES (5319,'7963840-4','42396509-6','S004','A','08/10/2021',26,12,312);
INSERT INTO venta VALUES (5320,'23911859-3','46566450-9','S005','B','20/07/2021',21,15,315);
INSERT INTO venta VALUES (5321,'26154119-K','18567395-2','S005','A','02/03/2020',30,14,420);
INSERT INTO venta VALUES (5322,'17211868-2','20237862-5','S003','B','01/05/2021',48,13,624);
INSERT INTO venta VALUES (5323,'14310154-1','6183303-K','S001','B','23/08/2020',32,14,448);
INSERT INTO venta VALUES (5324,'2876163-5','6183303-K','S002','B','02/09/2021',45,14,630);
INSERT INTO venta VALUES (5325,'4836809-3','45421301-7','S003','A','07/09/2021',44,13,572);
INSERT INTO venta VALUES (5326,'6770866-0','32531450-8','S005','B','10/01/2020',47,12,564);
INSERT INTO venta VALUES (5327,'30268781-1','46566450-9','S003','A','01/10/2020',11,12,132);
INSERT INTO venta VALUES (5328,'44370993-2','47232966-9','S004','A','09/04/2021',48,13,624);
INSERT INTO venta VALUES (5329,'9228271-6','24180587-5','S005','A','29/09/2020',33,12,396);
INSERT INTO venta VALUES (5330,'21387757-7','45421301-7','S002','B','17/01/2020',37,12,444);
INSERT INTO venta VALUES (5331,'37575381-2','32531450-8','S003','A','10/04/2020',17,14,238);
INSERT INTO venta VALUES (5332,'1840187-8','29374931-0','S003','B','25/05/2020',23,12,276);
INSERT INTO venta VALUES (5333,'18504853-5','14519212-9','S004','A','27/11/2021',13,15,195);
INSERT INTO venta VALUES (5334,'43641524-9','4810357-K','S003','A','31/01/2021',50,12,600);
INSERT INTO venta VALUES (5335,'4651673-7','46566450-9','S003','A','24/11/2021',42,12,504);
INSERT INTO venta VALUES (5336,'4441359-0','46566450-9','S004','B','09/06/2021',38,13,494);
INSERT INTO venta VALUES (5337,'25511320-8','23819125-4','S003','A','28/05/2020',30,15,450);
INSERT INTO venta VALUES (5338,'16179906-8','24180587-5','S004','B','18/07/2021',23,13,299);
INSERT INTO venta VALUES (5339,'19843558-9','8402711-1','S004','B','24/05/2020',20,12,240);
INSERT INTO venta VALUES (5340,'2811967-4','45421301-7','S004','A','12/10/2020',44,13,572);
INSERT INTO venta VALUES (5341,'28710876-1','6183303-K','S003','B','10/09/2020',35,15,525);
INSERT INTO venta VALUES (5342,'6617860-9','6183303-K','S003','B','26/04/2021',35,12,420);
INSERT INTO venta VALUES (5343,'35243513-9','46566450-9','S003','A','01/08/2020',29,14,406);
INSERT INTO venta VALUES (5344,'7463209-2','8402711-1','S005','A','17/07/2021',30,12,360);
INSERT INTO venta VALUES (5345,'38597729-8','14315947-7','S002','A','25/01/2020',32,15,480);
INSERT INTO venta VALUES (5346,'2123635-7','42396509-6','S001','B','12/07/2021',45,15,675);
INSERT INTO venta VALUES (5347,'2522692-5','29374931-0','S001','B','09/02/2020',16,14,224);
INSERT INTO venta VALUES (5348,'36551983-8','14519212-9','S003','B','16/11/2021',22,12,264);
INSERT INTO venta VALUES (5349,'27722312-0','47232966-9','S002','A','06/06/2021',40,15,600);
INSERT INTO venta VALUES (5350,'20753654-7','47232966-9','S003','B','09/04/2021',45,14,630);
INSERT INTO venta VALUES (5351,'13443951-3','6183303-K','S003','B','20/07/2020',12,12,144);
INSERT INTO venta VALUES (5352,'23136872-8','4810357-K','S003','A','04/04/2021',39,14,546);
INSERT INTO venta VALUES (5353,'4868525-0','14519212-9','S002','A','11/06/2021',34,15,510);
INSERT INTO venta VALUES (5354,'19376838-5','14519212-9','S005','A','02/02/2020',25,14,350);
INSERT INTO venta VALUES (5355,'788177-0','24180587-5','S002','B','04/09/2020',14,12,168);
INSERT INTO venta VALUES (5356,'21828819-7','32531450-8','S003','B','22/05/2021',20,12,240);
INSERT INTO venta VALUES (5357,'32325103-7','20237862-5','S001','B','13/07/2021',50,15,750);
INSERT INTO venta VALUES (5358,'9143968-9','24180587-5','S001','B','10/12/2020',13,15,195);
INSERT INTO venta VALUES (5359,'36354712-5','6183303-K','S004','B','13/12/2021',17,13,221);
INSERT INTO venta VALUES (5360,'7419796-5','32531450-8','S001','A','18/02/2021',45,14,630);
INSERT INTO venta VALUES (5361,'2681769-2','14315947-7','S002','A','21/01/2020',10,14,140);
INSERT INTO venta VALUES (5362,'47552796-8','4810357-K','S005','A','27/09/2020',30,12,360);
INSERT INTO venta VALUES (5363,'22442239-3','32531450-8','S002','A','24/07/2021',26,12,312);
INSERT INTO venta VALUES (5364,'46343501-4','23819125-4','S003','A','05/12/2020',18,13,234);
INSERT INTO venta VALUES (5365,'25789250-6','20237862-5','S001','A','02/05/2020',23,12,276);
INSERT INTO venta VALUES (5366,'4314143-0','29374931-0','S004','A','11/10/2020',26,14,364);
INSERT INTO venta VALUES (5367,'42428940-K','47232966-9','S002','A','16/04/2020',11,13,143);
INSERT INTO venta VALUES (5368,'39775721-8','8402711-1','S001','B','11/08/2020',36,13,468);
INSERT INTO venta VALUES (5369,'4758948-7','23819125-4','S005','A','01/05/2021',33,13,429);
INSERT INTO venta VALUES (5370,'33997149-8','4810357-K','S004','B','12/03/2020',34,13,442);
INSERT INTO venta VALUES (5371,'1122027-4','42396509-6','S005','B','10/04/2021',13,15,195);
INSERT INTO venta VALUES (5372,'46337336-1','24180587-5','S001','B','11/11/2021',44,14,616);
INSERT INTO venta VALUES (5373,'43643180-5','14315947-7','S004','B','04/02/2021',25,14,350);
INSERT INTO venta VALUES (5374,'36596992-2','23819125-4','S002','B','24/07/2021',15,12,180);
INSERT INTO venta VALUES (5375,'41832875-4','23819125-4','S001','B','12/05/2020',48,12,576);
INSERT INTO venta VALUES (5376,'2171656-1','45421301-7','S003','A','20/05/2020',30,12,360);
INSERT INTO venta VALUES (5377,'34267352-K','4810357-K','S003','B','24/02/2020',18,14,252);
INSERT INTO venta VALUES (5378,'631941-6','46566450-9','S001','B','14/06/2020',27,12,324);
INSERT INTO venta VALUES (5379,'45654643-9','6183303-K','S005','A','26/10/2020',40,12,480);
INSERT INTO venta VALUES (5380,'16765562-9','14315947-7','S004','A','11/11/2021',17,15,255);
INSERT INTO venta VALUES (5381,'32270250-7','6183303-K','S004','B','03/04/2020',25,13,325);
INSERT INTO venta VALUES (5382,'11563170-5','6183303-K','S001','B','23/02/2021',33,14,462);
INSERT INTO venta VALUES (5383,'26157537-K','14519212-9','S005','A','05/05/2021',16,13,208);
