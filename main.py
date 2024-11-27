import duckdb

duckdb.sql("CREATE TABLE bond_data AS SELECT * from read_csv('datasets/bond_etfs.csv')")
duckdb.sql("SELECT * from bond_data")