USE ROLE marketing_dlt_role;
USE DATABASE ifood;

SHOW SCHEMAS;

USE SCHEMA staging;

SHOW TABLES;

USE WAREHOUSE marketing_wh;

SELECT * FROM marketing_data;

SHOW TABLES IN SCHEMA STAGING;

SHOW TABLES LIKE '_DLT_LOADS';

SHOW TABLES LIKE 'marketing_data';

SELECT * FROM marketing_data LIMIT 10;
SELECT INDEX, income FROM marketing_data LIMIT 10;

DESCRIBE TABLE marketing_data;