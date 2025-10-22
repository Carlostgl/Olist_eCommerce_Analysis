-- FILE: Q1_Overall_Metric.SQL
-- Business Question: What is the overall business performance across 2016-2018?
-- ==============================================
-- Q1: Overall Metric

SELECT 
    COUNT(DISTINCT o.order_id) AS Total_Orders,
    COUNT(DISTINCT c.customer_unique_id) AS Total_Unique_Customers,
    ROUND(SUM(oi.price), 0) AS Total_Revenue,
    ROUND(AVG(oi.price), 2) AS AVG_Item_Price
FROM
    olist_orders AS o
JOIN
    olist_order_items AS oi ON o.order_id = oi.order_id
JOIN
    olist_customers AS c ON o.customer_id = c.customer_id
WHERE
    o.order_status = 'delivered'
-- ==============================================
/* BUSINESS INSIGHTS:
- Total: 96K orders, 93K unique customers, $13.2M revenue across 2016-2018
- Avg item price: $119.98, showing mid-range product focus
*/