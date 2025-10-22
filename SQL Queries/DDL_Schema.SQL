-- FILE: DDL_Schema.SQL
-- ==============================================
-- DATABASE SCHEMA CREATION
-- Purpose: Create all tables for Brazilian E-Commerce dataset
-- ==============================================
-- Create Table For olist_customers
CREATE TABLE olist_customers (
customer_id VARCHAR(50),
customer_unique_id VARCHAR(50),
customer_zip_code_prefix INT,
customer_city VARCHAR(50),
customer_state VARCHAR(2)
);
-- ==============================================
-- Create Table For olist_order_items
CREATE TABLE olist_order_items (
order_id VARCHAR (50),
order_item_id INT,
product_id VARCHAR (50),
seller_id VARCHAR (50),
shipping_limit_date DATETIME,
price DOUBLE,
freight_value DOUBLE
);
-- ==============================================
-- Create Table For olist_order_payments
CREATE TABLE olist_order_payments (
order_id VARCHAR(50),
payment_sequential TINYINT UNSIGNED,
payment_type VARCHAR(12),
payment_installments TINYINT UNSIGNED, 
payment_value DECIMAL (10,2)
);
-- ==============================================
-- Create Table For olist_order_reviews
CREATE TABLE olist_order_reviews (
review_id VARCHAR (50),
order_id VARCHAR (50),
review_score varchar(2), 
review_comment_title varchar(50),
review_comment_message varchar(225),
review_creation_date varchar(50),
review_answer_timestamp varchar(50)
);
-- ==============================================
-- Create Table For olist_orders
CREATE TABLE olist_orders (
order_id VARCHAR(50),
customer_id VARCHAR(50),
order_status VARCHAR(20),
order_purchase_timestamp TEXT,
order_approved_at TEXT,
order_delivered_carrier_date TEXT,
order_delivered_customer_date TEXT,
order_estimated_delivery_date TEXT 
);
-- ==============================================
-- Create Table For olist_products
CREATE TABLE olist_products (
product_id	VARCHAR(50) NOT NULL,
product_category_name	VARCHAR(100) NULL,
product_name_lenght	varchar(50) NULL,
product_description_lenght varchar(1000) NULL,
product_photos_qty	varchar(10) NULL, 
product_weight_g	varchar(20) NULL, 
product_length_cm	varchar(20) NULL,
product_height_cm	varchar(20) NULL,
product_width_cm	varchar(20) NULL
);
-- ==============================================
-- Create Table For product_category_name_translation
CREATE TABLE product_category_name_translation (
product_category_name VARCHAR(50),
product_category_name_english VARCHAR(50)
);