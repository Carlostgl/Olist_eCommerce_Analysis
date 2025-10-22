-- FILE: Q3.1_Delivery_Accuracy.SQL
-- Business Question: Are we meeting our delivery time promises?
-- ==============================================
-- Q3.1: Delivery Accuracy

SELECT
ROUND(AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)), 2) AS Avg_Actual_Time,
ROUND(AVG(DATEDIFF(order_estimated_delivery_date, order_purchase_timestamp)), 2) AS Avg_Estimated_Time,
ROUND(AVG(DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)), 2) AS Avg_Delivery_Variance_Days
FROM olist_orders
WHERE order_status = 'delivered';
-- ==============================================
/* Business Insights:
- Actual delivery: 12.5 days vs Estimated: 24.4 days
- Consistently delivering 11.9 days earlier than promised
*/