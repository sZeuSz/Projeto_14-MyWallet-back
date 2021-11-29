--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    user_id integer,
    user_name text,
    token text
);


ALTER TABLE public.sessions OWNER TO mvsmevhasvurzw;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    user_id integer,
    value numeric,
    description text,
    date date
);


ALTER TABLE public.transactions OWNER TO mvsmevhasvurzw;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    email text,
    password text
);


ALTER TABLE public.users OWNER TO mvsmevhasvurzw;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO mvsmevhasvurzw;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (user_id, user_name, token) FROM stdin;
129	zeninho	00fc500e-09eb-48b2-bf9e-c8f8132cfa6b
129	zeninho	491945ab-0d15-47a2-8153-d5eb164a4857
131	juju	f258625c-9694-4ac5-a9f1-2b58ba7c210c
131	juju	92f7d376-3857-4d18-93a6-f07c734d4b3d
131	juju	09d514e1-22dd-46d0-9553-ca992d16aa58
131	juju	b0583851-ecb0-4ba4-a515-12fd6446ac14
131	juju	ead08406-b466-426a-97ee-abcd72baa78c
131	juju	348c85b6-94d4-4751-977a-a5443dc41d28
131	juju	fddb707c-e86f-4b37-9125-a43d527d2ed6
131	juju	38aeb97e-50f8-47b5-954e-dda6ce083454
131	juju	ed7df65d-70e9-46e9-ac3d-c5ad0f1c5d12
131	juju	d65808c5-b623-4fa8-9a0b-ccf0eaccecb0
131	juju	f7c63eef-8b09-461d-bc64-dcc0ac912544
131	juju	43b4f87b-e2b9-41f0-aa46-0dd0b49245b8
131	juju	4ca333d5-cc6b-4387-b48e-35a20eda5477
131	juju	06359a50-8972-421b-9478-052ac69c6e5d
131	juju	bd1080b9-77ac-4582-8941-11c3c15b3f7a
131	juju	5e3b6d67-811b-4ba3-9e4e-4c2bb82fbc3c
131	juju	0cea9752-5988-478b-a69f-fe21a726a401
131	juju	39751321-00ff-4442-842a-cd793afd4dfb
131	juju	7ee39456-26fb-472a-bac2-14401721449f
131	juju	e17561e1-7a8b-4bb7-80b4-265bc4710355
131	juju	af892598-8d0d-40db-b15e-c73a9dbc9cd0
131	juju	fd740a2a-fb15-4022-b0c6-46ab47b91f64
131	juju	c5e292e7-dccb-4be4-95f2-0a80bf88e889
131	juju	8cc536ef-3d34-4b89-b2a5-ac55f8b8d6e5
131	juju	5b8e02a5-03d8-4282-bd4b-e15b65306131
131	juju	1770348a-f0c8-41af-9616-21ad0959786a
131	juju	3abd451d-b485-406d-9ccb-756c1e2bcbc6
131	juju	5569f225-bad6-4625-9fdc-b257149e1a83
131	juju	41b26f65-beea-40db-994c-ded532c14e37
131	juju	e4220fea-7360-4c35-91ff-61f6fb78d290
131	juju	0e39be0b-fc50-495b-954e-02c3fda052b2
131	juju	f42f04ee-a416-46f9-848c-346bf2fe2463
131	juju	565e8474-85ce-467a-b5a2-4997a9ce586d
131	juju	d83608f7-1a9b-42a1-8015-319970036990
131	juju	61626120-25f8-49a9-8767-02234e3e637c
131	juju	1d42d3f5-aeb8-4ad2-a62e-f1589b31f882
131	juju	67ef638a-1399-4d0c-b8fe-98ea07250500
131	juju	8ab99bc0-0aea-439d-9bae-097c808e5b47
131	juju	dbd65be3-16a6-4304-8de4-726674debc68
131	juju	181b56d0-d7f0-4c0d-90e3-9ea3adca1930
131	juju	b398b125-cecc-4ff1-8d48-864d0e5882fc
131	juju	549f4492-c735-48e2-84f1-b23bf6f406e5
131	juju	49458459-027a-4406-bc30-3e0a9eb2947c
131	juju	74429b2b-fee9-47f2-80b5-f944cccd9483
131	juju	0c53436a-1897-4537-aa35-09e19377d043
131	juju	594b7b9f-f961-4152-ad08-ed1e2e0759d9
131	juju	f7efbc98-61e0-495b-9b5e-adf8a2f7a86b
131	juju	18f85519-51e6-4de8-a3a4-f901542a772c
131	juju	d3ca83e8-c2f4-4073-8012-f8fcd70176da
131	juju	8d06aa3d-419f-4cbe-a387-f200860ff517
131	juju	a3786ea5-829a-4e26-bad3-46bb889fb0c5
131	juju	7270874b-1045-4d10-8c46-940b30efb2c3
131	juju	f7b91112-ea3a-4740-b0e9-0d5d8cbbc140
131	juju	b9f3018d-5355-440c-a400-a86267ef07f8
131	juju	2d618591-ace9-4925-9b90-bf0d3a463193
132	Ronaldo	afab7a40-0d59-496b-943a-f91794ba5376
131	juju	8972afb0-0f3e-43a9-869d-7f442049e84a
131	juju	45a7773b-4d87-4b5f-80de-572d305671e9
131	juju	7370f2a8-3634-489e-8695-af7467adb152
131	juju	895510fa-514e-42fb-a572-7fb0f03e059b
131	juju	8cfb7bb8-1bb8-4335-9ced-4ca95e33338b
131	juju	6baff441-1d18-4c58-956a-1d9e668e1404
131	juju	a34f1836-5d87-4944-98aa-80eccd96aa09
131	juju	823131e1-11a5-4c94-ba30-53925571c271
131	juju	a54e27dd-5aea-48b9-8c14-f03691773764
131	juju	e23f3510-2f4c-413f-89f4-8d184cb18b48
131	juju	d6318bc7-effd-42db-b57d-a3999a286bca
131	juju	a0ee1137-3f19-43a2-8ceb-01a1572bb92f
131	juju	5f755e1e-4f11-497f-addc-e5daad0c2c51
131	juju	b8b6ff19-46be-49be-9b9a-6a48baea9e3b
131	juju	71fa0b7c-f667-4d0a-b5c3-1a9ec57438d7
131	juju	c773d092-083d-4ade-86a9-9f15b4f44d3f
131	juju	cefe7bad-b877-44ef-8ec4-b135a487ae64
134	rock	2b76815f-756d-44a7-ad7b-4357dd55a7d9
131	juju	551782ab-45e9-4cce-9844-2b9df83082c5
131	juju	2fc32d6f-5ff4-4832-b235-37e185edfb18
131	juju	37edd224-6247-4dc2-8f35-6c485d8b1720
131	juju	467217ff-bd37-4481-9ebf-0b5ea6993964
131	juju	c004c055-5e30-403e-bc29-4b7aa88d800d
131	juju	c846662c-f00b-4233-a35b-d81878898511
131	juju	3ea910a1-8375-43f6-b754-67ada565edff
131	juju	77e3d36c-7552-4477-ac00-18510f390694
131	juju	df9b7fd7-deef-48c6-b53f-844077726d86
131	juju	757d331c-031c-486c-bb1b-4f6769e79939
131	juju	0c5dd8a7-a81f-482b-8ad4-8f578b9e06a8
131	juju	605b1468-f139-4755-a840-fc46015609d2
131	juju	1079c3fe-bad9-4e31-b8e9-9698435c2f3d
131	juju	76b43602-993a-46af-965f-ea7e50139682
131	juju	c69e8d08-b53a-4308-8e2d-a92c91069114
131	juju	e67491ee-147b-4e2e-921f-873d3ea9b79e
131	juju	11386129-95e8-4bfa-8a3a-aad33dda40ba
131	juju	b718e6f0-d967-4959-924e-d9d9cdf2c26b
131	juju	c6b6f09e-c3b8-489f-b48f-dc22d49ffbe3
131	juju	a76adcd3-9938-446f-9a20-433ec40177ef
131	juju	db1c35f6-e941-493e-b0d4-cdf0eb536aeb
131	juju	6a34fb10-1f00-4ed8-86ad-07a6f04a8556
131	juju	1f0d3aaf-ae0e-4d3f-a837-bb432ee843eb
131	juju	659496cf-04ae-4df1-b949-5f0e2602f33a
131	juju	606b6587-1c3b-48b7-9a77-8b48016b87a5
131	juju	630fa5ac-c77c-44a5-a9e1-41fd05b057ed
131	juju	a05bdb0e-bae8-4405-924a-25206103b265
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (user_id, value, description, date) FROM stdin;
129	55	ração	2021-10-25
129	-99	papagaio	2021-10-25
129	500	sacos de lixo	2021-10-25
129	-20	passe	2021-10-25
129	10	venda do salgadinho	2021-10-25
131	22.56	Corretor	2021-11-25
131	55	Juninho	2021-11-25
131	669	Jandersu	2021-11-25
131	33	Junihn	2021-11-25
131	52	Liuss	2021-11-25
131	55	Leonardo	2021-11-25
131	233	Bernarndin	2021-11-25
131	899	Juno, lo brabo	2021-11-25
131	85	AKuu	2021-11-25
131	-22	juninho	2021-11-26
131	-77	paulo	2021-11-26
131	52	Bruno	2021-11-26
131	-8	joaquin	2021-11-26
131	55	Brunoo	2021-11-26
131	255	Bruna	2021-11-26
131	22	Uhan	2021-11-26
131	88	Bruninho	2021-11-26
131	88	Chulin	2021-11-26
134	-555	Me roubaram hoje	2021-11-26
134	-200	roubo	2021-11-26
134	855	roubei porque me roubaram	2021-11-26
134	88	Juno	2021-11-26
134	-32	roubaru	2021-11-26
134	-88	Meu dog	2021-11-26
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
129	zeninho	zeninho@gmail.com	$2b$12$7j5SIwoLEV2nPPuiTlt5Au.hsq8HytfDlNOwDIheT25aH8USGj1mq
130	juju	ju@gmail.com	$2b$12$KaQRYGfg7HdX0L7IeCZusOqWNg6DIyIMTRq9EPOPA6PQhVcrqPJdi
131	juju	ju@ju.com	$2b$12$VD/3IFAyPrkaqmkHcaTY1O3Wb0oXDfvSfSSnOC1FNFFhLmf23WPcC
132	Ronaldo	ronaldo@gmail.com	$2b$12$7rFZB7N.5BOGD2i1bRNlxOf8DhBqpX.ouCU/rH.aGS31rLW6JgKIq
133	brunin	bruno@bruno.com	$2b$12$lUoEJltvxhh42N54lUBA8.ZTpEeXtL59W/PB7D8jFZMIELsf8vhAW
134	rock	rock@rock.com	$2b$12$wn.fDNqvLIaF.bkAO6YSEeIB7IElcM8CAY9K9Z9YAx8JqDrVtqLWu
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 134, true);


--
-- PostgreSQL database dump complete
--

