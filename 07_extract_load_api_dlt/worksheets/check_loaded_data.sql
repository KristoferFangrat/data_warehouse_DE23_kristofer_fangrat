USE ROLE job_ads_dlt_role;
USE DATABASE job_ads;
SHOW SCHEMAS;
USE SCHEMA staging;

SHOW TABLES IN SCHEMA staging;
DESC table staging.data_field_job_ads;
USE WAREHOUSE dev_wh;

SELECT headline, EMPLOYER__WORKPLACE,
FROM staging.data_field_job_ads;

SELECT * FROM staging.data_field_job_ads;