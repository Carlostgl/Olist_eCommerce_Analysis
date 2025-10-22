-- FILE: Q1.3_State_Peak_Performance.SQL
-- Business Question: When does each state achieve its highest revenue?
-- ==============================================
-- Q1.3: State Peak Performance

WITH state_monthly AS (
    SELECT
      c.customer_state AS state,
      DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
      ROUND(SUM(op.payment_value), 0) AS revenue,
      ROW_NUMBER() OVER (
        PARTITION BY c.customer_state
        ORDER BY
          SUM(op.payment_value) DESC
      ) AS rank_in_state
    FROM olist_orders AS o
      JOIN olist_order_payments AS op ON op.order_id = o.order_id
      JOIN olist_customers AS c ON c.customer_id = o.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY
      state,
      month
  )
SELECT
  state as State,
  month AS Best_Month,
  revenue AS Peak_Revenue
FROM state_monthly
WHERE rank_in_state = 1
ORDER BY revenue DESC
LIMIT 10;
-- ==============================================
/* BUSINESS INSIGHTS:
- SP peaked May 2018 ($478K)
- Black Friday 2017 drove peak performance across most regions
*/