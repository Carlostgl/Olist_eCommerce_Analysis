-- FILE: Q2_Revenue_By_Category.SQL
-- Business Question: Which product categories generate the most revenue?
-- ==============================================
-- Q2: Revenue By Category
SELECT 
    t.product_category_name_english AS Category,
    COUNT(DISTINCT odi.order_id) AS Orders,
    ROUND(SUM(odi.price), 0) AS Revenue,
    ROUND(AVG(odi.price), 2) AS AVG_Price
FROM
    olist_order_items AS odi
LEFT JOIN
    olist_products AS p ON p.product_id = odi.product_id
LEFT JOIN
    olist_orders AS o ON o.order_id = odi.order_id
LEFT JOIN
    product_category_name_translation AS t ON t.product_category_name = p.product_category_name
WHERE
    o.order_status = 'delivered'
GROUP BY t.product_category_name_english
ORDER BY revenue DESC
-- ==============================================
/* BUSINESS INSIGHTS:
- Health Beauty leads at $1.23M, followed by Watches Gifts $1.17M and Bed Bath Table $1M
- Top 5 categories contribute 46% of total revenue, showing category concentration
*/