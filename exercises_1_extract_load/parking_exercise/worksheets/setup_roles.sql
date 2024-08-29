USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS parking_dlt_role;

USE ROLE SECURITYADMIN;
GRANT USAGE ON WAREHOUSE parking_wh TO ROLE parking_dlt_role;
GRANT USAGE ON DATABASE parking TO ROLE parking_dlt_role;
GRANT USAGE ON SCHEMA parking.staging TO ROLE parking_dlt_role; 
GRANT USAGE ON SCHEMA parking.staging_mc TO ROLE parking_dlt_role; 

GRANT SELECT ON ALL TABLES IN SCHEMA parking.staging TO ROLE parking_dlt_role;
GRANT SELECT ON ALL TABLES IN SCHEMA parking.staging_mc TO ROLE parking_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA parking.staging TO ROLE parking_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA parking.staging_mc TO ROLE parking_dlt_role;
GRANT CREATE TABLE ON SCHEMA parking.staging TO ROLE parking_dlt_role;
GRANT CREATE TABLE ON SCHEMA parking.staging_mc TO ROLE parking_dlt_role;

-- grant future tables
GRANT SELECT ON FUTURE TABLES IN SCHEMA parking.staging TO ROLE parking_dlt_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA parking.staging_mc TO ROLE parking_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA parking.staging TO ROLE parking_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA parking.staging_mc TO ROLE parking_dlt_role;

GRANT ROLE parking_dlt_role TO USER parking_user;

SHOW GRANTS TO ROLE parking_dlt_role;

SHOW GRANTS TO USER parking_user;

GRANT ROLE parking_dlt_role TO USER parking_user;
GRANT ROLE parking_dlt_role TO USER kristoferfangrat;
