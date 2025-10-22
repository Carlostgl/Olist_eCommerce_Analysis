-- FILE: Q1.2_Revenue_By_State.SQL
-- Business Question: Which states are our top revenue contributors?
-- ==============================================
-- Q1.2: Revenue By State

SELECT 
    c.customer_state AS State,
    COUNT(DISTINCT o.order_id) AS Total_Orders,
    ROUND(SUM(op.payment_value), 0) AS Total_Revenue
FROM
    olist_orders AS o
LEFT JOIN
    olist_order_payments AS op ON op.order_id = o.order_id
LEFT JOIN
    olist_customers AS c ON c.customer_id = o.customer_id
WHERE
    o.order_status = 'delivered'
GROUP BY State
ORDER BY Total_Revenue DESC
-- ==============================================
/* BUSINESS INSIGHTS:
- São Paulo (SP) and Rio de Janeiro (RJ) dominate revenue annually, 
- consistently accounting for over 30% of total revenue.
*/