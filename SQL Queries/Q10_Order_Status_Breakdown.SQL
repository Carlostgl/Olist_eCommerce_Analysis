-- FILE: Q10_Order_Status_Breakdown.SQL
-- Business Question: What percentage of orders are successfully delivered?
-- ==============================================
-- Q10: Order Status Breakdown

SELECT
  order_status AS Order_Status,
  COUNT(*) AS Orders_Count,
  CONCAT(ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2),'%') AS Percentage
FROM olist_orders
GROUP BY Order_status
ORDER BY Orders_Count DESC;
-- ==============================================
/* Business Insights:
- 97.02% orders delivered successfully, showing strong operational efficiency
- Cancellation + unavailable: 1.24% combined, minimal failure rate
*/