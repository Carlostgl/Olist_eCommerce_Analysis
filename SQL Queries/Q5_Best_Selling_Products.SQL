-- FILE: Q5_Best_Selling_Products.SQL
-- Business Question: What are our most popular products by quantity sold?
-- ==============================================
-- Q5: Best-Selling Products

SELECT 
    t.product_category_name_english AS Categories,
    p.product_id AS Product_ID,
    ROUND(AVG(odi.price), 2) AS AVG_Item_Price,
    COUNT(odi.order_item_id) AS Total_Quantity_Bought
FROM
    olist_order_items AS odi
LEFT JOIN
    olist_products AS p ON p.product_id = odi.product_id
LEFT JOIN
    product_category_name_translation AS t ON t.product_category_name = p.product_category_name
GROUP BY t.product_category_name_english , p.product_id
HAVING COUNT(odi.order_item_id) >= 20
ORDER BY total_quantity_bought DESC
LIMIT 10;
-- ==============================================
/* Business Insights:
- Top seller: Furniture Decor with 527 units at $71.36 avg price
- Best sellers concentrated in home categories: Furniture, Bed Bath, Garden Tools
*/