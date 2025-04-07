--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO deft;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO deft;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO deft;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO deft;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO deft;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO deft;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO deft;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO deft;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO deft;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO deft;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO deft;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO deft;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO deft;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO deft;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO deft;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO deft;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO deft;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO deft;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO deft;

--
-- Name: event_tags; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.event_tags (
    id bigint NOT NULL,
    capacity_affected double precision NOT NULL,
    risk_model_id bigint NOT NULL,
    weather_data_id bigint NOT NULL
);


ALTER TABLE public.event_tags OWNER TO deft;

--
-- Name: event_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.event_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_tags_id_seq OWNER TO deft;

--
-- Name: event_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.event_tags_id_seq OWNED BY public.event_tags.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.files (
    id bigint NOT NULL,
    name text NOT NULL,
    loaded_at timestamp without time zone NOT NULL,
    status_id bigint NOT NULL,
    hash_code text NOT NULL
);


ALTER TABLE public.files OWNER TO deft;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO deft;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_users; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.files_users (
    id bigint NOT NULL,
    file_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.files_users OWNER TO deft;

--
-- Name: files_users_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.files_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_users_id_seq OWNER TO deft;

--
-- Name: files_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.files_users_id_seq OWNED BY public.files_users.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    address text NOT NULL,
    file_id bigint NOT NULL,
    latitude_index integer NOT NULL,
    longitude_index integer NOT NULL
);


ALTER TABLE public.locations OWNER TO deft;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO deft;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: power_systems; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.power_systems (
    id bigint NOT NULL,
    short_name text NOT NULL,
    full_name text NOT NULL,
    unit_id text NOT NULL,
    capacity double precision NOT NULL,
    resource_id bigint,
    station_id bigint NOT NULL,
    technology_id bigint NOT NULL,
    project_id bigint NOT NULL
);


ALTER TABLE public.power_systems OWNER TO deft;

--
-- Name: power_systems_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.power_systems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.power_systems_id_seq OWNER TO deft;

--
-- Name: power_systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.power_systems_id_seq OWNED BY public.power_systems.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    name text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.projects OWNER TO deft;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO deft;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: raw_weather_data; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.raw_weather_data (
    id bigint NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    temperature double precision NOT NULL,
    wind_speed double precision NOT NULL,
    dew_point double precision NOT NULL,
    "time" timestamp without time zone NOT NULL,
    file_id bigint NOT NULL,
    address text NOT NULL
);


ALTER TABLE public.raw_weather_data OWNER TO deft;

--
-- Name: raw_weather_data_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.raw_weather_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.raw_weather_data_id_seq OWNER TO deft;

--
-- Name: raw_weather_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.raw_weather_data_id_seq OWNED BY public.raw_weather_data.id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.resources (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.resources OWNER TO deft;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_id_seq OWNER TO deft;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.resources_id_seq OWNED BY public.resources.id;


--
-- Name: risk_models; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.risk_models (
    id bigint NOT NULL,
    period_days integer NOT NULL,
    event text NOT NULL,
    project_id bigint NOT NULL,
    technology_id bigint NOT NULL,
    derating double precision NOT NULL,
    operator1 text NOT NULL,
    operator2 text,
    threshold1 double precision NOT NULL,
    threshold2 double precision,
    variable_id1 bigint NOT NULL,
    variable_id2 bigint
);


ALTER TABLE public.risk_models OWNER TO deft;

--
-- Name: risk_models_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.risk_models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.risk_models_id_seq OWNER TO deft;

--
-- Name: risk_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.risk_models_id_seq OWNED BY public.risk_models.id;


--
-- Name: station_locations; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.station_locations (
    id bigint NOT NULL,
    city text,
    latitude double precision,
    longitude double precision,
    state text
);


ALTER TABLE public.station_locations OWNER TO deft;

--
-- Name: station_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.station_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.station_locations_id_seq OWNER TO deft;

--
-- Name: station_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.station_locations_id_seq OWNED BY public.station_locations.id;


--
-- Name: stations; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.stations (
    id bigint NOT NULL,
    name text NOT NULL,
    location_id bigint NOT NULL,
    identifier text NOT NULL
);


ALTER TABLE public.stations OWNER TO deft;

--
-- Name: stations_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.stations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stations_id_seq OWNER TO deft;

--
-- Name: stations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.stations_id_seq OWNED BY public.stations.id;


--
-- Name: statuses; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.statuses (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.statuses OWNER TO deft;

--
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statuses_id_seq OWNER TO deft;

--
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- Name: technologies; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.technologies (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.technologies OWNER TO deft;

--
-- Name: technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.technologies_id_seq OWNER TO deft;

--
-- Name: technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.technologies_id_seq OWNED BY public.technologies.id;


--
-- Name: variables; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.variables (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.variables OWNER TO deft;

--
-- Name: variables_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variables_id_seq OWNER TO deft;

--
-- Name: variables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.variables_id_seq OWNED BY public.variables.id;


--
-- Name: weather_data; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.weather_data (
    id bigint NOT NULL,
    "time" timestamp without time zone NOT NULL,
    file_id bigint NOT NULL,
    time_index integer NOT NULL,
    weather_model_id bigint NOT NULL,
    weather_scenario_id bigint NOT NULL,
    weather_year_id bigint NOT NULL,
    station_id bigint NOT NULL,
    station_index integer NOT NULL,
    weather_model_index integer NOT NULL,
    weather_scenario_index integer NOT NULL,
    weather_year_index integer NOT NULL
);


ALTER TABLE public.weather_data OWNER TO deft;

--
-- Name: weather_data_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.weather_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weather_data_id_seq OWNER TO deft;

--
-- Name: weather_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.weather_data_id_seq OWNED BY public.weather_data.id;


--
-- Name: weather_data_variables; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.weather_data_variables (
    id bigint NOT NULL,
    variable_id bigint NOT NULL,
    weather_data_id bigint NOT NULL,
    value double precision NOT NULL
);


ALTER TABLE public.weather_data_variables OWNER TO deft;

--
-- Name: weather_data_variables_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.weather_data_variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weather_data_variables_id_seq OWNER TO deft;

--
-- Name: weather_data_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.weather_data_variables_id_seq OWNED BY public.weather_data_variables.id;


--
-- Name: weather_models; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.weather_models (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.weather_models OWNER TO deft;

--
-- Name: weather_model_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.weather_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weather_model_id_seq OWNER TO deft;

--
-- Name: weather_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.weather_model_id_seq OWNED BY public.weather_models.id;


--
-- Name: weather_scenarios; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.weather_scenarios (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.weather_scenarios OWNER TO deft;

--
-- Name: weather_scenario_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.weather_scenario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weather_scenario_id_seq OWNER TO deft;

--
-- Name: weather_scenario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.weather_scenario_id_seq OWNED BY public.weather_scenarios.id;


--
-- Name: weather_years; Type: TABLE; Schema: public; Owner: deft
--

CREATE TABLE public.weather_years (
    id bigint NOT NULL,
    year text NOT NULL
);


ALTER TABLE public.weather_years OWNER TO deft;

--
-- Name: weather_year_id_seq; Type: SEQUENCE; Schema: public; Owner: deft
--

CREATE SEQUENCE public.weather_year_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weather_year_id_seq OWNER TO deft;

--
-- Name: weather_year_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deft
--

ALTER SEQUENCE public.weather_year_id_seq OWNED BY public.weather_years.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: event_tags id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.event_tags ALTER COLUMN id SET DEFAULT nextval('public.event_tags_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_users id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.files_users ALTER COLUMN id SET DEFAULT nextval('public.files_users_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: power_systems id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.power_systems ALTER COLUMN id SET DEFAULT nextval('public.power_systems_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: raw_weather_data id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.raw_weather_data ALTER COLUMN id SET DEFAULT nextval('public.raw_weather_data_id_seq'::regclass);


--
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.resources_id_seq'::regclass);


--
-- Name: risk_models id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.risk_models ALTER COLUMN id SET DEFAULT nextval('public.risk_models_id_seq'::regclass);


--
-- Name: station_locations id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.station_locations ALTER COLUMN id SET DEFAULT nextval('public.station_locations_id_seq'::regclass);


--
-- Name: stations id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.stations ALTER COLUMN id SET DEFAULT nextval('public.stations_id_seq'::regclass);


--
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- Name: technologies id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.technologies ALTER COLUMN id SET DEFAULT nextval('public.technologies_id_seq'::regclass);


--
-- Name: variables id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.variables ALTER COLUMN id SET DEFAULT nextval('public.variables_id_seq'::regclass);


--
-- Name: weather_data id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data ALTER COLUMN id SET DEFAULT nextval('public.weather_data_id_seq'::regclass);


--
-- Name: weather_data_variables id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data_variables ALTER COLUMN id SET DEFAULT nextval('public.weather_data_variables_id_seq'::regclass);


--
-- Name: weather_models id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_models ALTER COLUMN id SET DEFAULT nextval('public.weather_model_id_seq'::regclass);


--
-- Name: weather_scenarios id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_scenarios ALTER COLUMN id SET DEFAULT nextval('public.weather_scenario_id_seq'::regclass);


--
-- Name: weather_years id; Type: DEFAULT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_years ALTER COLUMN id SET DEFAULT nextval('public.weather_year_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add content type	2	add_contenttype
6	Can change content type	2	change_contenttype
7	Can delete content type	2	delete_contenttype
8	Can view content type	2	view_contenttype
9	Can add permission	3	add_permission
10	Can change permission	3	change_permission
11	Can delete permission	3	delete_permission
12	Can view permission	3	view_permission
13	Can add group	4	add_group
14	Can change group	4	change_group
15	Can delete group	4	delete_group
16	Can view group	4	view_group
17	Can add user	5	add_user
18	Can change user	5	change_user
19	Can delete user	5	delete_user
20	Can view user	5	view_user
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add file	7	add_file
26	Can change file	7	change_file
27	Can delete file	7	delete_file
28	Can view file	7	view_file
29	Can add location	8	add_location
30	Can change location	8	change_location
31	Can delete location	8	delete_location
32	Can view location	8	view_location
33	Can add resource	9	add_resource
34	Can change resource	9	change_resource
35	Can delete resource	9	delete_resource
36	Can view resource	9	view_resource
37	Can add station location	10	add_stationlocation
38	Can change station location	10	change_stationlocation
39	Can delete station location	10	delete_stationlocation
40	Can view station location	10	view_stationlocation
41	Can add status	11	add_status
42	Can change status	11	change_status
43	Can delete status	11	delete_status
44	Can view status	11	view_status
45	Can add technology	12	add_technology
46	Can change technology	12	change_technology
47	Can delete technology	12	delete_technology
48	Can view technology	12	view_technology
49	Can add variable	13	add_variable
50	Can change variable	13	change_variable
51	Can delete variable	13	delete_variable
52	Can view variable	13	view_variable
53	Can add weather data	14	add_weatherdata
54	Can change weather data	14	change_weatherdata
55	Can delete weather data	14	delete_weatherdata
56	Can view weather data	14	view_weatherdata
57	Can add weather data variable	15	add_weatherdatavariable
58	Can change weather data variable	15	change_weatherdatavariable
59	Can delete weather data variable	15	delete_weatherdatavariable
60	Can view weather data variable	15	view_weatherdatavariable
61	Can add station	16	add_station
62	Can change station	16	change_station
63	Can delete station	16	delete_station
64	Can view station	16	view_station
65	Can add scenario	17	add_scenario
66	Can change scenario	17	change_scenario
67	Can delete scenario	17	delete_scenario
68	Can view scenario	17	view_scenario
69	Can add rule	18	add_rule
70	Can change rule	18	change_rule
71	Can delete rule	18	delete_rule
72	Can view rule	18	view_rule
73	Can add power system	19	add_powersystem
74	Can change power system	19	change_powersystem
75	Can delete power system	19	delete_powersystem
76	Can view power system	19	view_powersystem
77	Can add file user	20	add_fileuser
78	Can change file user	20	change_fileuser
79	Can delete file user	20	delete_fileuser
80	Can view file user	20	view_fileuser
81	Can add event tag	21	add_eventtag
82	Can change event tag	21	change_eventtag
83	Can delete event tag	21	delete_eventtag
84	Can view event tag	21	view_eventtag
85	Can add raw weather data	22	add_rawweatherdata
86	Can change raw weather data	22	change_rawweatherdata
87	Can delete raw weather data	22	delete_rawweatherdata
88	Can view raw weather data	22	view_rawweatherdata
89	Can add project	23	add_project
90	Can change project	23	change_project
91	Can delete project	23	delete_project
92	Can view project	23	view_project
93	Can add risk model	24	add_riskmodel
94	Can change risk model	24	change_riskmodel
95	Can delete risk model	24	delete_riskmodel
96	Can view risk model	24	view_riskmodel
97	Can add weather model	25	add_weathermodel
98	Can change weather model	25	change_weathermodel
99	Can delete weather model	25	delete_weathermodel
100	Can view weather model	25	view_weathermodel
101	Can add weather scenario	26	add_weatherscenario
102	Can change weather scenario	26	change_weatherscenario
103	Can delete weather scenario	26	delete_weatherscenario
104	Can view weather scenario	26	view_weatherscenario
105	Can add weather year	27	add_weatheryear
106	Can change weather year	27	change_weatheryear
107	Can delete weather year	27	delete_weatheryear
108	Can view weather year	27	view_weatheryear
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$soaC0Tf4IsH9gbVkSDrJ7E$bFTDPUVVobJ6ogmm76wFQ+Z+Fdys/IR/jUV8oJ3/Buk=	\N	t	admin			deft@deft.com	t	t	2022-04-20 21:29:56.774+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	contenttypes	contenttype
3	auth	permission
4	auth	group
5	auth	user
6	sessions	session
7	api	file
8	api	location
9	api	resource
10	api	stationlocation
11	api	status
12	api	technology
13	api	variable
14	api	weatherdata
15	api	weatherdatavariable
16	api	station
17	api	scenario
18	api	rule
19	api	powersystem
20	api	fileuser
21	api	eventtag
22	api	rawweatherdata
23	api	project
24	api	riskmodel
25	api	weathermodel
26	api	weatherscenario
27	api	weatheryear
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-05-10 19:43:56.287744+00
2	auth	0001_initial	2022-05-10 19:43:56.328882+00
3	admin	0001_initial	2022-05-10 19:43:56.340086+00
4	admin	0002_logentry_remove_auto_add	2022-05-10 19:43:56.3446+00
5	admin	0003_logentry_add_action_flag_choices	2022-05-10 19:43:56.349176+00
6	api	0001_initial	2022-05-10 19:43:56.45775+00
7	api	0002_file_hash_code_weatherdatavariable_value	2022-05-10 19:43:56.466906+00
8	api	0003_alter_resource_name_alter_scenario_name_and_more	2022-05-10 19:43:56.499971+00
9	api	0004_rawweatherdata	2022-05-10 19:43:56.515154+00
10	api	0005_remove_rawweatherdata_address	2022-05-10 19:43:56.521723+00
11	api	0006_rawweatherdata_address	2022-05-10 19:43:56.526804+00
12	api	0007_location_latitude_index_location_longitude_index_and_more	2022-05-10 19:43:56.540842+00
13	contenttypes	0002_remove_content_type_name	2022-05-10 19:43:56.599564+00
14	auth	0002_alter_permission_name_max_length	2022-05-10 19:43:56.608729+00
15	auth	0003_alter_user_email_max_length	2022-05-10 19:43:56.614332+00
16	auth	0004_alter_user_username_opts	2022-05-10 19:43:56.620385+00
17	auth	0005_alter_user_last_login_null	2022-05-10 19:43:56.628103+00
18	auth	0006_require_contenttypes_0002	2022-05-10 19:43:56.629875+00
19	auth	0007_alter_validators_add_error_messages	2022-05-10 19:43:56.635652+00
20	auth	0008_alter_user_username_max_length	2022-05-10 19:43:56.644102+00
21	auth	0009_alter_user_last_name_max_length	2022-05-10 19:43:56.651398+00
22	auth	0010_alter_group_name_max_length	2022-05-10 19:43:56.663751+00
23	auth	0011_update_proxy_permissions	2022-05-10 19:43:56.674432+00
24	auth	0012_alter_user_first_name_max_length	2022-05-10 19:43:56.680188+00
25	sessions	0001_initial	2022-05-10 19:43:56.689319+00
26	api	0008_project_riskmodel_remove_scenario_user_and_more	2022-06-15 18:32:27.143726+00
27	api	0009_remove_stationlocation_name_stationlocation_city_and_more	2022-06-15 18:32:27.179022+00
28	api	0010_alter_stationlocation_city_and_more	2022-06-15 18:32:27.194609+00
29	api	0011_alter_station_name_station_station-location_unique	2022-06-15 18:32:27.214146+00
30	api	0012_riskmodel_derating	2022-06-15 18:32:27.228239+00
31	api	0013_alter_resource_name	2022-06-15 18:32:27.234359+00
32	api	0014_weathermodel_weatherscenario_weatheryear_and_more	2022-06-15 18:32:27.347698+00
33	api	0015_alter_weathermodel_table_alter_weatherscenario_table_and_more	2022-06-15 18:32:27.364034+00
34	api	0016_remove_weatherdata_location_weatherdata_station	2022-06-15 18:32:27.427184+00
35	api	0017_station_csv_id_station_file	2022-06-15 18:32:27.469787+00
36	api	0018_rename_csv_id_station_identifier	2022-06-15 18:32:27.485134+00
37	api	0019_remove_station_station-location_unique_and_more	2022-06-15 18:32:27.53745+00
38	api	0020_alter_powersystem_resource	2022-06-15 18:32:27.575209+00
39	api	0021_remove_station_identifier_file_id_unique_and_more	2022-06-15 18:32:27.598184+00
40	api	0022_stationlocation_state_city_unique_and_more	2022-06-15 18:32:27.618733+00
41	api	0023_alter_file_name_alter_weatherscenario_name_and_more	2022-06-15 18:32:27.652581+00
42	api	0024_alter_weatherdata_time	2022-06-15 18:32:27.673049+00
43	api	0025_weatherdata_station_index	2022-06-15 18:32:27.690584+00
44	api	0026_alter_weathermodel_name_alter_weatherscenario_name_and_more	2022-06-15 18:32:27.721746+00
45	api	0027_remove_station_station_location_unique_and_more	2022-06-15 18:32:27.748918+00
46	api	0028_remove_station_station_location_unique_and_more	2022-06-15 18:32:27.795501+00
47	api	0029_weatherdata_weather_model_index_and_more	2022-06-15 18:32:27.831993+00
48	api	0030_alter_weatherdata_time	2022-06-15 18:32:27.844577+00
49	api	0031_remove_eventtag_file_eventtag_weather_data_and_more	2022-06-15 18:34:06.114994+00
50	api	0032_alter_eventtag_risk_model_and_more	2022-06-15 18:34:06.162973+00
51	api	0033_alter_fileuser_file_alter_fileuser_user	2022-10-12 00:51:26.473879+00
52	api	0034_alter_weatherdatavariable_weather_data	2022-10-12 00:51:26.522264+00
53	api	0035_alter_weatherdatavariable_weather_data	2022-10-12 00:51:26.531487+00
54	api	0036_alter_weatherdatavariable_weather_data	2022-10-12 00:51:26.541631+00
55	api	0037_alter_eventtag_weather_data	2022-10-12 00:51:26.551134+00
56	api	0038_riskmodel_event_technology_project_unique	2022-10-12 00:51:26.562965+00
57	api	0039_remove_riskmodel_operator_remove_riskmodel_threshold_and_more	2023-05-07 00:54:22.834493+00
58	api	0040_alter_riskmodel_project_alter_riskmodel_technology	2023-05-07 00:54:22.853366+00
59	api	0041_alter_riskmodel_variable_id1_and_more	2023-05-07 00:54:22.872851+00
60	api	0042_alter_riskmodel_variable_id1_and_more	2023-05-07 00:54:22.891437+00
61	api	0043_alter_riskmodel_operator2_alter_riskmodel_threshold2_and_more	2023-05-07 00:54:22.916898+00
62	api	0044_alter_riskmodel_operator2_alter_riskmodel_threshold2_and_more	2023-05-07 00:54:22.935121+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
05w7cwra50h5big408bbhu2tsk51a80q	.eJxVjEEOwiAQRe_C2pAMDJS6dO8ZCAODVA0kpV0Z765Numi3_733P8KHdSl-7Tz7KYmrAHE5bhTii-sG0jPUR5Ox1WWeSG6K3GmX95b4fdvd00EJvfzrbME4toaTNlrBQOgsWcxAEBUBUiRQY2Bk0ooHdCOjThHZWeNMJvH9AdheN9k:1nqcGP:WV3wpwjfB2eM2C935z4U46YSDNuYeTe6yx0sCdRXibY	2022-05-30 15:04:01.460881+00
\.


--
-- Data for Name: event_tags; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.event_tags (id, capacity_affected, risk_model_id, weather_data_id) FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.files (id, name, loaded_at, status_id, hash_code) FROM stdin;
3	10station_1951_1960_historical.nc	2023-09-13 09:43:42	2	a07d8fa5af27cd2398ec426fbe61341ef36d5f4a55bf24848303dd43708c0013
\.


--
-- Data for Name: files_users; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.files_users (id, file_id, user_id) FROM stdin;
3	3	1
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.locations (id, latitude, longitude, address, file_id, latitude_index, longitude_index) FROM stdin;
\.


--
-- Data for Name: power_systems; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.power_systems (id, short_name, full_name, unit_id, capacity, resource_id, station_id, technology_id, project_id) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.projects (id, name, user_id) FROM stdin;
\.


--
-- Data for Name: raw_weather_data; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.raw_weather_data (id, latitude, longitude, temperature, wind_speed, dew_point, "time", file_id, address) FROM stdin;
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.resources (id, name) FROM stdin;
\.


--
-- Data for Name: risk_models; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.risk_models (id, period_days, event, project_id, technology_id, derating, operator1, operator2, threshold1, threshold2, variable_id1, variable_id2) FROM stdin;
\.


--
-- Data for Name: station_locations; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.station_locations (id, city, latitude, longitude, state) FROM stdin;
\.


--
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.stations (id, name, location_id, identifier) FROM stdin;
\.


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.statuses (id, name) FROM stdin;
1	ERROR
2	LOADED
3	IMPORTING
4	IMPORTED
\.


--
-- Data for Name: technologies; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.technologies (id, name) FROM stdin;
\.


--
-- Data for Name: variables; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.variables (id, name) FROM stdin;
1	temperature
2	dewpoint
3	wind speed at 10m
4	wind speed at 100m
5	mean sea level pressure
6	precipitation
7	snow height
8	solar irradiance
9	load_base
10	load_heat
11	load_ev
12	load_base_min
13	load_heat_min
14	load_ev_min
15	load_base_plus
16	load_heat_plus
17	load_ev_plus
\.


--
-- Data for Name: weather_data; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.weather_data (id, "time", file_id, time_index, weather_model_id, weather_scenario_id, weather_year_id, station_id, station_index, weather_model_index, weather_scenario_index, weather_year_index) FROM stdin;
\.


--
-- Data for Name: weather_data_variables; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.weather_data_variables (id, variable_id, weather_data_id, value) FROM stdin;
\.


--
-- Data for Name: weather_models; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.weather_models (id, name) FROM stdin;
1	HISTORICAL
\.


--
-- Data for Name: weather_scenarios; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.weather_scenarios (id, name) FROM stdin;
1	HISTORICAL
\.


--
-- Data for Name: weather_years; Type: TABLE DATA; Schema: public; Owner: deft
--

COPY public.weather_years (id, year) FROM stdin;
1	2027
2	2032
3	HISTORICAL
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 108, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 27, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 62, true);


--
-- Name: event_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.event_tags_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.files_id_seq', 3, true);


--
-- Name: files_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.files_users_id_seq', 3, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- Name: power_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.power_systems_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.projects_id_seq', 5, true);


--
-- Name: raw_weather_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.raw_weather_data_id_seq', 1, false);


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.resources_id_seq', 2, true);


--
-- Name: risk_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.risk_models_id_seq', 1, false);


--
-- Name: station_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.station_locations_id_seq', 52, true);


--
-- Name: stations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.stations_id_seq', 54, true);


--
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.statuses_id_seq', 4, true);


--
-- Name: technologies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.technologies_id_seq', 27, true);


--
-- Name: variables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.variables_id_seq', 17, true);


--
-- Name: weather_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.weather_data_id_seq', 7188240, true);


--
-- Name: weather_data_variables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.weather_data_variables_id_seq', 7013760, true);


--
-- Name: weather_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.weather_model_id_seq', 1, true);


--
-- Name: weather_scenario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.weather_scenario_id_seq', 1, true);


--
-- Name: weather_year_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deft
--

SELECT pg_catalog.setval('public.weather_year_id_seq', 3, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: event_tags event_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);


--
-- Name: risk_models event_technology_project_unique; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.risk_models
    ADD CONSTRAINT event_technology_project_unique UNIQUE (technology_id, event, project_id);


--
-- Name: files files_hash_code_key; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_hash_code_key UNIQUE (hash_code);


--
-- Name: files files_name_57cb9fc9_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_name_57cb9fc9_uniq UNIQUE (name);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_users files_users_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.files_users
    ADD CONSTRAINT files_users_pkey PRIMARY KEY (id);


--
-- Name: station_locations latitude_longitude_unique; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.station_locations
    ADD CONSTRAINT latitude_longitude_unique UNIQUE (latitude, longitude);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: power_systems power_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.power_systems
    ADD CONSTRAINT power_systems_pkey PRIMARY KEY (id);


--
-- Name: projects projects_name_key; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_name_key UNIQUE (name);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: raw_weather_data raw_weather_data_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.raw_weather_data
    ADD CONSTRAINT raw_weather_data_pkey PRIMARY KEY (id);


--
-- Name: resources resources_name_52c93631_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_name_52c93631_uniq UNIQUE (name);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: risk_models risk_models_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.risk_models
    ADD CONSTRAINT risk_models_pkey PRIMARY KEY (id);


--
-- Name: station_locations state_city_unique; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.station_locations
    ADD CONSTRAINT state_city_unique UNIQUE (state, city);


--
-- Name: station_locations station_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.station_locations
    ADD CONSTRAINT station_locations_pkey PRIMARY KEY (id);


--
-- Name: stations stations_name_71acd296_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_name_71acd296_uniq UNIQUE (name);


--
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (id);


--
-- Name: statuses statuses_name_342aa706_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_name_342aa706_uniq UNIQUE (name);


--
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- Name: technologies technologies_name_21c5c2f9_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.technologies
    ADD CONSTRAINT technologies_name_21c5c2f9_uniq UNIQUE (name);


--
-- Name: technologies technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.technologies
    ADD CONSTRAINT technologies_pkey PRIMARY KEY (id);


--
-- Name: variables variables_name_9bc98a13_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT variables_name_9bc98a13_uniq UNIQUE (name);


--
-- Name: variables variables_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT variables_pkey PRIMARY KEY (id);


--
-- Name: weather_data weather_data_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT weather_data_pkey PRIMARY KEY (id);


--
-- Name: weather_data_variables weather_data_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data_variables
    ADD CONSTRAINT weather_data_variables_pkey PRIMARY KEY (id);


--
-- Name: weather_models weather_model_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_models
    ADD CONSTRAINT weather_model_pkey PRIMARY KEY (id);


--
-- Name: weather_models weather_models_name_2816cc04_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_models
    ADD CONSTRAINT weather_models_name_2816cc04_uniq UNIQUE (name);


--
-- Name: weather_scenarios weather_scenario_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_scenarios
    ADD CONSTRAINT weather_scenario_pkey PRIMARY KEY (id);


--
-- Name: weather_scenarios weather_scenarios_name_6456147d_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_scenarios
    ADD CONSTRAINT weather_scenarios_name_6456147d_uniq UNIQUE (name);


--
-- Name: weather_years weather_year_pkey; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_years
    ADD CONSTRAINT weather_year_pkey PRIMARY KEY (id);


--
-- Name: weather_years weather_years_year_0c0a026a_uniq; Type: CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_years
    ADD CONSTRAINT weather_years_year_0c0a026a_uniq UNIQUE (year);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: event_tags_risk_model_id_5ecef439; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX event_tags_risk_model_id_5ecef439 ON public.event_tags USING btree (risk_model_id);


--
-- Name: event_tags_weather_data_id_df66e246; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX event_tags_weather_data_id_df66e246 ON public.event_tags USING btree (weather_data_id);


--
-- Name: files_hash_code_3e04381c_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX files_hash_code_3e04381c_like ON public.files USING btree (hash_code text_pattern_ops);


--
-- Name: files_name_57cb9fc9_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX files_name_57cb9fc9_like ON public.files USING btree (name text_pattern_ops);


--
-- Name: files_status_id_c36351c4; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX files_status_id_c36351c4 ON public.files USING btree (status_id);


--
-- Name: files_users_file_id_07332a93; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX files_users_file_id_07332a93 ON public.files_users USING btree (file_id);


--
-- Name: files_users_user_id_01e75c98; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX files_users_user_id_01e75c98 ON public.files_users USING btree (user_id);


--
-- Name: locations_file_id_9a24e29f; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX locations_file_id_9a24e29f ON public.locations USING btree (file_id);


--
-- Name: power_systems_project_id_6f542b1a; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX power_systems_project_id_6f542b1a ON public.power_systems USING btree (project_id);


--
-- Name: power_systems_resource_id_1a1c76f8; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX power_systems_resource_id_1a1c76f8 ON public.power_systems USING btree (resource_id);


--
-- Name: power_systems_station_id_c03f3ef8; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX power_systems_station_id_c03f3ef8 ON public.power_systems USING btree (station_id);


--
-- Name: power_systems_technology_id_85710f83; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX power_systems_technology_id_85710f83 ON public.power_systems USING btree (technology_id);


--
-- Name: projects_name_fb20444c_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX projects_name_fb20444c_like ON public.projects USING btree (name text_pattern_ops);


--
-- Name: projects_user_id_155ff78a; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX projects_user_id_155ff78a ON public.projects USING btree (user_id);


--
-- Name: raw_weather_data_file_id_5a3583ef; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX raw_weather_data_file_id_5a3583ef ON public.raw_weather_data USING btree (file_id);


--
-- Name: resources_name_52c93631_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX resources_name_52c93631_like ON public.resources USING btree (name text_pattern_ops);


--
-- Name: risk_models_project_id_0ce8e85e; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX risk_models_project_id_0ce8e85e ON public.risk_models USING btree (project_id);


--
-- Name: risk_models_technology_id_9fb439c4; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX risk_models_technology_id_9fb439c4 ON public.risk_models USING btree (technology_id);


--
-- Name: risk_models_variable_id1_dfbbaaa6; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX risk_models_variable_id1_dfbbaaa6 ON public.risk_models USING btree (variable_id1);


--
-- Name: risk_models_variable_id2_eb8db9de; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX risk_models_variable_id2_eb8db9de ON public.risk_models USING btree (variable_id2);


--
-- Name: stations_location_id_b792cc1e; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX stations_location_id_b792cc1e ON public.stations USING btree (location_id);


--
-- Name: stations_name_71acd296_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX stations_name_71acd296_like ON public.stations USING btree (name text_pattern_ops);


--
-- Name: statuses_name_342aa706_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX statuses_name_342aa706_like ON public.statuses USING btree (name text_pattern_ops);


--
-- Name: technologies_name_21c5c2f9_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX technologies_name_21c5c2f9_like ON public.technologies USING btree (name text_pattern_ops);


--
-- Name: variables_name_9bc98a13_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX variables_name_9bc98a13_like ON public.variables USING btree (name text_pattern_ops);


--
-- Name: weather_data_file_id_3e1344c6; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX weather_data_file_id_3e1344c6 ON public.weather_data USING btree (file_id);


--
-- Name: weather_data_station_id_b89d8345; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX weather_data_station_id_b89d8345 ON public.weather_data USING btree (station_id);


--
-- Name: weather_data_variables_variable_id_094cea93; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX weather_data_variables_variable_id_094cea93 ON public.weather_data_variables USING btree (variable_id);


--
-- Name: weather_data_variables_weather_data_id_81cdf4dd; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX weather_data_variables_weather_data_id_81cdf4dd ON public.weather_data_variables USING btree (weather_data_id);


--
-- Name: weather_data_weather_model_id_07230295; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX weather_data_weather_model_id_07230295 ON public.weather_data USING btree (weather_model_id);


--
-- Name: weather_data_weather_scenario_id_57ff994c; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX weather_data_weather_scenario_id_57ff994c ON public.weather_data USING btree (weather_scenario_id);


--
-- Name: weather_data_weather_year_id_7e238df7; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX weather_data_weather_year_id_7e238df7 ON public.weather_data USING btree (weather_year_id);


--
-- Name: weather_models_name_2816cc04_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX weather_models_name_2816cc04_like ON public.weather_models USING btree (name text_pattern_ops);


--
-- Name: weather_scenarios_name_6456147d_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX weather_scenarios_name_6456147d_like ON public.weather_scenarios USING btree (name text_pattern_ops);


--
-- Name: weather_years_year_0c0a026a_like; Type: INDEX; Schema: public; Owner: deft
--

CREATE INDEX weather_years_year_0c0a026a_like ON public.weather_years USING btree (year text_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_tags event_tags_risk_model_id_5ecef439_fk_risk_models_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_risk_model_id_5ecef439_fk_risk_models_id FOREIGN KEY (risk_model_id) REFERENCES public.risk_models(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_tags event_tags_weather_data_id_df66e246_fk_weather_data_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_weather_data_id_df66e246_fk_weather_data_id FOREIGN KEY (weather_data_id) REFERENCES public.weather_data(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: files files_status_id_c36351c4_fk_statuses_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_status_id_c36351c4_fk_statuses_id FOREIGN KEY (status_id) REFERENCES public.statuses(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: files_users files_users_file_id_07332a93_fk_files_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.files_users
    ADD CONSTRAINT files_users_file_id_07332a93_fk_files_id FOREIGN KEY (file_id) REFERENCES public.files(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: files_users files_users_user_id_01e75c98_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.files_users
    ADD CONSTRAINT files_users_user_id_01e75c98_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: locations locations_file_id_9a24e29f_fk_files_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_file_id_9a24e29f_fk_files_id FOREIGN KEY (file_id) REFERENCES public.files(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: power_systems power_systems_project_id_6f542b1a_fk_projects_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.power_systems
    ADD CONSTRAINT power_systems_project_id_6f542b1a_fk_projects_id FOREIGN KEY (project_id) REFERENCES public.projects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: power_systems power_systems_resource_id_1a1c76f8_fk_resources_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.power_systems
    ADD CONSTRAINT power_systems_resource_id_1a1c76f8_fk_resources_id FOREIGN KEY (resource_id) REFERENCES public.resources(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: power_systems power_systems_station_id_c03f3ef8_fk_stations_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.power_systems
    ADD CONSTRAINT power_systems_station_id_c03f3ef8_fk_stations_id FOREIGN KEY (station_id) REFERENCES public.stations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: power_systems power_systems_technology_id_85710f83_fk_technologies_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.power_systems
    ADD CONSTRAINT power_systems_technology_id_85710f83_fk_technologies_id FOREIGN KEY (technology_id) REFERENCES public.technologies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects projects_user_id_155ff78a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_user_id_155ff78a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: raw_weather_data raw_weather_data_file_id_5a3583ef_fk_files_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.raw_weather_data
    ADD CONSTRAINT raw_weather_data_file_id_5a3583ef_fk_files_id FOREIGN KEY (file_id) REFERENCES public.files(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: risk_models risk_models_project_id_0ce8e85e_fk_projects_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.risk_models
    ADD CONSTRAINT risk_models_project_id_0ce8e85e_fk_projects_id FOREIGN KEY (project_id) REFERENCES public.projects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: risk_models risk_models_technology_id_9fb439c4_fk_technologies_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.risk_models
    ADD CONSTRAINT risk_models_technology_id_9fb439c4_fk_technologies_id FOREIGN KEY (technology_id) REFERENCES public.technologies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: risk_models risk_models_variable_id1_dfbbaaa6_fk_variables_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.risk_models
    ADD CONSTRAINT risk_models_variable_id1_dfbbaaa6_fk_variables_id FOREIGN KEY (variable_id1) REFERENCES public.variables(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: risk_models risk_models_variable_id2_eb8db9de_fk_variables_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.risk_models
    ADD CONSTRAINT risk_models_variable_id2_eb8db9de_fk_variables_id FOREIGN KEY (variable_id2) REFERENCES public.variables(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stations stations_location_id_b792cc1e_fk_station_locations_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_location_id_b792cc1e_fk_station_locations_id FOREIGN KEY (location_id) REFERENCES public.station_locations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weather_data weather_data_file_id_3e1344c6_fk_files_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT weather_data_file_id_3e1344c6_fk_files_id FOREIGN KEY (file_id) REFERENCES public.files(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weather_data weather_data_station_id_b89d8345_fk_stations_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT weather_data_station_id_b89d8345_fk_stations_id FOREIGN KEY (station_id) REFERENCES public.stations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weather_data_variables weather_data_variabl_weather_data_id_81cdf4dd_fk_weather_d; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data_variables
    ADD CONSTRAINT weather_data_variabl_weather_data_id_81cdf4dd_fk_weather_d FOREIGN KEY (weather_data_id) REFERENCES public.weather_data(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weather_data_variables weather_data_variables_variable_id_094cea93_fk_variables_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data_variables
    ADD CONSTRAINT weather_data_variables_variable_id_094cea93_fk_variables_id FOREIGN KEY (variable_id) REFERENCES public.variables(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weather_data weather_data_weather_model_id_07230295_fk_weather_models_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT weather_data_weather_model_id_07230295_fk_weather_models_id FOREIGN KEY (weather_model_id) REFERENCES public.weather_models(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weather_data weather_data_weather_scenario_id_57ff994c_fk_weather_s; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT weather_data_weather_scenario_id_57ff994c_fk_weather_s FOREIGN KEY (weather_scenario_id) REFERENCES public.weather_scenarios(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weather_data weather_data_weather_year_id_7e238df7_fk_weather_years_id; Type: FK CONSTRAINT; Schema: public; Owner: deft
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT weather_data_weather_year_id_7e238df7_fk_weather_years_id FOREIGN KEY (weather_year_id) REFERENCES public.weather_years(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

