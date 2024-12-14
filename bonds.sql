LOAD DATA INFILE 'datasets/bond_etfs.csv'
INTO TABLE your_table
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  -- Skip the header row
