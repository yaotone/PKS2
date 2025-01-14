--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: building_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.building_materials (
    material_code integer NOT NULL,
    material_name text
);


ALTER TABLE public.building_materials OWNER TO postgres;

--
-- Name: districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.districts (
    district_code integer NOT NULL,
    district_name text
);


ALTER TABLE public.districts OWNER TO postgres;

--
-- Name: marks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marks (
    mark_code integer NOT NULL,
    property_code integer,
    date_of_mark date,
    criteria_code integer,
    mark integer
);


ALTER TABLE public.marks OWNER TO postgres;

--
-- Name: marks_criterias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marks_criterias (
    criteria_code integer NOT NULL,
    criteria_name text
);


ALTER TABLE public.marks_criterias OWNER TO postgres;

--
-- Name: property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property (
    property_code integer NOT NULL,
    district integer,
    adress text,
    floorr integer,
    quantity_of_rooms integer,
    typess integer,
    status integer,
    price real,
    property_description text,
    property_material integer,
    property_square real,
    ad_date date
);


ALTER TABLE public.property OWNER TO postgres;

--
-- Name: rieltor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rieltor (
    rieltor_code integer NOT NULL,
    rieltor_name text,
    rieltor_lastname text,
    rieltor_surname text,
    rieltor_phone_number text
);


ALTER TABLE public.rieltor OWNER TO postgres;

--
-- Name: selling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.selling (
    selling_code integer NOT NULL,
    property_code integer,
    selling_date date,
    rieltor_code integer,
    price real
);


ALTER TABLE public.selling OWNER TO postgres;

--
-- Name: typess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typess (
    type_code integer NOT NULL,
    type_name character(1)
);


ALTER TABLE public.typess OWNER TO postgres;

--
-- Data for Name: building_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.building_materials (material_code, material_name) FROM stdin;
1	╨║╨╕╤А╨┐╨╕╤З
2	╨▒╨╡╤В╨╛╨╜
3	╨┤╨╡╤А╨╡╨▓╨╛
4	╨║╨╡╤А╨░╨╝╨╛╨▒╨╗╨╛╨║╨╕
5	╨│╨░╨╖╨╛╨▒╨╡╤В╨╛╨╜
\.


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.districts (district_code, district_name) FROM stdin;
1	╨Р╤А╨▒╨░╤В
2	╨С╨░╤Б╨╝╨░╨╜╨╜╤Л╨╣
3	╨Ч╨░╨╝╨╛╤Б╨║╨▓╨╛╤А╨╡╤З╤М╨╡
4	╨Ъ╤А╨░╤Б╨╜╨╛╤Б╨╡╨╗╤М╤Б╨║╨╕╨╣
5	╨Ь╨╡╤Й╨░╨╜╤Б╨║╨╕╨╣
6	╨Я╤А╨╡╤Б╨╜╨╡╨╜╤Б╨║╨╕╨╣
7	╨в╨░╨│╨░╨╜╤Б╨║╨╕╨╣
8	╨в╨▓╨╡╤А╤Б╨║╨╛╨╣
9	╨е╨░╨╝╨╛╨▓╨╜╨╕╨║╨╕
\.


--
-- Data for Name: marks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marks (mark_code, property_code, date_of_mark, criteria_code, mark) FROM stdin;
1	1	2018-02-12	1	4
2	1	2018-02-12	2	5
3	1	2018-02-12	3	4
4	1	2018-02-12	4	3
5	1	2018-02-12	5	2
6	1	2018-02-12	6	1
7	1	2018-02-12	7	5
8	2	2018-03-25	1	1
9	2	2018-03-25	2	4
10	2	2018-03-25	3	5
11	2	2018-03-25	4	5
12	2	2018-03-25	5	2
13	2	2018-03-25	6	3
14	2	2018-03-25	7	5
15	3	2017-01-19	1	2
16	3	2017-01-19	2	3
17	3	2017-01-19	3	4
18	3	2017-01-19	4	3
19	3	2017-01-19	5	3
20	3	2017-01-19	6	2
21	3	2017-01-19	7	1
22	4	2017-03-21	1	5
23	4	2017-03-21	2	3
24	4	2017-03-21	3	4
25	4	2017-03-21	4	5
26	4	2017-03-21	5	2
27	4	2017-03-21	6	5
28	4	2017-03-21	7	5
29	5	2018-01-16	1	2
30	5	2018-01-16	2	4
31	5	2018-01-16	3	3
32	5	2018-01-16	4	5
33	5	2018-01-16	5	2
34	5	2018-01-16	6	4
35	5	2018-01-16	7	5
36	6	2018-02-14	1	2
37	6	2018-02-14	2	3
38	6	2018-02-14	3	4
39	6	2018-02-14	4	5
40	6	2018-02-14	5	1
41	6	2018-02-14	6	5
42	6	2018-02-14	7	4
43	7	2017-01-30	1	5
44	7	2017-01-30	2	3
45	7	2017-01-30	3	4
46	7	2017-01-30	4	4
47	7	2017-01-30	5	1
48	7	2017-01-30	6	2
49	7	2017-01-30	7	5
50	8	2017-03-19	1	1
51	8	2017-03-19	2	2
52	8	2017-03-19	3	4
53	8	2017-03-19	4	4
54	8	2017-03-19	5	3
55	8	2017-03-19	6	5
56	8	2017-03-19	7	4
57	9	2019-01-21	1	1
58	9	2019-01-21	2	1
59	9	2019-01-21	3	2
60	9	2019-01-21	4	5
61	9	2019-01-21	5	5
62	9	2019-01-21	6	3
63	9	2019-01-21	7	4
64	10	2019-02-23	1	5
65	10	2019-02-23	2	2
66	10	2019-02-23	3	5
67	10	2019-02-23	4	5
68	10	2019-02-23	5	5
69	10	2019-02-23	6	2
70	10	2019-02-23	7	1
71	11	2019-03-11	1	3
72	11	2019-03-11	2	4
73	11	2019-03-11	3	5
74	11	2019-03-11	4	5
75	11	2019-03-11	5	4
76	11	2019-03-11	6	3
77	11	2019-03-11	7	4
78	12	2019-04-01	1	3
79	12	2019-04-01	2	5
80	12	2019-04-01	3	2
81	12	2019-04-01	4	5
82	12	2019-04-01	5	4
83	12	2019-04-01	6	5
84	12	2019-04-01	7	3
85	13	2019-02-27	1	1
86	13	2019-02-27	1	4
87	13	2019-02-27	1	5
88	13	2019-02-27	1	3
89	13	2019-02-27	1	4
90	13	2019-02-27	1	4
91	13	2019-02-27	1	5
92	14	2019-02-13	1	4
93	14	2019-02-13	2	5
94	14	2019-02-13	3	5
95	14	2019-02-13	4	5
96	14	2019-02-13	5	4
97	14	2019-02-13	6	3
98	14	2019-02-13	7	1
99	15	2017-01-31	1	3
100	15	2017-01-31	2	3
101	15	2017-01-31	3	1
102	15	2017-01-31	4	2
103	15	2017-01-31	5	5
104	15	2017-01-31	6	4
105	15	2017-01-31	7	3
106	16	2017-01-06	1	2
107	16	2017-01-06	2	5
108	16	2017-01-06	3	5
109	16	2017-01-06	4	4
110	16	2017-01-06	5	4
111	16	2017-01-06	6	5
112	16	2017-01-06	7	5
113	17	2018-12-20	1	2
114	17	2018-12-20	2	2
115	17	2018-12-20	3	2
116	17	2018-12-20	4	2
117	17	2018-12-20	5	2
118	17	2018-12-20	6	2
119	17	2018-12-20	7	2
120	18	2018-09-12	1	1
121	18	2018-09-12	2	1
122	18	2018-09-12	3	1
123	18	2018-09-12	4	1
124	18	2018-09-12	5	1
125	18	2018-09-12	6	1
126	18	2018-09-12	7	1
127	19	2020-06-07	1	4
128	19	2020-06-07	2	4
129	19	2020-06-07	3	2
130	19	2020-06-07	4	5
131	19	2020-06-07	5	4
132	19	2020-06-07	6	3
133	19	2020-06-07	7	5
134	20	2020-11-30	1	5
135	20	2020-11-30	2	5
136	20	2020-11-30	3	5
137	20	2020-11-30	4	5
138	20	2020-11-30	5	5
139	20	2020-11-30	6	5
140	20	2020-11-30	7	5
141	21	2020-11-30	1	2
142	21	2020-11-30	2	3
143	21	2020-11-30	3	4
144	21	2020-11-30	4	5
145	21	2020-11-30	5	5
146	21	2020-11-30	6	1
147	21	2020-11-30	7	2
148	22	2020-11-30	1	4
149	22	2020-11-30	2	3
150	22	2020-11-30	3	1
151	22	2020-11-30	4	5
152	22	2020-11-30	5	5
153	22	2020-11-30	6	3
154	22	2020-11-30	7	4
155	23	2020-11-30	1	5
156	23	2020-11-30	2	5
157	23	2020-11-30	3	5
158	23	2020-11-30	4	5
159	23	2020-11-30	5	5
160	23	2020-11-30	6	2
161	23	2020-11-30	7	2
162	24	2020-11-30	1	3
163	24	2020-11-30	2	4
164	24	2020-11-30	3	1
165	24	2020-11-30	4	2
166	24	2020-11-30	5	5
167	24	2020-11-30	6	5
168	25	2020-11-30	1	5
169	25	2020-11-30	2	5
170	25	2020-11-30	3	5
171	25	2020-11-30	4	5
172	25	2020-11-30	5	5
173	25	2020-11-30	6	5
174	25	2020-11-30	7	5
175	26	2020-11-30	1	5
176	26	2020-11-30	2	5
177	26	2020-11-30	3	5
178	26	2020-11-30	4	5
179	26	2020-11-30	5	5
180	26	2020-11-30	6	5
181	26	2020-11-30	7	5
182	27	2020-11-30	1	5
183	27	2020-11-30	2	5
184	27	2020-11-30	3	5
185	27	2020-11-30	4	5
186	27	2020-11-30	5	5
187	27	2020-11-30	6	5
188	27	2020-11-30	7	5
189	28	2020-11-30	1	5
190	28	2020-11-30	2	5
191	28	2020-11-30	3	5
192	28	2020-11-30	4	5
193	28	2020-11-30	5	5
194	28	2020-11-30	6	5
195	28	2020-11-30	7	5
196	29	2020-11-30	1	5
197	29	2020-11-30	2	5
198	29	2020-11-30	3	5
199	29	2020-11-30	4	5
200	29	2020-11-30	5	5
201	29	2020-11-30	6	5
202	29	2020-11-30	7	5
203	30	2020-11-30	1	5
204	30	2020-11-30	2	5
205	30	2020-11-30	3	5
206	30	2020-11-30	4	5
207	30	2020-11-30	5	5
208	30	2020-11-30	6	5
209	30	2020-11-30	7	5
210	31	2020-11-30	1	5
211	31	2020-11-30	2	5
212	31	2020-11-30	3	5
213	31	2020-11-30	4	5
214	31	2020-11-30	5	5
215	31	2020-11-30	6	5
216	31	2020-11-30	7	5
217	32	2020-11-30	1	5
218	32	2020-11-30	2	5
219	32	2020-11-30	3	5
220	32	2020-11-30	4	5
221	32	2020-11-30	5	5
222	32	2020-11-30	6	5
223	32	2020-11-30	7	5
224	33	2020-11-30	1	5
225	33	2020-11-30	2	5
226	33	2020-11-30	3	5
227	33	2020-11-30	4	5
228	33	2020-11-30	5	5
229	33	2020-11-30	6	5
230	33	2020-11-30	7	5
231	34	2020-11-30	1	5
232	34	2020-11-30	2	5
233	34	2020-11-30	3	5
234	34	2020-11-30	4	5
235	34	2020-11-30	5	5
236	34	2020-11-30	6	5
237	34	2020-11-30	7	5
238	35	2020-11-30	1	5
239	35	2020-11-30	2	5
240	35	2020-11-30	3	5
241	35	2020-11-30	4	5
242	35	2020-11-30	5	5
243	35	2020-11-30	6	5
244	35	2020-11-30	7	5
245	36	2020-11-30	1	5
246	36	2020-11-30	2	5
247	36	2020-11-30	3	5
248	36	2020-11-30	4	5
249	36	2020-11-30	5	5
250	36	2020-11-30	6	5
251	36	2020-11-30	7	5
252	1	2018-02-12	1	3
253	1	2018-02-12	1	5
254	1	2018-02-12	2	2
255	1	2018-02-12	2	4
256	1	2018-02-12	3	2
257	1	2018-02-12	3	5
259	1	2018-02-12	4	3
258	1	2018-02-12	4	3
260	1	2018-02-12	5	2
261	1	2018-02-12	5	2
263	1	2018-02-12	6	3
262	1	2018-02-12	6	5
265	1	2018-02-12	7	5
264	1	2018-02-12	7	2
\.


--
-- Data for Name: marks_criterias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marks_criterias (criteria_code, criteria_name) FROM stdin;
1	╨С╨╡╨╖╨╛╨┐╨░╤Б╨╜╨╛╤Б╤В╤М
2	╨Я╨░╤А╨║╨╛╨▓╨╛╤З╨╜╤Л╨╡ ╨╝╨╡╤Б╤В╨░
3	╨Ф╨╛╤Б╤В╤Г╨┐╨╜╨╛╤Б╤В╤М ╨╝╨╡╤В╤А╨╛
4	╨б╨╛╤Ж╨╕╨░╨╗╤М╨╜╨░╤П ╨╕╨╜╤Д╤А╨░╤Б╤В╤А╤Г╨║╤В╤Г╤А╨░
5	╨з╨╕╤Б╤В╨╛╤В╨░
6	╨н╨║╨╛╨╗╨╛╨│╨╕╤П
7	╨б╨╛╤Б╨╡╨┤╨╕
\.


--
-- Data for Name: property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property (property_code, district, adress, floorr, quantity_of_rooms, typess, status, price, property_description, property_material, property_square, ad_date) FROM stdin;
5	2	╨С╨╛╨╗╤М╤И╨╛╨╣ ╨Ч╨╗╨░╤В╨╛╤Г╤Б╤В╨╕╨╜╤Б╨║╨╕╨╣ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║, 6╤Б1	4	3	2	1	2.4e+07	...	2	110	2019-01-16
17	5	╨С╨╛╨╗╤М╤И╨╛╨╣ ╨У╨╛╨╗╨╛╨▓╨╕╨╜ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║, 2	2	1	2	1	9e+06	...	1	25	2019-12-20
18	5	╨С╨╛╨╗╤М╤И╨╛╨╣ ╨б╨╡╤А╨│╨╕╨╡╨▓╤Б╨║╨╕╨╣ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║, 10	3	1	2	0	5e+06	...	1	17	2019-09-12
1	1	╤Г╨╗╨╕╤Ж╨░ ╨Р╤А╨▒╨░╤В, 24	5	3	2	0	3.5e+07	...	1	117	2018-02-12
2	1	╨Ъ╤А╨╕╨▓╨╛╨░╤А╨▒╨░╤В╤Б╨║╨╕╨╣ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║, 1	10	2	2	1	2e+07	...	5	70	2018-03-25
3	1	╤Г╨╗╨╕╤Ж╨░ ╨Э╨╛╨▓╤Л╨╣ ╨Р╤А╨▒╨░╤В, 11╤Б1	24	7	2	0	6e+07	...	4	537	2017-01-19
4	1	╤Г╨╗╨╕╤Ж╨░ ╨Э╨╛╨▓╤Л╨╣ ╨Р╤А╨▒╨░╤В, 8	8	4	2	1	5.4e+07	...	1	195	2017-03-21
6	2	╤Г╨╗╨╕╤Ж╨░ ╨Я╨╛╨║╤А╨╛╨▓╨║╨░, 29	3	1	2	0	1.8e+07	...	2	65	2018-02-14
7	2	╨з╨╕╤Б╤В╨╛╨┐╤А╤Г╨┤╨╜╤Л╨╣ ╨▒╤Г╨╗╤М╨▓╨░╤А, 11╤Б1	11	2	2	1	2.3e+07	...	1	91	2017-01-30
8	2	╤Г╨╗╨╕╤Ж╨░ ╨Ц╤Г╨║╨╛╨▓╤Б╨║╨╛╨│╨╛, 5	5	5	2	0	4.1e+07	...	1	270	2017-03-19
9	3	╨С╨╛╨╗╤М╤И╨░╤П ╨Я╨╕╨╛╨╜╨╡╤А╤Б╨║╨░╤П ╤Г╨╗╨╕╤Ж╨░, 1	6	1	2	0	1.2e+07	...	1	41	2019-01-21
10	3	╨Ы╤О╤Б╨╕╨╜╨╛╨▓╤Б╨║╨░╤П ╤Г╨╗╨╕╤Ж╨░, 51	10	1	2	1	1e+07	...	1	36	2019-02-23
11	3	╤Г╨╗╨╕╤Ж╨░ ╨Я╨░╨▓╨╗╨░ ╨Р╨╜╨┤╤А╨╡╨╡╨▓╨░, 28╨║3	12	3	2	0	2.3e+07	...	1	78	2019-03-11
12	3	╨Ь╤Л╤В╨╜╨░╤П ╤Г╨╗╨╕╤Ж╨░, 7╤Б1	1	6	2	1	3.9e+07	...	1	310	2019-04-01
13	4	╨Ъ╨░╨╗╨░╨╜╤З╤С╨▓╤Б╨║╨░╤П ╤Г╨╗╨╕╤Ж╨░, 47	2	12	2	0	1.2e+08	...	1	810	2019-02-27
14	4	╨Ь╨╕╨╗╤О╤В╨╕╨╜╤Б╨║╨╕╨╣ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║, 22	9	2	2	1	2.2e+07	...	1	97	2019-02-13
15	4	╤Г╨╗╨╕╤Ж╨░ ╨С╨╛╨╗╤М╤И╨░╤П ╨Ы╤Г╨▒╤П╨╜╨║╨░, 20╤Б2	11	4	2	1	2.8e+07	...	1	111	2017-01-31
16	4	╤Г╨╗╨╕╤Ж╨░ ╨Ь╨░╨╗╨░╤П ╨Ы╤Г╨▒╤П╨╜╨║╨░, 14	14	3	2	0	3.1e+07	...	1	142	2017-01-06
19	5	╨в╤А╤Г╨▒╨╜╨░╤П ╤Г╨╗╨╕╤Ж╨░, 2	6	5	2	0	3.3e+07	...	1	124	2020-06-07
20	5	╨Э╨╕╨╢╨╜╨╕╨╣ ╨Ъ╨╕╤Б╨╡╨╗╤М╨╜╤Л╨╣ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║, 4	26	7	2	0	7e+07	...	1	561	2020-11-30
21	6	╨Ч╨▓╨╡╨╜╨╕╨│╨╛╤А╨╛╨┤╤Б╨║╨╛╨╡ ╤И╨╛╤Б╤Б╨╡, 11	17	2	2	1	2.35e+07	...	1	62	2020-01-15
22	6	╤Г╨╗╨╕╤Ж╨░ ╨б╨╡╤А╨│╨╡╤П ╨Ь╨░╨║╨╡╨╡╨▓╨░, 9╨║1	31	3	2	1	3.1325e+07	...	1	94	2020-02-16
23	6	╤Г╨╗╨╕╤Ж╨░ ╨б╨╡╤А╨│╨╡╤П ╨Ь╨░╨║╨╡╨╡╨▓╨░, 9╨║4	11	4	2	0	3.8666664e+07	...	1	111	2020-03-11
24	6	╤Г╨╗╨╕╤Ж╨░ ╨Ъ╨╛╤Б╤В╨╕╨║╨╛╨▓╨░, 7	12	1	2	0	1.2432e+07	...	1	42	2020-04-13
25	7	2-╨╣ ╨Ъ╨╛╤В╨╡╨╗╤М╨╜╨╕╤З╨╡╤Б╨║╨╕╨╣ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║, 5	9	5	2	1	4.243228e+07	...	1	114	2021-04-09
26	7	╨Ъ╨╛╤В╨╡╨╗╤М╨╜╨╕╤З╨╡╤Б╨║╨░╤П ╨╜╨░╨▒╨╡╤А╨╡╨╢╨╜╨░╤П, 25╨║2	8	4	2	0	4.1333332e+07	...	1	113	2021-04-05
27	7	╨У╨╛╨╜╤З╨░╤А╨╜╨░╤П ╤Г╨╗╨╕╤Ж╨░, 30╤Б1	15	2	2	1	2.3616272e+07	...	1	65	2021-02-01
28	7	1-╨╣ ╨У╨╛╨╜╤З╨░╤А╨╜╤Л╨╣ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║, 8╤Б6	42	13	2	0	2.5e+08	...	1	1100	2021-03-30
29	8	╤Г╨╗╨╕╤Ж╨░ ╨Ь╨░╨╗╨░╤П ╨Ф╨╝╨╕╤В╤А╨╛╨▓╨║╨░, 23/15╤Б1	10	1	2	1	1.8e+07	...	1	43	2021-12-10
30	8	╨Ъ╨╛╨╖╨╕╤Ж╨║╨╕╨╣ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║, 7	2	2	2	0	2.9e+07	...	1	63	2021-11-14
31	8	╤Г╨╗╨╕╤Ж╨░ ╨Я╨╡╤В╤А╨╛╨▓╨║╨░, 18	3	3	2	1	3.7e+07	...	1	81	2022-05-17
32	8	╨б╤В╨╛╨╗╨╡╤И╨╜╨╕╨║╨╛╨▓ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║, 14	4	4	2	0	4.6e+07	...	1	103	2022-02-24
33	9	╤Г╨╗╨╕╤Ж╨░ ╨в╨╕╨╝╤Г╤А╨░ ╨д╤А╤Г╨╜╨╖╨╡, 18	5	5	2	1	5.7e+07	...	1	124	2022-01-31
34	9	╨Ч╤Г╨▒╨╛╨▓╤Б╨║╨░╤П ╤Г╨╗╨╕╤Ж╨░, 7	6	6	2	0	6.4e+07	...	1	152	2022-02-25
35	9	1-╨╣ ╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║ ╨в╤А╤Г╨╢╨╡╨╜╨╕╨║╨╛╨▓, 17╨Р	7	7	2	1	7.8e+07	...	1	193	2022-03-24
36	9	╨Я╨╛╨│╨╛╨┤╨╕╨╜╤Б╨║╨░╤П ╤Г╨╗╨╕╤Ж╨░, 4	8	8	2	0	9.7e+07	...	1	344	2022-02-21
\.


--
-- Data for Name: rieltor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rieltor (rieltor_code, rieltor_name, rieltor_lastname, rieltor_surname, rieltor_phone_number) FROM stdin;
1	╨Ч╨░╨╣╤Ж╨╡╨▓	╨Х╤Д╨╕╨╝	╨Р╨╗╨╡╨║╤Б╨╡╨╡╨▓╨╕╤З	79672723030
2	╨Ь╨╡╨┤╨▓╨╡╨┤╨╡╨▓	╨Ш╨│╨╛╤А╤М	╨Ш╨╛╤Б╨╕╤Д╨╛╨▓╨╕╤З	79673017797
3	╨а╨╛╨╝╨░╨╜╨╛╨▓	╨У╨╡╤А╨╝╨░╨╜	╨Я╨░╨╜╤В╨╡╨╗╨╡╨╣╨╝╨╛╨╜╨╛╨▓╨╕╤З	79675231648
4	╨Ъ╨░╨╗╨╕╨╜╨╕╨╜	╨Р╨┐╨╛╨╗╨╗╨╛╨╜	╨Ь╨░╨║╨░╤А╨╛╨▓╨╕╤З	79675296004
5	╨Я╨╡╤В╤Г╤Е╨╛╨▓	╨Р╨╜╤В╨╛╨╜	╨Т╨╕╤В╨░╨╗╤М╨╡╨▓╨╕╤З	79677778078
6	╨Ш╤Б╨░╨╡╨▓	╨Ш╨│╨╜╨░╤В╨╕╨╣	╨У╨╡╤А╨╝╨░╨╜╨╜╨╛╨▓╨╕╤З	79678916992
7	╨Р╨▓╨┤╨╡╨╡╨▓	╨Ь╨╡╤З╨╡╤Б╨╗╨░╨▓	╨Т╨░╨┤╨╕╨╝╨╛╨▓╨╕╤З	79672658149
8	╨У╨╛╤А╨┤╨╡╨╡╨▓	╨Ы╤О╨▒╨╛╨╝╨╕╤А	╨Ь╤Н╨╗╨╛╤А╨╛╨▓╨╕╤З	79677827970
9	╨С╨╕╤А╤О╨║╨╛╨▓	╨Т╨╕╤Б╤Б╨░╤А╨╕╨╛╨╜	╨п╨║╤Г╨╜╨╛╨▓╨╕╤З	79674745539
10	╨Ь╨╛╨╕╤Б╨╡╨╡╨▓	╨Р╨╗╤М╤Д╤А╨╡╨┤	╨Т╨╗╨░╨┤╨╕╤Б╨╗╨░╨▓╨╛╨▓╨╕╤З	79672001026
\.


--
-- Data for Name: selling; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.selling (selling_code, property_code, selling_date, rieltor_code, price) FROM stdin;
1	1	2018-03-14	1	3.8e+07
2	3	2017-02-19	1	6.4e+07
3	6	2018-04-13	1	1.9e+07
4	8	2017-04-11	2	4.5e+07
5	9	2019-02-21	2	1.5e+07
6	11	2018-04-25	2	1.2e+07
7	13	2019-03-27	3	1.7e+07
8	16	2017-02-02	3	3.9e+07
9	18	2019-10-21	3	7e+06
10	19	2020-12-01	4	3.5e+07
11	20	2020-11-30	4	7.1e+07
12	23	2020-04-12	4	4.1e+07
13	24	2020-05-12	5	1.4e+07
14	26	2021-04-12	5	4.7e+07
15	28	2021-04-30	5	2.74e+08
16	30	2021-12-02	6	3.1e+07
17	32	2022-12-03	7	4.9e+07
18	34	2022-05-14	8	7.8e+07
19	36	2022-04-04	9	1.03e+08
\.


--
-- Data for Name: typess; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typess (type_code, type_name) FROM stdin;
2	╨Ъ
1	╨Ф
\.


--
-- Name: building_materials building_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building_materials
    ADD CONSTRAINT building_materials_pkey PRIMARY KEY (material_code);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (district_code);


--
-- Name: marks_criterias marks_criterias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks_criterias
    ADD CONSTRAINT marks_criterias_pkey PRIMARY KEY (criteria_code);


--
-- Name: marks marks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (mark_code);


--
-- Name: property property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_pkey PRIMARY KEY (property_code);


--
-- Name: rieltor rieltor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rieltor
    ADD CONSTRAINT rieltor_pkey PRIMARY KEY (rieltor_code);


--
-- Name: selling selling_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selling
    ADD CONSTRAINT selling_pkey PRIMARY KEY (selling_code);


--
-- Name: typess typess_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typess
    ADD CONSTRAINT typess_pkey PRIMARY KEY (type_code);


--
-- Name: marks marks_criteria_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_criteria_code_fkey FOREIGN KEY (criteria_code) REFERENCES public.marks_criterias(criteria_code);


--
-- Name: marks marks_property_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_property_code_fkey FOREIGN KEY (property_code) REFERENCES public.property(property_code);


--
-- Name: property property_district_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_district_fkey FOREIGN KEY (district) REFERENCES public.districts(district_code);


--
-- Name: property property_property_material_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_property_material_fkey FOREIGN KEY (property_material) REFERENCES public.building_materials(material_code);


--
-- Name: property property_typess_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_typess_fkey FOREIGN KEY (typess) REFERENCES public.typess(type_code);


--
-- Name: selling selling_property_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selling
    ADD CONSTRAINT selling_property_code_fkey FOREIGN KEY (property_code) REFERENCES public.property(property_code);


--
-- Name: selling selling_rieltor_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selling
    ADD CONSTRAINT selling_rieltor_code_fkey FOREIGN KEY (rieltor_code) REFERENCES public.rieltor(rieltor_code);


--
-- PostgreSQL database dump complete
--

