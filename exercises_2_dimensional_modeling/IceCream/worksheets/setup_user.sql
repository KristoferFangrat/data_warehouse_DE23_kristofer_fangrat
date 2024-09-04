-- Also create suitable roles and users for loading and transforming data.

USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS ice_cream_dlt_role;

CREATE USER IF NOT EXISTS ice_cream_loader
    PASSWORD = 'ice_cream_loader_password123'
    DEFAULT_WAREHOUSE = dev_wh;

USE ROLE SECURITYADMIN;
GRANT ROLE ice_cream_dlt_role TO USER ice_cream_loader;
GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_dlt_role;
GRANT USAGE ON DATABASE ice_cream_db_exercise TO ROLE ice_cream_dlt_role;
GRANT USAGE ON SCHEMA ice_cream_db_exercise.staging TO ROLE ice_cream_dlt_role;
GRANT USAGE ON SCHEMA ice_cream_db_exercise.warehouse TO ROLE ice_cream_dlt_role;

GRANT CREATE TABLE ON SCHEMA ice_cream_db_exercise.staging TO ROLE ice_cream_dlt_role;
GRANT CREATE TABLE ON SCHEMA ice_cream_db_exercise.warehouse TO ROLE ice_cream_dlt_role;
GRANT INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA ice_cream_db_exercise.staging TO ROLE ice_cream_dlt_role;

GRANT INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA ice_cream_db_exercise.staging TO ROLE ice_cream_dlt_role;

GRANT INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA ice_cream_db_exercise.warehouse TO ROLE ice_cream_dlt_role;

GRANT INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA ice_cream_db_exercise.warehouse TO ROLE ice_cream_dlt_role;

-- check grants
SHOW GRANTS ON SCHEMA ice_cream_db_exercise.staging;
SHOW FUTURE GRANTS IN SCHEMA ice_cream_db_exercise.staging;

SHOW GRANTS ON SCHEMA ice_cream_db_exercise.warehouse;
SHOW FUTURE GRANTS IN SCHEMA ice_cream_db_exercise.warehouse;

SHOW GRANTS TO ROLE ice_cream_dlt_role;
SHOW GRANTS TO ROLE ice_cream_loader;
