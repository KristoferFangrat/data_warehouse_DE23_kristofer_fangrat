-- Ice cream analyst
--In the lecture setup_dlt we setup a reader and writer role and also an analyst role for the ice_cream_db.
-- However we never granted any privileges to that role. It needs the following privileges to do its work:

--read data from tables and views in public schema
--use dev_wh
--create views
--create tables
--create temporary tables
--Check that it has the correct grants and future grants.
-- Now assign this role to your user, and do some manual testing to see that it works.
-- Use the SECURITYADMIN role to grant permissions

-- Solution
USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_analyst;

GRANT USAGE ON DATABASE ice_cream_db TO ROLE ice_cream_analyst;

GRANT USAGE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

GRANT CREATE VIEW ON SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

GRANT CREATE TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

GRANT CREATE TEMPORARY TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

SHOW GRANTS TO ROLE ice_cream_analyst;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

GRANT ROLE ice_cream_analyst TO USER kristoferfangrat;

USE ROLE ice_cream_analyst;

USE DATABASE ice_cream_db;

SHOW GRANTS TO ROLE ice_cream_analyst;

GRANT USAGE ON ALL SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_analyst;

GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

SHOW GRANTS TO ROLE ice_cream_analyst;

SELECT CURRENT_ROLE();

SELECT * FROM flavors;

SELECT * FROM customers;

SELECT * FROM transactions;

CREATE TEMPORARY TABLE temp_table AS
SELECT * FROM transactions;

SELECT * FROM temp_table;

CREATE VIEW transactions_view AS
SELECT * FROM transactions;

SELECT * FROM transactions_view;

CREATE TABLE toppings (
    topping_id INT AUTOINCREMENT,
    topping_name STRING,
    price DECIMAL (5, 2),
    PRIMARY KEY (topping_id)
);

SHOW TABLES IN SCHEMA ice_cream_db.public;

INSERT INTO toppings (topping_name, price) VALUES ('Chocolate Chips', 1.50);
INSERT INTO toppings (topping_name, price) VALUES ('Sprinkles', 0.75);
INSERT INTO toppings (topping_name, price) VALUES ('Caramel Syrup', 1.25);
INSERT INTO toppings (topping_name, price) VALUES ('Whipped Cream', 1.00);
INSERT INTO toppings (topping_name, price) VALUES ('Cherry', 0.50);

SELECT * FROM toppings;

CREATE VIEW toppings_view AS
SELECT * FROM toppings;

SELECT * FROM toppings_view;