-- =========================================
-- SILVER TABLE: taxi zone lookup
-- =========================================
CREATE TABLE silver.taxi_zone_lookup AS
SELECT DISTINCT
    LocationID AS locationid,
    TRIM(Borough) AS borough,
    TRIM("Zone") AS zone,
    TRIM(service_zone) AS service_zone
FROM bronze.taxi_zone_lookup_raw
WHERE LocationID IS NOT NULL;

-- =========================================
-- SILVER TABLE: yellow taxi clean
-- =========================================
CREATE TABLE silver.yellow_taxi_clean AS
SELECT
    ROW_NUMBER() OVER () AS trip_id,

    tpep_pickup_datetime AS pickup_datetime,
    tpep_dropoff_datetime AS dropoff_datetime,

    DATE_TRUNC('month', tpep_pickup_datetime) AS pickup_month,

    EXTRACT(EPOCH FROM (tpep_dropoff_datetime - tpep_pickup_datetime)) / 60.0 
        AS trip_duration_minutes,

    trip_distance,
    total_amount,

    PULocationID AS pulocationid,
    DOLocationID AS dolocationid,

    payment_type,

    CASE
        WHEN tpep_pickup_datetime IS NULL THEN FALSE
        WHEN tpep_dropoff_datetime IS NULL THEN FALSE
        WHEN tpep_dropoff_datetime < tpep_pickup_datetime THEN FALSE
        WHEN trip_distance < 0 THEN FALSE
        WHEN total_amount < 0 THEN FALSE
        ELSE TRUE
    END AS is_valid_record

FROM bronze.yellow_taxi_raw;