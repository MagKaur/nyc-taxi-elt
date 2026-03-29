-- =========================================
-- GOLD TABLE: taxi metrics
-- =========================================
CREATE TABLE gold.taxi_metrics AS
SELECT
    DATE_TRUNC('month', y.pickup_datetime) AS month,
    pu.zone AS pickup_zone,
    do_.zone AS dropoff_zone,
    COUNT(*) AS trip_count,
    ROUND(SUM(y.total_amount), 2) AS total_revenue,
    ROUND(AVG(y.trip_distance), 2) AS avg_distance
FROM silver.yellow_taxi_clean y
LEFT JOIN silver.taxi_zone_lookup pu
    ON y.pulocationid = pu.locationid
LEFT JOIN silver.taxi_zone_lookup do_
    ON y.dolocationid = do_.locationid
WHERE y.is_valid_record = TRUE
GROUP BY 1, 2, 3;