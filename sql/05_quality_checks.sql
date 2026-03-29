-- =========================================
-- DATA QUALITY CHECKS
-- =========================================

-- 1. Invalid time logic
SELECT COUNT(*) AS invalid_time_records
FROM bronze.yellow_taxi_raw
WHERE tpep_dropoff_datetime < tpep_pickup_datetime;

-- 2. Negative values
SELECT COUNT(*) AS negative_values
FROM bronze.yellow_taxi_raw
WHERE trip_distance < 0 OR total_amount < 0;

-- 3. Missing location mapping
SELECT COUNT(*) AS missing_location_lookup
FROM silver.yellow_taxi_clean y
LEFT JOIN silver.taxi_zone_lookup l
    ON y.pulocationid = l.locationid
WHERE l.locationid IS NULL;

-- 4. Invalid records in Silver
SELECT COUNT(*) AS invalid_records_silver
FROM silver.yellow_taxi_clean
WHERE is_valid_record = FALSE;
