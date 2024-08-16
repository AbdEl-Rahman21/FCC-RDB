--
-- PostgreSQL database dump
--

-- Dumped from database version 12.19 (Ubuntu 12.19-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.19 (Ubuntu 12.19-0ubuntu0.20.04.1)

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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years integer,
    distance_from_earth_in_millions_of_ly numeric(4,1)
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    age_in_billions_of_years integer,
    distance_from_earth_in_millions_of_ly numeric(4,1)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    description text,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    star_id integer,
    description text,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    age_in_billions_of_years integer,
    distance_from_earth_in_millions_of_ly numeric(4,1)
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A*', 13, 26.0);
INSERT INTO public.blackhole VALUES (2, 'M87*', 7, 53.0);
INSERT INTO public.blackhole VALUES (3, 'TON 618', 10, 10.0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 10, 2.5);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Barred Spiral', 13, 0.0);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12, 3.0);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unbarred Spiral', 13, 29.7);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 8, 2.3);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Spiral', 11, 17.6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'The only natural satellite of Earth, known for its impact on tides.', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'The larger and closer of Mars’ two moons, with an irregular shape.', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'The smaller and more distant of Mars’ two moons.', false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'The most volcanically active body in the Solar System, orbiting Jupiter.', true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Jupiter’s moon, believed to have a subsurface ocean.', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'The largest moon in the Solar System, larger than the planet Mercury.', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'The second-largest moon of Jupiter, heavily cratered.', true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'The largest moon of Saturn, known for its thick atmosphere and lakes of methane.', true);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'The second-largest moon of Saturn, composed mainly of ice.', true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 'A moon of Saturn with a distinctive two-tone coloration.', true);
INSERT INTO public.moon VALUES (11, 'Oberon', 7, 'The second-largest moon of Uranus, characterized by its heavily cratered surface.', true);
INSERT INTO public.moon VALUES (12, 'Titania', 7, 'The largest moon of Uranus, known for its large canyons.', true);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, 'One of Uranus’ moons, notable for its smooth, relatively uncratered surface.', true);
INSERT INTO public.moon VALUES (14, 'Triton', 8, 'The largest moon of Neptune, known for its retrograde orbit and geysers.', true);
INSERT INTO public.moon VALUES (15, 'Nereid', 8, 'A moon of Neptune with a highly eccentric orbit.', true);
INSERT INTO public.moon VALUES (16, 'Charon', 3, 'The largest moon of the dwarf planet Pluto, often considered a binary system with Pluto.', true);
INSERT INTO public.moon VALUES (17, 'Styx', 3, 'A small moon of Pluto, named after the river in Greek mythology.', true);
INSERT INTO public.moon VALUES (18, 'Nix', 3, 'A small moon of Pluto, named after the Greek goddess of the night.', true);
INSERT INTO public.moon VALUES (19, 'Hydra', 3, 'A small moon of Pluto, named after the mythical serpent with multiple heads.', true);
INSERT INTO public.moon VALUES (20, 'Kerberos', 3, 'A small moon of Pluto, named after the three-headed dog of Greek mythology.', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'The smallest and closest planet to the Sun.', true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Second planet from the Sun, with a thick atmosphere.', true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Our home planet, known for its diverse ecosystems.', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'The red planet, known for its iron oxide-rich surface.', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'The largest planet in the Solar System, known for its Great Red Spot.', true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Known for its prominent ring system.', true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'An ice giant with a blue-green color due to methane.', true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'The farthest known planet in our Solar System, also an ice giant.', true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 'An exoplanet orbiting within the habitable zone of Proxima Centauri.', true);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2, 'A super-Earth exoplanet orbiting the star Kepler-22 in the habitable zone.', true);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 3, 'A potential habitable exoplanet orbiting the red dwarf star Gliese 581.', true);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bb', 2, 'A planet orbiting the star Alpha Centauri B, close to Earth.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 2, 0, 8.6);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 2, 8, 642.5);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 5, 4.2);
INSERT INTO public.star VALUES (4, 'Vega', 2, 0, 25.0);
INSERT INTO public.star VALUES (5, 'Polaris', 2, 0, 433.0);
INSERT INTO public.star VALUES (6, 'Aldebaran', 2, 7, 65.0);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 3, true);


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
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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

