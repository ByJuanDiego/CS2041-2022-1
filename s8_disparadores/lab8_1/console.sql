-- CREATE SCHEMA petrogas202010062;

--CREATE SCHEMA "estacion";
set search_path to petrogas202010062;
CREATE TABLE combustible(
	nombre VARCHAR(10)
);
CREATE TABLE deposito (
	id varchar(4),
	dimension VARCHAR(10),
	capacidad int,
	abastecido int,
	combustible VARCHAR(10)
);
CREATE TABLE proveedor(
	placa VARCHAR(6),
	nrolicencia VARCHAR(10)
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
	nrodocumento VARCHAR(8),
	sueldo int
);
CREATE TABLE cliente(
	nrodocumento VARCHAR(8)
);
CREATE TABLE surtidor (
	nroserie VARCHAR(12),
	lado VARCHAR(1),
	marca VARCHAR(15),
	depositoid varchar(4)
);

CREATE TABLE venta(
	nro bigint,
	nrodocumentocli VARCHAR(8),
	nrodocumentodes VARCHAR(8),
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

INSERT INTO combustible VALUES('GALOSINA');
INSERT INTO combustible VALUES('GAS');
INSERT INTO combustible VALUES('PETROLEO');
INSERT INTO proveedor VALUES ('ABC123','12345678');
INSERT INTO proveedor VALUES ('ABC124','12345670');

INSERT INTO deposito VALUES ('1','10x52x30',10000,0,'GALOSINA');
INSERT INTO deposito VALUES ('2','10x52x30',3000,0,'GAS');
INSERT INTO deposito VALUES ('3','10x52x30',5000,0,'PETROLEO');

INSERT INTO abastecimiento VALUES (1,(SELECT now()),'1','ABC123','12345678',100, 12);
INSERT INTO abastecimiento VALUES (2,(SELECT now()),'2','ABC123','12345678',50, 12);
INSERT INTO abastecimiento VALUES (3,(SELECT now()),'3','ABC123','12345678',50, 12);
INSERT INTO abastecimiento VALUES (4,(SELECT now()),'1','ABC124','12345670',200, 12.0);
INSERT INTO abastecimiento VALUES (5,(SELECT now()),'2','ABC124','12345670',70, 12.2);
INSERT INTO abastecimiento VALUES (6,(SELECT now()),'3','ABC124','12345670',60, 12.5);

INSERT INTO despachador VALUES ('4214154', 2000);
INSERT INTO despachador VALUES ('4214153', 2700);
INSERT INTO cliente VALUES ('000001');

INSERT INTO surtidor VALUES('S001','A','DESCONOCIDO','1');
INSERT INTO surtidor VALUES('S001','B','DESCONOCIDO','1');
INSERT INTO surtidor VALUES('S002','A','DESCONOCIDO','1');
INSERT INTO surtidor VALUES('S002','B','DESCONOCIDO','1');

INSERT INTO venta VALUES (1,'000001', '4214154','S001','A',(SELECT now()),10,12,120);
INSERT INTO venta VALUES (2,'000001', '4214154','S001','A',(SELECT now()),15,20,300);
INSERT INTO venta VALUES (3,'000001', '4214154','S001','A',(SELECT now()),2,12,24);
INSERT INTO venta VALUES (4,'000001', '4214154','S001','A',(SELECT now()),1,12,12);


-- Elabore una funcion o store procedure para obtener la ventas por dia de un mes y ano especifico
CREATE OR REPLACE FUNCTION get_venta_by_dayyear(p_mes INTEGER, p_anhio INTEGER)
RETURNS TABLE(dia numeric, totalventa double precision, cantidadventa double precision) AS
$$
BEGIN
 RETURN QUERY
 	SELECT  EXTRACT( DAY FROM fecha) AS dia, SUM(cantidad * preciounitario) as totalventa, SUM(cantidad) as cantidadventa
	FROM venta
	WHERE EXTRACT( MONTH FROM fecha) = p_mes AND
		  EXTRACT( YEAR FROM fecha) = p_anhio
	GROUP BY dia;
END;
$$ LANGUAGE plpgsql;

SELECT get_venta_by_dayyear(5, 2022);

create table logged_actions (
    schema_name text not null,
    table_name text not null,
    user_name text,
    action_tstamp timestamp with time zone not null default current_timestamp,
    action TEXT NOT NULL check (action in ('I','D','U')),
    original_data text,
    new_data text,
    query text
) ;


CREATE OR REPLACE FUNCTION func_auditoria() RETURNS trigger AS $body$
DECLARE
    v_old_data TEXT;
    v_new_data TEXT;
BEGIN

    if (TG_OP = 'UPDATE') then
        v_old_data := ROW(OLD.*);
        v_new_data := ROW(NEW.*);
        insert into logged_actions (schema_name,table_name,user_name,action,original_data,new_data,query)
        values (TG_TABLE_SCHEMA::TEXT,TG_TABLE_NAME::TEXT,session_user::TEXT,substring(TG_OP,1,1),v_old_data,v_new_data, current_query());
        RETURN NEW;
    elsif (TG_OP = 'DELETE') then
        v_old_data := ROW(OLD.*);
        insert into logged_actions (schema_name,table_name,user_name,action,original_data,query)
        values (TG_TABLE_SCHEMA::TEXT,TG_TABLE_NAME::TEXT,session_user::TEXT,substring(TG_OP,1,1),v_old_data, current_query());
        RETURN OLD;
    elsif (TG_OP = 'INSERT') then
        v_new_data := ROW(NEW.*);
        insert into logged_actions (schema_name,table_name,user_name,action,new_data,query)
        values (TG_TABLE_SCHEMA::TEXT,TG_TABLE_NAME::TEXT,session_user::TEXT,substring(TG_OP,1,1),v_new_data, current_query());
        RETURN NEW;
    else
        RAISE WARNING '[IF_MODIFIED_FUNC] - Other action occurred: %, at %',TG_OP,now();
        RETURN NULL;
    end if;

EXCEPTION
    WHEN data_exception THEN
        RAISE WARNING '[IF_MODIFIED_FUNC] - UDF ERROR [DATA EXCEPTION] - SQLSTATE: %, SQLER RM: %',SQLSTATE,SQLERRM;
        RETURN NULL;
    WHEN unique_violation THEN
        RAISE WARNING '[IF_MODIFIED_FUNC] - UDF ERROR [UNIQUE] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;
        RETURN NULL;
    WHEN others THEN
        RAISE WARNING '[IF_MODIFIED_FUNC] - UDF ERROR [OTHER] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;
        RETURN NULL;
END;
$body$
LANGUAGE plpgsql;


CREATE TRIGGER auditoria_venta
AFTER INSERT OR UPDATE OR DELETE ON venta
FOR EACH ROW EXECUTE PROCEDURE func_auditoria();

INSERT INTO venta VALUES (8,'000001', '4214154','S001','A',(SELECT now()),1,12,12);
UPDATE venta SET cantidad = 150 WHERE nro = 11;

SELECT * FROM logged_actions;
