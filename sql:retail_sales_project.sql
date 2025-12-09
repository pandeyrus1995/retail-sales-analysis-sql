-- ---------------------------------------------------------------------------------------------
-- 										RETAIL SALES ANALYSIS PROJECT
-- ----------------------------------------------------------------------------------------------
CREATE DATABASE retail_sales_project;
USE retail_sales_project;

-- Creating a table
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales(
		transactions_id INT PRIMARY KEY,
		sale_date DATE,
		sale_time TIME,
		customer_id INT,
        gender VARCHAR(15),
		age INT,
        category VARCHAR(25),
		quantiy INT,
		price_per_unit FLOAT,
		cogs FLOAT,
		total_sale FLOAT
);

SELECT *
FROM retail_sales;

-- --------------------------------------------------------------------------------
-- DATA CLEANING
-- --------------------------------------------------------------------------------
-- Identifying if we have any NULL VALUES
SELECT *
FROM retail_sales
WHERE
	transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR customer_id IS NULL
	OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL
    ;

-- Deleting the NULL VALUE ROWS
DELETE
FROM retail_sales
WHERE
	transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR customer_id IS NULL
	OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

SELECT COUNT(*)
FROM retail_sales;

-- --------------------------------------------------------------------------------
-- EXPLORATORY DATA ANALYSIS
-- --------------------------------------------------------------------------------
-- 1. How many number of sales do we have?
SELECT COUNT(*)
FROM retail_sales; -- 1997

-- 2. How many unique customers do we have?
SELECT COUNT(DISTINCT(customer_id))
FROM retail_sales; -- 155

-- 3. How many unique category of products do we have?
SELECT COUNT(DISTINCT(category))
FROM retail_sales; -- 3

-- --------------------------------------------------------------------------------
-- SOLVING BUSINESS PROBLEMS/DATA ANALYSIS
-- --------------------------------------------------------------------------------

-- 1. Retrive all columns for sales made on "2022-11-05"
SELECT *
FROM retail_sales
WHERE sale_date = "2022-11-05";

-- 2. Retrive all transactions where the category is "Clothing" and the quantity sold
-- is more than 10 in the month of Nov-2022
SELECT category, 
	SUM(quantiy) AS total_quantity,sale_date
FROM retail_sales
WHERE category = "Clothing"
 AND MONTH(sale_date) = 11
    AND 
    YEAR(sale_date) = 2022
GROUP BY category,sale_date
HAVING total_quantity >= 10;

-- 3. Calculate the total sales (total_sale) for each category
SELECT category,SUM(total_sale) AS total_sales 
FROM retail_sales
GROUP BY category;

-- 4. Find average age of the customers who purchased items from the "Beauty" category
SELECT category, AVG(age)
FROM retail_sales
GROUP BY category
HAVING category = "Beauty";

SELECT category, AVG(age)
FROM retail_sales
WHERE category = "Beauty";

-- 5. Find all transactions where the total_sale is more than 1000
SELECT *
FROM retail_sales
WHERE total_sale >= 1000;

-- 6.Find the total number of transactions (transaction_id) made by each gender in every category
SELECT gender, category,COUNT(transactions_id)
FROM retail_sales
GROUP BY gender,category
ORDER BY category,gender;

-- 7. Calaculate the average sale for each month.Find out best selling month in each year
SELECT * FROM
	(SELECT 
		YEAR(sale_date),
		MONTH(sale_date),
		AVG(total_sale) AS avg_sale,
		RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) as RNK
	FROM retail_sales
	GROUP BY YEAR(sale_date),MONTH(sale_date)
	ORDER BY 1 ,3 DESC) AS t1
WHERE RNK = 1;

-- 8.Find top 5 cstomers based on the highest total sales
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY 2 DESC
LIMIT 5;

-- 9. Find the number of unique customers who purchased items from each category
SELECT category,COUNT(DISTINCT(customer_id))
FROM retail_sales
GROUP BY category;

-- 10. Create each shift and number of orders 
-- (example:morning <=12, afternoon between 12 &17, evening > 17)
SELECT CASE 
	WHEN HOUR(sale_time) < 12 THEN "Morning"
    WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN "Afternoon"
    ELSE "Evening"
END AS shift_name,
COUNT(transactions_id)
FROM retail_sales
GROUP BY shift_name;

























