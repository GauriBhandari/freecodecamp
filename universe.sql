--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    has_life boolean,
    has_water boolean,
    material text
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
-- Name: galaxy_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_id_seq OWNED BY public.galaxy.star_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    has_life boolean,
    has_water boolean,
    material text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_start_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_start_id_seq OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_start_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN star_id SET DEFAULT nextval('public.galaxy_star_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_start_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'galaxy1', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.galaxy VALUES (2, 2, 'galaxy2', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.galaxy VALUES (3, 3, 'galaxy3', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.galaxy VALUES (4, 4, 'galaxy4', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.galaxy VALUES (5, 5, 'galaxy5', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.galaxy VALUES (6, 6, 'galaxy6', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.galaxy VALUES (7, 7, 'galaxy7', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.galaxy VALUES (8, 8, 'galaxy8', 50, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (9, 9, 'galaxy9', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (10, 10, 'galaxy10', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (11, 11, 'galaxy11', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (12, 12, 'galaxy12', 50, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (13, 13, 'planet13', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.galaxy VALUES (14, 14, 'planet14', 50, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (15, 15, 'planet15', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (16, 16, 'star16', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (17, 17, 'planet17', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (18, 18, 'planet18', 50, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (19, 19, 'planet19', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.galaxy VALUES (20, 20, 'planet20', 500, 750, 1500, true, true, 'solid');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'moon1', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (2, 2, 'moon2', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (3, 3, 'moon3', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (4, 4, 'moon4', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (5, 5, 'moon5', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (6, 6, 'moon6', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (7, 7, 'moon7', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (8, 8, 'moon8', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (9, 9, 'moon9', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (10, 10, 'moon10', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (11, 11, 'moon11', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (12, 12, 'moon12', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (13, 13, 'moon13', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (14, 14, 'moon14', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (15, 15, 'moon15', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (16, 16, 'moon16', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (17, 17, 'moon17', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (18, 18, 'moon18', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (19, 19, 'moon19', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.moon VALUES (20, 20, 'moon20', 500, 750, 1500.75, 'solid', true, true);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'info1', 'lorem');
INSERT INTO public.more_info VALUES (2, 2, 'info2', 'lorem');
INSERT INTO public.more_info VALUES (3, 3, 'info3', 'lorem');
INSERT INTO public.more_info VALUES (4, 4, 'info4', 'lorem');
INSERT INTO public.more_info VALUES (5, 5, 'info5', 'lorem');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 1, 'planet1', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (2, 2, 2, 'planet2', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (3, 3, 3, 'planet3', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (4, 4, 4, 'planet4', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (5, 5, 5, 'planet5', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (6, 6, 6, 'planet6', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (7, 7, 7, 'planet7', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (8, 8, 8, 'planet8', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (9, 9, 9, 'planet9', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (10, 10, 10, 'pllanet10', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (11, 11, 11, 'planet11', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (12, 12, 12, 'planet12', 500, 750, 1500.75, true, true, 'solid');
INSERT INTO public.planet VALUES (13, 13, 13, 'planet13', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.planet VALUES (14, 14, 14, 'planet14', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.planet VALUES (15, 15, 15, 'planet15', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.planet VALUES (16, 16, 16, 'planet16', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.planet VALUES (17, 17, 17, 'planet17', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.planet VALUES (18, 18, 18, 'planet18', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.planet VALUES (19, 19, 19, 'planet19', 500, 750, 1500, true, true, 'solid');
INSERT INTO public.planet VALUES (20, 20, 20, 'planet20', 500, 750, 1500, true, true, 'solid');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 1, 'star1', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (2, 2, 2, 'star2', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (3, 3, 3, 'star3', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (4, 4, 4, 'star4', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (5, 5, 5, 'star5', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (6, 6, 6, 'star6', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (7, 7, 7, 'star7', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (8, 8, 8, 'star8', 50, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (9, 9, 9, 'star9', 500, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (10, 10, 10, 'star10', 500, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (11, 11, 11, 'star11', 500, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (12, 12, 12, 'star12', 50, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (13, 13, 13, 'star13', 500, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (14, 14, 14, 'star14', 500, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (15, 15, 15, 'star15', 500, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (16, 16, 16, 'star16', 500, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (17, 17, 17, 'star17', 500, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (18, 18, 18, 'star18', 500, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (19, 19, 19, 'solid19', 500, 750, 1500, 'solid', true, true);
INSERT INTO public.star VALUES (20, 20, 20, 'star20', 500, 750, 1500, 'solid', true, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: galaxy_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_start_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_start_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_more_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_more_info_id_key UNIQUE (more_info_id);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star star_star_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key1 UNIQUE (star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

