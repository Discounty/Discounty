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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ad_campaigns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_campaigns (
    id integer NOT NULL,
    description text,
    shop_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ad_campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ad_campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ad_campaigns_id_seq OWNED BY ad_campaigns.id;


--
-- Name: advertisements; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE advertisements (
    id integer NOT NULL,
    name character varying,
    ad_data json,
    ad_campaign_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: advertisements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE advertisements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: advertisements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE advertisements_id_seq OWNED BY advertisements.id;


--
-- Name: barcode_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE barcode_types (
    id integer NOT NULL,
    barcode_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    barcode_id integer
);


--
-- Name: barcode_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE barcode_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: barcode_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE barcode_types_id_seq OWNED BY barcode_types.id;


--
-- Name: barcodes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE barcodes (
    id integer NOT NULL,
    barcode character varying,
    discount_percentage double precision,
    extra_info character varying,
    barcode_type_id integer,
    discount_card_id integer,
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
-- Name: coupons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE coupons (
    id integer NOT NULL,
    description text,
    barcode_id integer,
    shop_id integer,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE coupons_id_seq OWNED BY coupons.id;


--
-- Name: customer_feedbacks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customer_feedbacks (
    id integer NOT NULL,
    feedback text,
    rating integer,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: customer_feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE customer_feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE customer_feedbacks_id_seq OWNED BY customer_feedbacks.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customers (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying NOT NULL,
    phone_number character varying,
    city character varying,
    country character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: discount_cards; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE discount_cards (
    id integer NOT NULL,
    name character varying,
    description character varying,
    shop_id integer,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    unregistered_shop character varying
);


--
-- Name: discount_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE discount_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discount_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE discount_cards_id_seq OWNED BY discount_cards.id;


--
-- Name: i18n_keys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE i18n_keys (
    id integer NOT NULL,
    key_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: i18n_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE i18n_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: i18n_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE i18n_keys_id_seq OWNED BY i18n_keys.id;


--
-- Name: locales; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locales (
    id integer NOT NULL,
    name character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locales_id_seq OWNED BY locales.id;


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth_access_grants (
    id integer NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id integer NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying
);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oauth_access_grants_id_seq OWNED BY oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth_access_tokens (
    id integer NOT NULL,
    resource_owner_id integer,
    application_id integer,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying
);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oauth_access_tokens_id_seq OWNED BY oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth_applications (
    id integer NOT NULL,
    name character varying NOT NULL,
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oauth_applications_id_seq OWNED BY oauth_applications.id;


--
-- Name: recipient_lists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recipient_lists (
    id integer NOT NULL,
    ad_campaign_id integer,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: recipient_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recipient_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recipient_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recipient_lists_id_seq OWNED BY recipient_lists.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: shop_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shop_types (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    i18n_name_id integer,
    i18n_description_id integer,
    shop_id integer
);


--
-- Name: shop_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shop_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shop_types_id_seq OWNED BY shop_types.id;


--
-- Name: shops; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shops (
    id integer NOT NULL,
    name character varying,
    description text,
    chain_store character varying,
    address text,
    city character varying,
    country character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone
);


--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shops_id_seq OWNED BY shops.id;


--
-- Name: translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE translations (
    id integer NOT NULL,
    translation character varying,
    i18n_key_id integer,
    locale_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE translations_id_seq OWNED BY translations.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_campaigns ALTER COLUMN id SET DEFAULT nextval('ad_campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY advertisements ALTER COLUMN id SET DEFAULT nextval('advertisements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_types ALTER COLUMN id SET DEFAULT nextval('barcode_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcodes ALTER COLUMN id SET DEFAULT nextval('barcodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY coupons ALTER COLUMN id SET DEFAULT nextval('coupons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY customer_feedbacks ALTER COLUMN id SET DEFAULT nextval('customer_feedbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY discount_cards ALTER COLUMN id SET DEFAULT nextval('discount_cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY i18n_keys ALTER COLUMN id SET DEFAULT nextval('i18n_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locales ALTER COLUMN id SET DEFAULT nextval('locales_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('oauth_access_grants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('oauth_access_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth_applications ALTER COLUMN id SET DEFAULT nextval('oauth_applications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recipient_lists ALTER COLUMN id SET DEFAULT nextval('recipient_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_types ALTER COLUMN id SET DEFAULT nextval('shop_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shops ALTER COLUMN id SET DEFAULT nextval('shops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY translations ALTER COLUMN id SET DEFAULT nextval('translations_id_seq'::regclass);


--
-- Name: ad_campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_campaigns
    ADD CONSTRAINT ad_campaigns_pkey PRIMARY KEY (id);


--
-- Name: advertisements_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY advertisements
    ADD CONSTRAINT advertisements_pkey PRIMARY KEY (id);


--
-- Name: barcode_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY barcode_types
    ADD CONSTRAINT barcode_types_pkey PRIMARY KEY (id);


--
-- Name: barcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY barcodes
    ADD CONSTRAINT barcodes_pkey PRIMARY KEY (id);


--
-- Name: coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: customer_feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer_feedbacks
    ADD CONSTRAINT customer_feedbacks_pkey PRIMARY KEY (id);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: discount_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY discount_cards
    ADD CONSTRAINT discount_cards_pkey PRIMARY KEY (id);


--
-- Name: i18n_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY i18n_keys
    ADD CONSTRAINT i18n_keys_pkey PRIMARY KEY (id);


--
-- Name: locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locales
    ADD CONSTRAINT locales_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: recipient_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recipient_lists
    ADD CONSTRAINT recipient_lists_pkey PRIMARY KEY (id);


--
-- Name: shop_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_types
    ADD CONSTRAINT shop_types_pkey PRIMARY KEY (id);


--
-- Name: shops_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: index_ad_campaigns_on_shop_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ad_campaigns_on_shop_id ON ad_campaigns USING btree (shop_id);


--
-- Name: index_advertisements_on_ad_campaign_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_advertisements_on_ad_campaign_id ON advertisements USING btree (ad_campaign_id);


--
-- Name: index_barcode_types_on_barcode_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_barcode_types_on_barcode_id ON barcode_types USING btree (barcode_id);


--
-- Name: index_barcodes_on_barcode_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_barcodes_on_barcode_type_id ON barcodes USING btree (barcode_type_id);


--
-- Name: index_barcodes_on_discount_card_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_barcodes_on_discount_card_id ON barcodes USING btree (discount_card_id);


--
-- Name: index_coupons_on_barcode_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_coupons_on_barcode_id ON coupons USING btree (barcode_id);


--
-- Name: index_coupons_on_customer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_coupons_on_customer_id ON coupons USING btree (customer_id);


--
-- Name: index_coupons_on_shop_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_coupons_on_shop_id ON coupons USING btree (shop_id);


--
-- Name: index_customer_feedbacks_on_customer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_customer_feedbacks_on_customer_id ON customer_feedbacks USING btree (customer_id);


--
-- Name: index_customers_on_confirmation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_customers_on_confirmation_token ON customers USING btree (confirmation_token);


--
-- Name: index_customers_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_customers_on_email ON customers USING btree (email);


--
-- Name: index_customers_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_customers_on_reset_password_token ON customers USING btree (reset_password_token);


--
-- Name: index_discount_cards_on_customer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_discount_cards_on_customer_id ON discount_cards USING btree (customer_id);


--
-- Name: index_discount_cards_on_shop_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_discount_cards_on_shop_id ON discount_cards USING btree (shop_id);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON oauth_applications USING btree (uid);


--
-- Name: index_recipient_lists_on_ad_campaign_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_recipient_lists_on_ad_campaign_id ON recipient_lists USING btree (ad_campaign_id);


--
-- Name: index_recipient_lists_on_customer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_recipient_lists_on_customer_id ON recipient_lists USING btree (customer_id);


--
-- Name: index_shop_types_on_shop_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shop_types_on_shop_id ON shop_types USING btree (shop_id);


--
-- Name: index_shops_on_confirmation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_shops_on_confirmation_token ON shops USING btree (confirmation_token);


--
-- Name: index_shops_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_shops_on_email ON shops USING btree (email);


--
-- Name: index_shops_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_shops_on_reset_password_token ON shops USING btree (reset_password_token);


--
-- Name: index_shops_on_unlock_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_shops_on_unlock_token ON shops USING btree (unlock_token);


--
-- Name: index_translations_on_i18n_key_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_translations_on_i18n_key_id ON translations USING btree (i18n_key_id);


--
-- Name: index_translations_on_locale_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_translations_on_locale_id ON translations USING btree (locale_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_058ccb2964; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coupons
    ADD CONSTRAINT fk_rails_058ccb2964 FOREIGN KEY (customer_id) REFERENCES customers(id);


--
-- Name: fk_rails_08297f3ae9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coupons
    ADD CONSTRAINT fk_rails_08297f3ae9 FOREIGN KEY (shop_id) REFERENCES shops(id);


--
-- Name: fk_rails_08d2966a08; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recipient_lists
    ADD CONSTRAINT fk_rails_08d2966a08 FOREIGN KEY (customer_id) REFERENCES customers(id);


--
-- Name: fk_rails_17ccc34160; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY customer_feedbacks
    ADD CONSTRAINT fk_rails_17ccc34160 FOREIGN KEY (customer_id) REFERENCES customers(id);


--
-- Name: fk_rails_20656cb90e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_campaigns
    ADD CONSTRAINT fk_rails_20656cb90e FOREIGN KEY (shop_id) REFERENCES shops(id);


--
-- Name: fk_rails_259809f500; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY advertisements
    ADD CONSTRAINT fk_rails_259809f500 FOREIGN KEY (ad_campaign_id) REFERENCES ad_campaigns(id);


--
-- Name: fk_rails_3909510b83; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcodes
    ADD CONSTRAINT fk_rails_3909510b83 FOREIGN KEY (barcode_type_id) REFERENCES barcode_types(id);


--
-- Name: fk_rails_407a8d61ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT fk_rails_407a8d61ca FOREIGN KEY (locale_id) REFERENCES locales(id);


--
-- Name: fk_rails_6673e048ff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_types
    ADD CONSTRAINT fk_rails_6673e048ff FOREIGN KEY (shop_id) REFERENCES shops(id);


--
-- Name: fk_rails_6bc5aad6d2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coupons
    ADD CONSTRAINT fk_rails_6bc5aad6d2 FOREIGN KEY (barcode_id) REFERENCES barcodes(id);


--
-- Name: fk_rails_6dc118d565; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT fk_rails_6dc118d565 FOREIGN KEY (i18n_key_id) REFERENCES i18n_keys(id);


--
-- Name: fk_rails_9a52731b52; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcodes
    ADD CONSTRAINT fk_rails_9a52731b52 FOREIGN KEY (discount_card_id) REFERENCES discount_cards(id);


--
-- Name: fk_rails_c333894fbf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recipient_lists
    ADD CONSTRAINT fk_rails_c333894fbf FOREIGN KEY (ad_campaign_id) REFERENCES ad_campaigns(id);


--
-- Name: fk_rails_d7d553969e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY discount_cards
    ADD CONSTRAINT fk_rails_d7d553969e FOREIGN KEY (shop_id) REFERENCES shops(id);


--
-- Name: fk_rails_e5abfc09ff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barcode_types
    ADD CONSTRAINT fk_rails_e5abfc09ff FOREIGN KEY (barcode_id) REFERENCES barcodes(id);


--
-- Name: fk_rails_f4afe7ec7b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY discount_cards
    ADD CONSTRAINT fk_rails_f4afe7ec7b FOREIGN KEY (customer_id) REFERENCES customers(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20151207202703');

INSERT INTO schema_migrations (version) VALUES ('20151207202927');

INSERT INTO schema_migrations (version) VALUES ('20151207203527');

INSERT INTO schema_migrations (version) VALUES ('20151207203902');

INSERT INTO schema_migrations (version) VALUES ('20151207204101');

INSERT INTO schema_migrations (version) VALUES ('20151207204224');

INSERT INTO schema_migrations (version) VALUES ('20151207204801');

INSERT INTO schema_migrations (version) VALUES ('20151207205633');

INSERT INTO schema_migrations (version) VALUES ('20151207205853');

INSERT INTO schema_migrations (version) VALUES ('20151207205951');

INSERT INTO schema_migrations (version) VALUES ('20151207210247');

INSERT INTO schema_migrations (version) VALUES ('20151207210543');

INSERT INTO schema_migrations (version) VALUES ('20151207210811');

INSERT INTO schema_migrations (version) VALUES ('20151207211133');

INSERT INTO schema_migrations (version) VALUES ('20151207211329');

INSERT INTO schema_migrations (version) VALUES ('20151207211634');

INSERT INTO schema_migrations (version) VALUES ('20151207211752');

INSERT INTO schema_migrations (version) VALUES ('20151212234336');

INSERT INTO schema_migrations (version) VALUES ('20151220193121');

INSERT INTO schema_migrations (version) VALUES ('20151220203133');

