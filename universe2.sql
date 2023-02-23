PostgreSQL database dump
---
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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50),
    asteriod_type character varying(50),
    distance_from_earth integer NOT NULL,
    description text,
    is_asteroid boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    description text,
    galaxy_size integer NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    moon_type character varying(50),
    is_spherical boolean NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    star_id integer,
    planet_size integer NOT NULL
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
    name character varying(50) NOT NULL,
    is_spherical boolean NOT NULL,
    size_of_star integer NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    galaxy_id integer,
    star_color character varying(50) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Asteroid Ceres', 'C-type', 13, 'Big', true);
INSERT INTO public.asteroid VALUES (2, 'Asteroid Pallax', 'M-type', 27, 'Medium', true);
INSERT INTO public.asteroid VALUES (3, 'Asteroid Vesta', 'S-type', 11, 'Small', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Spiral', 3.543, 'Daughters of the Kings of Ethopia', 47);
INSERT INTO public.galaxy VALUES (2, 'Tadpole Galaxy', 'Spiral', 420, 'Resembles a Tadpole', 50);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'elliptical', 520, 'Spectacular dark band of absorbing dust', 55);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'elliptical', 537, 'Spiral galaxy with a seyfrex 2 nucleus', 34);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Peculiar', 578, 'Appears like a sombrero', 23);
INSERT INTO public.galaxy VALUES (6, 'Milky Way Galaxy', 'Irregular', 789, 'Hazy Band of Light', 56);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Regular', true, 123, 413, 1);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Irregular', true, 345, 8912, 2);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Mars Moon', true, 234, 9999, 3);
INSERT INTO public.moon VALUES (2, 'Ganymede', 'Mercury Moon', true, 3456, 8888, 4);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Venus Moon', true, 987, 7777, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Saturn Moon', true, 555, 6666, 6);
INSERT INTO public.moon VALUES (7, 'Europa', 'Jupiter Moon', true, 444, 5555, 7);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Dwarf Ceres', true, 513, 4444, 8);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Dwarf Hygiea', true, 724, 3333, 9);
INSERT INTO public.moon VALUES (10, 'Thebe', 'Uranus Moon', true, 781, 2222, 10);
INSERT INTO public.moon VALUES (11, 'Elara', 'Pasiphae', true, 820, 1111, 10);
INSERT INTO public.moon VALUES (12, 'Metis', 'Carme', true, 9421, 1423, 9);
INSERT INTO public.moon VALUES (13, 'Sinope', 'Ananke', true, 3445, 3791, 8);
INSERT INTO public.moon VALUES (14, 'Lysithea', 'Leda', true, 2886, 2087, 7);
INSERT INTO public.moon VALUES (15, 'Adrastea', 'Callirhoe', true, 3339, 2091, 6);
INSERT INTO public.moon VALUES (16, 'Themisto', 'Praxidike', true, 4448, 2081, 5);
INSERT INTO public.moon VALUES (17, 'Kalyke', 'Locaste', true, 2221, 2071, 4);
INSERT INTO public.moon VALUES (18, 'Megaclite', 'Taygete', true, 3456, 2061, 3);
INSERT INTO public.moon VALUES (19, 'Aoede', 'Autonoe', true, 4781, 2051, 2);
INSERT INTO public.moon VALUES (20, 'Chaldene', 'Dia', true, 2919, 2041, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Uninhabitable', false, 345, 1, 400);
INSERT INTO public.planet VALUES (2, 'Venus', 'Uninhabitable', false, 123, 2, 300);
INSERT INTO public.planet VALUES (3, 'Earth', 'Inhabitable', true, 456, 3, 234);
INSERT INTO public.planet VALUES (4, 'Mars', 'uninhabitable', false, 786, 4, 678);
INSERT INTO public.planet VALUES (5, 'Jupyter', 'Uninhabitable', false, 899, 5, 345);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Uninhabitable', false, 999, 6, 321);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Uninhabitable', false, 888, 6, 378);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Uninhabitable', false, 777, 5, 276);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Uninhabitable', false, 666, 4, 129);
INSERT INTO public.planet VALUES (11, 'Krypton', 'Uninhabitable', false, 555, 3, 567);
INSERT INTO public.planet VALUES (12, 'Nova', 'Uninhabitable', false, 444, 2, 814);
INSERT INTO public.planet VALUES (7, 'Kimura', 'Uninhabitable', false, 333, 1, 111);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Polaris', true, 5000, 456, 2, 'Pink');
INSERT INTO public.star VALUES (2, 'Castor', true, 4000, 567, 1, 'Red');
INSERT INTO public.star VALUES (3, 'Pollux', true, 6000, 431, 5, 'Purple');
INSERT INTO public.star VALUES (4, 'Orion', true, 8934, 459, 3, 'Violet');
INSERT INTO public.star VALUES (5, 'Sirius', false, 5678, 142, 1, 'Maroon');
INSERT INTO public.star VALUES (6, 'Altair', false, 4891, 457, 5, 'Blue');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: asteroid asteroid_asteriod_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_asteriod_type_key UNIQUE (asteriod_type);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_size_key UNIQUE (galaxy_size);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_type_key UNIQUE (moon_type);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_size_key UNIQUE (planet_size);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_color_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_color_key UNIQUE (star_color);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

