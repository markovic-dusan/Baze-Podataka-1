-- Generated by Oracle SQL Developer Data Modeler 18.3.0.268.1156
--   at:        2019-12-08 10:05:04 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



DROP TABLE drzava CASCADE CONSTRAINTS;

DROP TABLE glumac CASCADE CONSTRAINTS;

DROP TABLE mesto CASCADE CONSTRAINTS;

DROP TABLE podela CASCADE CONSTRAINTS;

DROP TABLE pozoriste CASCADE CONSTRAINTS;

DROP TABLE predstava CASCADE CONSTRAINTS;

DROP TABLE prikazivanje CASCADE CONSTRAINTS;

DROP TABLE radnik CASCADE CONSTRAINTS;

DROP TABLE scena CASCADE CONSTRAINTS;

DROP TABLE sektor CASCADE CONSTRAINTS;

DROP TABLE tehnicar CASCADE CONSTRAINTS;

DROP TABLE uloga CASCADE CONSTRAINTS;

DROP TABLE upravnik CASCADE CONSTRAINTS;

CREATE TABLE drzava (
    idd      INTEGER NOT NULL,
    nazivd   VARCHAR2(32 CHAR) NOT NULL
);

ALTER TABLE drzava ADD CONSTRAINT drzava_pk PRIMARY KEY ( idd );

CREATE TABLE glumac (
    mbg               INTEGER NOT NULL,
    imeg              VARCHAR2(32 CHAR) NOT NULL,
    datumr            DATE,
    status            CHAR(1),
    plata             NUMBER(10, 2) NOT NULL,
    dodatak           NUMBER(10, 2),
    pozoriste_idpoz   INTEGER
);

ALTER TABLE glumac ADD CONSTRAINT glumac_pk PRIMARY KEY ( mbg );

CREATE TABLE mesto (
    idm          INTEGER NOT NULL,
    nazivm       VARCHAR2(32 CHAR) NOT NULL,
    drzava_idd   INTEGER NOT NULL
);

ALTER TABLE mesto ADD CONSTRAINT mesto_pk PRIMARY KEY ( idm );

CREATE TABLE podela (
    honorar      NUMBER(10, 2) NOT NULL,
    datumd       DATE NOT NULL,
    datump       DATE NOT NULL,
    glumac_mbg   INTEGER NOT NULL,
    uloga_idul   INTEGER NOT NULL,
    idpod        INTEGER NOT NULL
);

ALTER TABLE podela
    ADD CONSTRAINT podela_pk PRIMARY KEY (
                                           idpod );

CREATE TABLE pozoriste (
    idpoz       INTEGER NOT NULL,
    nazivpoz    VARCHAR2(64 CHAR) NOT NULL,
    adresapoz   VARCHAR2(64 CHAR) NOT NULL,
    sajt        VARCHAR2(64 CHAR),
    mesto_idm   INTEGER NOT NULL
);

ALTER TABLE pozoriste ADD CONSTRAINT pozoriste_pk PRIMARY KEY ( idpoz );

CREATE TABLE predstava (
    idpred      INTEGER NOT NULL,
    nazivpred   VARCHAR2(32 CHAR) NOT NULL,
    trajanje    VARCHAR2(32 CHAR) NOT NULL,
    godinapre   INTEGER NOT NULL
);

ALTER TABLE predstava ADD CONSTRAINT predstava_pk PRIMARY KEY ( idpred );

CREATE TABLE prikazivanje (
    rbr                INTEGER NOT NULL,
    datumpri           DATE NOT NULL,
    vremepri           DATE NOT NULL,
    brojgled           INTEGER NOT NULL,
    predstava_idpred   INTEGER NOT NULL,
    scena_idsce        INTEGER NOT NULL
);

ALTER TABLE prikazivanje ADD CONSTRAINT prikazivanje_pk PRIMARY KEY ( rbr );

CREATE TABLE radnik (
    mbr            INTEGER NOT NULL,
    imer           VARCHAR2(32 CHAR) NOT NULL,
    prezr          VARCHAR2(32 CHAR) NOT NULL,
    platar         NUMBER(10, 2) NOT NULL,
    sektor_idsek   INTEGER NOT NULL,
    radnik_mbr     INTEGER,
    tiprad         VARCHAR2(32 CHAR) NOT NULL
);

ALTER TABLE radnik ADD CONSTRAINT radnik_pk PRIMARY KEY ( mbr );

CREATE TABLE scena (
    idsce             INTEGER NOT NULL,
    nazivsce          VARCHAR2(32 CHAR) NOT NULL,
    brojsed           INTEGER NOT NULL,
    pozoriste_idpoz   INTEGER NOT NULL
);

ALTER TABLE scena ADD CONSTRAINT scena_pk PRIMARY KEY ( idsce );

CREATE TABLE sektor (
    idsek             INTEGER NOT NULL,
    nazivsek          VARCHAR2(32 CHAR) NOT NULL,
    pozoriste_idpoz   INTEGER NOT NULL
);

ALTER TABLE sektor ADD CONSTRAINT sektor_pk PRIMARY KEY ( idsek );

CREATE TABLE tehnicar (
    mbr     INTEGER NOT NULL,
    tipap   VARCHAR2(32 CHAR) NOT NULL
);

ALTER TABLE tehnicar ADD CONSTRAINT tehnicar_pk PRIMARY KEY ( mbr );

CREATE TABLE uloga (
    idul               INTEGER NOT NULL,
    imeulo             VARCHAR2(64 CHAR) NOT NULL,
    pol                CHAR(1 CHAR) NOT NULL,
    vrstaulo           VARCHAR2(32 CHAR) NOT NULL,
    predstava_idpred   INTEGER NOT NULL
);

ALTER TABLE uloga ADD CONSTRAINT uloga_pk PRIMARY KEY ( idul );

CREATE TABLE upravnik (
    mbr   INTEGER NOT NULL,
    nss   INTEGER NOT NULL
);

ALTER TABLE upravnik ADD CONSTRAINT upravnik_pk PRIMARY KEY ( mbr );

ALTER TABLE glumac
    ADD CONSTRAINT glumac_pozoriste_fk FOREIGN KEY ( pozoriste_idpoz )
        REFERENCES pozoriste ( idpoz );


ALTER TABLE mesto
    ADD CONSTRAINT mesto_drzava_fk FOREIGN KEY ( drzava_idd )
        REFERENCES drzava ( idd );

ALTER TABLE podela
    ADD CONSTRAINT podela_glumac_fk FOREIGN KEY ( glumac_mbg )
        REFERENCES glumac ( mbg );

ALTER TABLE podela
    ADD CONSTRAINT podela_uloga_fk FOREIGN KEY ( uloga_idul )
        REFERENCES uloga ( idul );

ALTER TABLE pozoriste
    ADD CONSTRAINT pozoriste_mesto_fk FOREIGN KEY ( mesto_idm )
        REFERENCES mesto ( idm );

ALTER TABLE prikazivanje
    ADD CONSTRAINT prikazivanje_predstava_fk FOREIGN KEY ( predstava_idpred )
        REFERENCES predstava ( idpred );

ALTER TABLE prikazivanje
    ADD CONSTRAINT prikazivanje_scena_fk FOREIGN KEY ( scena_idsce )
        REFERENCES scena ( idsce );

ALTER TABLE radnik
    ADD CONSTRAINT radnik_radnik_fk FOREIGN KEY ( radnik_mbr )
        REFERENCES radnik ( mbr );

ALTER TABLE radnik
    ADD CONSTRAINT radnik_sektor_fk FOREIGN KEY ( sektor_idsek )
        REFERENCES sektor ( idsek );

ALTER TABLE scena
    ADD CONSTRAINT scena_pozoriste_fk FOREIGN KEY ( pozoriste_idpoz )
        REFERENCES pozoriste ( idpoz );

ALTER TABLE sektor
    ADD CONSTRAINT sektor_pozoriste_fk FOREIGN KEY ( pozoriste_idpoz )
        REFERENCES pozoriste ( idpoz );

ALTER TABLE tehnicar
    ADD CONSTRAINT tehnicar_radnik_fk FOREIGN KEY ( mbr )
        REFERENCES radnik ( mbr );

ALTER TABLE uloga
    ADD CONSTRAINT uloga_predstava_fk FOREIGN KEY ( predstava_idpred )
        REFERENCES predstava ( idpred );

ALTER TABLE upravnik
    ADD CONSTRAINT upravnik_radnik_fk FOREIGN KEY ( mbr )
        REFERENCES radnik ( mbr );





-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             41
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   4
-- WARNINGS                                 0
