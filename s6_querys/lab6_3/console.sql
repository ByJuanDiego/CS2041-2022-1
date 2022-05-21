set search_path to lab6_3;

CREATE TABLE Profesor (
    dniP varchar(8) PRIMARY KEY,
    nombreP varchar(255) default NULL,
    area varchar(255) ,
    fNacimiento date,
    fOnomastico varchar
);


CREATE TABLE Empresa (
    nombreE varchar(255)  PRIMARY KEY
);
CREATE TABLE Proyecto (
    codigoP varchar(10) PRIMARY KEY,
	nombre varchar(1000),
    fInicio date,
    fFin date,
    presupuesto float,
    dniP varchar(8),
    nombreE varchar(255),
    FOREIGN KEY (dniP) REFERENCES Profesor(dniP),
    FOREIGN KEY (nombreE) REFERENCES Empresa(nombreE)
);
 CREATE TABLE Departamento (
    codigoD varchar(10) PRIMARY KEY,
    nombreD varchar(255)
);


CREATE TABLE Estudiante (
    codigoEs varchar(10) PRIMARY KEY,
    nombreEs varchar(255)
);

CREATE TABLE EPostgrado (
    codigoEs varchar(10) PRIMARY KEY,
    especializacion varchar(255),
	FOREIGN KEY (codigoEs) REFERENCES Estudiante(codigoEs)
);


CREATE TABLE EPregrado (
    codigoEs varchar(10) PRIMARY KEY,
    carrera varchar(255),
	FOREIGN KEY (codigoEs) REFERENCES Estudiante(codigoEs)
);

CREATE TABLE TrabajaP (
    fecha varchar(50),
    codigoEs varchar(10),
	codigoP varchar(10),
    FOREIGN KEY (codigoP) REFERENCES Proyecto(codigoP),
    FOREIGN KEY (codigoEs) REFERENCES Estudiante(codigoEs),
	PRIMARY KEY(fecha, codigoEs)
);



CREATE TABLE Asesora (
    dniP varchar(8) ,
    codigoP varchar(10) ,
    FOREIGN KEY (codigoP) REFERENCES Proyecto(codigoP),
    FOREIGN KEY (dniP) REFERENCES Profesor(dniP) ,
	PRIMARY KEY(dniP, codigoP)
);

CREATE TABLE TrabajaD (
    dniP varchar(8) ,
    codigoD varchar(10),
    FOREIGN KEY (codigoD) REFERENCES Departamento(codigoD),
    FOREIGN KEY (dniP) REFERENCES Profesor(dniP),
	PRIMARY KEY(dniP, codigoD)
);


CREATE TABLE DirigeD (
    dniP varchar(8),
    codigoD varchar(10) PRIMARY KEY,
    FOREIGN KEY (codigoD) REFERENCES Departamento(codigoD),
    FOREIGN KEY (dniP) REFERENCES Profesor(dniP)
);
CREATE TABLE Pertenece (
	codigoEs varchar(10) PRIMARY KEY,
	codigoD  varchar(10),
	FOREIGN KEY (codigoEs) REFERENCES Estudiante(codigoEs),
	FOREIGN KEY (codigoD) REFERENCES Departamento(codigoD)
);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(24608040,'Alan Morante','Sistemas de Computación','1982-05-01',44317);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(59659598,'Yamilet Serrano','Ingeniería de Software y Lenguajes de Programación','1983-06-02',44349);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(67172915,'Fernando Augusto Nuñez Calderón','Gestión de Datos y de la Información','1984-07-03',44380);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(53242328,'Henry Gallegos Velgara','Robótica, visión computacional y procesamiento gráfico','1985-08-04',44412);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(72190130,'Jesus Bellido Angulo','Inteligencia Artificial','1986-09-05',44444);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(20497619,'Jose Renom Andara','Optimización','1987-10-07',44476);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(96134795,'Jose Fiestas','Lenguajes de Programación','1988-11-07',44507);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(95549917,'Maria Hilda Bermejo Rios','Inteligencia Artificial','1989-12-09',44539);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(81956618,'Ruben Rivas','Estructura de Datos y Algoritmos','1991-01-10',44206);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(12746278,'Heider Sanchez Enriquez','Base de datos','1992-02-11',44238);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(23692863,'Teofilo Chambilla Aquino','Interacción Humano Computador','1993-03-14',44269);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(30864680,'Juan Gutiérrez Alva','Algoritmos y estructuras de datos','1987-10-08',44418);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(53383988,'Cristian López del Álamo','Ingeniería Mecánica','1988-11-08',44327);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(69908818,'Helard Álvarez Sánchez','Ingeniería Mecánica','1989-12-10',44481);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(14429151,'Samuel Charca Mamani','Ingeniería Mecánica','1991-01-11',44501);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(41111825,'Xyoby Chávez Pacheco','Ciencias','1992-02-12',44532);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(55150805,'Hermes Pantoja Carhuavilca','Ciencias','1993-03-15',03/15);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(30041092,'Rafael Vera Pomalaza','Ingeniería De La Energía','1987-10-08',44418);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(30227941,'Enrique Stiglich Labarthe','Negocios Digitales','1988-11-08',44419);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(30663021,'Patricia Araujo Pantoja','Ingeniería Química','1989-12-10',44481);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(28785002,'Carmen Elena Flores','Ingeniería Química','1991-01-11',44501);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(72634225,'Juan Carlos Rodríguez Reyes','Ingeniería Química','1992-02-12',44532);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(44422446,'Luis Castillo Campos','Ingeniería Electrónica','1993-03-15',03/15);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(14084845,'Alejandro Ríos Cuadros','Ciencias','1987-10-09',44449);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(90136800,'Rosa Fabiola Jabo Bereche','Matemáticas','1988-11-09',44450);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(10806792,'José Gaspar de la Puente Maldonado','Ingeniería Industrial','1989-12-11',44512);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(15849775,'Omar Bejarano Grandez','Ingeniería Mecánica','1991-01-12',44531);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(19517946,'José Alfredo Diaz León','Ingeniería Industrial','1992-02-13',12/13);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(46751277,'Tulio Antonio Antezano Inga','Ingeniería Mecánica','1993-03-16',03/16);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(16111535,'Francisco Daniel Porles Ochoa','Ingeniería De La Energía','1987-10-09',44449);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(70619696,'Alejandra Ratti Parandelli','Bioingeniería','1988-11-09',44450);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(49293712,'Carlos Alfredo Rios Perez','Ingeniería Mecánica','1989-12-11',44512);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(73130679,'Giuliana Maria Carrillo Pastor','Humanidades','1991-01-12',44531);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(29443239,'Victor Gonzalo Ramirez Herrera','Humanidades','1992-02-13',02/13);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(53474924,'David Alberto Gallardo Yaya','Ingeniería Industrial','1993-03-16',03/16);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(31983040,'David Vilca Tomaylla','Ingeniería De La Energía','1987-10-10',44479);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(62605005,'Diana Maria Luna Torres','Humanidades','1988-11-10',44480);
INSERT INTO profesor (dnip, nombrep, area, fnacimiento,fonomastico) values(63028542,'Flavio Cesar Ramirez Horna','Ingeniería Electrónica','1988-11-11',44511);
INSERT INTO Empresa values ('Google'),('Facebook'),('Tiktok'),('IBM'),('Microsoft'),('PCM'),
('Alicorp'),('Grupo Gloria'),('Leche Gloria'),('San Fernando'),('Nestlé Perú'), ('Adm. Andina Perú'),('Redondos'),('Molitalia'),('Vitapro'),
('Inretail Perú Corp. y Sub'),('Inretail Pharma'),('Supermercados Peruanos'),('Cencosud'),
('Hipermercados Tottus'),('Saga Falabella'),('Grupo Ripley Perú'),('Sodimac Perú'),
('Mifarma'),('Makro Supermayoristas');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('72808','A Comprehensive Framework for Designing Computer-Mediated Interaction Mechanisms to Support Informal Elderly Caregiving','2019-01-01','2019-01-21',5530,24608040,'Google');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('170586','Reducing Social Isolation of Elderly People Using Social Media and Ambient Intelligence','2019-02-02','2019-02-22',4225,59659598,'Facebook');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('51562','GEMS: Gestión Experimental de la Mejora de Software','2019-03-06','2019-03-26',13755,67172915,'Tiktok');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('62227','UBIHEALTH: Exchange of Excellence in Ubiquitous Computing Technologies to Address Healthcare Challenges','2019-04-07','2019-04-27',7130,53242328,'IBM');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('17885','Understanding the impact of computing solutions on the mobile workers productivity','2019-05-09','2019-05-29',18538,72190130,'Microsoft');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('186997','ADAPTE: Adaptable Domain And Process Technology Engineering','2019-06-10','2019-06-30',7599,20497619,'PCM');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('172795','Temporal Social Networks and Knowledge Dissemination for Healthcare','2019-07-12','2019-08-01',15555,96134795,'Alicorp');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('127475','Understanding the Key Issues Behind the Computer-Supported Mobile Work','2019-08-13','2019-09-02',16602,95549917,'Grupo Gloria');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('174859','Smart Phones and Ambient Displays to Support Collaboration in Hospital Work','2019-09-14','2019-10-04',3491,81956618,'Leche Gloria');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('86916','Understanding the Design and Use of Ad-hoc Collaborative Mobile workspaces for the Chilean Construction Industry','2019-10-16','2019-11-05',15419,12746278,'San Fernando');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('158943','IT-based Collaboration framework for Preparing against, Responding to and Recovering from Disasters involving Critical Physical Infrastructures','2019-11-17','2019-12-07',11318,23692863,'Nestlé Perú');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('119977','Reusing Digital Learning Material','2019-12-19','2020-01-08',6734,30864680,'Adm. Andina Perú');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('76785','Development of a basis for implementing e-Government Solutions in Chile','2020-01-20','2020-02-09',14741,53383988,'Redondos');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('135730','Specialized Topics in Collaborative Systems','2020-02-21','2020-03-12',5368,69908818,'Molitalia');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('75929','TOP (Ten Object Platform): A Groupware Framework','2020-03-24','2020-04-13',14942,14429151,'Vitapro');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('56635','Tecnologías de Software Aplicadas a Bibliotecas Digitales','2020-04-25','2020-05-15',7418,41111825,'Inretail Perú Corp. y Sub');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('63671','Red Informática de Bibliotecas Digitales','2020-05-27','2020-06-16',3087,55150805,'Inretail Pharma');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('33451','Assessing Empathy and Managing Emotions Through Interactions with an Affective Avatar','2020-06-28','2020-07-18',2284,30041092,'Supermercados Peruanos');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('81841','A Stochastic Approach for Modeling Message Dissemination in Opportunistic Networks','2020-07-30','2020-08-19',6493,30227941,'Cencosud');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('94287','A Context-Aware Model to Provide Positioning in Disaster Relief Scenarios','2020-08-31','2020-09-20',14815,30663021,'Hipermercados Tottus');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('119864','Human-centric Wireless Sensor Networks to Improve Information Availability During Urban Search and Rescue Activities','2020-10-02','2020-10-22',7737,28785002,'Saga Falabella');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('113602','A New Class Of Proximity Data Obtained From Dictionary Networks','2020-11-03','2020-11-23',19160,72634225,'Grupo Ripley Perú');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('70044','The Notion Delegation of Tasks in Linked Data through Agents.','2020-12-05','2020-12-25',17820,44422446,'Sodimac Perú');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('134240','Building knowledge maps of Web graphs.','2021-01-06','2021-01-26',7753,14084845,'Mifarma');
INSERT INTO Proyecto (codigoP,nombre,fInicio , fFin,presupuesto,dniP,nombreE) values('21510','NautiLOD: A Formal Language for the Web of Data Graph.','2021-02-07','2021-02-27',16210,90136800,'Makro Supermayoristas');

INSERT INTO departamento ( codigod, nombred) values('IM','Ingeniería Mecatrónica');
INSERT INTO departamento ( codigod, nombred) values('AN','Administración y Negocios Digitales');
INSERT INTO departamento ( codigod, nombred) values('BI','Bioingeniería');
INSERT INTO departamento ( codigod, nombred) values('DS','Ciencia de Datos');
INSERT INTO departamento ( codigod, nombred) values('CS','Ciencia de la Computación');
INSERT INTO departamento ( codigod, nombred) values('IQ','Ingeniería Química');
INSERT INTO departamento ( codigod, nombred) values('IE','Ingeniería de la Energía');
INSERT INTO departamento ( codigod, nombred) values('DB','Departamento de Bioingeniería');
INSERT INTO departamento ( codigod, nombred) values('DC','Departamento de Civil');
INSERT INTO departamento ( codigod, nombred) values('DM','Departamento de Mecánica');

INSERT INTO estudiante(codigoes, nombrees) values('201830868','Alvarado Ramos Miguel Angel');
INSERT INTO estudiante(codigoes, nombrees) values('202014511','Angeles Barazorda Jean Pier Renzo');
INSERT INTO estudiante(codigoes, nombrees) values('201897944','Armas Vega Paolo Sebastian');
INSERT INTO estudiante(codigoes, nombrees) values('201845752','Arrospide Gonzalez Eduardo');
INSERT INTO estudiante(codigoes, nombrees) values('201851994','Astuhuaman Dávila Tony Enrique');
INSERT INTO estudiante(codigoes, nombrees) values('202000858','Avendaño Vargas Plinio Matias');
INSERT INTO estudiante(codigoes, nombrees) values('202065555','Ayala Pineda Marcos Daniel');
INSERT INTO estudiante(codigoes, nombrees) values('201899058','Baldeon Medrano Brandon Alexander');
INSERT INTO estudiante(codigoes, nombrees) values('201982009','Barzola Estrella Johar Jared');
INSERT INTO estudiante(codigoes, nombrees) values('201940800','Calixto Rojas Neftali Anderson');
INSERT INTO estudiante(codigoes, nombrees) values('201974563','Canto Vidal Harold Alexis Victor');
INSERT INTO estudiante(codigoes, nombrees) values('201820303','Carhuancho Espejo Eros Joaquin');
INSERT INTO estudiante(codigoes, nombrees) values('201990695','Carlos Acosta Rodrigo Dion');
INSERT INTO estudiante(codigoes, nombrees) values('201944441','Chacon Arrospide Edgar Santos');
INSERT INTO estudiante(codigoes, nombrees) values('202049027','Chahua Salgueran Luis Eduardo');
INSERT INTO estudiante(codigoes, nombrees) values('201880407','Choquehuanca Alberto Said Martín');
INSERT INTO estudiante(codigoes, nombrees) values('201832016','Cortez Gorbalan Ian Augusto');
INSERT INTO estudiante(codigoes, nombrees) values('202064973','Cuaresma Puclla Paulo Oshualdo');
INSERT INTO estudiante(codigoes, nombrees) values('201930585','Escajadillo Guerrero Diego Antonio');
INSERT INTO estudiante(codigoes, nombrees) values('201956396','Espinoza Herrera Marcela Fernanda');
INSERT INTO estudiante(codigoes, nombrees) values('201801867','Flores Rimac Christopher William');
INSERT INTO estudiante(codigoes, nombrees) values('201942204','Guerra Chevarria Diego Eduardo');
INSERT INTO estudiante(codigoes, nombrees) values('202078305','Gutierrez Guanilo Luis Antonio');
INSERT INTO estudiante(codigoes, nombrees) values('201939164','Gutierrez Soto Brhandon Luis');
INSERT INTO estudiante(codigoes, nombrees) values('201993366','Lama Carrasco Miguel Angel');
INSERT INTO estudiante(codigoes, nombrees) values('201878498','Lapa Carhuamaca Arleth Ivhy');
INSERT INTO estudiante(codigoes, nombrees) values('201917658','Loayza Huaman Johannes Albert Segundo');
INSERT INTO estudiante(codigoes, nombrees) values('201813754','Mamani Andia Albino Alejandro');
INSERT INTO estudiante(codigoes, nombrees) values('202029040','Melendez Cabezas Jean Paul');
INSERT INTO estudiante(codigoes, nombrees) values('202060343','Morales Azañedo Rodrigo Alonso');
INSERT INTO estudiante(codigoes, nombrees) values('201894936','Mori Ortiz Pedro Enrique');
INSERT INTO estudiante(codigoes, nombrees) values('202075346','Muñoz Chávez Gonzalo Sebastián');
INSERT INTO estudiante(codigoes, nombrees) values('202046070','Neira Riveros Jorge Luis');
INSERT INTO estudiante(codigoes, nombrees) values('201850389','Quiroz Maquin Nincol Abraham');
INSERT INTO estudiante(codigoes, nombrees) values('201963551','Rincón Espinoza Alberto Domenic');
INSERT INTO estudiante(codigoes, nombrees) values('201866682','Rios Sialer Alonso Matias');
INSERT INTO estudiante(codigoes, nombrees) values('201829369','Robledo Chuquicusma Luis Brauns');
INSERT INTO estudiante(codigoes, nombrees) values('201983335','Romero Pessagno Renzo');
INSERT INTO estudiante(codigoes, nombrees) values('202070816','Rubio Montiel Ignacio');
INSERT INTO estudiante(codigoes, nombrees) values('201892119','Salazar Alva Rodrigo Gabriel');
INSERT INTO estudiante(codigoes, nombrees) values('201827837','Surco Salas Marcelo Juan');
INSERT INTO estudiante(codigoes, nombrees) values('201904337','Torres Farfán Juan Manuel');
INSERT INTO estudiante(codigoes, nombrees) values('201927760','Vargas Vargas Fabián Martín');
INSERT INTO estudiante(codigoes, nombrees) values('201879772','Zuloaga Loo Angello Miguel');


INSERT INTO epostgrado (codigoes, especializacion) values('202046070','Ingeniería Mecatrónica');
INSERT INTO epostgrado (codigoes, especializacion) values('201850389','Ciencia de la Computación');
INSERT INTO epostgrado (codigoes, especializacion) values('201963551','Bioingeniería');
INSERT INTO epostgrado (codigoes, especializacion) values('201866682','Ciencia de Datos');
INSERT INTO epostgrado (codigoes, especializacion) values('201829369','Ciencia de la Computación');
INSERT INTO epostgrado (codigoes, especializacion) values('201983335','Ingeniería Química');
INSERT INTO epostgrado (codigoes, especializacion) values('202070816','Ingeniería de la Energía');
INSERT INTO epostgrado (codigoes, especializacion) values('201892119','Departamento de Bioingeniería');
INSERT INTO epostgrado (codigoes, especializacion) values('201827837','Departamento de Civil');
INSERT INTO epostgrado (codigoes, especializacion) values('201904337','Ciencia de la Computación');
INSERT INTO epostgrado (codigoes, especializacion) values('201927760','Ciencia de la Computación');
INSERT INTO epostgrado (codigoes, especializacion) values('201879772','Ciencia de Datos');
INSERT INTO epostgrado (codigoes, especializacion ) values('201830868','Ingeniería Mecatrónica');


INSERT INTO epregrado (codigoes, carrera ) values('201830868','Ingeniería Mecatrónica');
INSERT INTO epregrado (codigoes, carrera ) values('202014511','Administración y Negocios Digitales');
INSERT INTO epregrado (codigoes, carrera ) values('201897944','Bioingeniería');
INSERT INTO epregrado (codigoes, carrera ) values('201845752','Ciencia de Datos');
INSERT INTO epregrado (codigoes, carrera ) values('201851994','Ciencia de la Computación');
INSERT INTO epregrado (codigoes, carrera ) values('202000858','Ingeniería Química');
INSERT INTO epregrado (codigoes, carrera ) values('202065555','Ingeniería de la Energía');
INSERT INTO epregrado (codigoes, carrera ) values('201899058','Departamento de Bioingeniería');
INSERT INTO epregrado (codigoes, carrera ) values('201982009','Departamento de Civil');
INSERT INTO epregrado (codigoes, carrera ) values('201940800','Departamento de Mecánica');
INSERT INTO epregrado (codigoes, carrera ) values('201974563','Ingeniería Mecatrónica');
INSERT INTO epregrado (codigoes, carrera ) values('201820303','Ciencia de la Computación');
INSERT INTO epregrado (codigoes, carrera ) values('201990695','Ciencia de la Computación');
INSERT INTO epregrado (codigoes, carrera ) values('201944441','Ciencia de Datos');
INSERT INTO epregrado (codigoes, carrera ) values('202049027','Ciencia de la Computación');
INSERT INTO epregrado (codigoes, carrera ) values('201880407','Ingeniería Química');
INSERT INTO epregrado (codigoes, carrera ) values('201832016','Ingeniería de la Energía');
INSERT INTO epregrado (codigoes, carrera ) values('202064973','Departamento de Bioingeniería');
INSERT INTO epregrado (codigoes, carrera ) values('201930585','Departamento de Civil');
INSERT INTO epregrado (codigoes, carrera ) values('201956396','Departamento de Mecánica');
INSERT INTO epregrado (codigoes, carrera ) values('201801867','Ciencia de la Computación');
INSERT INTO epregrado (codigoes, carrera ) values('201942204','Ciencia de la Computación');
INSERT INTO epregrado (codigoes, carrera ) values('202078305','Ciencia de Datos');
INSERT INTO epregrado (codigoes, carrera ) values('201939164','Ciencia de la Computación');
INSERT INTO epregrado (codigoes, carrera ) values('201993366','Ingeniería Química');
INSERT INTO epregrado (codigoes, carrera ) values('201878498','Ingeniería de la Energía');
INSERT INTO epregrado (codigoes, carrera ) values('201917658','Departamento de Bioingeniería');
INSERT INTO epregrado (codigoes, carrera ) values('201813754','Departamento de Civil');
INSERT INTO epregrado (codigoes, carrera ) values('202029040','Ciencia de la Computación');
INSERT INTO epregrado (codigoes, carrera ) values('202060343','Ciencia de la Computación');
INSERT INTO epregrado (codigoes, carrera ) values('201894936','Ciencia de la Computación');
INSERT INTO epregrado (codigoes, carrera ) values('202075346','Ciencia de Datos');


INSERT INTO asesora (dnip, codigop) values('15849775','72808');
INSERT INTO asesora (dnip, codigop) values('19517946','170586');
INSERT INTO asesora (dnip, codigop) values('46751277','51562');
INSERT INTO asesora (dnip, codigop) values('16111535','62227');
INSERT INTO asesora (dnip, codigop) values('70619696','17885');
INSERT INTO asesora (dnip, codigop) values('49293712','186997');
INSERT INTO asesora (dnip, codigop) values('73130679','172795');
INSERT INTO asesora (dnip, codigop) values('29443239','127475');
INSERT INTO asesora (dnip, codigop) values('53474924','174859');
INSERT INTO asesora (dnip, codigop) values('31983040','86916');
INSERT INTO asesora (dnip, codigop) values('62605005','158943');
INSERT INTO asesora (dnip, codigop) values('63028542','119977');
INSERT INTO asesora (dnip, codigop) values('15849775','76785');
INSERT INTO asesora (dnip, codigop) values('19517946','135730');
INSERT INTO asesora (dnip, codigop) values('46751277','75929');
INSERT INTO asesora (dnip, codigop) values('16111535','56635');
INSERT INTO asesora (dnip, codigop) values('70619696','63671');
INSERT INTO asesora (dnip, codigop) values('49293712','33451');
INSERT INTO asesora (dnip, codigop) values('73130679','81841');
INSERT INTO asesora (dnip, codigop) values('29443239','94287');
INSERT INTO asesora (dnip, codigop) values('53474924','119864');
INSERT INTO asesora (dnip, codigop) values('31983040','113602');
INSERT INTO asesora (dnip, codigop) values('62605005','70044');
INSERT INTO asesora (dnip, codigop) values('63028542','134240');
INSERT INTO asesora (dnip, codigop) values('63028542','21510');
INSERT INTO asesora (dnip, codigop) values('59659598','72808');
INSERT INTO asesora (dnip, codigop) values('67172915','170586');
INSERT INTO asesora (dnip, codigop) values('53242328','51562');
INSERT INTO asesora (dnip, codigop) values('72190130','62227');
INSERT INTO asesora (dnip, codigop) values('20497619','17885');
INSERT INTO asesora (dnip, codigop) values('96134795','186997');
INSERT INTO asesora (dnip, codigop) values('95549917','172795');
INSERT INTO asesora (dnip, codigop) values('81956618','127475');
INSERT INTO asesora (dnip, codigop) values('12746278','174859');
INSERT INTO asesora (dnip, codigop) values('23692863','86916');
INSERT INTO asesora (dnip, codigop) values('30864680','158943');
INSERT INTO asesora (dnip, codigop) values('53383988','119977');
INSERT INTO asesora (dnip, codigop) values('69908818','76785');
INSERT INTO asesora (dnip, codigop) values('14429151','135730');
INSERT INTO asesora (dnip, codigop) values('41111825','75929');
INSERT INTO asesora (dnip, codigop) values('55150805','56635');
INSERT INTO asesora (dnip, codigop) values('30041092','63671');
INSERT INTO asesora (dnip, codigop) values('30227941','33451');
INSERT INTO asesora (dnip, codigop) values('30663021','81841');
INSERT INTO asesora (dnip, codigop) values('28785002','94287');
INSERT INTO asesora (dnip, codigop) values('72634225','119864');
INSERT INTO asesora (dnip, codigop) values('44422446','113602');
INSERT INTO asesora (dnip, codigop) values('14084845','70044');
INSERT INTO asesora (dnip, codigop) values('90136800','134240');
INSERT INTO asesora (dnip, codigop) values('10806792','21510');
INSERT INTO asesora (dnip, codigop) values('53242328','170586');
INSERT INTO asesora (dnip, codigop) values('72190130','51562');
INSERT INTO asesora (dnip, codigop) values('20497619','62227');
INSERT INTO asesora (dnip, codigop) values('96134795','17885');
INSERT INTO asesora (dnip, codigop) values('95549917','186997');
INSERT INTO asesora (dnip, codigop) values('81956618','172795');
INSERT INTO asesora (dnip, codigop) values('12746278','127475');
INSERT INTO asesora (dnip, codigop) values('23692863','174859');
INSERT INTO asesora (dnip, codigop) values('30864680','86916');
INSERT INTO asesora (dnip, codigop) values('53383988','158943');
INSERT INTO asesora (dnip, codigop) values('69908818','119977');
INSERT INTO asesora (dnip, codigop) values('14429151','76785');
INSERT INTO asesora (dnip, codigop) values('41111825','135730');
INSERT INTO asesora (dnip, codigop) values('55150805','75929');
INSERT INTO asesora (dnip, codigop) values('30041092','56635');
INSERT INTO asesora (dnip, codigop) values('30227941','63671');
INSERT INTO asesora (dnip, codigop) values('30663021','33451');
INSERT INTO asesora (dnip, codigop) values('28785002','81841');
INSERT INTO asesora (dnip, codigop) values('72634225','94287');
INSERT INTO asesora (dnip, codigop) values('44422446','119864');
INSERT INTO asesora (dnip, codigop) values('14084845','113602');
INSERT INTO asesora (dnip, codigop) values('90136800','70044');
INSERT INTO asesora (dnip, codigop) values('10806792','134240');
INSERT INTO asesora (dnip, codigop) values('90136800','21510');


INSERT INTO diriged (dnip, codigod) values ('24608040','IM');
INSERT INTO diriged (dnip, codigod) values ('59659598','AN');
INSERT INTO diriged (dnip, codigod) values ('67172915','BI');
INSERT INTO diriged (dnip, codigod) values ('53242328','DS');
INSERT INTO diriged (dnip, codigod) values ('72190130','CS');
INSERT INTO diriged (dnip, codigod) values ('20497619','IQ');
INSERT INTO diriged (dnip, codigod) values ('96134795','IE');
INSERT INTO diriged (dnip, codigod) values ('95549917','DB');
INSERT INTO diriged (dnip, codigod) values ('81956618','DC');
INSERT INTO diriged (dnip, codigod) values ('12746278','DM');


INSERT INTO trabajad(dnip, codigod) values ('24608040','IM');
INSERT INTO trabajad(dnip, codigod) values ('59659598','AN');
INSERT INTO trabajad(dnip, codigod) values ('67172915','BI');
INSERT INTO trabajad(dnip, codigod) values ('53242328','DS');
INSERT INTO trabajad(dnip, codigod) values ('72190130','CS');
INSERT INTO trabajad(dnip, codigod) values ('20497619','IQ');
INSERT INTO trabajad(dnip, codigod) values ('96134795','IE');
INSERT INTO trabajad(dnip, codigod) values ('95549917','DB');
INSERT INTO trabajad(dnip, codigod) values ('81956618','DC');
INSERT INTO trabajad(dnip, codigod) values ('12746278','DM');
INSERT INTO trabajad(dnip, codigod) values ('23692863','IM');
INSERT INTO trabajad(dnip, codigod) values ('30864680','AN');
INSERT INTO trabajad(dnip, codigod) values ('53383988','BI');
INSERT INTO trabajad(dnip, codigod) values ('69908818','DS');
INSERT INTO trabajad(dnip, codigod) values ('14429151','CS');
INSERT INTO trabajad(dnip, codigod) values ('41111825','IQ');
INSERT INTO trabajad(dnip, codigod) values ('55150805','IE');
INSERT INTO trabajad(dnip, codigod) values ('30041092','DB');
INSERT INTO trabajad(dnip, codigod) values ('30227941','DC');
INSERT INTO trabajad(dnip, codigod) values ('30663021','DM');
INSERT INTO trabajad(dnip, codigod) values ('28785002','IM');
INSERT INTO trabajad(dnip, codigod) values ('72634225','AN');
INSERT INTO trabajad(dnip, codigod) values ('44422446','BI');
INSERT INTO trabajad(dnip, codigod) values ('14084845','DS');
INSERT INTO trabajad(dnip, codigod) values ('90136800','CS');
INSERT INTO trabajad(dnip, codigod) values ('10806792','IQ');
INSERT INTO trabajad(dnip, codigod) values ('15849775','IE');
INSERT INTO trabajad(dnip, codigod) values ('19517946','DB');
INSERT INTO trabajad(dnip, codigod) values ('46751277','DC');
INSERT INTO trabajad(dnip, codigod) values ('16111535','DM');
INSERT INTO trabajad(dnip, codigod) values ('70619696','IM');
INSERT INTO trabajad(dnip, codigod) values ('49293712','AN');
INSERT INTO trabajad(dnip, codigod) values ('73130679','BI');
INSERT INTO trabajad(dnip, codigod) values ('29443239','DS');
INSERT INTO trabajad(dnip, codigod) values ('53474924','CS');
INSERT INTO trabajad(dnip, codigod) values ('31983040','IQ');
INSERT INTO trabajad(dnip, codigod) values ('62605005','IE');
INSERT INTO trabajad(dnip, codigod) values ('63028542','DB');
INSERT INTO trabajad(dnip, codigod) values ('44422446','DS');
INSERT INTO trabajad(dnip, codigod) values ('14084845','CS');
INSERT INTO trabajad(dnip, codigod) values ('90136800','IQ');
INSERT INTO trabajad(dnip, codigod) values ('10806792','IE');
INSERT INTO trabajad(dnip, codigod) values ('15849775','DB');
INSERT INTO trabajad(dnip, codigod) values ('19517946','DC');
INSERT INTO trabajad(dnip, codigod) values ('46751277','DM');
INSERT INTO trabajad(dnip, codigod) values ('16111535','IM');
INSERT INTO trabajad(dnip, codigod) values ('70619696','AN');
INSERT INTO trabajad(dnip, codigod) values ('49293712','BI');
INSERT INTO trabajad(dnip, codigod) values ('73130679','DS');
INSERT INTO trabajad(dnip, codigod) values ('29443239','CS');
INSERT INTO trabajad(dnip, codigod) values ('53474924','IQ');
INSERT INTO trabajad(dnip, codigod) values ('31983040','IE');
INSERT INTO trabajad(dnip, codigod) values ('62605005','DB');
INSERT INTO trabajad(dnip, codigod) values ('63028542','IQ');
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2017-0',201830868,72808);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2017-1',202014511,170586);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2017-2',201897944,51562);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2018-0',201845752,62227);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2018-1',201851994,17885);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2018-2',202000858,186997);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2019-0',202065555,172795);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2019-1',201899058,127475);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2019-2',201982009,174859);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2020-0',201940800,86916);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2020-1',201974563,158943);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2020-2',201820303,119977);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2021-0',201990695,76785);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2021-1',201944441,135730);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2021-2',202049027,75929);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2017-0',201880407,56635);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2017-1',201832016,63671);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2017-2',202064973,33451);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2018-0',201930585,81841);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2018-1',201956396,94287);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2018-2',201801867,119864);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2019-0',201942204,113602);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2019-1',202078305,70044);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2019-2',201939164,134240);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2020-0',201993366,21510);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2020-1',201878498,94287);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2020-2',201917658,119864);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2021-0',201813754,113602);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2021-1',202029040,70044);
INSERT INTO TrabajaP (fecha,codigoes,codigop) values ('2021-2',202060343,134240);


INSERT INTO pertenece (codigoes, codigod) values('201830868','IM');
INSERT INTO pertenece (codigoes, codigod) values('202014511','AN');
INSERT INTO pertenece (codigoes, codigod) values('201897944','BI');
INSERT INTO pertenece (codigoes, codigod) values('201845752','DS');
INSERT INTO pertenece (codigoes, codigod) values('201851994','CS');
INSERT INTO pertenece (codigoes, codigod) values('202000858','IQ');
INSERT INTO pertenece (codigoes, codigod) values('202065555','IE');
INSERT INTO pertenece (codigoes, codigod) values('201899058','DB');
INSERT INTO pertenece (codigoes, codigod) values('201982009','DC');
INSERT INTO pertenece (codigoes, codigod) values('201940800','DM');
INSERT INTO pertenece (codigoes, codigod) values('201974563','IM');
INSERT INTO pertenece (codigoes, codigod) values('201820303','AN');
INSERT INTO pertenece (codigoes, codigod) values('201990695','BI');
INSERT INTO pertenece (codigoes, codigod) values('201944441','DS');
INSERT INTO pertenece (codigoes, codigod) values('202049027','CS');
INSERT INTO pertenece (codigoes, codigod) values('201880407','IQ');
INSERT INTO pertenece (codigoes, codigod) values('201832016','IE');
INSERT INTO pertenece (codigoes, codigod) values('202064973','DB');
INSERT INTO pertenece (codigoes, codigod) values('201930585','DC');
INSERT INTO pertenece (codigoes, codigod) values('201956396','DM');
INSERT INTO pertenece (codigoes, codigod) values('201801867','IM');
INSERT INTO pertenece (codigoes, codigod) values('201942204','AN');
INSERT INTO pertenece (codigoes, codigod) values('202078305','BI');
INSERT INTO pertenece (codigoes, codigod) values('201939164','DS');
INSERT INTO pertenece (codigoes, codigod) values('201993366','CS');
INSERT INTO pertenece (codigoes, codigod) values('201878498','IQ');
INSERT INTO pertenece (codigoes, codigod) values('201917658','IE');
INSERT INTO pertenece (codigoes, codigod) values('201813754','DB');
INSERT INTO pertenece (codigoes, codigod) values('202029040','DC');
INSERT INTO pertenece (codigoes, codigod) values('202060343','DM');
INSERT INTO pertenece (codigoes, codigod) values('201894936','IM');
INSERT INTO pertenece (codigoes, codigod) values('202075346','AN');
INSERT INTO pertenece (codigoes, codigod) values('202046070','BI');
INSERT INTO pertenece (codigoes, codigod) values('201850389','DS');
INSERT INTO pertenece (codigoes, codigod) values('201963551','CS');
INSERT INTO pertenece (codigoes, codigod) values('201866682','IQ');
INSERT INTO pertenece (codigoes, codigod) values('201829369','IE');
INSERT INTO pertenece (codigoes, codigod) values('201983335','DB');
INSERT INTO pertenece (codigoes, codigod) values('202070816','DC');
INSERT INTO pertenece (codigoes, codigod) values('201892119','DM');
INSERT INTO pertenece (codigoes, codigod) values('201827837','CS');
INSERT INTO pertenece (codigoes, codigod) values('201904337','CS');
INSERT INTO pertenece (codigoes, codigod) values('201927760','CS');
INSERT INTO pertenece (codigoes, codigod) values('201879772','CS');

-- El numero de proyectos que tiene cada departamento
select nombred, COUNT(nombred) as cuenta
from asesora NATURAL JOIN trabajad NATURAL JOIN departamento
GROUP BY nombred
ORDER BY cuenta;

-- 2. Listar los profesores que son asesores y a la vez dirigen otros proyectos
SELECT P.nombreP
FROM (
    SELECT dnip FROM asesora
    INTERSECT
    SELECT dnip FROM proyecto
) T1 NATURAL JOIN profesor P;

-- 3. Profesores que nunca dirigieron proyectos

SELECT nombreP
FROM profesor
EXCEPT
(
    SELECT nombreP
    FROM Profesor NATURAL JOIN Proyecto
);

-- 4. Estudiantes que trabajaron en proyectos asesorados o dirigidos por el director de carrera.

SELECT nombreEs FROM
Estudiante natural join trabajap natural join proyecto
WHERE dniP IN (
    SELECT dniP from diriged
);

-- 5. Los estudiantes que estan en pregrado y postgrado que trabajaron en alg ́un proyecto
SELECT nombreEs AS Estudiante, nombre AS Proyecto, fecha AS ciclo
FROM epregrado NATURAL JOIN epostgrado NATURAL JOIN Estudiante NATURAL JOIN TrabajaP NATURAL JOIN Proyecto;

-- 6 Los profesores que asesoraron mas proyectos

SELECT nombreP, dniP, COUNT(codigop) AS "Cantidad de Proyectos asesorados"
FROM Asesora NATURAL JOIN Profesor
GROUP BY nombreP, dniP
HAVING COUNT(codigoP) = (
        SELECT max(T1.count) from(
            SELECT COUNT(codigoP)
            FROM Asesora
            GROUP BY dniP
        ) T1
    );

-- 7. Listar cantidad de proyectos por cada anos que se relazaron en UTEC.
SELECT EXTRACT(year FROM ffin) AS "año", COUNT(EXTRACT(year FROM ffin)) AS "Cantidad de Proyectos"
FROM proyecto
GROUP BY "año";

-- 8. Listar todos los integrantes de ”Ciencia de la Computaci ́on” que hayan participado en
-- alg ́un proyecto

SELECT nombreEs
FROM Estudiante NATURAL JOIN EPregrado NATURAL JOIN TrabajaP
WHERE EPregrado.carrera = 'Ciencia de la Computación'
ORDER BY nombreEs;

-- 9. Muestre el primero y segundo proyecto que tiene la mayor cantidad de participantes
SELECT codigoP, nombre, count(codigoEs) AS "Cantidad de Participantes"
FROM Proyecto NATURAL JOIN TrabajaP
GROUP BY codigoP, nombre
ORDER BY "Cantidad de Participantes" DESC
LIMIT 2;

-- 10. Muestre el proyecto que tiene la mayor duraci ́on
SELECT * FROM (
    SELECT nombre, age(fFin, fInicio) AS duracion
    FROM Proyecto
) T1
WHERE duracion = (
    SELECT max(T2.duracion)
    FROM (
        SELECT nombre, age(fFin, fInicio) AS duracion
        FROM Proyecto
    ) T2
);

-- 11. Muestre el cumplea ̃nos (d ́ıa, mes) y la edad del profesor/a con mayor cantidad de proyectos
-- asesorados



SELECT fNacimiento, nombreP, (extract(YEAR FROM current_date) - extract(YEAR FROM fNacimiento)) AS Edad FROM (
    SELECT dniP
    FROM asesora
    GROUP BY dniP
    HAVING COUNT(codigoP) = (
        SELECT max(T.count) FROM(
            SELECT dniP, COUNT(codigoP)
            from asesora
            GROUP BY dniP
        ) T
    )
) T2 natural join Profesor;

-- 12. Carreras que tienen las misma cantidad de proyectos

-- 13. Muestre el departamento con la menor cantidad de proyectos en los que han trabajado
-- por lo menos un alumno de postgrado.

-- 14. Cuantos profesores entre el rango de edad de 30 a 34 a ̃nos dirigen proyectos trabajados
-- por al menos un alumno de pregrado de Ciencia de la Computaci ́on
SELECT * FROM
(
    SELECT dniP, nombreP, (extract(YEAR FROM current_date) - extract(YEAR FROM fNacimiento)) AS Edad
    FROM profesor
) T1
NATURAL JOIN
(
    SELECT * FROM Estudiante NATURAL JOIN epregrado NATURAL JOIN TrabajaP NATURAL JOIN Proyecto NATURAL JOIN Profesor
    WHERE EPregrado.carrera = 'Ciencia de la Computación'
) T2
WHERE Edad BETWEEN 30 AND 34;
