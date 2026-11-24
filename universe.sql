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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_solar_masses numeric(15,2) NOT NULL,
    is_supermassive boolean NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth_mly numeric(10,2),
    has_active_nucleus boolean NOT NULL,
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days numeric(10,2),
    description text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    orbital_period_days numeric(10,2),
    moons_count integer NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(20) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    temperature_kelvin integer NOT NULL,
    is_visible_naked_eye boolean NOT NULL
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 1, 4154000.00, true);
INSERT INTO public.black_hole VALUES (2, 'M87*', 6, 6500000000.00, true);
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 1, 21.20, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13610, 0.00, false, 'Our home galaxy containing the Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10010, 2.54, true, 'Nearest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 2.73, false, 'Third-largest member of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 13250, 29.35, true, 'Known for its bright nucleus and large central bulge');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 400, 23.16, true, 'Interacting grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 13240, 53.49, true, 'Supergiant elliptical galaxy in the Virgo cluster');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 3474, 27.32, 'Earths only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 22, 0.32, 'Larger and closer of the two Martian moons');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 12, 1.26, 'Smaller outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 3643, 1.77, 'Most geologically active object in the Solar System');
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 3121, 3.55, 'Icy moon with a subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 5268, 7.15, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 4820, 16.69, 'Heavily cratered Galilean moon');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, 167, 0.50, 'Irregular inner moon of Jupiter');
INSERT INTO public.moon VALUES (9, 'Titan', 6, true, 5149, 15.95, 'Largest moon of Saturn with a dense atmosphere');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, true, 504, 1.37, 'Icy moon with water-rich plumes');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, true, 396, 0.94, 'Known for the giant Herschel crater');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, true, 1527, 4.52, 'Second-largest moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, true, 1469, 79.32, 'Distinctive two-tone coloration');
INSERT INTO public.moon VALUES (14, 'Dione', 6, true, 1122, 2.74, 'Composed primarily of water ice');
INSERT INTO public.moon VALUES (15, 'Tethys', 6, true, 1062, 1.89, 'Mid-sized icy moon of Saturn');
INSERT INTO public.moon VALUES (16, 'Titania', 7, true, 1576, 8.71, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Oberon', 7, true, 1522, 13.46, 'Outermost major moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Miranda', 7, true, 471, 1.41, 'Smallest and innermost of Uranus round moons');
INSERT INTO public.moon VALUES (19, 'Triton', 8, true, 2706, 5.88, 'Largest moon of Neptune with retrograde orbit');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, false, 420, 1.12, 'Second-largest Neptunian moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, true, 87.97, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, true, 224.70, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 365.25, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, true, 686.98, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, true, 4332.59, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, true, 10759.22, 146);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, true, 30688.50, 28);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, true, 60195.00, 16);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'Terrestrial', false, true, 11.18, 0);
INSERT INTO public.planet VALUES (10, 'Proxima d', 4, 'Sub-Earth', false, true, 5.12, 0);
INSERT INTO public.planet VALUES (11, 'Sirius b Planet', 2, 'Exoplanet', false, true, 450.00, 1);
INSERT INTO public.planet VALUES (12, 'Mirach b', 6, 'Gas Giant', false, true, 507.80, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 4600, 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 242, 9940, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M1Ia', 10, 3500, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M5.5Ve', 4850, 3042, false);
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, 'B8IV', 60, 13800, true);
INSERT INTO public.star VALUES (6, 'Mirach', 2, 'M0III', 500, 3842, true);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- PostgreSQL database dump complete
--

