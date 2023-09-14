CREATE SCHEMA configserver
    AUTHORIZATION postgres;

CREATE TABLE configserver.properties
(
    application character varying(100) NOT NULL,
    profile character varying(100),
    label character varying(100),
    key character varying(100) NOT NULL,
    value character varying(1000) NOT NULL
)
WITH (
    OIDS = FALSE
);

ALTER TABLE configserver.properties
    ADD CONSTRAINT props_pk PRIMARY KEY (application, profile, label, key);


