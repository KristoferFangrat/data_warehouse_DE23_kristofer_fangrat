SHOW DATABASES;

USE DATABASE CRUNCHBASE_BASIC_COMPANY_DATA;

SHOW SCHEMAS;

USE SCHEMA PUBLIC;

SHOW TABLES;

SHOW VIEWS;

SELECT * FROM ORGANIZATION_SUMMARY LIMIT 10;

SELECT COUNT(*) AS number_rows FROM ORGANIZATION_SUMMARY;

SELECT DISTINCT(TYPE) FROM ORGANIZATION_SUMMARY;
SELECT DISTINCT(STATE_CODE) FROM ORGANIZATION_SUMMARY;
SELECT DISTINCT(ROLES) FROM ORGANIZATION_SUMMARY;
SELECT COUNTRY_CODE, COUNT(COUNTRY_CODE) AS number_organizations
FROM ORGANIZATION_SUMMARY
GROUP BY COUNTRY_CODE
ORDER BY number_organizations DESC;

SELECT
    COUNTRY_CODE,
    COUNT(COUNTRY_CODE) AS number_organizations,
FROM 
    ORGANIZATION_SUMMARY
WHERE 
    COUNTRY_CODE IN ('SWE', 'NOR', 'DMK', 'FIN', 'ISL')
GROUP BY
    COUNTRY_CODE
ORDER BY
    number_organizations DESC;
SELECT
    CITY,
    COUNTRY_CODE,
    COUNT(COUNTRY_CODE) AS number_organizations,
FROM 
    ORGANIZATION_SUMMARY
WHERE 
    COUNTRY_CODE IN ('SWE', 'NOR', 'DMK', 'FIN', 'ISL')
GROUP BY
    CITY, COUNTRY_CODE
ORDER BY
    number_organizations DESC;

SELECT
    CASE
        WHEN CITY IN ('Göteborg', 'Gothenburg') THEN 'Göteborg'
        ELSE CITY
    END AS CITY,
    COUNTRY_CODE,
    COUNT(COUNTRY_CODE) AS number_organizations
FROM
    ORGANIZATION_SUMMARY
WHERE 
    COUNTRY_CODE IN ('SWE', 'NOR', 'DMK', 'FIN', 'ISL')
GROUP BY
    CITY, COUNTRY_CODE
ORDER BY
    number_organizations DESC;

SELECT * FROM ORGANIZATION_SUMMARY;