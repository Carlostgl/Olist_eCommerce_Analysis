-- FILE: Q4_High_Value_Customers_AOV_Analysis.SQL
-- Business Question: Who are our highest-spending customers and where are they located?
-- ==============================================
-- Q4: High-Value Customers (AOV Analysis)

WITH order_total AS (
    SELECT
      c.customer_unique_id,
      o.order_id,
      SUM(oi.price) AS order_total,
      c.customer_city,
      c.customer_state
    FROM olist_orders AS o
      LEFT JOIN olist_order_items AS oi ON o.order_id = oi.order_id
      LEFT JOIN olist_customers AS c ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY
      c.customer_unique_id,
      o.order_id,
      c.customer_city,
      c.customer_state
  )
SELECT
  customer_unique_id AS Customer_Unique_ID,
  customer_city AS City,
  customer_state AS State,
  COUNT(order_id) AS Total_Orders,
  ROUND(AVG(order_total), 2) AS AOV
FROM order_total
GROUP BY
  customer_unique_id,
  customer_city,
  customer_state
ORDER BY AOV DESC
Limit 10;
-- ==============================================
/* Business Insights:
- Top 10 customers: AOV ranges $4,400-$13,400, all one-time buyers
- High spenders concentrated in RJ, ES, MS, SP regions
*/