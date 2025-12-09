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
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    num_stars_in_billions integer NOT NULL,
    diameter_in_light_years numeric(10,2) NOT NULL,
    has_supermassive_blackhole boolean NOT NULL,
    is_spiral boolean NOT NULL,
    description text
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    mass_in_mlun numeric(10,9) NOT NULL,
    radius_in_km integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_geologically_active boolean NOT NULL
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
    star_id integer,
    mass_in_msol numeric(10,2) NOT NULL,
    radius_in_km integer NOT NULL,
    is_habitable boolean NOT NULL,
    has_rings boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon_star (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_moon_star_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.planet_moon_star OWNER TO freecodecamp;

--
-- Name: planet_moon_star_planet_moon_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_star_planet_moon_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_star_planet_moon_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_star_planet_moon_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_star_planet_moon_star_id_seq OWNED BY public.planet_moon_star.planet_moon_star_id;


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
    galaxy_id integer NOT NULL,
    mass_in_msol numeric(5,2) NOT NULL,
    radius_in_km integer NOT NULL,
    has_planets boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_main_sequence boolean NOT NULL
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
-- Name: planet_moon_star planet_moon_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star ALTER COLUMN planet_moon_star_id SET DEFAULT nextval('public.planet_moon_star_planet_moon_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 13600, 250, 105700.00, true, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 13000, 100, 50000.00, true, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 10000, 1000000, 220000.00, true, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 13000, 30000, 14000.00, false, false, NULL);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 13200, 1000000, 120000.00, true, false, NULL);
INSERT INTO public.galaxy VALUES (8, 'Messier 51', 450, 100, 60000.00, true, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1.000000000, 1737, 4500, false, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 3, 0.000000150, 11, 4300, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 3, 0.000000020, 6, 4300, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 2, 1.214000000, 1821, 4500, true, true);
INSERT INTO public.moon VALUES (5, 'Europe', 2, 0.653000000, 1560, 4500, true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2, 2.013000000, 2634, 4500, true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 2, 1.470000000, 2410, 4500, true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 15, 1.835000000, 2575, 4500, true, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 15, 0.001470000, 252, 4500, true, true);
INSERT INTO public.moon VALUES (10, 'Rhea', 15, 0.031400000, 763, 4500, true, false);
INSERT INTO public.moon VALUES (12, 'Mimas', 15, 0.000510000, 198, 4500, false, false);
INSERT INTO public.moon VALUES (11, 'Iapetus', 15, 0.024600000, 734, 4500, true, false);
INSERT INTO public.moon VALUES (13, 'Dione', 15, 0.015000000, 561, 4500, true, false);
INSERT INTO public.moon VALUES (14, 'Titania', 16, 0.048000000, 788, 4500, false, false);
INSERT INTO public.moon VALUES (15, 'Oberon', 16, 0.041000000, 761, 4500, false, false);
INSERT INTO public.moon VALUES (16, 'Ariel', 16, 0.018400000, 579, 4500, false, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 16, 0.017300000, 585, 4500, false, false);
INSERT INTO public.moon VALUES (18, 'Miranda', 16, 0.000900000, 236, 4500, false, true);
INSERT INTO public.moon VALUES (19, 'Triton', 17, 0.291000000, 1353, 4500, true, true);
INSERT INTO public.moon VALUES (20, 'Nereid', 17, 0.000004200, 170, 4500, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.00, 6371, true, false, 4540);
INSERT INTO public.planet VALUES (2, 'Jupiter', 1, 317.80, 69911, false, true, 4540);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 0.11, 3389, false, false, 4500);
INSERT INTO public.planet VALUES (4, 'M51-ULS-1b', 6, 40.00, 30000, false, false, 10);
INSERT INTO public.planet VALUES (5, 'R136a1-b', 4, 300.00, 90000, false, true, 1);
INSERT INTO public.planet VALUES (6, 'M31-V1b', 2, 8.00, 12000, false, false, 90);
INSERT INTO public.planet VALUES (7, 'M87-HVS1', 5, 15.00, 18000, false, true, 200);
INSERT INTO public.planet VALUES (13, 'Mercury', 1, 0.06, 2439, false, false, 4500);
INSERT INTO public.planet VALUES (14, 'Venus', 1, 0.82, 6051, false, false, 4500);
INSERT INTO public.planet VALUES (15, 'Saturn', 1, 95.20, 58232, false, true, 4500);
INSERT INTO public.planet VALUES (16, 'Uranus', 1, 14.50, 25362, false, true, 4500);
INSERT INTO public.planet VALUES (17, 'Neptune', 1, 17.10, 24622, false, true, 4500);


--
-- Data for Name: planet_moon_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon_star VALUES (1, 1, 1, 1, NULL);
INSERT INTO public.planet_moon_star VALUES (3, 2, 1, 2, NULL);
INSERT INTO public.planet_moon_star VALUES (2, 5, 1, 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, 1.00, 696340, true, 4600, true);
INSERT INTO public.star VALUES (2, 'M31-V1', 3, 5.00, 40000000, false, 100, false);
INSERT INTO public.star VALUES (3, 'SM-Red-1', 4, 1.30, 70000000, false, 9000, false);
INSERT INTO public.star VALUES (4, 'R136a1', 6, 215.00, 35000000, false, 1, true);
INSERT INTO public.star VALUES (5, 'M87-HVS1', 7, 2.50, 1500000, false, 300, true);
INSERT INTO public.star VALUES (6, 'M51-ULS-1', 8, 20.00, 10000000, true, 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moon_star_planet_moon_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_star_planet_moon_star_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moon_star planet_moon_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star
    ADD CONSTRAINT planet_moon_star_pkey PRIMARY KEY (planet_moon_star_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet_moon_star uq_planet_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star
    ADD CONSTRAINT uq_planet_moon UNIQUE (planet_id, moon_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet_moon_star moon_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star
    ADD CONSTRAINT moon_id FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_moon_star planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet_moon_star star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

