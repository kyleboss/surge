--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE addresses (
    id integer NOT NULL,
    street_address character varying NOT NULL,
    city character varying NOT NULL,
    state character varying NOT NULL,
    zip_code integer NOT NULL,
    country character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: antennas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE antennas (
    id integer NOT NULL,
    hardware_identifier character varying,
    location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: antennas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE antennas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: antennas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE antennas_id_seq OWNED BY antennas.id;


--
-- Name: arrivals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE arrivals (
    id integer NOT NULL,
    location_id integer NOT NULL,
    trackable_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: arrivals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE arrivals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: arrivals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE arrivals_id_seq OWNED BY arrivals.id;


--
-- Name: barcode_readers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE barcode_readers (
    id integer NOT NULL,
    hardware_identifier character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    hospital_id integer NOT NULL
);


--
-- Name: barcode_readers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE barcode_readers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: barcode_readers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE barcode_readers_id_seq OWNED BY barcode_readers.id;


--
-- Name: barcode_scans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE barcode_scans (
    id integer NOT NULL,
    barcode_reader_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    barcode_id integer NOT NULL
);


--
-- Name: barcode_scans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE barcode_scans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: barcode_scans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE barcode_scans_id_seq OWNED BY barcode_scans.id;


--
-- Name: barcode_trackable_pairings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE barcode_trackable_pairings (
    id integer NOT NULL,
    barcode_id integer NOT NULL,
    trackable_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: barcode_trackable_pairings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE barcode_trackable_pairings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: barcode_trackable_pairings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE barcode_trackable_pairings_id_seq OWNED BY barcode_trackable_pairings.id;


--
-- Name: barcodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE barcodes (
    id integer NOT NULL,
    code character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: barcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE barcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: barcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE barcodes_id_seq OWNED BY barcodes.id;


--
-- Name: departures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE departures (
    id integer NOT NULL,
    location_id integer NOT NULL,
    trackable_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: departures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE departures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: departures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE departures_id_seq OWNED BY departures.id;


--
-- Name: hospitals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE hospitals (
    id integer NOT NULL,
    name character varying NOT NULL,
    address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: hospitals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hospitals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hospitals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hospitals_id_seq OWNED BY hospitals.id;


--
-- Name: inventory_snapshot_contents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE inventory_snapshot_contents (
    id integer NOT NULL,
    inventory_snapshot_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    trackable_id integer NOT NULL
);


--
-- Name: inventory_snapshot_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE inventory_snapshot_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_snapshot_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE inventory_snapshot_contents_id_seq OWNED BY inventory_snapshot_contents.id;


--
-- Name: inventory_snapshots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE inventory_snapshots (
    id integer NOT NULL,
    location_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: inventory_snapshots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE inventory_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE inventory_snapshots_id_seq OWNED BY inventory_snapshots.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying NOT NULL,
    hospital_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE patients (
    id integer NOT NULL,
    mrn character varying NOT NULL,
    name character varying NOT NULL,
    hospital_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: rfid_reader_barcode_reader_pairings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rfid_reader_barcode_reader_pairings (
    id integer NOT NULL,
    barcode_reader_id integer NOT NULL,
    rfid_reader_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rfid_reader_barcode_reader_pairings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rfid_reader_barcode_reader_pairings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rfid_reader_barcode_reader_pairings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rfid_reader_barcode_reader_pairings_id_seq OWNED BY rfid_reader_barcode_reader_pairings.id;


--
-- Name: rfid_readers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rfid_readers (
    id integer NOT NULL,
    hardware_identifier character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    hospital_id integer NOT NULL
);


--
-- Name: rfid_readers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rfid_readers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rfid_readers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rfid_readers_id_seq OWNED BY rfid_readers.id;


--
-- Name: rfid_scans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rfid_scans (
    id integer NOT NULL,
    rfid_reader_id integer NOT NULL,
    rfid_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rfid_scans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rfid_scans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rfid_scans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rfid_scans_id_seq OWNED BY rfid_scans.id;


--
-- Name: rfid_trackable_pairings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rfid_trackable_pairings (
    id integer NOT NULL,
    rfid_id integer NOT NULL,
    trackable_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rfid_trackable_pairings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rfid_trackable_pairings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rfid_trackable_pairings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rfid_trackable_pairings_id_seq OWNED BY rfid_trackable_pairings.id;


--
-- Name: rfids; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rfids (
    id integer NOT NULL,
    hardware_identifier character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rfids_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rfids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rfids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rfids_id_seq OWNED BY rfids.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: searches; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW searches AS
 SELECT patients.id AS searchable_id,
    patients.name AS term,
    patients.name AS patient_name,
    patients.mrn AS patient_mrn,
    patients.hospital_id
   FROM patients;


--
-- Name: trackables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trackables (
    id integer NOT NULL,
    patient_id integer,
    admin_dose character varying,
    drug_name character varying,
    brand_name character varying,
    order_identifier character varying,
    med_identifier character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sig character varying,
    admin character varying
);


--
-- Name: trackables_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE trackables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trackables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE trackables_id_seq OWNED BY trackables.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    phone character varying,
    address_id integer,
    email character varying NOT NULL,
    password character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    middle_initial character varying,
    hospital_id integer NOT NULL,
    is_admin boolean DEFAULT false NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY antennas ALTER COLUMN id SET DEFAULT nextval('antennas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY arrivals ALTER COLUMN id SET DEFAULT nextval('arrivals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_readers ALTER COLUMN id SET DEFAULT nextval('barcode_readers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_scans ALTER COLUMN id SET DEFAULT nextval('barcode_scans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_trackable_pairings ALTER COLUMN id SET DEFAULT nextval('barcode_trackable_pairings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcodes ALTER COLUMN id SET DEFAULT nextval('barcodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY departures ALTER COLUMN id SET DEFAULT nextval('departures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hospitals ALTER COLUMN id SET DEFAULT nextval('hospitals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY inventory_snapshot_contents ALTER COLUMN id SET DEFAULT nextval('inventory_snapshot_contents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY inventory_snapshots ALTER COLUMN id SET DEFAULT nextval('inventory_snapshots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_reader_barcode_reader_pairings ALTER COLUMN id SET DEFAULT nextval('rfid_reader_barcode_reader_pairings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_readers ALTER COLUMN id SET DEFAULT nextval('rfid_readers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_scans ALTER COLUMN id SET DEFAULT nextval('rfid_scans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_trackable_pairings ALTER COLUMN id SET DEFAULT nextval('rfid_trackable_pairings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfids ALTER COLUMN id SET DEFAULT nextval('rfids_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackables ALTER COLUMN id SET DEFAULT nextval('trackables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: antennas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY antennas
    ADD CONSTRAINT antennas_pkey PRIMARY KEY (id);


--
-- Name: arrivals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arrivals
    ADD CONSTRAINT arrivals_pkey PRIMARY KEY (id);


--
-- Name: barcode_readers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_readers
    ADD CONSTRAINT barcode_readers_pkey PRIMARY KEY (id);


--
-- Name: barcode_scans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_scans
    ADD CONSTRAINT barcode_scans_pkey PRIMARY KEY (id);


--
-- Name: barcode_trackable_pairings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_trackable_pairings
    ADD CONSTRAINT barcode_trackable_pairings_pkey PRIMARY KEY (id);


--
-- Name: barcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcodes
    ADD CONSTRAINT barcodes_pkey PRIMARY KEY (id);


--
-- Name: departures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departures
    ADD CONSTRAINT departures_pkey PRIMARY KEY (id);


--
-- Name: hospitals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hospitals
    ADD CONSTRAINT hospitals_pkey PRIMARY KEY (id);


--
-- Name: inventory_snapshot_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY inventory_snapshot_contents
    ADD CONSTRAINT inventory_snapshot_contents_pkey PRIMARY KEY (id);


--
-- Name: inventory_snapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY inventory_snapshots
    ADD CONSTRAINT inventory_snapshots_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: patients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: rfid_reader_barcode_reader_pairings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_reader_barcode_reader_pairings
    ADD CONSTRAINT rfid_reader_barcode_reader_pairings_pkey PRIMARY KEY (id);


--
-- Name: rfid_readers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_readers
    ADD CONSTRAINT rfid_readers_pkey PRIMARY KEY (id);


--
-- Name: rfid_scans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_scans
    ADD CONSTRAINT rfid_scans_pkey PRIMARY KEY (id);


--
-- Name: rfid_trackable_pairings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_trackable_pairings
    ADD CONSTRAINT rfid_trackable_pairings_pkey PRIMARY KEY (id);


--
-- Name: rfids_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfids
    ADD CONSTRAINT rfids_pkey PRIMARY KEY (id);


--
-- Name: trackables_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackables
    ADD CONSTRAINT trackables_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_antennas_on_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_antennas_on_location_id ON antennas USING btree (location_id);


--
-- Name: index_arrivals_on_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_arrivals_on_location_id ON arrivals USING btree (location_id);


--
-- Name: index_arrivals_on_trackable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_arrivals_on_trackable_id ON arrivals USING btree (trackable_id);


--
-- Name: index_barcode_readers_on_hospital_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_barcode_readers_on_hospital_id ON barcode_readers USING btree (hospital_id);


--
-- Name: index_barcode_scans_on_barcode_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_barcode_scans_on_barcode_id ON barcode_scans USING btree (barcode_id);


--
-- Name: index_barcode_scans_on_barcode_reader_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_barcode_scans_on_barcode_reader_id ON barcode_scans USING btree (barcode_reader_id);


--
-- Name: index_barcode_trackable_pairings_on_barcode_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_barcode_trackable_pairings_on_barcode_id ON barcode_trackable_pairings USING btree (barcode_id);


--
-- Name: index_barcode_trackable_pairings_on_trackable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_barcode_trackable_pairings_on_trackable_id ON barcode_trackable_pairings USING btree (trackable_id);


--
-- Name: index_departures_on_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_departures_on_location_id ON departures USING btree (location_id);


--
-- Name: index_departures_on_trackable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_departures_on_trackable_id ON departures USING btree (trackable_id);


--
-- Name: index_hospitals_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hospitals_on_address_id ON hospitals USING btree (address_id);


--
-- Name: index_inventory_snapshot_contents_on_inventory_snapshot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_inventory_snapshot_contents_on_inventory_snapshot_id ON inventory_snapshot_contents USING btree (inventory_snapshot_id);


--
-- Name: index_inventory_snapshots_on_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_inventory_snapshots_on_location_id ON inventory_snapshots USING btree (location_id);


--
-- Name: index_locations_on_hospital_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_locations_on_hospital_id ON locations USING btree (hospital_id);


--
-- Name: index_patients_on_hospital_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_patients_on_hospital_id ON patients USING btree (hospital_id);


--
-- Name: index_patients_on_mrn; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_patients_on_mrn ON patients USING gin (to_tsvector('english'::regconfig, (mrn)::text));


--
-- Name: index_patients_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_patients_on_name ON patients USING gin (to_tsvector('english'::regconfig, (name)::text));


--
-- Name: index_rfid_reader_barcode_reader_pairings_on_barcode_reader_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rfid_reader_barcode_reader_pairings_on_barcode_reader_id ON rfid_reader_barcode_reader_pairings USING btree (barcode_reader_id);


--
-- Name: index_rfid_reader_barcode_reader_pairings_on_rfid_reader_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rfid_reader_barcode_reader_pairings_on_rfid_reader_id ON rfid_reader_barcode_reader_pairings USING btree (rfid_reader_id);


--
-- Name: index_rfid_readers_on_hospital_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rfid_readers_on_hospital_id ON rfid_readers USING btree (hospital_id);


--
-- Name: index_rfid_scans_on_rfid_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rfid_scans_on_rfid_id ON rfid_scans USING btree (rfid_id);


--
-- Name: index_rfid_scans_on_rfid_reader_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rfid_scans_on_rfid_reader_id ON rfid_scans USING btree (rfid_reader_id);


--
-- Name: index_rfid_trackable_pairings_on_rfid_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rfid_trackable_pairings_on_rfid_id ON rfid_trackable_pairings USING btree (rfid_id);


--
-- Name: index_rfid_trackable_pairings_on_trackable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rfid_trackable_pairings_on_trackable_id ON rfid_trackable_pairings USING btree (trackable_id);


--
-- Name: index_trackables_on_order_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trackables_on_order_identifier ON trackables USING btree (order_identifier);


--
-- Name: index_trackables_on_patient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trackables_on_patient_id ON trackables USING btree (patient_id);


--
-- Name: index_users_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_address_id ON users USING btree (address_id);


--
-- Name: index_users_on_hospital_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_hospital_id ON users USING btree (hospital_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_03dcd638f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_scans
    ADD CONSTRAINT fk_rails_03dcd638f9 FOREIGN KEY (barcode_id) REFERENCES barcodes(id);


--
-- Name: fk_rails_1673fa1e63; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hospitals
    ADD CONSTRAINT fk_rails_1673fa1e63 FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: fk_rails_33c4da1fe4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_readers
    ADD CONSTRAINT fk_rails_33c4da1fe4 FOREIGN KEY (hospital_id) REFERENCES hospitals(id);


--
-- Name: fk_rails_37b1d1c1ce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_trackable_pairings
    ADD CONSTRAINT fk_rails_37b1d1c1ce FOREIGN KEY (rfid_id) REFERENCES rfids(id);


--
-- Name: fk_rails_3ba95c4fe7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_reader_barcode_reader_pairings
    ADD CONSTRAINT fk_rails_3ba95c4fe7 FOREIGN KEY (rfid_reader_id) REFERENCES rfid_readers(id);


--
-- Name: fk_rails_420b36a74d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT fk_rails_420b36a74d FOREIGN KEY (hospital_id) REFERENCES hospitals(id);


--
-- Name: fk_rails_4b2ea791ff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY inventory_snapshot_contents
    ADD CONSTRAINT fk_rails_4b2ea791ff FOREIGN KEY (inventory_snapshot_id) REFERENCES inventory_snapshots(id);


--
-- Name: fk_rails_50e269ebe4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departures
    ADD CONSTRAINT fk_rails_50e269ebe4 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rails_5fbb406f60; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY inventory_snapshots
    ADD CONSTRAINT fk_rails_5fbb406f60 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rails_67f5ab1fa5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arrivals
    ADD CONSTRAINT fk_rails_67f5ab1fa5 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rails_6d1698ae35; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_scans
    ADD CONSTRAINT fk_rails_6d1698ae35 FOREIGN KEY (rfid_id) REFERENCES rfids(id);


--
-- Name: fk_rails_6de0f0ab37; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_trackable_pairings
    ADD CONSTRAINT fk_rails_6de0f0ab37 FOREIGN KEY (trackable_id) REFERENCES trackables(id);


--
-- Name: fk_rails_84cca00414; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackables
    ADD CONSTRAINT fk_rails_84cca00414 FOREIGN KEY (patient_id) REFERENCES patients(id);


--
-- Name: fk_rails_86da7a9ca1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT fk_rails_86da7a9ca1 FOREIGN KEY (hospital_id) REFERENCES hospitals(id);


--
-- Name: fk_rails_9c6ab304e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_scans
    ADD CONSTRAINT fk_rails_9c6ab304e3 FOREIGN KEY (rfid_reader_id) REFERENCES rfid_readers(id);


--
-- Name: fk_rails_a18fed308b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_scans
    ADD CONSTRAINT fk_rails_a18fed308b FOREIGN KEY (barcode_reader_id) REFERENCES barcode_readers(id);


--
-- Name: fk_rails_a8ceccb51e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_a8ceccb51e FOREIGN KEY (hospital_id) REFERENCES hospitals(id);


--
-- Name: fk_rails_bac677e259; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arrivals
    ADD CONSTRAINT fk_rails_bac677e259 FOREIGN KEY (trackable_id) REFERENCES trackables(id);


--
-- Name: fk_rails_c3a12a5f74; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departures
    ADD CONSTRAINT fk_rails_c3a12a5f74 FOREIGN KEY (trackable_id) REFERENCES trackables(id);


--
-- Name: fk_rails_c57f98f481; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_trackable_pairings
    ADD CONSTRAINT fk_rails_c57f98f481 FOREIGN KEY (trackable_id) REFERENCES trackables(id);


--
-- Name: fk_rails_d45630332a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rfid_reader_barcode_reader_pairings
    ADD CONSTRAINT fk_rails_d45630332a FOREIGN KEY (barcode_reader_id) REFERENCES barcode_readers(id);


--
-- Name: fk_rails_d51996b6d0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY antennas
    ADD CONSTRAINT fk_rails_d51996b6d0 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rails_dc3a99cfd6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_trackable_pairings
    ADD CONSTRAINT fk_rails_dc3a99cfd6 FOREIGN KEY (barcode_id) REFERENCES barcodes(id);


--
-- Name: fk_rails_e5969fa6e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_readers
    ADD CONSTRAINT fk_rails_e5969fa6e4 FOREIGN KEY (hospital_id) REFERENCES hospitals(id);


--
-- Name: fk_rails_eb2fc738e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_eb2fc738e4 FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20151110231626');

INSERT INTO schema_migrations (version) VALUES ('20151110233848');

INSERT INTO schema_migrations (version) VALUES ('20151110233916');

INSERT INTO schema_migrations (version) VALUES ('20151110233943');

INSERT INTO schema_migrations (version) VALUES ('20151111034228');

INSERT INTO schema_migrations (version) VALUES ('20151111193627');

INSERT INTO schema_migrations (version) VALUES ('20151111213000');

INSERT INTO schema_migrations (version) VALUES ('20151111213616');

INSERT INTO schema_migrations (version) VALUES ('20151120221527');

INSERT INTO schema_migrations (version) VALUES ('20151120222212');

INSERT INTO schema_migrations (version) VALUES ('20151120222254');

INSERT INTO schema_migrations (version) VALUES ('20151120222643');

INSERT INTO schema_migrations (version) VALUES ('20151120225350');

INSERT INTO schema_migrations (version) VALUES ('20151120225358');

INSERT INTO schema_migrations (version) VALUES ('20151121001748');

INSERT INTO schema_migrations (version) VALUES ('20151121162015');

INSERT INTO schema_migrations (version) VALUES ('20151122020710');

INSERT INTO schema_migrations (version) VALUES ('20151122024031');

INSERT INTO schema_migrations (version) VALUES ('20151122025558');

INSERT INTO schema_migrations (version) VALUES ('20151124004442');

INSERT INTO schema_migrations (version) VALUES ('20151124005613');

INSERT INTO schema_migrations (version) VALUES ('20151124007546');

INSERT INTO schema_migrations (version) VALUES ('20151128203158');

INSERT INTO schema_migrations (version) VALUES ('20151128204224');

INSERT INTO schema_migrations (version) VALUES ('20151128224953');

INSERT INTO schema_migrations (version) VALUES ('20151128232944');

INSERT INTO schema_migrations (version) VALUES ('20151129001733');

INSERT INTO schema_migrations (version) VALUES ('20151129011616');

INSERT INTO schema_migrations (version) VALUES ('20151129045833');

INSERT INTO schema_migrations (version) VALUES ('20151129045917');

INSERT INTO schema_migrations (version) VALUES ('20151129050105');

INSERT INTO schema_migrations (version) VALUES ('20151129050138');

INSERT INTO schema_migrations (version) VALUES ('20151130003854');

INSERT INTO schema_migrations (version) VALUES ('20151130084627');

INSERT INTO schema_migrations (version) VALUES ('20160131225313');

INSERT INTO schema_migrations (version) VALUES ('20160203194957');

INSERT INTO schema_migrations (version) VALUES ('20160203195929');

INSERT INTO schema_migrations (version) VALUES ('20160203203555');

INSERT INTO schema_migrations (version) VALUES ('20160203204059');

INSERT INTO schema_migrations (version) VALUES ('20160204041736');

INSERT INTO schema_migrations (version) VALUES ('20160204041910');

INSERT INTO schema_migrations (version) VALUES ('20160205171946');

INSERT INTO schema_migrations (version) VALUES ('20160205223412');

INSERT INTO schema_migrations (version) VALUES ('20160205225000');

INSERT INTO schema_migrations (version) VALUES ('20160205232839');

INSERT INTO schema_migrations (version) VALUES ('20160205233958');

INSERT INTO schema_migrations (version) VALUES ('20160205234230');

INSERT INTO schema_migrations (version) VALUES ('20160205234750');

INSERT INTO schema_migrations (version) VALUES ('20160206000301');

INSERT INTO schema_migrations (version) VALUES ('20160206000349');

INSERT INTO schema_migrations (version) VALUES ('20160206000649');

INSERT INTO schema_migrations (version) VALUES ('20160206001122');

INSERT INTO schema_migrations (version) VALUES ('20160206001609');

INSERT INTO schema_migrations (version) VALUES ('20160206001932');

INSERT INTO schema_migrations (version) VALUES ('20160206002227');

INSERT INTO schema_migrations (version) VALUES ('20160206003410');

INSERT INTO schema_migrations (version) VALUES ('20160206003520');

INSERT INTO schema_migrations (version) VALUES ('20160206031428');

INSERT INTO schema_migrations (version) VALUES ('20160206032706');

INSERT INTO schema_migrations (version) VALUES ('20160206033602');

INSERT INTO schema_migrations (version) VALUES ('20160206034046');

INSERT INTO schema_migrations (version) VALUES ('20160206034936');

INSERT INTO schema_migrations (version) VALUES ('20160206035517');

INSERT INTO schema_migrations (version) VALUES ('20160206041421');

INSERT INTO schema_migrations (version) VALUES ('20160206041458');

INSERT INTO schema_migrations (version) VALUES ('20160206041612');

INSERT INTO schema_migrations (version) VALUES ('20160208175407');

INSERT INTO schema_migrations (version) VALUES ('20160208183731');

INSERT INTO schema_migrations (version) VALUES ('20160208191939');

