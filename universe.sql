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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(60) NOT NULL,
    visible_from_earth boolean NOT NULL,
    number_of_stars integer,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    age_in_billion_years numeric(4,2),
    type character varying(30),
    rotation_speed integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_no_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_no_seq OWNER TO freecodecamp;

--
-- Name: galaxy_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_no_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60),
    is_round boolean,
    planet_id integer NOT NULL,
    shape character varying(30),
    dia_in_kms numeric(10,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60),
    has_life boolean,
    is_round boolean,
    no_of_moons integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60),
    no_of_planets integer,
    galaxy_id integer NOT NULL,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_no_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', true, 7, 'The Hunter - one of the most recognizable constellations with Betelgeuse and Rigel', 1);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', true, 7, 'The Great Bear - contains the Big Dipper asterism', 1);
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', true, 5, 'The Queen - distinctive W-shaped constellation', 1);
INSERT INTO public.constellation VALUES (4, 'Scorpius', true, 18, 'The Scorpion - contains the red supergiant Antares', 1);
INSERT INTO public.constellation VALUES (5, 'Andromeda', true, 3, 'The Chained Princess - home to the Andromeda Galaxy M31', 1);
INSERT INTO public.constellation VALUES (6, 'Andromedan Wing', false, 12, 'Hypothetical constellation pattern in Andromeda Galaxy', 2);
INSERT INTO public.constellation VALUES (7, 'Triangulum Spiral', false, 8, 'Star pattern following the spiral arms of Triangulum Galaxy', 3);
INSERT INTO public.constellation VALUES (8, 'M87 Crown', false, 15, 'Ring of bright stars surrounding the core of Messier 87', 4);
INSERT INTO public.constellation VALUES (9, 'Sombrero Band', false, 10, 'Stars along the dust lane of the Sombrero Galaxy', 5);
INSERT INTO public.constellation VALUES (10, 'Whirlpool Arms', false, 20, 'Distinctive spiral arm pattern in the Whirlpool Galaxy', 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy containing the Solar System', 13.60, 'Spiral', 220);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way, on collision course', 10.01, 'Spiral', 250);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest member of the Local Group of galaxies', 12.50, 'Spiral', 100);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Giant elliptical galaxy with supermassive black hole', 13.24, 'Elliptical', 0);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Unusual galaxy with bright nucleus and large central bulge', 13.25, 'Spiral', 180);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Classic spiral galaxy with prominent spiral arms', 11.00, 'Spiral', 195);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel Galaxy', 'Face-on spiral galaxy known for its well-defined spiral structure', 13.00, 'Spiral', 170);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 3, 'Spherical', 3474.20);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 4, 'Irregular', 22.53);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 4, 'Irregular', 12.40);
INSERT INTO public.moon VALUES (4, 'Io', true, 5, 'Spherical', 3643.20);
INSERT INTO public.moon VALUES (5, 'Europa', true, 5, 'Spherical', 3121.60);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 5, 'Spherical', 5268.20);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 5, 'Spherical', 4820.60);
INSERT INTO public.moon VALUES (8, 'Amalthea', false, 5, 'Irregular', 167.00);
INSERT INTO public.moon VALUES (9, 'Himalia', false, 5, 'Irregular', 139.60);
INSERT INTO public.moon VALUES (10, 'Thebe', false, 5, 'Irregular', 98.60);
INSERT INTO public.moon VALUES (11, 'Titan', true, 6, 'Spherical', 5149.50);
INSERT INTO public.moon VALUES (12, 'Rhea', true, 6, 'Spherical', 1527.60);
INSERT INTO public.moon VALUES (13, 'Iapetus', true, 6, 'Spherical', 1469.00);
INSERT INTO public.moon VALUES (14, 'Dione', true, 6, 'Spherical', 1122.80);
INSERT INTO public.moon VALUES (15, 'Tethys', true, 6, 'Spherical', 1062.20);
INSERT INTO public.moon VALUES (16, 'Enceladus', true, 6, 'Spherical', 504.20);
INSERT INTO public.moon VALUES (17, 'Mimas', true, 6, 'Spherical', 396.40);
INSERT INTO public.moon VALUES (18, 'Hyperion', false, 6, 'Irregular', 270.00);
INSERT INTO public.moon VALUES (19, 'Phoebe', false, 6, 'Irregular', 213.00);
INSERT INTO public.moon VALUES (20, 'Janus', false, 6, 'Irregular', 179.00);
INSERT INTO public.moon VALUES (21, 'Titania', true, 7, 'Spherical', 1577.80);
INSERT INTO public.moon VALUES (22, 'Oberon', true, 7, 'Spherical', 1522.80);
INSERT INTO public.moon VALUES (23, 'Umbriel', true, 7, 'Spherical', 1169.40);
INSERT INTO public.moon VALUES (24, 'Ariel', true, 7, 'Spherical', 1157.80);
INSERT INTO public.moon VALUES (25, 'Miranda', true, 7, 'Spherical', 471.60);
INSERT INTO public.moon VALUES (26, 'Triton', true, 8, 'Spherical', 2706.80);
INSERT INTO public.moon VALUES (27, 'Proteus', false, 8, 'Irregular', 418.00);
INSERT INTO public.moon VALUES (28, 'Nereid', false, 8, 'Irregular', 340.00);
INSERT INTO public.moon VALUES (29, 'Larissa', false, 8, 'Irregular', 194.00);
INSERT INTO public.moon VALUES (30, 'Galatea', false, 8, 'Irregular', 176.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, true, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, true, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 95, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 146, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 28, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 16, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', false, true, 0, 4);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', false, true, 0, 4);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', false, true, 0, 4);
INSERT INTO public.planet VALUES (12, 'Kepler-442b', false, true, 0, 2);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', false, true, 0, 3);
INSERT INTO public.planet VALUES (14, 'HD 209458 b', false, true, 0, 5);
INSERT INTO public.planet VALUES (15, 'Gliese 581g', false, true, 0, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 1, 'Our home star, a G-type main-sequence yellow dwarf');
INSERT INTO public.star VALUES (2, 'Sirius', 0, 1, 'Brightest star in the night sky, a binary star system');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 0, 1, 'Red supergiant star in the constellation Orion');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 3, 1, 'Closest star to our Solar System at 4.24 light-years');
INSERT INTO public.star VALUES (5, 'Vega', 1, 1, 'Bright star in the constellation Lyra');
INSERT INTO public.star VALUES (6, 'Alpheratz', 0, 2, 'Brightest star in the Andromeda constellation');
INSERT INTO public.star VALUES (7, 'Rigel', 0, 1, 'Blue supergiant star, seventh brightest in the night sky');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 10, true);


--
-- Name: galaxy_no_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_no_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 30, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

