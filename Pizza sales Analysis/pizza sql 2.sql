-- --------KEY PERFORMING INDICATOR (KPI)---------------------------
SELECT *
FROM pizza_sales;

-- -------------------- TOTAL REVENUE -----------------------------------
SELECT SUM(total_price) AS Total_revenue from pizza_sales;

-- -------AVERAGE ORDER VALUE ----------------------------
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_order_value FROM pizza_sales;

-- ------------ TOTAL PIZZA SOLD ----------------
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

-- ------TOTAL ORDER PLACED -----------
SELECT COUNT(DISTINCT order_id) AS Total_order from pizza_sales;

-- ---------- AVERAGE PIZZA PER ORDER ----------------
 SELECT CAST(CAST( SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,5))
 AS Average_pizza_per_order FROM pizza_sales;
 
 
 -- --------------------------------------------------------------------------------------
 -- ------------------ PROBLEM STATEMENT-------------------------------------------------
 
 -- ------------DAILY TREND FOR TOTAL ORDER ---------------------------------
 SELECT DAYNAME (order_date) AS Order_date, COUNT(DISTINCT order_id) AS Total_order
 FROM pizza_sales
 GROUP BY DAYNAME (order_date);
 
 -- ---------MONTHLY TREND FOR TOTAL ORDER ---------------------
 SELECT MONTHNAME(order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_order
 FROM pizza_sales
 GROUP BY  MONTHNAME(order_date) 
 ORDER BY Total_order DESC;
 
 -- ---PERCENTAGE OF SALES BY PIZZA CATEGORY ---------
 SELECT pizza_category,SUM(total_price) AS Total_sales, SUM(total_price)* 100 / (SELECT SUM(total_price) FROM pizza_sales) AS
 PCT_Total_sales
 FROM pizza_sales
 GROUP BY pizza_category;
 -- NOTE To check each month we use the where syntax Example: to check fo January
 SELECT pizza_category,SUM(total_price) AS Total_sales, SUM(total_price)* 100 / (SELECT SUM(total_price) FROM pizza_sales 
 WHERE MONTHNAME(order_date) = 5) AS
 PCT_Total_sales
 FROM pizza_sales
 WHERE MONTHNAME(order_date) = 5
 GROUP BY pizza_category;
 
 
 -- ---- PERCENTAGE OF SALES BY PIZZA SIZE
 SELECT DISTINCT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2))AS Total_sales ,   CAST(SUM(total_price)*100 / 
 (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2))
 AS PCT_of_sales_by_size
 FROM pizza_sales
-- to know the specific sales of the month we use Where
 WHERE dayofyear(order_date)= 4
 GROUP BY pizza_size
 ORDER BY PCT_of_sales_by_size DESC ;
 
 -- --- TOP 5 BEST SELLERS BY REVENUE,TOTAL QUANTITY AND TOTAL ORDER-----------
 SELECT pizza_name, SUM(total_price) AS Total_revenue FROM pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_revenue DESC
 LIMIT 5;
 
 -- --------- BUTTOM WORST SELLERS BY REVENUE,TOTAL QUANTITY AND TOTAL ORDER----
  SELECT pizza_name, SUM(total_price) AS Total_revenue FROM pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_revenue ASC
 LIMIT 5
 
SELECT * FROM pizza_sales