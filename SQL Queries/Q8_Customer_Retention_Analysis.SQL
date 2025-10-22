-- FILE: Q8_Customer_Retention_Analysis.SQL
-- Business Question: Are customers coming back to buy again?
-- ==============================================
-- Q8: Customer Retention Analysis

WITH customer_behavior AS (
    SELECT
      c.customer_unique_id,
      COUNT(DISTINCT o.order_id) AS total_orders,
      AVG(r.review_score) AS avg_review,
      AVG(
        DATEDIFF(
          o.order_delivered_customer_date,
          o.order_purchase_timestamp
        )
      ) AS avg_delivery_days
    FROM olist_orders o
      LEFT JOIN olist_customers c ON o.customer_id = c.customer_id
      LEFT JOIN olist_order_reviews r ON o.order_id = r.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
  )
SELECT
  CASE
    WHEN total_orders = 1 THEN 'One-time'
    ELSE 'Repeat'
  END AS Purchase_Frequency,
  COUNT(*) AS Customer_Count,
  ROUND(AVG(avg_review), 2) AS Avg_Satisfaction_Score,
  ROUND(AVG(avg_delivery_days), 1) AS AVG_Delivery_Days
FROM customer_behavior
GROUP BY Purchase_Frequency;
-- ==============================================
/* Business Insights:
- One-time buyers: 97-99% annually, repeat rate critically low at 1-3%
- Repeat customers show marginally higher satisfaction (4.17-4.20 vs 4.01-4.17)
*/