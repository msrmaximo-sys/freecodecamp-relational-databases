--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(55) NOT NULL,
    aliens boolean,
    constelacion character varying(55),
    vecinas text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: misiones_espaciales; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.misiones_espaciales (
    misiones_espaciales_id integer NOT NULL,
    name character varying(55) NOT NULL,
    descripcion text
);


ALTER TABLE public.misiones_espaciales OWNER TO freecodecamp;

--
-- Name: misiones_espaciales_misiones_espaciales_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.misiones_espaciales_misiones_espaciales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.misiones_espaciales_misiones_espaciales_id_seq OWNER TO freecodecamp;

--
-- Name: misiones_espaciales_misiones_espaciales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.misiones_espaciales_misiones_espaciales_id_seq OWNED BY public.misiones_espaciales.misiones_espaciales_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(55) NOT NULL,
    planet_id integer,
    mision text,
    mision_fecha date
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(55) NOT NULL,
    star_id integer,
    descripcion text,
    edad integer,
    temperatura numeric,
    habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(55) NOT NULL,
    galaxy_id integer,
    edad integer,
    hace_calor boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: star_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_galaxy_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: misiones_espaciales misiones_espaciales_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.misiones_espaciales ALTER COLUMN misiones_espaciales_id SET DEFAULT nextval('public.misiones_espaciales_misiones_espaciales_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_galaxy_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'vialactea', false, 'pepe', 'muchas');
INSERT INTO public.galaxy VALUES (2, 'counter', true, 'valve', 'pocas');
INSERT INTO public.galaxy VALUES (3, 'gta5', false, 'rockstar', 'algunos');
INSERT INTO public.galaxy VALUES (4, 'wow', true, 'blizzard', 'ninguna');
INSERT INTO public.galaxy VALUES (5, 'freecode', true, 'academy', 'algunas');
INSERT INTO public.galaxy VALUES (6, 'hackthebox', false, 'Hack', 'ninguna');


--
-- Data for Name: misiones_espaciales; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.misiones_espaciales VALUES (1, 'apollo_pepe', 'buscar aliens');
INSERT INTO public.misiones_espaciales VALUES (2, 'mision_linux', 'instalar kali en marte');
INSERT INTO public.misiones_espaciales VALUES (3, 'operacion_python', 'automatizar la nave');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'luna_pepe', 1, 'apollo_fake', '2020-01-10');
INSERT INTO public.moon VALUES (2, 'luna_counter', 2, 'mision valve', '2021-03-15');
INSERT INTO public.moon VALUES (3, 'luna_gta', 3, 'explorar', '2022-06-20');
INSERT INTO public.moon VALUES (4, 'luna_wow', 4, 'buscar orcos', '2019-04-12');
INSERT INTO public.moon VALUES (5, 'luna_python', 5, 'buscar codigo', '2023-08-11');
INSERT INTO public.moon VALUES (6, 'luna_linux', 6, 'buscar pinguinos', '2024-02-21');
INSERT INTO public.moon VALUES (7, 'luna_sql', 7, 'recolectar datos', '2020-09-05');
INSERT INTO public.moon VALUES (8, 'luna_kali', 8, 'analizar red', '2025-01-17');
INSERT INTO public.moon VALUES (9, 'luna_root', 9, 'obtener acceso', '2022-11-30');
INSERT INTO public.moon VALUES (10, 'luna_bash', 10, 'ejecutar scripts', '2021-07-14');
INSERT INTO public.moon VALUES (11, 'luna_git', 11, 'buscar commits', '2024-05-19');
INSERT INTO public.moon VALUES (12, 'luna_docker', 12, 'buscar containers', '2023-12-01');
INSERT INTO public.moon VALUES (13, 'luna_nmap', 1, 'escanear crateres', '2025-03-03');
INSERT INTO public.moon VALUES (14, 'luna_postgres', 2, 'guardar muestras', '2020-10-22');
INSERT INTO public.moon VALUES (15, 'luna_tcp', 3, 'enviar paquetes', '2022-02-18');
INSERT INTO public.moon VALUES (16, 'luna_udp', 4, 'enviar rapido', '2023-03-25');
INSERT INTO public.moon VALUES (17, 'luna_dns', 5, 'resolver nombres', '2024-04-08');
INSERT INTO public.moon VALUES (18, 'luna_http', 6, 'hacer peticiones', '2021-06-16');
INSERT INTO public.moon VALUES (19, 'luna_ssh', 7, 'conexion remota', '2025-07-07');
INSERT INTO public.moon VALUES (20, 'luna_vpn', 8, 'crear tunel', '2024-09-09');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'tierra', 1, 'planeta azul', 4500, 15.5, true);
INSERT INTO public.planet VALUES (2, 'marte', 1, 'planeta rojo', 4600, -63.2, false);
INSERT INTO public.planet VALUES (3, 'dust2', 2, 'planeta desertico', 300, 42.7, false);
INSERT INTO public.planet VALUES (4, 'mirage', 2, 'planeta rocoso', 500, 31.4, true);
INSERT INTO public.planet VALUES (5, 'los_santos', 3, 'planeta urbano', 250, 24.8, true);
INSERT INTO public.planet VALUES (6, 'vice_city', 3, 'planeta costero', 180, 29.3, true);
INSERT INTO public.planet VALUES (7, 'azeroth', 4, 'mundo fantastico', 900, 18.6, true);
INSERT INTO public.planet VALUES (8, 'northrend', 4, 'mundo helado', 1200, -40.5, false);
INSERT INTO public.planet VALUES (9, 'pythonia', 5, 'planeta tecnologico', 100, 22.1, true);
INSERT INTO public.planet VALUES (10, 'sql_world', 5, 'planeta de datos', 150, 19.7, true);
INSERT INTO public.planet VALUES (11, 'root', 6, 'planeta linux', 400, 26.3, true);
INSERT INTO public.planet VALUES (12, 'kali', 6, 'planeta seguro', 350, 23.9, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sol', 1, 50, true);
INSERT INTO public.star VALUES (2, 'portal', 2, 120, false);
INSERT INTO public.star VALUES (3, 'trevor', 3, 80, true);
INSERT INTO public.star VALUES (4, 'arthas', 4, 300, false);
INSERT INTO public.star VALUES (5, 'python', 5, 25, true);
INSERT INTO public.star VALUES (6, 'pwnbox', 6, 90, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: misiones_espaciales_misiones_espaciales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.misiones_espaciales_misiones_espaciales_id_seq', 3, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 20, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 12, true);


--
-- Name: star_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_galaxy_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: misiones_espaciales misiones_espaciales_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.misiones_espaciales
    ADD CONSTRAINT misiones_espaciales_name_key UNIQUE (name);


--
-- Name: misiones_espaciales misiones_espaciales_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.misiones_espaciales
    ADD CONSTRAINT misiones_espaciales_pkey PRIMARY KEY (misiones_espaciales_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

