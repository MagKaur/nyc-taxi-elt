# Data Quality Risks

## 1. Błędna logika czasowa
Zbiór danych zawiera czas rozpoczęcia (pickup) i zakończenia (dropoff) przejazdu. Problem jakości danych pojawia się, gdy czas dropoff jest wcześniejszy niż pickup lub gdy któryś z tych czasów jest brakujący. Takie rekordy powodują błędne obliczenia czasu trwania przejazdu i mogą zaburzać analizy czasowe.

## 2. Brakujące lub niedopasowane identyfikatory lokalizacji
Dane wykorzystują `PULocationID` i `DOLocationID` do identyfikacji stref przejazdu, które są łączone z tabelą Taxi Zone Lookup. Problem pojawia się, gdy identyfikatory są brakujące, błędne lub nie mają odpowiednika w tabeli lookup. Może to prowadzić do niepełnych joinów i braków w analizach przestrzennych.

## 3. Nieprawidłowe wartości numeryczne
Zbiór danych zawiera pola takie jak `trip_distance` oraz `total_amount`. Ryzyko jakości danych występuje, gdy wartości te są ujemne lub nielogiczne. Takie dane mogą wpływać na błędne obliczenia przychodów, średnich wartości oraz innych metryk biznesowych.

## 4. Niespójność formatów danych między plikami
Projekt wykorzystuje dane z kilku miesięcy. Może wystąpić niespójność w formacie danych między plikami źródłowymi, np. różnice w typach danych, brakujące kolumny lub inny sposób zapisu wartości. Może to powodować problemy podczas ładowania danych do warstwy Bronze.
