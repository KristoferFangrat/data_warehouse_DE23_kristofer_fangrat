USE ROLE SYSADMIN;

USE DATABASE ice_cream_db_exercise;
USE SCHEMA ice_cream_db_exercise.staging;
USE WAREHOUSE DEV_WH;

USE ROLE ACCOUNTADMIN;
USE ROLE USERADMIN;
USE ROLE ice_cream_dlt_role;

SELECT * FROM ICE_CREAM_REVIEWS LIMIT 100;

SHOW TABLES IN SCHEMA ice_cream_db_exercise.staging;