import pandas as pd
from pathlib import Path

project_root = Path(__file__).resolve().parent.parent
data_dir = project_root / "data"

df = pd.read_parquet(data_dir / "yellow_tripdata_2025-12.parquet")
df.to_csv(data_dir / "yellow_2025_12.csv", index=False)

df = pd.read_parquet(data_dir / "yellow_tripdata_2026-01.parquet")
df.to_csv(data_dir / "yellow_2026_01.csv", index=False)

df = pd.read_parquet(data_dir / "yellow_tripdata_2026-02.parquet")
df.to_csv(data_dir / "yellow_2026_02.csv", index=False)

print("Konwersja zakończona.")