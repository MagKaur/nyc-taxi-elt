## Źródło danych

Główna strona danych:
https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

Bezpośrednie pliki wykorzystane w projekcie:

- https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-12.parquet  
- https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-01.parquet  
- https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-02.parquet  

Tabela lookup:
- https://d37ci6vzurychx.cloudfront.net/misc/taxi+_zone_lookup.csv

---

## Wykorzystane dane

Projekt wykorzystuje dane typu Yellow Taxi Trip Records, które zawierają:

- datę i godzinę rozpoczęcia oraz zakończenia przejazdu,
- dystans przejazdu,
- kwotę zapłaty (fare, tip, total),
- identyfikatory lokalizacji (PULocationID, DOLocationID),
- sposób płatności.

Dane obejmują trzy miesiące:
- grudzień 2025,
- styczeń 2026,
- luty 2026.

Dodatkowo wykorzystano tabelę Taxi Zone Lookup do wzbogacenia danych o informacje przestrzenne (nazwy stref i dzielnic).
