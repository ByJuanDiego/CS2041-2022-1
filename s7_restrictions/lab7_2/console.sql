-- Delivery(_direccion_, _fecha_, _hora_, distrito, P.dni)
-- Persona(_dni_, nombre, fecha_nacimiento, genero, celular, apellidos)
-- Cliente(_P.dni_)
-- Empleado(_P.dni_, horario, activo, sueldo, dias_descanso)
-- Contrato(_numero_, _P.dni_, desde, hasta)
-- Repartidor(_P.dni_, placa_vehiculo, tipo_vehiculo)
-- Planilla(_P.dni_, area_trabajo)
-- Local(_direccion_, telefono, aforo, distrito)
-- Pago(_numeracion_, fecha_emision, metodo_pago, monto_total, subtotal, igv, D.direccion, D.fecha, D.hora)
-- Boleta(_P.numeracion_)
-- Factura(_P.numeracion_, razon_social, ruc)
-- Promocion(_codigo_, _C.fecha_preparacion_, _C.hora_preparacion_, descuento, fecha_inicio, fecha_fin)
-- Comida(_fecha_preparacion_, _nombre_, _hora_preparacion_, foto, categoria, descripcion, precio_venta)
-- Ingrediente(_nombre_, stock, precio_compra)
--
-- Pedido(_C.fecha_preparacion_, _C.nombre_, _C.hora_preparacion_, _D.direccion_, _D.fecha_, _D.hora_, _P.dni_, cantidad)
-- Entrega(_D.hora_, _D.fecha_, _D.direccion_, _P.dni_)
-- Trabaja(_P.dni_, _L.direccion_)
-- Recibe(_L.direccion_, _P.numeracion_)
-- Requiere(_I.nombre_, _C.fecha_preparacion_, _C.hora_preparacion_, _C.nombre_, _L.direccion_)
--

-- DROP SCHEMA romania5lab101 CASCADE;
-- CREATE SCHEMA romania5lab101;
SET search_path TO romania5lab101;
-- a)

-- Entidades
CREATE TABLE delivery(
    direccion VARCHAR(100),
    fecha DATE,
    hora TIME,
    distrito VARCHAR(20),
    dni VARCHAR(8)
);

CREATE TABLE persona(
    dni VARCHAR(8),
    nombre VARCHAR(20),
    fecha_nacimiento DATE,
    genero VARCHAR(1),
    celular VARCHAR(15),
    apellidos VARCHAR(20)
);

CREATE TABLE cliente(
    dni VARCHAR(8)
);

CREATE TABLE empleado(
    dni VARCHAR(8),
    horario VARCHAR(20),
    activo BOOLEAN,
    sueldo INTEGER,
    dias_descanso INTEGER
);

CREATE TABLE contrato(
    numero INTEGER,
    dni VARCHAR(8),
    desde DATE,
    hasta DATE
);

CREATE TABLE repartidor(
    dni VARCHAR(8),
    placa_vehiculo VARCHAR(7),
    tipo_vehiculo VARCHAR(30)
);

CREATE TABLE planilla(
    dni VARCHAR(8),
    area_trabajo VARCHAR(30)
);

CREATE TABLE local(
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    aforo INTEGER,
    distrito VARCHAR(50)
);

CREATE TABLE pago(
    numeracion VARCHAR,
    fecha_emision DATE,
    metodo_pago VARCHAR(20),
    monto_total DOUBLE PRECISION,
    subtotal DOUBLE PRECISION,
    igv DOUBLE PRECISION,
    direccion VARCHAR(100),
    fecha DATE,
    hora TIME
);


CREATE TABLE boleta(
    numeracion VARCHAR
);

CREATE TABLE factura(
    numeracion VARCHAR,
    razon_social VARCHAR(100),
    ruc VARCHAR(100)
);

CREATE TABLE promocion(
    codigo INTEGER,
    fecha_preparacion DATE,
    hora_preparacion TIME,
    nombre VARCHAR,
    descuento DOUBLE PRECISION,
    fecha_inicio DATE,
    fecha_fin DATE
);


CREATE TABLE comida(
    fecha_preparacion DATE,
    nombre VARCHAR,
    hora_preparacion TIME,
    foto VARCHAR,
    categoria VARCHAR,
    descripcion VARCHAR,
    precio_venta DOUBLE PRECISION
);

CREATE TABLE ingrediente(
    nombre VARCHAR,
    stock INTEGER,
    precio_compra DOUBLE PRECISION
);

-- Relaciones

CREATE TABLE pedido(
	fecha_preparacion DATE,
	nombre VARCHAR(40),
	hora_preparacion TIME,
	direccion VARCHAR(100),
	fecha DATE,
	hora TIME,
	dni VARCHAR(8),
	cantidad SMALLINT
);

CREATE TABLE entrega(
	hora TIME,
	fecha DATE,
	direccion VARCHAR(100),
	dni VARCHAR(8)
);

CREATE TABLE trabaja(
	dni VARCHAR(8),
	direccion VARCHAR(100)
);

CREATE TABLE recibe(
	direccion VARCHAR(100),
	numeracion VARCHAR
);

CREATE TABLE requiere(
	nombreI VARCHAR(20),
	fecha_preparacion DATE,
	hora_preparacion TIME,
	nombreC VARCHAR(40),
	direccion VARCHAR(100)
);


-- b)
ALTER TABLE delivery ADD CONSTRAINT pk_delivery_direccion_fecha_hora PRIMARY KEY (direccion, fecha, hora);
ALTER TABLE persona ADD CONSTRAINT pk_persona_dni PRIMARY KEY (dni);
ALTER TABLE cliente ADD CONSTRAINT pk_cliente_dni PRIMARY KEY (dni);
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_dni FOREIGN KEY (dni) REFERENCES persona(dni);
ALTER TABLE empleado ADD CONSTRAINT pk_empleado_dni PRIMARY KEY (dni);
ALTER TABLE empleado ADD CONSTRAINT fk_empleado_dni FOREIGN KEY (dni) REFERENCES persona(dni);
ALTER TABLE contrato ADD CONSTRAINT pk_contrato_numero_dni PRIMARY KEY (numero, dni);
ALTER TABLE contrato ADD CONSTRAINT fk_contrato_dni FOREIGN KEY (dni) REFERENCES persona(dni);
ALTER TABLE repartidor ADD CONSTRAINT pk_repartidor_dni_placa_tipo PRIMARY KEY (dni, placa_vehiculo, tipo_vehiculo);
ALTER TABLE repartidor ADD CONSTRAINT fk_repartidor_dni FOREIGN KEY (dni) REFERENCES persona(dni);
ALTER TABLE planilla ADD CONSTRAINT pk_planilla_dni_area PRIMARY KEY (dni, area_trabajo);
ALTER TABLE planilla ADD CONSTRAINT fk_planilla_dni FOREIGN KEY (dni) REFERENCES persona(dni);
ALTER TABLE local ADD CONSTRAINT pk_direccion_direccion PRIMARY KEY (direccion);
ALTER TABLE pago ADD CONSTRAINT pk_pago_numeracion PRIMARY KEY (numeracion);
ALTER TABLE pago ADD CONSTRAINT fk_pago_direccion_fecha_hora FOREIGN KEY (direccion, fecha, hora) REFERENCES delivery(direccion, fecha, hora);
ALTER TABLE boleta ADD CONSTRAINT pk_boleta_numeracion PRIMARY KEY (numeracion);
ALTER TABLE boleta ADD CONSTRAINT fk_boleta_numeracion FOREIGN KEY (numeracion) REFERENCES pago(numeracion);
ALTER TABLE factura ADD CONSTRAINT pk_factura_numeracion PRIMARY KEY (numeracion);
ALTER TABLE factura ADD CONSTRAINT fk_factura_numeracion FOREIGN KEY (numeracion) REFERENCES pago(numeracion);

ALTER TABLE promocion ADD CONSTRAINT pk_promocion_codigo_fecha_hora_nombre PRIMARY KEY (codigo, fecha_preparacion, hora_preparacion, nombre);
ALTER TABLE comida ADD CONSTRAINT pk_comida_nombre_fecha_hora PRIMARY KEY (nombre, fecha_preparacion, hora_preparacion);
ALTER TABLE promocion ADD CONSTRAINT fk_promocion_fecha_hora_nombre FOREIGN KEY (fecha_preparacion, hora_preparacion, nombre) REFERENCES comida(fecha_preparacion, hora_preparacion, nombre);


ALTER TABLE ingrediente ADD CONSTRAINT pk_ingrediente_nombre PRIMARY KEY (nombre);
ALTER TABLE pedido ADD CONSTRAINT pk_pedido PRIMARY KEY (nombre, fecha_preparacion, hora_preparacion, direccion, fecha, hora, dni);
ALTER TABLE pedido ADD CONSTRAINT fk_pedido_comida FOREIGN KEY (nombre, fecha_preparacion, hora_preparacion) REFERENCES comida(nombre, fecha_preparacion, hora_preparacion);

ALTER TABLE pedido ADD CONSTRAINT fk_pedido_delivery FOREIGN KEY (fecha, direccion, hora) REFERENCES delivery(fecha, direccion, hora);

ALTER TABLE pedido ADD CONSTRAINT fk_pedido_dni FOREIGN KEY (dni) REFERENCES persona(dni);
ALTER TABLE entrega ADD CONSTRAINT pk_entrega_hora_fecha_direccion_dni PRIMARY KEY (hora, fecha, direccion, dni);
ALTER TABLE entrega ADD CONSTRAINT fk_entrega_delivery FOREIGN KEY (fecha, direccion, hora) REFERENCES delivery(fecha, direccion, hora);

ALTER TABLE entrega ADD CONSTRAINT fk_entrega_dni FOREIGN KEY (dni) REFERENCES persona(dni);
ALTER TABLE trabaja ADD CONSTRAINT pk_trabaja_dni_direccion PRIMARY KEY (dni, direccion);
ALTER TABLE trabaja ADD CONSTRAINT fk_trabaja_dni FOREIGN KEY (dni) REFERENCES persona(dni);
ALTER TABLE trabaja ADD CONSTRAINT fk_trabaja_direccion FOREIGN KEY (direccion) REFERENCES local(direccion);
ALTER TABLE recibe ADD CONSTRAINT pk_recibe_direccion_numeracion PRIMARY KEY (direccion, numeracion);
ALTER TABLE recibe ADD CONSTRAINT fk_recibe_direccion FOREIGN KEY (direccion) REFERENCES local(direccion);
ALTER TABLE recibe ADD CONSTRAINT fk_recibe_numeracion FOREIGN KEY (numeracion) REFERENCES pago(numeracion);
ALTER TABLE requiere ADD CONSTRAINT pk_nombrei_fecha_hora_nombrec_direccion PRIMARY KEY (nombrei, fecha_preparacion, hora_preparacion, nombrec, direccion);
ALTER TABLE requiere ADD CONSTRAINT fk_requiere_nombrei FOREIGN KEY (nombrei) REFERENCES ingrediente(nombre);
ALTER TABLE requiere ADD CONSTRAINT fk_requiere_comida FOREIGN KEY (fecha_preparacion, hora_preparacion, nombreC) REFERENCES comida(fecha_preparacion, hora_preparacion, nombre);
ALTER TABLE requiere ADD CONSTRAINT fk_requiere_local FOREIGN KEY (direccion) REFERENCES local(direccion);

-- c
ALTER TABLE pago ADD CONSTRAINT numeracion_inicia_p CHECK (numeracion LIKE 'P%');
ALTER TABLE delivery ADD CONSTRAINT horario_es_valido CHECK (hora > '9:00' AND hora < '23:00');
ALTER TABLE promocion ADD CONSTRAINT promocion_menos_dos_dias CHECK (EXTRACT(DAY FROM fecha_fin) - EXTRACT(DAY FROM fecha_inicio) < 2);
ALTER TABLE contrato ADD CONSTRAINT contratos_tres_meses CHECK (EXTRACT(MONTH FROM hasta) - EXTRACT(MONTH FROM desde) = 3);
ALTER TABLE local ADD CONSTRAINT aforo_max CHECK (aforo < 50);

ALTER TABLE delivery ALTER COLUMN distrito SET NOT NULL;
ALTER TABLE delivery ALTER COLUMN dni SET NOT NULL;

ALTER TABLE persona ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE persona ALTER COLUMN fecha_nacimiento SET NOT NULL;
ALTER TABLE persona ALTER COLUMN genero SET NOT NULL;
ALTER TABLE persona ALTER COLUMN celular SET NOT NULL;
ALTER TABLE persona ALTER COLUMN apellidos SET NOT NULL;

ALTER TABLE empleado ALTER COLUMN horario SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN activo SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN sueldo SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN dias_descanso SET NOT NULL;

ALTER TABLE contrato ALTER COLUMN desde SET NOT NULL;
ALTER TABLE contrato ALTER COLUMN hasta SET NOT NULL;

ALTER TABLE repartidor ALTER COLUMN placa_vehiculo SET NOT NULL;
ALTER TABLE repartidor ALTER COLUMN tipo_vehiculo SET NOT NULL;

ALTER TABLE planilla ALTER COLUMN area_trabajo SET NOT NULL;

ALTER TABLE local ALTER COLUMN telefono SET NOT NULL;
ALTER TABLE local ALTER COLUMN aforo SET NOT NULL;
ALTER TABLE local ALTER COLUMN distrito SET NOT NULL;

ALTER TABLE pago ALTER COLUMN fecha_emision SET NOT NULL;
ALTER TABLE pago ALTER COLUMN metodo_pago SET NOT NULL;
ALTER TABLE pago ALTER COLUMN monto_total SET NOT NULL;
ALTER TABLE pago ALTER COLUMN subtotal SET NOT NULL;
ALTER TABLE pago ALTER COLUMN igv SET NOT NULL;
ALTER TABLE pago ALTER COLUMN direccion SET NOT NULL;
ALTER TABLE pago ALTER COLUMN fecha SET NOT NULL;
ALTER TABLE pago ALTER COLUMN hora SET NOT NULL;

ALTER TABLE factura ALTER COLUMN ruc SET NOT NULL;

ALTER TABLE promocion ALTER COLUMN descuento SET NOT NULL;
ALTER TABLE promocion ALTER COLUMN fecha_inicio SET NOT NULL;
ALTER TABLE promocion ALTER COLUMN fecha_fin SET NOT NULL;

ALTER TABLE comida ALTER COLUMN foto SET NOT NULL;
ALTER TABLE comida ALTER COLUMN categoria SET NOT NULL;
ALTER TABLE comida ALTER COLUMN descripcion SET NOT NULL;
ALTER TABLE comida ALTER COLUMN precio_venta SET NOT NULL;

ALTER TABLE ingrediente ALTER COLUMN stock SET NOT NULL;
ALTER TABLE ingrediente ALTER COLUMN precio_compra SET NOT NULL;

ALTER TABLE pedido ALTER COLUMN cantidad SET NOT NULL;

ALTER TABLE persona ALTER COLUMN celular TYPE VARCHAR(9);
ALTER TABLE persona ADD CONSTRAINT numero_celular_p CHECK (celular LIKE '9%');

CREATE SEQUENCE secuencia_contrato
    START WITH 100
    INCREMENT BY 5;

ALTER TABLE contrato ALTER COLUMN numero SET DEFAULT nextval('secuencia_contrato');

-- d)

INSERT INTO persona (dni,nombre,apellidos,celular,genero,fecha_nacimiento) VALUES
  ('3773912','Clio','Miranda','945617946','F','1999-07-01'),
  ('1384973','Guinevere','Johnston','963236530','F','1999-07-25'),
  ('0377884','Dane','Hodge','971661319','F','1998-12-11'),
  ('6497875','Damon','Mcgee','946508557','M','1997-01-24'),
  ('6468764','Fiona','Kelley','968116349','F','1997-09-06'),
  ('6650937','Theodore','Hewitt','944602789','M','2003-06-02'),
  ('7116287','Merritt','Camacho','956213766','F','2003-04-05'),
  ('5282312','Hamilton','Gonzalez','922313747','M','2002-10-21'),
  ('1107165','Halla','Sweeney','943672525','F','2002-06-16'),
  ('6882835','Plato','Mendez','911372987','M','1999-12-26');

INSERT INTO local (direccion,telefono,aforo,distrito) VALUES
  ('195-5601 Tellus St.','9782754',29,'Chancay'),
  ('Ap #458-6334 Vulputate St.','952311366',15,'Chimbote'),
  ('Ap #841-8358 Malesuada Ave','987138281',23,'Huaraz'),
  ('8709 Natoque Ave','0235229',48,'Cajamarca'),
  ('Ap #841-4716 Adipiscing Av.','7851866',27,'Huancayo');

INSERT INTO ingrediente (nombre, stock, precio_compra) VALUES
  ('libero',2,124.8),
  ('elementum',8,19.8),
  ('elit',5,44.8),
  ('Nulla',4,56.8),
  ('euismod',46,62.8);

INSERT INTO delivery (direccion,fecha,hora,distrito,dni) VALUES
  ('Ap #384-3254 Nostra, Rd.','Feb 12, 2023','2:50 PM','Junín','3773912'),
  ('486-5282 Erat St.','Jan 26, 2022','9:43 PM','Lambayeque','3773912'),
  ('703-8817 In, Rd.','Feb 8, 2022','8:59 PM','Ancash','1384973'),
  ('5623 Dui Av.','Jun 11, 2021','12:06 PM','Cusco','7116287'),
  ('Ap #797-6202 Nostra, Road','Nov 21, 2021','4:19 PM','Lambayeque','1107165'),
  ('Ap #354-1130 Natoque Street','Aug 3, 2022','10:47 AM','Junín','6882835'),
  ('Ap #445-3082 Sit Rd.','Aug 8, 2022','5:09 PM','Arequipa','0377884'),
  ('P.O. Box 831, 8770 Blandit St.','Feb 11, 2023','1:00 PM','La Libertad','0377884'),
  ('P.O. Box 427, 6938 Dui. Avenue','Apr 17, 2022','10:03 PM','Piura','0377884'),
  ('178-2054 Ultricies Ave','Aug 25, 2021','7:19 PM','Ancash','0377884');

-- ------------------------ NO SE PUEDE HACER AAAAA ----------------------
-- ALTER TABLE pago ALTER COLUMN igv SET DEFAULT (subtotal * 0.18);
-- ALTER TABLE pago ALTER COLUMN monto_total SET DEFAULT (subtotal + pago.igv);
-- -----------------------------------------------------------------------

INSERT INTO pago (numeracion, fecha_emision, metodo_pago, subtotal, monto_total, igv, direccion, fecha, hora)
VALUES
  ('P781','2022-03-10','efectivo',117.65, 117.65+0.18*117.65, 0.18*117.65, 'Ap #384-3254 Nostra, Rd.','Feb 12, 2023','2:50 PM'),
  ('P377','2022-03-28','tarjeta',61.65,61.65+0.18*61.65, 0.18*61.65,'486-5282 Erat St.','Jan 26, 2022','9:43 PM'),
  ('P225','2022-03-03','tarjeta',161.65,161.65+0.18*161.65, 0.18*161.65,'703-8817 In, Rd.','Feb 8, 2022','8:59 PM'),
  ('P782','2021-03-25','tarjeta',193.65,193.65+0.18*193.65, 0.18*193.65,'5623 Dui Av.','Jun 11, 2021','12:06 PM'),
  ('P927','2021-03-08','efectivo',126.65,126.65+0.18*126.65, 0.18*126.65,'Ap #797-6202 Nostra, Road','Nov 21, 2021','4:19 PM'),
  ('P357','2021-03-14','efectivo',197.65,197.65+0.18*197.65, 0.18*197.65,'Ap #354-1130 Natoque Street','Aug 3, 2022','10:47 AM'),
  ('P868','2021-03-23','efectivo',142.65,142.65+0.18*142.65, 0.18*142.65,'Ap #445-3082 Sit Rd.','Aug 8, 2022','5:09 PM'),
  ('P486','2022-04-10','efectivo',194.65,194.65+0.18*194.65, 0.18*194.65,'P.O. Box 831, 8770 Blandit St.','Feb 11, 2023','1:00 PM'),
  ('P753','2021-04-10','tarjeta',169.65,169.65+0.18*169.65, 0.18*169.65,'P.O. Box 427, 6938 Dui. Avenue','Apr 17, 2022','10:03 PM'),
  ('P480','2022-03-13','efectivo',53.65,53.65+0.18*53.65, 0.18*53.65,'178-2054 Ultricies Ave','Aug 25, 2021','7:19 PM');

INSERT INTO factura(numeracion, razon_social, ruc) VALUES
 ('P781', 'ASD', '25608783190'),
 ('P377', 'BSD', '24608783192'),
 ('P225', 'CSD', '23608783190'),
 ('P782', 'DSD', '22605783490'),
 ('P927', 'ESD', '21103753690'),
 ('P357', 'FSD', '20602153698'),
 ('P868', 'GSD', '29167890140'),
 ('P486', 'HSD', '28431784510'),
 ('P753', 'ISD', '27605432310'),
 ('P480', 'JSD', '26467853190');

-- e)
INSERT INTO planilla (dni, area_trabajo) VALUES
 ('6650937', 'Cocina'),
 ('7116287', 'Cocina'),
 ('5282312', 'Cocina');

INSERT INTO comida (fecha_preparacion, nombre, hora_preparacion, foto, categoria, descripcion, precio_venta) VALUES
 ('2017-2-1', 'Lomo Saltado', '8:50 PM', 'lomo.png', 'Almuerzo', 'Buenazo.', 59.99),
 ('2017-2-2', 'Pollo Saltado', '7:50 PM', 'lomo.png', 'Almuerzo', 'Buenazo.', 59.99),
 ('2017-2-2', 'Chancho Saltado', '6:50 PM', 'lomo.png', 'Almuerzo', 'Buenazo.', 59.99),
 ('2017-2-3', 'Pavo Saltado', '8:50 PM', 'lomo.png', 'Almuerzo', 'Buenazo.', 59.99),
 ('2017-2-3', 'Lomo a lo pobre', '7:50 PM', 'lomo.png', 'Almuerzo', 'Buenazo.', 59.99),
 ('2017-3-1', 'Lomo a la pimienta', '9:50 PM', 'lomo.png', 'Almuerzo', 'Buenazo.', 59.99),
 ('2017-4-1', 'Causa', '8:50 PM', 'causa.png', 'Entrada', 'Buenazo.', 29.99);

INSERT INTO pedido (fecha_preparacion, nombre, hora_preparacion, direccion, fecha, hora, dni, cantidad) VALUES
 ('2022-05-10', 'Lomo Saltado', '01:47:06.910059', 'Ap #384-3254 Nostra, Rd.', '2023-02-12', '14:50', '6650937',2),
 ('2017-02-01','Lomo Saltado', '20:50:00', '486-5282 Erat St.', '2022-01-26', '21:43', '6650937', 5),
 ('2017-02-02','Pollo Saltado', '19:50', '703-8817 In, Rd.','2022-02-08', '20:59','6650937',3),
 ('2017-02-02','Chancho Saltado', '18:50', '5623 Dui Av.','2021-06-11','12:06','6650937',1),
 ('2017-02-03','Pavo Saltado', '20:50', 'Ap #797-6202 Nostra, Road', '2021-11-21', '16:19', '7116287', 6),
 ('2017-02-03','Lomo a lo pobre', '19:50', 'Ap #354-1130 Natoque Street','2022-08-03', '10:47','7116287', 3),
 ('2017-03-01','Lomo a la pimienta', '21:50', 'Ap #445-3082 Sit Rd.', '2022-08-08', '17:09','5282312', 2),
 ('2017-04-01','Causa', '20:50', 'P.O. Box 831, 8770 Blandit St.', '2023-02-11', '13:00','5282312', 2);

SELECT p.dni, COUNT((c.nombre, c.fecha_preparacion, c.hora_preparacion)) AS cuenta
FROM planilla JOIN persona p on planilla.dni = p.dni JOIN pedido p2 on p.dni = p2.dni JOIN comida c on (p2.fecha_preparacion = c.fecha_preparacion AND p2.hora_preparacion = c.hora_preparacion AND p2.nombre = c.nombre)
WHERE planilla.area_trabajo = 'Cocina'
GROUP BY p.dni;

-- f)
SELECT TO_CHAR(TO_DATE(EXTRACT(MONTH FROM fecha_emision)::text, 'MM'), 'Month') as mes , count(fecha_emision) as cuenta
FROM pago
WHERE EXTRACT(YEAR FROM fecha_emision) = 2021
GROUP BY EXTRACT (MONTH FROM fecha_emision), mes;
