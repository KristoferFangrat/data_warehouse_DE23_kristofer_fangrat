USE ROLE marketing_dlt_role;

USE DATABASE ifood;

SHOW SCHEMAS;

SHOW TABLES IN SCHEMA staging;

USE SCHEMA staging;

SHOW TABLES;

-- Query to see the data in the marketing_data table
SELECT * FROM _dlt_loads LIMIT 10;

SELECT * FROM marketing_data LIMIT 10;

SHOW VIEWS IN SCHEMA staging;