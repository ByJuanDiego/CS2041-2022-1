set search_path to petrogas;
set datestyle=dmy;

-- (a) [6 points] PETROGAS solicita unas mejoras en su base de datos:

-- Agregar el atributo montopagado en la tabla venta, la misma que debe ser
-- actualizado cada vez que se realiza un pago o varios pagos de esa venta.
ALTER TABLE venta ADD COLUMN montopagado    DOUBLE PRECISION;
UPDATE venta SET montopagado = montototal WHERE montopagado IS NULL;
SELECT * FROM venta;

-- Debe permitir pagar una venta con efectivo y tarjeta de credito. (Ejemplo Si
-- el montototal es 100 se podria pagar 10 Soles en efectivo y el resto con tarjeta
-- credito o viceversa)

CREATE TABLE pagos(
    nro BIGINT,
    monto_efectivo DOUBLE PRECISION DEFAULT 0,
    monto_tarjeta DOUBLE PRECISION DEFAULT 0
);

ALTER TABLE pagos ADD FOREIGN KEY (nro) REFERENCES venta(nro);

CREATE OR REPLACE FUNCTION modificar() RETURNS TRIGGER AS $$
    BEGIN
        UPDATE venta SET montopagado = (NEW.monto_efectivo + NEW.monto_tarjeta)
        WHERE venta.nro = NEW.nro;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER actualizar_monto_pagado
BEFORE INSERT OR UPDATE ON pagos
FOR EACH ROW EXECUTE PROCEDURE modificar();

-- (b) [6 points] ¿Que clientes dejaron de comprarnos ’Gasolina 90’, ’Gasolina 95’, ’Gasolina 97’
-- hace 6 meses? [SQL y Algebra Relacional]

-- Algebra Relacional:

-- Q1 ← π nrodocumento, nombre (cliente ⨝ (nrodocumento = nrodocumentocli) venta ⨝ surtidor ⨝ (depositoid = id) deposito)
-- Q2 ← σ ((combustible = 'GALOSINA 90' ∨ combustible = 'GALOSINA 95' ∨ combustible = 'GALOSINA 97') ∧ (date('21-5-2022')-fecha) < interval('6 months')) (Q1)
-- Q3 ← π nrodocumento, nombre (cliente)
-- Q4 ← Q3 - Q2
-- Q4

-- SQL:
SELECT DISTINCT nrodocumento, nombre
FROM cliente
EXCEPT (
    SELECT DISTINCT C.nrodocumento, C.nombre
    FROM cliente C JOIN venta V ON C.nrodocumento = V.nrodocumentocli NATURAL JOIN surtidor S JOIN deposito D on S.depositoid = D.id
    WHERE age(current_date, V.fecha) < (INTERVAL '6 months')
    AND (
        combustible = 'GALOSINA 90' OR combustible = 'GALOSINA 95' OR combustible = 'GALOSINA 97'
    )
);


-- (c) [4 points] ¿Quien es el tercer cliente Top del ano 2021, respecto al nro de compras
-- realizadas y montos totales? y muestre la cantidad de compras que realiz´o en cada
-- mes.
SELECT * FROM (
    SELECT nombre, nrodocumentocli, count(nro) AS "Cantidad de Compras", sum(montototal) AS montos_totales
    FROM venta JOIN cliente on venta.nrodocumentocli = cliente.nrodocumento
    WHERE extract(YEAR FROM fecha) = '2021' -- Para filtrar las compras del 2021
    GROUP BY nombre, nrodocumentocli
    ORDER BY "Cantidad de Compras" DESC
    LIMIT 3
    ) T1
EXCEPT (
    select nombre, nrodocumentocli, count(nro) AS "Cantidad de Compras", sum(montototal) AS montos_totales
    FROM venta JOIN cliente on venta.nrodocumentocli = cliente.nrodocumento
    WHERE extract(YEAR FROM fecha) = '2021' -- Para filtrar las compras del 2021
    GROUP BY nombre, nrodocumentocli
    ORDER BY "Cantidad de Compras" DESC
    LIMIT 2
);

-- (d) [4 points] Transforme la siguiente consulta SQL a Algebra Relacional
SELECT *
FROM despachador D
WHERE D.nrodocumento NOT IN (
        SELECT nrodocumentodes
        FROM venta V
        WHERE montototal NOT BETWEEN 10 AND 50
    )
    AND D.sueldo = (
        SELECT MAX(sueldo)
        FROM despachador
        WHERE D.nrodocumento IN (
            SELECT V.nrodocumentodes
            FROM venta V
            GROUP BY V.nrodocumentodes
            HAVING COUNT(DISTINCT V.lado) = (
                SELECT COUNT(V.lado)
                FROM venta
            )
    )
);

-- Q1 ← π nrodocumentodes (σ montototal < 10 ∨ montototal > 50 (venta))
-- Q2 ← F<COUNT(lado)asCount> venta
-- Q3 ← π nrodocumentodes (σ lado=Count(venta x Q2)))
-- Q4 ← F<MAX(sueldo)MaxSueldo> despachador
-- Q5 ← π sueldo (σ sueldo=MaxSueldo ((despachador ⨝ (despachador.nrodocumento = Q3.nrodocumentodes) Q3) x Q4))
--
-- Q6 ← π nrodocumentodes (despachador - Q1)
-- Q7 ← (Q6 ⨝ despachador)
-- Q8 ← π<>(σ Q7.sueldo = Q5.sueldo (Q7 x Q5))
-- Q8
