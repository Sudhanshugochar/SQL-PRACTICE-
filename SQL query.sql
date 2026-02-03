--Data cleaning --

SELECT * FROM retail_sales;


SELECT *
FROM retail_sales
WHERE 
    transactions_id IS NULL
 OR sale_date IS NULL
 OR sale_time IS NULL
 OR gender IS NULL
 OR age IS NULL
 OR category IS NULL
 OR quantity IS NULL
 OR price_per_unit IS NULL
 OR cogs IS NULL
 OR total_sale IS NULL;
--
DELETE FROM retail_sales
WHERE 
    transactions_id IS NULL
 OR sale_date IS NULL
 OR sale_time IS NULL
 OR gender IS NULL
 OR age IS NULL
 OR category IS NULL
 OR quantity IS NULL
 OR price_per_unit IS NULL
 OR cogs IS NULL
 OR total_sale IS NULL;


SELECT COUNT(*) FROM retail_sales;


--Data exploration --

--Diffrent types of category --
SELECT DISTINCT category FROM retail_sales;

--
SELECT 
     category,
	 SUM(total_sale) as a_sale,
	 COUNT(*) as total_orders
FROM retail_sales

GROUP BY 1
	 
----
SELECT * FROM retail_sales;
-- QUERY WHERE CATEGORY IS BEAUTY AND TOTAL SALE >= 100,AGE >=50 GENDER IS FEMALE--
 
SELECT 
     *
FROM retail_sales
WHERE category = 'Beauty'
AND 
   total_sale >='100' 
   AND age >='50' 
   AND gender = 'Female'
--Write sql query to find all transection where the total sales is greater then 100--
Select *
FROM retail_sales
WHERE total_sale > 100  
   --Write sql query to find total number of transection made by each gender in each category--
Select 
     category,
	 gender,
	 COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY
	category,
	gender
ORDER BY 1	

--Write sql query to celebrate the avg sale for each month . Find out best selling month in each year--
SELECT
      EXTRACT(YEAR FROM sale_date) as year,
	   EXTRACT(MONTH FROM sale_date) as month,
	   AVG(total_sale) as avg_sale,
	   RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date)ORDER BY AVG (total_sale)DESC) as rank 
FROM retail_sales
GROUP BY 1,2

--Write sql query to find top 5 customer based on the highest total sales; 

SELECT 
     customer_id,
	 SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5







	 
	 






