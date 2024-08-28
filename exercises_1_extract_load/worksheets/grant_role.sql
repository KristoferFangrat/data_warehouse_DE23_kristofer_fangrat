USE ROLE SECURITYADMIN;

-- Grant usage on warehouse
GRANT USAGE ON WAREHOUSE marketing_wh TO ROLE marketing_dlt_role;

-- Grant usage on database
GRANT USAGE ON DATABASE ifood TO ROLE marketing_dlt_role;

-- Grant usage on schema
GRANT USAGE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;

GRANT SELECT ON ALL TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;

-- Grant create table on schema
GRANT CREATE TABLE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;

-- Grant DML operations on all tables in schema
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;

-- Grant DML operations on future tables in schema
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;

USE ROLE SECURITYADMIN;

-- Grant role to user
GRANT ROLE marketing_dlt_role TO USER extract_loader;

USE ROLE marketing_dlt_role;

SHOW GRANTS TO ROLE marketing_dlt_role;
SHOW GRANTS TO USER extract_loader;

SHOW GRANTS ON SCHEMA ifood.staging;
SHOW GRANTS ON WAREHOUSE marketing_wh;
SHOW GRANTS ON DATABASE ifood;