CREATE TYPE public."enum_Resources_category" AS ENUM (
    'Message',
    'Songs',
    'Relevant information',
    'Video Announcement',
    'Other'
);
CREATE TYPE public."enum_Resources_service" AS ENUM (
    'Jesus Celebration Service',
    'Life Application Service',
    'Youth Church',
    'Teenage Church',
    'Children''s Church',
    'Other'
);
CREATE TYPE public."enum_Users_role" AS ENUM (
    'Media-team member',
    'Chorister',
    'Reverend',
    'Pastor',
    'Other'
);
CREATE TYPE public."enum_Users_status" AS ENUM (
    'Super admin',
    'Admin',
    'Other'
);
CREATE TABLE public."Resources" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userId" uuid NOT NULL,
    title character varying(255) NOT NULL,
    text character varying(255),
    file character varying(255),
    service public."enum_Resources_service" NOT NULL,
    category public."enum_Resources_category" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
CREATE TABLE public."Users" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "firstName" character varying(255),
    "lastName" character varying(255),
    role public."enum_Users_role",
    status public."enum_Users_status" DEFAULT 'Other'::public."enum_Users_status" NOT NULL,
    picture character varying(255),
    "phoneNumber" character varying(255),
    "sideNote" character varying(255),
    "dateOfBirth" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
CREATE TABLE public.yeah (
    id integer NOT NULL,
    fullname text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);
CREATE SEQUENCE public.yeah_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.yeah_id_seq OWNED BY public.yeah.id;
ALTER TABLE ONLY public.yeah ALTER COLUMN id SET DEFAULT nextval('public.yeah_id_seq'::regclass);
ALTER TABLE ONLY public."Resources"
    ADD CONSTRAINT "Resources_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public.yeah
    ADD CONSTRAINT yeah_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public."Resources"
    ADD CONSTRAINT "Resources_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
