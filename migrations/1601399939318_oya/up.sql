CREATE TABLE public.oya (
    id integer NOT NULL,
    name text NOT NULL
);
CREATE SEQUENCE public.oya_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.oya_id_seq OWNED BY public.oya.id;
ALTER TABLE ONLY public.oya ALTER COLUMN id SET DEFAULT nextval('public.oya_id_seq'::regclass);
ALTER TABLE ONLY public.oya
    ADD CONSTRAINT oya_pkey PRIMARY KEY (id);
