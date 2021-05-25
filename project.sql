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

-- object: public.regimen | type: TABLE --
-- DROP TABLE IF EXISTS public.regimen CASCADE;
CREATE TABLE public.regimen (
	id_regimen char(5) NOT NULL,
	regimen varchar(40) NOT NULL,
	id_area_area integer NOT NULL,
	CONSTRAINT regimen_pk PRIMARY KEY (id_regimen,id_area_area)

);
-- ddl-end --
-- ALTER TABLE public.regimen OWNER TO postgres;
-- ddl-end --

-- object: public.lugar_de_parto | type: TABLE --
-- DROP TABLE IF EXISTS public.lugar_de_parto CASCADE;
CREATE TABLE public.lugar_de_parto (
	id_lugar serial NOT NULL,
	inst_salud integer NOT NULL,
	domicilio integer NOT NULL,
	otro integer NOT NULL,
	sin_informacion integer NOT NULL,
	total integer NOT NULL,
	ano integer NOT NULL,
	id_regimen_regimen char(5),
	id_area_area_regimen integer,
	CONSTRAINT "lugar_pk" PRIMARY KEY (id_lugar)

);
-- ddl-end --
-- ALTER TABLE public.lugar_de_parto OWNER TO postgres;
-- ddl-end --

-- object: public.tipo_de_parto | type: TABLE --
-- DROP TABLE IF EXISTS public.tipo_de_parto CASCADE;
CREATE TABLE public.tipo_de_parto (
	id_tipo serial NOT NULL,
	cesarea integer NOT NULL,
	espontaneo integer NOT NULL,
	instrumentado integer NOT NULL,
	sin_informacion integer NOT NULL,
	total integer NOT NULL,
	ano integer NOT NULL,
	id_regimen_regimen char(5),
	id_area_area_regimen integer,
	CONSTRAINT "tipo de parto_pk" PRIMARY KEY (id_tipo)

);
-- ddl-end --
-- ALTER TABLE public.tipo_de_parto OWNER TO postgres;
-- ddl-end --

-- object: public.area | type: TABLE --
-- DROP TABLE IF EXISTS public.area CASCADE;
CREATE TABLE public.area (
	id_area serial NOT NULL,
	nombre varchar(50) NOT NULL,
	CONSTRAINT "area_pk" PRIMARY KEY (id_area)

);
-- ddl-end --
-- ALTER TABLE public.area OWNER TO postgres;
-- ddl-end --

-- object: area_fk | type: CONSTRAINT --
-- ALTER TABLE public.regimen DROP CONSTRAINT IF EXISTS area_fk CASCADE;
ALTER TABLE public.regimen ADD CONSTRAINT area_fk FOREIGN KEY (id_area_area)
REFERENCES public.area (id_area) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: regimen_fk | type: CONSTRAINT --
-- ALTER TABLE public.lugar_de_parto DROP CONSTRAINT IF EXISTS regimen_fk CASCADE;
ALTER TABLE public.lugar_de_parto ADD CONSTRAINT regimen_fk FOREIGN KEY (id_regimen_regimen,id_area_area_regimen)
REFERENCES public.regimen (id_regimen,id_area_area) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: regimen_fk | type: CONSTRAINT --
-- ALTER TABLE public.tipo_de_parto DROP CONSTRAINT IF EXISTS regimen_fk CASCADE;
ALTER TABLE public.tipo_de_parto ADD CONSTRAINT regimen_fk FOREIGN KEY (id_regimen_regimen,id_area_area_regimen)
REFERENCES public.regimen (id_regimen,id_area_area) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


