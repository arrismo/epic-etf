import duckdb 

# Connect to the DuckDB database named 'bonds.db'
con = duckdb.connect("bonds.db")

# Create a table 'bonds' by importing data from a CSV file
con.sql("""
    CREATE TABLE bonds AS 
        SELECT * FROM read_csv('bonds_etfs.csv')
""")

# Create a comprehensive analysis table for bond ETFs
# This query calculates various metrics for each bond ETF
con.sql("""
CREATE TABLE bonds.bonds_analysis AS
SELECT
    -- Basic date information
    Date,
    EXTRACT(MONTH FROM CAST(Date AS DATE)) AS MONTH,  -- Extract month from date
    EXTRACT(YEAR FROM CAST(Date AS DATE)) AS YEAR,    -- Extract year from date
    
    -- For each ETF (AGG, BIL, BND, etc.), calculate:
    -- 1. Current price
    -- 2. Previous day's price using LAG
    -- 3. Daily percentage change
    -- 4. Cumulative return since the first date
    
    -- AGG ETF calculations
    AGG,
    LAG(AGG) OVER (ORDER BY Date) AS Previous_AGG,
    (AGG - LAG(AGG) OVER (ORDER BY Date)) / LAG(AGG) OVER (ORDER BY Date) * 100 AS AGG_Pct_Change,
    (AGG / FIRST_VALUE(AGG) OVER (ORDER BY Date) - 1) * 100 AS AGG_Cumulative_Return,
    
    -- Similar calculations repeated for other bond ETFs:
    -- BIL, BND, EDV, IEF, SGOV, SHV, SHY, TLH, TLT, VGIT
    [... repeated pattern for each ETF ...]
FROM
    bonds
""")

# Create a table 'equity' by importing data from equity.csv
con.sql("""
    CREATE TABLE equity AS
        SELECT * FROM read_csv("equity.csv")
""")

# Create a comprehensive analysis table for equity ETFs
# This query follows the same pattern as the bonds analysis
con.sql("""
CREATE TABLE bonds.equity_analysis AS
SELECT
    -- Basic date information
    date,
    EXTRACT(MONTH FROM CAST(date AS DATE)) AS MONTH,
    EXTRACT(YEAR FROM CAST(date AS DATE)) AS YEAR,
    
    -- For each equity ETF, calculate:
    -- 1. Current price
    -- 2. Previous day's price using LAG
    -- 3. Daily percentage change
    -- 4. Cumulative return since the first date
    
    -- Calculations for various equity ETFs:
    -- IEFA, IEMG, IJH, IJR, IVV, IWF, IWM, QQQ, RSP, SCHD,
    -- SPY, VEA, VGT, VIG, VO, VOO, VTI, VTV, VUG, VWO,
    -- VXUS, XLE, XLF, XLG, XLK
    [... repeated pattern for each ETF ...]
FROM
    bonds.equity
""")

# Close the database connection
con.close()