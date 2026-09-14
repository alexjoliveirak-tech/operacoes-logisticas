CREATE TABLE drivers (
    driver_id           VARCHAR(8)   PRIMARY KEY,
    first_name          VARCHAR(30)  NOT NULL,
    last_name           VARCHAR(30)  NOT NULL,
    hire_date           DATE         NOT NULL,
    termination_date    DATE,
    license_number      VARCHAR(15)  NOT NULL UNIQUE,
    license_state       CHAR(2)      NOT NULL,
    date_of_birth       DATE         NOT NULL,
    home_terminal       VARCHAR(30)  NOT NULL,
    employment_status   VARCHAR(15)  NOT NULL,
    cdl_class           CHAR(1)      NOT NULL,
    years_experience    SMALLINT     NOT NULL
);

CREATE TABLE trucks (
    truck_id                VARCHAR(8)   PRIMARY KEY,
    unit_number             VARCHAR(10)  NOT NULL,
    make                    VARCHAR(20)  NOT NULL,
    model_year              SMALLINT     NOT NULL,
    vin                     VARCHAR(18)  NOT NULL UNIQUE,
    acquisition_date        DATE         NOT NULL,
    acquisition_mileage     INTEGER      NOT NULL,
    fuel_type               VARCHAR(10)  NOT NULL,
    tank_capacity_gallons   SMALLINT     NOT NULL,
    status                  VARCHAR(15)  NOT NULL,
    home_terminal           VARCHAR(30)  NOT NULL
);

CREATE TABLE trailers (
    trailer_id          VARCHAR(8)   PRIMARY KEY,
    trailer_number      VARCHAR(10)  NOT NULL,
    trailer_type        VARCHAR(20)  NOT NULL CHECK (trailer_type IN ('Dry Van', 'Refrigerated')),
    length_feet         SMALLINT     NOT NULL,
    model_year          SMALLINT     NOT NULL CHECK (model_year BETWEEN 1990 AND 2100),
    vin                 VARCHAR(18)  NOT NULL UNIQUE,
    acquisition_date    DATE         NOT NULL,
    status              VARCHAR(20)  NOT NULL DEFAULT 'Active',
    current_location    VARCHAR(30)  NOT NULL
);

CREATE TABLE customers (
    customer_id                 VARCHAR(9)     PRIMARY KEY,
    customer_name               VARCHAR(50)    NOT NULL,
    customer_type               VARCHAR(15)    NOT NULL,
    credit_terms_days           SMALLINT       NOT NULL,
    primary_freight_type        VARCHAR(20)    NOT NULL,
    account_status               VARCHAR(10)    NOT NULL,
    contract_start_date          DATE           NOT NULL,
    annual_revenue_potential     NUMERIC(14,2)  NOT NULL
);

CREATE TABLE facilities (
    facility_id         VARCHAR(8)    PRIMARY KEY,
    facility_name       VARCHAR(50)   NOT NULL,
    facility_type       VARCHAR(25)   NOT NULL,
    city                VARCHAR(30)   NOT NULL,
    state               CHAR(2)       NOT NULL,
    latitude            NUMERIC(9,6)  NOT NULL,
    longitude           NUMERIC(9,6)  NOT NULL,
    dock_doors          SMALLINT      NOT NULL,
    operating_hours     VARCHAR(15)   NOT NULL
);

CREATE TABLE routes (
    route_id                 VARCHAR(8)    PRIMARY KEY,
    origin_city              VARCHAR(30)   NOT NULL,
    origin_state             CHAR(2)       NOT NULL,
    destination_city         VARCHAR(30)   NOT NULL,
    destination_state        CHAR(2)       NOT NULL,
    typical_distance_miles   INTEGER       NOT NULL CHECK (typical_distance_miles > 0),
    base_rate_per_mile       NUMERIC(6,2)  NOT NULL CHECK (base_rate_per_mile >= 0),
    fuel_surcharge_rate      NUMERIC(5,2)  NOT NULL CHECK (fuel_surcharge_rate >= 0),
    typical_transit_days     SMALLINT      NOT NULL CHECK (typical_transit_days > 0)
);

CREATE TABLE loads (
    load_id                VARCHAR(12)    PRIMARY KEY,
    customer_id            VARCHAR(9)     NOT NULL REFERENCES customers(customer_id),
    route_id               VARCHAR(8)     NOT NULL REFERENCES routes(route_id),
    load_date              DATE           NOT NULL,
    load_type              VARCHAR(20)    NOT NULL,
    weight_lbs             INTEGER        NOT NULL,
    pieces                 SMALLINT       NOT NULL,
    revenue                NUMERIC(10,2)  NOT NULL,
    fuel_surcharge         NUMERIC(10,2)  NOT NULL,
    accessorial_charges    NUMERIC(10,2)  NOT NULL,
    load_status            VARCHAR(15)    NOT NULL,
    booking_type           VARCHAR(15)    NOT NULL
);

CREATE TABLE trips (
    trip_id                  VARCHAR(12)    PRIMARY KEY,
    load_id                  VARCHAR(12)    NOT NULL REFERENCES loads(load_id),
    driver_id                VARCHAR(8)     REFERENCES drivers(driver_id),
    truck_id                 VARCHAR(8)     REFERENCES trucks(truck_id),
    trailer_id                VARCHAR(8)     REFERENCES trailers(trailer_id),
    dispatch_date            DATE           NOT NULL,
    actual_distance_miles    INTEGER        NOT NULL,
    actual_duration_hours    NUMERIC(6,2)   NOT NULL,
    fuel_gallons_used        NUMERIC(8,2)   NOT NULL,
    average_mpg              NUMERIC(5,2)   NOT NULL,
    idle_time_hours          NUMERIC(6,2)   NOT NULL,
    trip_status               VARCHAR(15)    NOT NULL
);

CREATE TABLE maintenance_records (
    maintenance_id         VARCHAR(13)    PRIMARY KEY,
    truck_id               VARCHAR(8)     NOT NULL REFERENCES trucks(truck_id),
    maintenance_date       DATE           NOT NULL,
    maintenance_type       VARCHAR(15)    NOT NULL,
    odometer_reading       INTEGER        NOT NULL,
    labor_hours            NUMERIC(6,2)   NOT NULL,
    labor_cost             NUMERIC(10,2)  NOT NULL,
    parts_cost             NUMERIC(10,2)  NOT NULL,
    total_cost             NUMERIC(10,2)  NOT NULL,
    facility_location      VARCHAR(30)    NOT NULL,
    downtime_hours         NUMERIC(6,2)   NOT NULL,
    service_description    VARCHAR(50)    NOT NULL
);

-- =========================================================
-- VERIFICAÇÃO DE CONTAGEM - 8 TABELAS
-- =========================================================
-- =========================================================
-- VERIFICAÇÃO DE CONTAGEM - 9 TABELAS
-- =========================================================
SELECT 'customers' AS tabela, COUNT(*) AS total FROM customers
UNION ALL SELECT 'drivers', COUNT(*) FROM drivers
UNION ALL SELECT 'trucks', COUNT(*) FROM trucks
UNION ALL SELECT 'trailers', COUNT(*) FROM trailers
UNION ALL SELECT 'facilities', COUNT(*) FROM facilities
UNION ALL SELECT 'routes', COUNT(*) FROM routes
UNION ALL SELECT 'loads', COUNT(*) FROM loads
UNION ALL SELECT 'trips', COUNT(*) FROM trips
UNION ALL SELECT 'maintenance_records', COUNT(*) FROM maintenance_records;