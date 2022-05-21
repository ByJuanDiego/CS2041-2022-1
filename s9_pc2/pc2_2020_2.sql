set search_path to pc2_2020_2_202010062;

-- Persona(_PersonaId_, TipoDocumento, NroDocumento, Nombres, Email, Celular)
-- Tramite(_Codigo_, Descripcion)
-- Agenda(_AgendaId_, T.TramiteId, Fecha, HoraInicio, HoraFin, Cupos)
-- Reserva(_Correlativo_, A.AgendaId, P.PersonaId, Estado, Fecha, Cancelacion, Reprogramacion, Atencion)

CREATE TABLE Persona(
    PersonaID       varchar,
    TipoDocumento   varchar(1),
    NroDocumento    varchar,
    Nombres         varchar,
    Email           varchar,
    Celular         varchar
);

CREATE TABLE Tramite(
    Codigo          varchar,
    Descripcion     varchar
);

CREATE TABLE Agenda(
    AgendaID        varchar,
    TramiteId       varchar,
    Fecha           date,
    HoraInicio      timestamp without time zone,
    HoraFin         timestamp without time zone,
    Cupos           int
);

CREATE TABLE Reserva(
    Correlativo     varchar,
    AgendaId        varchar,
    PersonaId       varchar,
    Estado          varchar,
    Fecha           date,
    Cancelacion     date,
    Reprogramacion  date,
    Atencion        date
);

-- PRIMARY KEYs
ALTER TABLE Persona ADD CONSTRAINT persona_pk PRIMARY KEY (PersonaID);
ALTER TABLE Tramite ADD CONSTRAINT tramite_pk PRIMARY KEY (Codigo);
ALTER TABLE Agenda  ADD CONSTRAINT agenda_pk  PRIMARY KEY (AgendaID);
ALTER TABLE Reserva ADD CONSTRAINT reserva_pk PRIMARY KEY (Correlativo);

-- FOREIGN KEYs
ALTER TABLE Agenda  ADD CONSTRAINT agenda_fk FOREIGN KEY (TramiteId) REFERENCES Tramite(Codigo);

ALTER TABLE Reserva ADD CONSTRAINT reserva_fk_agendaid  FOREIGN KEY (AgendaID)  REFERENCES Agenda(AgendaID);
ALTER TABLE Reserva ADD CONSTRAINT resreva_fk_personaid FOREIGN KEY (PersonaId) REFERENCES Persona(PersonaID);

-- NOT NULLS
ALTER TABLE Persona ALTER COLUMN PersonaID      SET NOT NULL;
ALTER TABLE Persona ALTER COLUMN TipoDocumento  SET NOT NULL;
ALTER TABLE Persona ALTER COLUMN NroDocumento   SET NOT NULL;
ALTER TABLE Persona ALTER COLUMN Nombres        SET NOT NULL;
ALTER TABLE Persona ALTER COLUMN Email          SET NOT NULL;
ALTER TABLE Persona ALTER COLUMN Celular        SET NOT NULL;

ALTER TABLE Tramite ALTER COLUMN Codigo         SET NOT NULL;
ALTER TABLE Tramite ALTER COLUMN Descripcion    SET NOT NULL;

ALTER TABLE Agenda  ALTER COLUMN AgendaID       SET NOT NULL;
ALTER TABLE Agenda  ALTER COLUMN TramiteId      SET NOT NULL;
ALTER TABLE Agenda  ALTER COLUMN Fecha          SET NOT NULL;
ALTER TABLE Agenda  ALTER COLUMN HoraInicio     SET NOT NULL;
ALTER TABLE Agenda  ALTER COLUMN HoraFin        SET NOT NULL;
ALTER TABLE Agenda  ALTER COLUMN Cupos          SET NOT NULL;

ALTER TABLE Reserva ALTER COLUMN Correlativo    SET NOT NULL;
ALTER TABLE Reserva ALTER COLUMN AgendaId       SET NOT NULL;
ALTER TABLE Reserva ALTER COLUMN PersonaId      SET NOT NULL;
ALTER TABLE Reserva ALTER COLUMN Estado         SET NOT NULL;
ALTER TABLE Reserva ALTER COLUMN Fecha          SET NOT NULL;
ALTER TABLE Reserva ALTER COLUMN Cancelacion    SET NOT NULL;
ALTER TABLE Reserva ALTER COLUMN Reprogramacion SET NOT NULL;
ALTER TABLE Reserva ALTER COLUMN Atencion       SET NOT NULL;

-- Constraints
ALTER TABLE Persona ADD CONSTRAINT tipo_documento_check CHECK (TipoDocumento = '1' OR TipoDocumento = '2');
ALTER TABLE Persona ADD CONSTRAINT tipodocumento_nrodocumento_unique UNIQUE (TipoDocumento, NroDocumento);

ALTER TABLE Agenda  ADD CONSTRAINT atencion_fechafin_fechainicio_check CHECK (
    extract(YEAR FROM age(HoraFin, HoraInicio)) = 0
        AND
    extract(MONTH FROM age(HoraFin, HoraInicio)) = 0
        AND
    extract(DAY FROM age(HoraFin, HoraInicio)) = 0
        AND
    extract(MINUTE FROM age(HoraFin, HoraInicio)) <= 30
);

ALTER TABLE Reserva ADD CONSTRAINT estado_check CHECK (
    Estado = '0' OR Estado = '1' OR Estado = '2' OR Estado = '3'
);

set search_path to pc2020_2;

SELECT * FROM (
    SELECT A.horainicio, A.horafin, A.tramiteid, COUNT(*) AS cant
    FROM reserva R natural join agenda A
    WHERE R.estado = 1
    GROUP BY (A.horainicio, A.horafin, A.tramiteid)
    ) R1
    WHERE cant = (
        SELECT max(cant1)
        FROM (
            SELECT A.horainicio, A.horafin, A.tramiteid, COUNT(*) AS cant1
            FROM reserva R natural join agenda A
            WHERE R.estado = 1
            GROUP BY (A.horainicio, A.horafin, A.tramiteid)
        ) R2
);

SELECT
    CASE P.tipodocumento
        WHEN P.tipodocumento = 1 THEN  'DNI'
        WHEN P.tipodocumento = 2 THEN  'CE'
    END,
    P.nrodocumento,
    P.nombres
FROM persona P
WHERE P.personaid NOT IN (
      SELECT R.personaid FROM reserva R
);
