--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "visitCount" integer NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '30a10046-b3df-426a-a451-4c559cc9ccab', '2022-10-15 20:46:47.978285');
INSERT INTO public.sessions VALUES (2, 1, '27106ca5-d75d-4511-a5b1-708310f3c48d', '2022-10-15 20:54:11.715241');
INSERT INTO public.sessions VALUES (3, 1, '2e91b50e-6cdd-40ee-ab90-657e824c0138', '2022-10-15 20:54:27.448921');
INSERT INTO public.sessions VALUES (4, 10, '64ac7142-d858-48fa-8fe3-6863f9adc81d', '2022-10-16 19:24:22.584722');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (4, 1, 'https://www.youtube.com/shorts/tAD1AJrxLiI', '4PwzJQQscKRb', '2022-10-15 22:04:31.9319', 0);
INSERT INTO public.urls VALUES (5, 1, 'https://www.youtube.com/watch?v=6T6MSbCV32g', 'EbbKmZw3hIJx', '2022-10-15 22:05:52.313257', 0);
INSERT INTO public.urls VALUES (2, 1, 'https://www.youtube.com/watch?v=JqbUCTLB5Ds', 'NHcqDKD2hmP9', '2022-10-15 22:00:36.503555', 1);
INSERT INTO public.urls VALUES (3, 1, 'https://www.youtube.com/watch?v=qpQSjf-0Lc8', 'JzNx_TXy7oER', '2022-10-15 22:03:13.775857', 1);
INSERT INTO public.urls VALUES (7, 10, 'https://www.leagueoflegends.com/pt-br/champions/leblanc/', 'f9yPXKJV2s9M', '2022-10-16 19:25:24.412971', 0);
INSERT INTO public.urls VALUES (8, 10, 'https://www.leagueoflegends.com/pt-br/champions/leblanc/', 'Rjzd7Liek-cm', '2022-10-16 19:25:27.394737', 0);
INSERT INTO public.urls VALUES (9, 10, 'https://www.google.com/search?q=leblanc&sxsrf=ALiCzsa2X1Xh7szHA54sQ6UFMstzt7RaYw:1665959094008&source=lnms&tbm=isch&sa=X&ved=2ahUKEwi7vIig5eX6AhUcqpUCHdHKAJIQ_AUoAXoECAMQAw&biw=1366&bih=600&dpr=1#imgrc=7XDfwGw-A4ZcCM', '2bp90ZGrq5FR', '2022-10-16 19:25:47.325494', 0);
INSERT INTO public.urls VALUES (10, 10, 'https://www.google.com/search?q=leblanc&sxsrf=ALiCzsa2X1Xh7szHA54sQ6UFMstzt7RaYw:1665959094008&source=lnms&tbm=isch&sa=X&ved=2ahUKEwi7vIig5eX6AhUcqpUCHdHKAJIQ_AUoAXoECAMQAw&biw=1366&bih=600&dpr=1#imgrc=7XDfwGw-A4ZcCM', 'DVIPoZ1Mz4h7', '2022-10-16 19:25:50.854495', 0);
INSERT INTO public.urls VALUES (11, 10, 'https://www.google.com/search?q=leblanc&sxsrf=ALiCzsa2X1Xh7szHA54sQ6UFMstzt7RaYw:1665959094008&source=lnms&tbm=isch&sa=X&ved=2ahUKEwi7vIig5eX6AhUcqpUCHdHKAJIQ_AUoAXoECAMQAw&biw=1366&bih=600&dpr=1#imgrc=7XDfwGw-A4ZcCM', 'LNIsa39E1tk4', '2022-10-16 19:25:52.774755', 0);
INSERT INTO public.urls VALUES (12, 10, 'https://www.google.com/search?q=leblanc&sxsrf=ALiCzsa2X1Xh7szHA54sQ6UFMstzt7RaYw:1665959094008&source=lnms&tbm=isch&sa=X&ved=2ahUKEwi7vIig5eX6AhUcqpUCHdHKAJIQ_AUoAXoECAMQAw&biw=1366&bih=600&dpr=1#imgrc=7XDfwGw-A4ZcCM', 'NR1LZ0hP_nIB', '2022-10-16 19:25:54.412319', 0);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'leo', 'leonaro@gmail.com', '$2b$10$ylcXF5Sbd.8pnOVFNGcJCe.vXJUV8qFL2HjE6ZjnqkTv7gx2t1f.e', '2022-10-15 20:35:32.948204');
INSERT INTO public.users VALUES (2, 'thiaga', 'titi@gmail.com', '$2b$10$4cHNvZso0sv4ekzS5MmUOOnMxxsaovv8LzGXKqc6nFiBXFGMggT9.', '2022-10-16 19:22:11.003518');
INSERT INTO public.users VALUES (3, 'erich', 'kkkko@gmail.com', '$2b$10$c1qlTU5nkgQvuqgTQdCbO.1D1pJqlayEB2aKUjY5WPEIgXdo7fd6C', '2022-10-16 19:22:26.213273');
INSERT INTO public.users VALUES (4, 'gabritinha', 'kkkplko@gmail.com', '$2b$10$kL0UxWGD1hcshMQAmo7eyuaNcLywyzA8r7qCzXAQ7llX.K5s4HSem', '2022-10-16 19:22:34.009117');
INSERT INTO public.users VALUES (5, 'renatella', 'popo@gmail.com', '$2b$10$gSyu/T9KdQw92.nMJoSPROOiM3uT/sAZvwjDhC.2sYUtjhKnRSIpG', '2022-10-16 19:22:43.383321');
INSERT INTO public.users VALUES (6, 'tiao', 'plpl@gmail.com', '$2b$10$7oCC0/70j1i.UgJe/lxwW.skL7FtO9ZA13zBDI9cX6irGgD2LoDgO', '2022-10-16 19:23:04.17717');
INSERT INTO public.users VALUES (7, 'cruiz', 'plp1l@gmail.com', '$2b$10$kGF4vrQc5SyUax9KEDeymeIT1mL.meMC9G.4SH.TyN/FfJq.Cks.G', '2022-10-16 19:23:10.49657');
INSERT INTO public.users VALUES (8, 'derick', 'plpw1l@gmail.com', '$2b$10$KYCVw.EXoxwM3lKOVvH34.HNTdX5lSQ1jQpKL/Cdj2/B4HPwxtT6y', '2022-10-16 19:23:16.3417');
INSERT INTO public.users VALUES (9, 'jefesro', 'plp3w1l@gmail.com', '$2b$10$hd0Q1rP8MCyUSjDWCWW2w.sD/FZDL3493eDATbhtbJKtW6XbGX7eC', '2022-10-16 19:23:24.679305');
INSERT INTO public.users VALUES (10, 'leblanc', 'leblanc@gmail.com', '$2b$10$PtWy.3MUpLIhzkRN8KX.hO3er.VFMD/uH5FbPGRCF8h6hpZXtFml6', '2022-10-16 19:24:03.428567');
INSERT INTO public.users VALUES (11, 'tunico', 'to@gmail.com', '$2b$10$o9jQIcilGf/wCfBVP3wXQu/qwyEch7VU2R5c2x6Hlm4jh9bG0c8sq', '2022-10-16 19:34:40.405932');
INSERT INTO public.users VALUES (12, 'tinoco', 'ti@gmail.com', '$2b$10$0Nj5NXEugby0rwlroKPyAOu6g7KoFJpDZWYM1TOFm9T5AdKG/D64S', '2022-10-16 19:34:46.526272');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: urls urls_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pk PRIMARY KEY (id);


--
-- Name: users users_createdAt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_createdAt_key" UNIQUE ("createdAt");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_password_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_password_key UNIQUE (password);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

