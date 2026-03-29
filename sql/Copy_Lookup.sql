COPY bronze.taxi_zone_lookup_raw (LocationID, Borough, "Zone", service_zone)
FROM '/tmp/taxi_zone_lookup.csv'
DELIMITER ','
CSV HEADER;
