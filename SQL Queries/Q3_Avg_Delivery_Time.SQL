-- FILE: Q3_Avg_Delivery_Time.SQL
-- Business Question: How long does delivery take in different states?
-- ==============================================
-- Q3: Avg Delivery Time
SELECT 
    c.customer_state AS State,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date,o.order_purchase_timestamp)),2) AS Avg_Delivery_Time_Days
FROM
    olist_orders AS o
LEFT JOIN
    olist_customers AS c ON o.customer_id = c.customer_id
WHERE
    o.order_status = 'delivered'
GROUP BY State
ORDER BY Avg_Delivery_Time_Days DESC;
-- ==============================================
/* BUSINESS INSIGHTS:
- Massive gap: Northern states 26-29 days vs SP 8.7 days
- 3.4x delivery time difference between best and worst regions
*/