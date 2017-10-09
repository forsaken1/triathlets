--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    name character varying(254),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: disciplines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE disciplines (
    id integer NOT NULL,
    name character varying(254),
    title character varying(254),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE disciplines OWNER TO postgres;

--
-- Name: disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE disciplines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE disciplines_id_seq OWNER TO postgres;

--
-- Name: disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE disciplines_id_seq OWNED BY disciplines.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(254),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE migration_versions (
    id integer NOT NULL,
    version character varying(17)
);


ALTER TABLE migration_versions OWNER TO postgres;

--
-- Name: migration_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE migration_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migration_versions_id_seq OWNER TO postgres;

--
-- Name: migration_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE migration_versions_id_seq OWNED BY migration_versions.id;


--
-- Name: race_disciplines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE race_disciplines (
    id integer NOT NULL,
    race_id integer,
    discipline_id integer,
    "position" integer,
    distance real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE race_disciplines OWNER TO postgres;

--
-- Name: race_disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE race_disciplines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE race_disciplines_id_seq OWNER TO postgres;

--
-- Name: race_disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE race_disciplines_id_seq OWNED BY race_disciplines.id;


--
-- Name: races; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE races (
    id integer NOT NULL,
    title character varying(254),
    date character varying(254),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE races OWNER TO postgres;

--
-- Name: races_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE races_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE races_id_seq OWNER TO postgres;

--
-- Name: races_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE races_id_seq OWNED BY races.id;


--
-- Name: result_race_disciplines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE result_race_disciplines (
    id integer NOT NULL,
    result_id integer,
    race_discipline_id integer,
    "position" integer,
    "time" character varying(254),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE result_race_disciplines OWNER TO postgres;

--
-- Name: result_race_disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE result_race_disciplines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE result_race_disciplines_id_seq OWNER TO postgres;

--
-- Name: result_race_disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE result_race_disciplines_id_seq OWNED BY result_race_disciplines.id;


--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE results (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    race_id integer,
    city_id integer,
    team_id integer,
    "position" integer,
    "time" character varying(254),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE results OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE results_id_seq OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE results_id_seq OWNED BY results.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE teams (
    id integer NOT NULL,
    name character varying(254),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(254),
    qualification character varying(254),
    year integer,
    team_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disciplines ALTER COLUMN id SET DEFAULT nextval('disciplines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migration_versions ALTER COLUMN id SET DEFAULT nextval('migration_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY race_disciplines ALTER COLUMN id SET DEFAULT nextval('race_disciplines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY races ALTER COLUMN id SET DEFAULT nextval('races_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY result_race_disciplines ALTER COLUMN id SET DEFAULT nextval('result_race_disciplines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results ALTER COLUMN id SET DEFAULT nextval('results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (id);


--
-- Name: race_disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY race_disciplines
    ADD CONSTRAINT race_disciplines_pkey PRIMARY KEY (id);


--
-- Name: races_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY races
    ADD CONSTRAINT races_pkey PRIMARY KEY (id);


--
-- Name: result_race_disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY result_race_disciplines
    ADD CONSTRAINT result_race_disciplines_pkey PRIMARY KEY (id);


--
-- Name: results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: mak
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM mak;
GRANT ALL ON SCHEMA public TO mak;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

