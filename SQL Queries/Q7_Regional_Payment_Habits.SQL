-- FILE: Q7_Regional_Payment_Habits.SQL
-- Business Question: Do payment preferences vary by state?
-- ==============================================
-- Q7: Regional Payment Habits

 SELECT
  c.customer_state AS State,
  odp.payment_type as Payment_Type,
  COUNT(DISTINCT odp.order_id) AS Total_Orders,
  ROUND(SUM(odp.payment_value), 0) AS Total_Revenue
FROM olist_order_payments as odp
  JOIN olist_orders AS o ON o.order_id = odp.order_id
  JOIN olist_customers AS c ON c.customer_id = o.customer_id
GROUP BY
  State,
  Payment_Type
ORDER BY total_orders DESC
-- ==============================================
/* Business Insights:
- SP leads all payment types: 32K credit card, 8.2K boleto orders
- Credit card dominates every state; boleto remains consistent secondary option
*/