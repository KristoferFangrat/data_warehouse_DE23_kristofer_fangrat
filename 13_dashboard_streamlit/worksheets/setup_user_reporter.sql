USE ROLE USERADMIN;

CREATE USER IF NOT EXISTS reporter
    PASSWORD = 'reporter_password123'
    LOGIN_NAME = 'reporter'
    DEFAULT_WAREHOUSE = 'DEV_WH'
    DEFAULT_NAMESPACE = 'job_ads.marts'
    COMMENT = 'reporter user for making analysis and BI'
    DEFAULT_ROLE = 'job_ads_reporter_role';