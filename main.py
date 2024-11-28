import duckdb

duckdb.sql("CREATE TABLE bond_data AS SELECT * from read_csv('datasets/bond_etfs.csv')")
duckdb.sql("SELECT * from bond_data")



# Add year column
duckdb.sql("ALTER TABLE bond_data ADD COLUMN year INT;")
duckdb.sql("UPDATE bond_data SET year = YEAR(Date);")


# Check missing values
duckdb.sql("SELECT * FROM bond_data \
           WHERE Date IS NULL \
   OR AGG IS NULL \
   OR BIL IS NULL \
   OR TLT IS NULL \
   OR VGIT IS NULL;")