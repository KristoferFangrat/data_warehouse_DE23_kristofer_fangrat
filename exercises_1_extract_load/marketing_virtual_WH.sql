-- a) Create a marketing virtual warehouse called marketing_wh with size xs,
-- 1 min suspend time, it should autoresume, suspend initially and give it a suitable comment.
USE ROLE SYSADMIN;

CREATE WAREHOUSE IF NOT EXISTS marketing_wh
    WITH WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Marketing virtual warehouse';

--b) Now create a database called ifood, and add a staging layer by creating a schema called staging.

CREATE DATABASE IF NOT EXISTS ifood;
CREATE SCHEMA IF NOT EXISTS ifood.staging;

--c) Create a user called extract_loader and setup its credentials.

USE ROLE USERADMIN;

CREATE USER IF NOT EXISTS extract_loader
    PASSWORD = 'extract_loader_password123'
    DEFAULT_WAREHOUSE = marketing_wh;

-- d) Create a role marketing_dlt_role and grant it access to staging.

USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS marketing_dlt_role;

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE marketing_wh TO ROLE marketing_dlt_role;
GRANT USAGE ON DATABASE ifood TO ROLE marketing_dlt_role;
GRANT USAGE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT CREATE TABLE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;

--e) Assign marketing_dlt_role to extract_loader user.

USE ROLE USERADMIN;

GRANT ROLE marketing_dlt_role TO USER extract_loader;
--f) Grant the following privileges to marketing_dlt_role:
-- - USAGE on marketing_wh
GRANT USAGE ON WAREHOUSE marketing_wh TO ROLE marketing_dlt_role;



-- - USAGE on ifood

GRANT USAGE ON DATABASE ifood TO ROLE marketing_dlt_role;

-- - USAGE on staging

GRANT USAGE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;
-- - CREATE TABLE on staging

GRANT CREATE TABLE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;
-- - SELECT, INSERT, UPDATE, DELETE on all tables in staging

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;
-- - SELECT, INSERT, UPDATE, DELETE on future tables in staging

GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;
--g) Check the grants for marketing_dlt_role.


--h) Check the grants for extract_loader user.



--i) Grant the role marketing_dlt_role to your user.

GRANT ROLE marketing_dlt_role TO USER kristoferfangrat;
--j) Switch to the marketing_dlt_role and check the grants.

USE ROLE marketing_dlt_role;