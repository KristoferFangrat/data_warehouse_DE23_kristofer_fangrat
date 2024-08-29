USE ROLE parking_dlt_role;

USE DATABASE parking;

USE SCHEMA parking.staging;
USE SCHEMA parking.staging_mc;
USE WAREHOUSE parking_wh;

SHOW TABLES;

SELECT * FROM parking_data LIMIT 10;

SELECT COUNT(*) FROM parking_data;