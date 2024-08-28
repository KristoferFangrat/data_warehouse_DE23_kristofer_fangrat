USE ROLE parking_dlt_role;

USE DATABASE parking;

USE SCHEMA parking.staging;
USE WAREHOUSE parking_wh;

SHOW TABLES;

SELECT * FROM parking_data LIMIT 10;

SELECT COUNT(*) FROM parking_data;