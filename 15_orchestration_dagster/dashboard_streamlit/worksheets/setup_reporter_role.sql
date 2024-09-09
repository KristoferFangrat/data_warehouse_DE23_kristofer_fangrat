USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS job_ads_reporter_role;

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE DEV_WH TO ROLE job_ads_reporter_role;

GRANT USAGE ON DATABASE job_ads TO ROLE job_ads_reporter_role;
GRANT USAGE ON SCHEMA job_ads.marts TO ROLE job_ads_reporter_role;
GRANT SELECT ON ALL TABLES IN SCHEMA job_ads.marts TO ROLE job_ads_reporter_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA job_ads.marts TO ROLE job_ads_reporter_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA job_ads.marts TO ROLE job_ads_reporter_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads.marts TO ROLE job_ads_reporter_role;

GRANT ROLE job_ads_reporter_role TO USER reporter;
GRANT ROLE job_ads_reporter_role TO USER kristoferfangrat;

USE ROLE job_ads_reporter_role;

SHOW GRANTS TO ROLE job_ads_reporter_role;

-- test querying a mart
USE WAREHOUSE DEV_WH;
SELECT * FROM job_ads.marts.mart_job_listings;