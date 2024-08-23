-- a) You have a simple workload that runs daily in Snowflake. The workload uses 0.5 credits per day. Calculate the total credit usage and cost for a 30-day month.
-- SVAR: Average daily cost: 1.33$ Total cost: 40$ -- 1.33*30 = 40 40*0.5 = 20, 0.37 * 30 = 11.1
SELECT 0.5*30 AS total_credit_usage, 3.90*15 AS total_cost;
-- TOTAL_CREDIT_USAGE = 15, TOTAL_COST = 58.5
-- b) Your workload varies throughout the month. For the first 10 days, you use 2 credits per day. 
-- For the next 10 days, you use 1.5 credits per day, and for the last 10 days, you use 1 credit per day. 
-- Calculate the total credit usage and cost for a 30-day month.
-- SVAR: Total credit usage: 45, total cost: 175.5 -- 2*10 + 1.5*10 + 1*10 = 45, 45*3.9 = 175.5
SELECT 2*10 + 1.5*10 + 1*10 AS total_credit_usage, 3.9*(2*10 + 1.5*10 + 1*10) AS total_cost;
-- SVAR: TOTAL_CREDIT_USAGE = 45, TOTAL_COST = 175.5


-- c) You have three different warehouses running workloads simultaneously. Warehouse A is of size XS, Warehouse B is of size S, and Warehouse C is of size M.
-- Warehouse A is used for 10h/day, B is used for 2h/day and C is used for 1h/day.
-- Calculate the total monthly cost assuming each warehouse runs for the full 30-day month.
-- XS = 0.5 credits/hour, S = 1 credit/hour, M = 2 credits/hour
-- SVAR: Total cost: 1170 -- 0.5*10*30 + 1*2*30 + 2*1*30 = 1170
-- On Demand credit pricing 3.9$ per credit
SELECT 1*10*30 AS total_cost_warehouse_A;
SELECT 2*2*30 AS total_cost_warehouse_B;
SELECT 4*1*30 AS total_cost_warehouse_C;
-- TOTAL_COST_WAREHOUSE_A = 150, TOTAL_COST_WAREHOUSE_B = 60, TOTAL_COST_WAREHOUSE_C = 60

SELECT 3.90*(1*10*30 + 2*2*30 + 4*1*30) AS total_cost;
-- TOTAL_COST = 2106

-- Första 10 dagarna: 2 kluster, 10 timmar per dag
SELECT 2 * 3.9 * 10 * 10 AS total_cost_first_10_days;
-- RESULTAT: TOTAL_COST_FIRST_10_DAYS = 780

-- Nästa 10 dagarna: 3 kluster, 10 timmar per dag
SELECT 3 * 3.9 * 10 * 10 AS total_cost_next_10_days;
-- RESULTAT: TOTAL_COST_NEXT_10_DAYS = 1170

-- Sista 10 dagarna: 4 kluster, 10 timmar per dag
SELECT 4 * 3.9 * 10 * 10 AS total_cost_last_10_days;
-- RESULTAT: TOTAL_COST_LAST_10_DAYS = 1560

-- Beräkna den totala månadskostnaden
SELECT 3.9 * (2 * 10 * 10 + 3 * 10 * 10 + 4 * 10 * 10) AS total_monthly_cost;
-- RESULTAT: TOTAL_MONTHLY_COST = 3510
