-- FILE: Q9_Review_Score_Distribution.SQL
-- Business Question: How satisfied are our customers based on their ratings?
-- ==============================================
-- Q9: Order Status Breakdown

SELECT
  odr.review_score AS Review_Score,
  COUNT(*) AS Reviews_Count,
  CONCAT(ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2), '%') AS Percentage
FROM olist_orders AS o
JOIN olist_order_reviews AS odr ON o.order_id = odr.order_id
WHERE o.order_status = 'delivered'
GROUP BY odr.review_score
ORDER BY odr.review_score DESC;
-- ==============================================
/* Business Insights:
- 5-star reviews: 59.22%, showing strong satisfaction base
- 1-star reviews: 9.76%, representing significant dissatisfied segment needing attention
*/