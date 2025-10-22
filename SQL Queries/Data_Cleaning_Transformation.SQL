-- FILE: Data_Cleaning_Transformation.SQL
-- ==============================================
-- DATA CLEANING & TYPE CONVERSION
-- Purpose: Convert TEXT columns to proper DATETIME/INT/DOUBLE types
-- Tables affected: olist_orders, olist_products, olist_order_reviews
-- ==============================================

-- STEP 1: olist_orders - Convert TEXT to DATETIME
-- ==============================================
-- Add New Columns
ALTER TABLE olist_orders  
ADD COLUMN order_purchase_timestamp_new DATETIME,
ADD COLUMN order_approved_at_new DATETIME,
ADD COLUMN order_delivered_carrier_date_new DATETIME,
ADD COLUMN order_delivered_customer_date_new DATETIME,
ADD COLUMN order_estimated_delivery_date_new DATETIME;
-- Convert type new columns
UPDATE olist_orders
SET
		order_purchase_timestamp_new = STR_TO_DATE(NULLIF(order_purchase_timestamp, ''), '%Y-%m-%d %H:%i:%S'),
		order_approved_at_new = STR_TO_DATE(NULLIF(order_approved_at, ''), '%Y-%m-%d %H:%i:%S'),
		order_delivered_carrier_date_new = STR_TO_DATE(NULLIF(order_delivered_carrier_date, ''), '%Y-%m-%d %H:%i:%S'),
		order_delivered_customer_date_new = STR_TO_DATE(NULLIF(order_delivered_customer_date, ''), '%Y-%m-%d %H:%i:%S'),
		order_estimated_delivery_date_new = STR_TO_DATE(NULLIF(order_estimated_delivery_date, ''), '%Y-%m-%d %H:%i:%S');
-- ==============================================
-- STEP 2: olist_products - Convert TEXT to INT/DOUBLE
-- ==============================================
-- Add New Columns
ALTER TABLE olist_products
ADD COLUMN product_name_lenght_new INT,
ADD COLUMN product_description_lenght_new INT,
ADD COLUMN product_photos_qty_new INT,
ADD COLUMN product_weight_g_new DOUBLE,
ADD COLUMN product_length_cm_new DOUBLE,
ADD COLUMN product_height_cm_new DOUBLE,
ADD COLUMN product_width_cm_new DOUBLE;
-- Convert type new columns
UPDATE olist_products
SET
    product_name_lenght_new = CAST(NULLIF(product_name_lenght, '') AS UNSIGNED),
    product_description_lenght_new = CAST(NULLIF(product_description_lenght, '') AS UNSIGNED),
    product_photos_qty_new = CAST(NULLIF(product_photos_qty, '') AS UNSIGNED),
    product_weight_g_new = CAST(NULLIF(product_weight_g, '') AS DOUBLE),
    product_length_cm_new = CAST(NULLIF(product_length_cm, '') AS DOUBLE),
    product_height_cm_new = CAST(NULLIF(product_height_cm, '') AS DOUBLE),
    product_width_cm_new = CAST(NULLIF(product_width_cm, '') AS DOUBLE);
-- ============================================== 
-- STEP 3: olist_order_reviews - Convert TEXT to proper types
-- ==============================================
-- Add New Columns
ALTER TABLE olist_order_reviews
ADD COLUMN review_score_new TINYINT UNSIGNED,
ADD COLUMN review_comment_title_new TEXT, 
ADD COLUMN review_comment_message_new TEXT, 
ADD COLUMN review_creation_date_new DATETIME,
ADD COLUMN review_answer_timestamp_new DATETIME;
-- Convert type new columns
UPDATE olist_order_reviews
SET 
	 	review_score_new = CAST(NULLIF(review_score, '') AS SIGNED), 
		review_comment_title_new = NULLIF(review_comment_title, ''), 
	  review_comment_message_new = NULLIF(review_comment_message, ''),
	  review_creation_date_new = STR_TO_DATE(NULLIF(review_creation_date, ''), '%Y-%m-%d %H:%i:%s'),
	  review_answer_timestamp_new = STR_TO_DATE(NULLIF(review_answer_timestamp, ''), '%Y-%m-%d %H:%i:%s');