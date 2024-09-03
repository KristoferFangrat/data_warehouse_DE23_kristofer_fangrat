USE ROLE useradmin;

CREATE ROLE IF NOT EXISTS ice_cream_dlt_role;

CREATE USER IF NOT EXISTS ice_cream_loader
    PASSWORD = 'ice_cream_loader_password123'
    DEFAULT_WAREHOUSE = dev_wh;