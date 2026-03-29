-- =========================================
-- BRONZE TABLE: yellow taxi raw data
-- =========================================
CREATE TABLE IF NOT EXISTS bronze.yellow_taxi_raw (
    raw_id SERIAL PRIMARY KEY,
    VendorID INTEGER,
    tpep_pickup_datetime TIMESTAMP,
    tpep_dropoff_datetime TIMESTAMP,
    passenger_count NUMERIC(10,2),
    trip_distance NUMERIC(10,2),
    RatecodeID NUMERIC(10,2),
    store_and_fwd_flag VARCHAR(1),
    PULocationID INTEGER,
    DOLocationID INTEGER,
    payment_type INTEGER,
    fare_amount NUMERIC(10,2),
    extra NUMERIC(10,2),
    mta_tax NUMERIC(10,2),
    tip_amount NUMERIC(10,2),
    tolls_amount NUMERIC(10,2),
    improvement_surcharge NUMERIC(10,2),
    total_amount NUMERIC(10,2),
    congestion_surcharge NUMERIC(10,2),
    airport_fee NUMERIC(10,2),
    cbd_congestion_fee NUMERIC(10,2),
    source_file VARCHAR(255),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- BRONZE TABLE: taxi zone lookup raw data
-- =========================================
CREATE TABLE IF NOT EXISTS bronze.taxi_zone_lookup_raw (
    raw_lookup_id SERIAL PRIMARY KEY,
    LocationID INTEGER,
    Borough VARCHAR(100),
    "Zone" VARCHAR(150),
    service_zone VARCHAR(100),
    source_file VARCHAR(255),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);