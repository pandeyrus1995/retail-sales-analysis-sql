# Retail Sales Analysis using SQL

## 📌 Project Overview
This project performs an end-to-end analysis of retail sales data using **MySQL**.
The objective is to clean the data, explore key patterns, and answer practical
business questions using SQL.

This project focuses on applying SQL concepts to real-world scenarios such as
customer behavior, sales trends, and time-based analysis.

> **Note:** This project was created with guidance from an online tutorial (YouTube) for learning purposes.  
> All SQL queries were written, executed, and understood independently as hands-on practice.

---

## 📂 Dataset Description
The dataset contains transactional retail sales data with the following columns:

- transaction_id  
- sale_date  
- sale_time  
- customer_id  
- gender  
- age  
- category  
- quantity  
- price_per_unit  
- cogs  
- total_sale  

The raw dataset is included in the `data/` folder of this repository.

---

## 🧹 Data Cleaning
The following data-cleaning steps were performed using SQL:
- Identified NULL values across all columns
- Removed rows containing missing values to ensure consistency and accuracy
- Verified record counts after cleaning

---

## 📊 Exploratory Data Analysis (EDA)
Initial analysis was performed to understand the dataset structure and key metrics:
- Total number of sales transactions
- Number of unique customers
- Number of unique product categories

---

## 💼 Business Questions Answered
This project answers the following business-driven questions:

1. Retrieve all sales made on a specific date  
2. Identify Clothing category transactions with high quantity sold in November 2022  
3. Calculate total sales for each product category  
4. Find the average age of customers purchasing from the Beauty category  
5. Retrieve all transactions with total sales greater than 1000  
6. Analyze the number of transactions by gender and category  
7. Identify the **best-selling month in each year** using window functions  
8. Find the top 5 customers based on total sales  
9. Determine the number of unique customers per category  
10. Analyze order distribution by time of day (Morning / Afternoon / Evening)  

---

## 🛠️ Tools & Concepts Used
- MySQL
- SQL Aggregations (`SUM`, `AVG`, `COUNT`)
- `GROUP BY` and `HAVING`
- `CASE` statements
- Date & time functions
- Subqueries
- Window functions (`RANK()`)

---

## ✅ Key Learnings
- Writing clean and readable SQL queries
- Applying SQL to real business scenarios
- Understanding execution order in SQL
- Using window functions for ranking and trend analysis
- Structuring SQL projects for portfolio presentation

---

## 📁 Project Structure
```text
retail-sales-analysis-sql/
├── data/
│   └── retail_sales_analysis_raw.csv
├── sql/
│   └── retail_sales_project.sql
└── README.md

