--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: communities; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE communities (
    id integer NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE communities OWNER TO "Guest";

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE communities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communities_id_seq OWNER TO "Guest";

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE communities_id_seq OWNED BY communities.id;


--
-- Name: communities_persons; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE communities_persons (
    id integer NOT NULL,
    community_id integer,
    person_id integer
);


ALTER TABLE communities_persons OWNER TO "Guest";

--
-- Name: communities_persons_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE communities_persons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communities_persons_id_seq OWNER TO "Guest";

--
-- Name: communities_persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE communities_persons_id_seq OWNED BY communities_persons.id;


--
-- Name: monsters; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE monsters (
    id integer NOT NULL,
    name character varying,
    personid integer,
    birthday timestamp without time zone,
    lastate timestamp without time zone,
    lastslept timestamp without time zone,
    lastplay timestamp without time zone,
    type character varying,
    lastwater timestamp without time zone,
    lastkindling timestamp without time zone
);


ALTER TABLE monsters OWNER TO "Guest";

--
-- Name: monsters_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE monsters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE monsters_id_seq OWNER TO "Guest";

--
-- Name: monsters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE monsters_id_seq OWNED BY monsters.id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE persons (
    id integer NOT NULL,
    name character varying,
    email character varying
);


ALTER TABLE persons OWNER TO "Guest";

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE persons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persons_id_seq OWNER TO "Guest";

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE persons_id_seq OWNED BY persons.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY communities ALTER COLUMN id SET DEFAULT nextval('communities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY communities_persons ALTER COLUMN id SET DEFAULT nextval('communities_persons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY monsters ALTER COLUMN id SET DEFAULT nextval('monsters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY persons ALTER COLUMN id SET DEFAULT nextval('persons_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY communities (id, name, description) FROM stdin;
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('communities_id_seq', 1, false);


--
-- Data for Name: communities_persons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY communities_persons (id, community_id, person_id) FROM stdin;
\.


--
-- Name: communities_persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('communities_persons_id_seq', 1, false);


--
-- Data for Name: monsters; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY monsters (id, name, personid, birthday, lastate, lastslept, lastplay, type, lastwater, lastkindling) FROM stdin;
1	Bubble	1	\N	\N	\N	\N	water	\N	\N
2	Spud	1	\N	\N	\N	\N	fire	\N	\N
\.


--
-- Name: monsters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('monsters_id_seq', 2, true);


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY persons (id, name, email) FROM stdin;
1	anna	anna@gmail
2	anna	anna@gmail
3	alexandra	alexandra@gmail.com
\.


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('persons_id_seq', 3, true);


--
-- Name: communities_persons_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY communities_persons
    ADD CONSTRAINT communities_persons_pkey PRIMARY KEY (id);


--
-- Name: communities_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: monsters_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY monsters
    ADD CONSTRAINT monsters_pkey PRIMARY KEY (id);


--
-- Name: persons_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

