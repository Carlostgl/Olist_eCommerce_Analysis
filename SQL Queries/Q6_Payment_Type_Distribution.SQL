-- FILE: Q6_Payment_Type_Distribution.SQL
-- Business Question: How do customers prefer to pay for their orders?
-- ==============================================
-- Q6: Payment Type Distribution

SELECT 
    payment_type AS Payment_Type,
    COUNT(DISTINCT order_id) AS Total_Orders,
    ROUND(SUM(payment_value), 0) AS Total_Revenue,
    ROUND(AVG(payment_value), 2) AS AVG_Revenue,
    ROUND(AVG(payment_installments), 1) AS AVG_Installments
FROM
    olist_order_payments
GROUP BY payment_Type
ORDER BY total_orders DESC
-- ==============================================
/* Business Insights:
- Credit card dominates: 75-77% of orders across all years
- Avg installments declining: 4.4 (2016) → 3.3 (2018), suggesting lower cart values
*/