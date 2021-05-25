-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public."Regimen" | type: TABLE --
-- DROP TABLE IF EXISTS public."Regimen" CASCADE;
CREATE TABLE public."regimen" (
	id_regimen char(5) NOT NULL,
	"Regimen" varchar(40) NOT NULL,
	"id_area_Area" integer NOT NULL,
	CONSTRAINT "Regimen_pk" PRIMARY KEY (id_regimen,"id_area_Area")

);
-- ddl-end --
-- ALTER TABLE public."Regimen" OWNER TO postgres;
-- ddl-end --

-- object: public."Lugar de parto" | type: TABLE --
-- DROP TABLE IF EXISTS public."Lugar de parto" CASCADE;
CREATE TABLE public."lugar_de_parto" (
	id_partos serial NOT NULL,
	"Inst_salud" integer NOT NULL,
	"Domicilio" integer NOT NULL,
	"Otro" integer NOT NULL,
	"Sin_informacion" integer NOT NULL,
	total integer NOT NULL,
	"Ano" integer NOT NULL,
	"id_regimen_Regimen" char(5),
	"id_area_Area_Regimen" integer,
	CONSTRAINT "Lugar_pk" PRIMARY KEY (id_partos)

);
-- ddl-end --
-- ALTER TABLE public."Lugar de parto" OWNER TO postgres;
-- ddl-end --

-- object: public."Tipo de parto" | type: TABLE --
-- DROP TABLE IF EXISTS public."Tipo de parto" CASCADE;
CREATE TABLE public."tipo_de_parto" (
	id_tipo serial NOT NULL,
	"Cesarea" integer NOT NULL,
	"Espontaneo" integer NOT NULL,
	"Instrumentado" integer NOT NULL,
	"Sin_informacion" integer NOT NULL,
	"Total" integer NOT NULL,
	"Ano" integer NOT NULL,
	"id_regimen_Regimen" char(5),
	"id_area_Area_Regimen" integer,
	CONSTRAINT "Tipo de parto_pk" PRIMARY KEY (id_tipo)

);
-- ddl-end --
-- ALTER TABLE public."Tipo de parto" OWNER TO postgres;
-- ddl-end --

-- object: "Regimen_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Lugar de parto" DROP CONSTRAINT IF EXISTS "Regimen_fk" CASCADE;
ALTER TABLE public."lugar_de_parto" ADD CONSTRAINT "regimen_fk" FOREIGN KEY ("id_regimen_Regimen","id_area_Area_Regimen")
REFERENCES public."regimen" (id_regimen,"id_area_Area") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Area" | type: TABLE --
-- DROP TABLE IF EXISTS public."Area" CASCADE;
CREATE TABLE public."area" (
	id_area serial NOT NULL,
	nombre varchar(50),
	CONSTRAINT "area_pk" PRIMARY KEY (id_area)

);
-- ddl-end --
-- ALTER TABLE public."Area" OWNER TO postgres;
-- ddl-end --

-- object: "Area_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Regimen" DROP CONSTRAINT IF EXISTS "Area_fk" CASCADE;
ALTER TABLE public."regimen" ADD CONSTRAINT "area_fk" FOREIGN KEY ("id_area_Area")
REFERENCES public."area" (id_area) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Regimen_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Tipo de parto" DROP CONSTRAINT IF EXISTS "Regimen_fk" CASCADE;
ALTER TABLE public."tipo_de_parto" ADD CONSTRAINT "regimen_fk" FOREIGN KEY ("id_regimen_Regimen","id_area_Area_Regimen")
REFERENCES public."regimen" (id_regimen,"id_area_Area") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

--carga masiva--
COPY area(nombre) FROM 'C:\datos_proyecto\area_tr.csv' with delimiter ';' csv header;
select * from area;

COPY regimen(id_regimen, "Regimen", "id_area_Area") 
FROM 'C:\datos_proyecto\regimen_tr.csv' with delimiter ';' csv header;
select * from regimen;

COPY lugar_de_parto("Inst_salud", "Domicilio", "Otro", "Sin_informacion", total, "Ano", "id_regimen_Regimen", "id_area_Area_Regimen") 
FROM 'C:\datos_proyecto\lugar_parto_tr.csv'with delimiter ';' csv header;
select * from lugar_de_parto;

COPY tipo_de_parto("Cesarea", "Espontaneo", "Instrumentado", "Sin_informacion", "Total", "Ano", "id_regimen_Regimen", "id_area_Area_Regimen") 
FROM 'C:\datos_proyecto\tipo_parto_tr.csv' with delimiter ';' csv header;
select * from tipo_de_parto;

