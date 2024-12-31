# Import the DuckDB database library
import duckdb

# Connect to the existing DuckDB database file named 'bonds.db'
con = duckdb.connect("bonds.db")

# Export the bonds_analysis table to a CSV file
con.sql(
    """
    # Copy all columns and rows from bonds_analysis table
    # Save to 'cleaned_data/bonds_analysis.csv'
    # Include headers (column names) and use comma as delimiter
    COPY (SELECT * FROM bonds_analysis) TO 'cleaned_data/bonds_analysis.csv' (HEADER, DELIMITER ',');
    """
)

# Export the equity_analysis table to a CSV file
con.sql(
    """
    # Copy all columns and rows from equity_analysis table
    # Save to 'cleaned_data/equity_analysis.csv'
    # Include headers (column names) and use comma as delimiter
    COPY (SELECT * FROM equity_analysis) TO 'cleaned_data/equity_analysis.csv' (HEADER, DELIMITER ',');
    """
)

# Close the database connection to free up resources
con.close()