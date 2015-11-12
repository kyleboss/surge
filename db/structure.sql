--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addresses (
    id integer NOT NULL,
    street_address character varying,
    city character varying,
    state character varying,
    zip_code integer,
    country character varying,
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
-- Name: brands; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE brands (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: credit_cards; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE credit_cards (
    id integer NOT NULL,
    number character varying,
    cvv integer,
    address_id integer,
    expiration_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying,
    middle_initial character varying,
    last_name character varying
);


--
-- Name: credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE credit_cards_id_seq OWNED BY credit_cards.id;


--
-- Name: drugs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE drugs (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: drugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE drugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: drugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE drugs_id_seq OWNED BY drugs.id;


--
-- Name: hospitals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hospitals (
    id integer NOT NULL,
    name character varying,
    address_id integer,
    administrator_id integer,
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
-- Name: locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying,
    hospital_id integer,
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
-- Name: pills; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pills (
    id integer NOT NULL,
    drug_id integer,
    brand_id integer,
    location_id integer,
    hospital_id integer,
    qty integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pills_id_seq OWNED BY pills.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: searches; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW searches AS
 SELECT locations.id AS searchable_id,
    locations.name AS term,
    'Location'::character varying AS searchable_type
   FROM locations
UNION
 SELECT brands.id AS searchable_id,
    brands.name AS term,
    'Brand'::character varying AS searchable_type
   FROM brands
UNION
 SELECT drugs.id AS searchable_id,
    drugs.name AS term,
    'Drug'::character varying AS searchable_type
   FROM drugs;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    phone character varying,
    address_id integer,
    email character varying,
    password character varying,
    credit_card_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    middle_initial character varying,
    hospital_id integer
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

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY credit_cards ALTER COLUMN id SET DEFAULT nextval('credit_cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugs ALTER COLUMN id SET DEFAULT nextval('drugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hospitals ALTER COLUMN id SET DEFAULT nextval('hospitals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pills ALTER COLUMN id SET DEFAULT nextval('pills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY credit_cards
    ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);


--
-- Name: drugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY drugs
    ADD CONSTRAINT drugs_pkey PRIMARY KEY (id);


--
-- Name: hospitals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hospitals
    ADD CONSTRAINT hospitals_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: pills_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pills
    ADD CONSTRAINT pills_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_credit_cards_on_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_credit_cards_on_address_id ON credit_cards USING btree (address_id);


--
-- Name: index_hospitals_on_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_hospitals_on_address_id ON hospitals USING btree (address_id);


--
-- Name: index_hospitals_on_administrator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_hospitals_on_administrator_id ON hospitals USING btree (administrator_id);


--
-- Name: index_locations_on_hospital_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_locations_on_hospital_id ON locations USING btree (hospital_id);


--
-- Name: index_pills_on_brand_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pills_on_brand_id ON pills USING btree (brand_id);


--
-- Name: index_pills_on_drug_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pills_on_drug_id ON pills USING btree (drug_id);


--
-- Name: index_pills_on_hospital_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pills_on_hospital_id ON pills USING btree (hospital_id);


--
-- Name: index_pills_on_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pills_on_location_id ON pills USING btree (location_id);


--
-- Name: index_users_on_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_address_id ON users USING btree (address_id);


--
-- Name: index_users_on_credit_card_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_credit_card_id ON users USING btree (credit_card_id);


--
-- Name: index_users_on_hospital_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_hospital_id ON users USING btree (hospital_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_141d4bec17; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pills
    ADD CONSTRAINT fk_rails_141d4bec17 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rails_14262c267c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pills
    ADD CONSTRAINT fk_rails_14262c267c FOREIGN KEY (drug_id) REFERENCES drugs(id);


--
-- Name: fk_rails_1625c741bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_1625c741bd FOREIGN KEY (credit_card_id) REFERENCES credit_cards(id);


--
-- Name: fk_rails_1673fa1e63; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hospitals
    ADD CONSTRAINT fk_rails_1673fa1e63 FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: fk_rails_420b36a74d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT fk_rails_420b36a74d FOREIGN KEY (hospital_id) REFERENCES hospitals(id);


--
-- Name: fk_rails_4ddc68558e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pills
    ADD CONSTRAINT fk_rails_4ddc68558e FOREIGN KEY (hospital_id) REFERENCES hospitals(id);


--
-- Name: fk_rails_a8ceccb51e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_a8ceccb51e FOREIGN KEY (hospital_id) REFERENCES hospitals(id);


--
-- Name: fk_rails_ba8b23249a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY credit_cards
    ADD CONSTRAINT fk_rails_ba8b23249a FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: fk_rails_d411c8fa68; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pills
    ADD CONSTRAINT fk_rails_d411c8fa68 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_d7d780c6ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hospitals
    ADD CONSTRAINT fk_rails_d7d780c6ca FOREIGN KEY (administrator_id) REFERENCES users(id);


--
-- Name: fk_rails_eb2fc738e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_eb2fc738e4 FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20151110230749');

INSERT INTO schema_migrations (version) VALUES ('20151110230758');

INSERT INTO schema_migrations (version) VALUES ('20151110231626');

INSERT INTO schema_migrations (version) VALUES ('20151110233636');

INSERT INTO schema_migrations (version) VALUES ('20151110233848');

INSERT INTO schema_migrations (version) VALUES ('20151110233916');

INSERT INTO schema_migrations (version) VALUES ('20151110233943');

INSERT INTO schema_migrations (version) VALUES ('20151110234040');

INSERT INTO schema_migrations (version) VALUES ('20151111013313');

INSERT INTO schema_migrations (version) VALUES ('20151111034228');

INSERT INTO schema_migrations (version) VALUES ('20151111193627');

INSERT INTO schema_migrations (version) VALUES ('20151111195249');

INSERT INTO schema_migrations (version) VALUES ('20151111213000');

INSERT INTO schema_migrations (version) VALUES ('20151111213616');

