-- a) Setup a database called ice_cream, a staging schema and a warehouse schema.
-- Also create suitable roles and users for loading and transforming data.

USE ROLE sysadmin;

CREATE DATABASE IF NOT EXISTS ice_cream_db_exercise;

USE WAREHOUSE dev_wh;

CREATE SCHEMA IF NOT EXISTS ice_cream_db_exercise.staging;

USE SCHEMA staging;

-- b) Use dlt to load the data into snowflake.