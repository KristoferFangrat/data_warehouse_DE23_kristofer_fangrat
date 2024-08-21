SHOW DATABASES;

USE DATABASE GOOGLE_KEYWORDS_SEARCH_DATASET__DISCOVER_ALL_SEARCHES_ON_GOOGLE;
-- a) Use this database and find out the underlying schemas, tables and views to get an overview of its logical structure.
SHOW SCHEMAS;
SHOW TABLES;
SHOW VIEWS;

USE SCHEMA DATAFEEDS;
-- b) Find out the columns and its data types in the table GOOGLE_KEYWORDS.
DESCRIBE TABLE GOOGLE_KEYWORDS;
SELECT * FROM GOOGLE_KEYWORDS LIMIT 1000;
SELECT COUNT(KEYWORD) FROM GOOGLE_KEYWORDS;
SELECT COUNTRY, COUNT(COUNTRY) AS number_countries
FROM GOOGLE_KEYWORDS
GROUP BY COUNTRY
ORDER BY number_countries DESC;

SELECT KEYWORD, COUNT(KEYWORD) AS number_keywords
FROM GOOGLE_KEYWORDS
GROUP BY KEYWORD
ORDER BY number_keywords DESC;
SELECT SITE, COUNT(SITE) AS number_sites
FROM GOOGLE_KEYWORDS
WHERE SITE IN ('youtube.com')
GROUP BY SITE
ORDER BY number_sites DESC;

-- c) Find out number of rows in the dataset.
SELECT COUNT(*) AS number_rows FROM GOOGLE_KEYWORDS;
-- 35046855
-- d) When is the first search and when is the latest search in the dataset?
SELECT DISTINCT DATE
FROM GOOGLE_KEYWORDS
WHERE DATE = (SELECT MIN(DATE)
FROM GOOGLE_KEYWORDS);
-- DATE = 2022-06-01
SELECT DISTINCT(DATE)
FROM GOOGLE_KEYWORDS
WHERE DATE = (SELECT MAX(DATE)
FROM GOOGLE_KEYWORDS);
-- DATE = 2022-06-30

-- e) Which are the 10 most popular keywords?
SELECT KEYWORD, COUNT(KEYWORD) AS number_keywords
FROM GOOGLE_KEYWORDS
GROUP BY KEYWORD
ORDER BY number_keywords DESC
LIMIT 10;


-- f) How many unique keywords are there?

SELECT COUNT(DISTINCT(KEYWORD)) AS number_unique_keywords
FROM GOOGLE_KEYWORDS; -- 7263686

-- g) Check what type of platforms are used and how many users per platform
SELECT PLATFORM, COUNT(PLATFORM) AS number_users
FROM GOOGLE_KEYWORDS
GROUP BY PLATFORM
ORDER BY number_users DESC; --how many users per platform = 35046855

-- h) Let's dive into what swedish people are searching. 
--Find the 20 most popular keywords and the number of searches of that keyword.
SELECT KEYWORD, COUNT(KEYWORD) AS number_keywords
FROM GOOGLE_KEYWORDS
WHERE COUNTRY IN ('752')
GROUP BY KEYWORD
ORDER BY number_keywords DESC
LIMIT 20;
--i) Lets see how popular spotify is around the world.
--List the top 10 number countries and the number of searches for spotify. 
--For now it's okay to list the country codes, 
--later we'll join this with the actual country to get more useful information to the stakeholders.

SELECT COUNTRY, COUNT(COUNTRY) AS number_searches
FROM GOOGLE_KEYWORDS
WHERE KEYWORD IN ('spotify')
GROUP BY COUNTRY
ORDER BY number_searches DESC
LIMIT 10;

--Join the actualy country to get more useful information to the stakeholders.
SELECT
    COUNTRY,
    KEYWORD,
    COUNT(COUNTRY) AS number_searches,
    CASE
        WHEN COUNTRY = '36' THEN 'Australia'
        WHEN COUNTRY = '56' THEN 'Belgium'
        WHEN COUNTRY = '76' THEN 'Brazil'
        WHEN COUNTRY = '124' THEN 'Canada'
        WHEN COUNTRY = '250' THEN 'France'
        WHEN COUNTRY = '276' THEN 'Germany'
        WHEN COUNTRY = '356' THEN 'India'
        WHEN COUNTRY = '392' THEN 'Japan'
        WHEN COUNTRY = '826' THEN 'United Kingdom'
        WHEN COUNTRY = '840' THEN 'United States'
        ELSE 'Other'
    END AS COUNTRY_NAME
FROM
    GOOGLE_KEYWORDS
WHERE
    KEYWORD = 'spotify'
GROUP BY
    COUNTRY,
    KEYWORD
ORDER BY
    number_searches DESC
LIMIT 10;

-- j) Feel free to do additional explorations of this dataset.
SELECT KEYWORD, COUNT(KEYWORD) AS number_keywords
FROM GOOGLE_KEYWORDS
WHERE COUNTRY IN ('752')
GROUP BY KEYWORD
ORDER BY number_keywords DESC
LIMIT 5;
-- j) Feel free to do additional explorations of this dataset.
SELECT
    KEYWORD,
    COUNT(KEYWORD) AS number_keywords
FROM
    GOOGLE_KEYWORDS
GROUP BY
    KEYWORD
HAVING 
    COUNT(KEYWORD) > 15000
ORDER BY
    number_keywords DESC;

-- j) Feel free to do additional explorations of this dataset.
SELECT
    DISTINCT(COUNTRY),
    COUNT(CALIBRATED_CLICKS) AS number_clicks
FROM
    GOOGLE_KEYWORDS
GROUP BY
    COUNTRY
ORDER BY
    number_clicks DESC
LIMIT 10;