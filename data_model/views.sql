-- REVENUE BY MONTH
CREATE VIEW v_monthly_revenue AS
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_payment_value) AS revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_orders
GROUP BY month
ORDER BY month;

-- TOP PRODUCTS
CREATE VIEW v_top_products AS
SELECT 
    product_id,
    SUM(total_payment_value) AS revenue,
    COUNT(order_id) AS sales_count
FROM fact_orders
GROUP BY product_id
ORDER BY revenue DESC;

-- SELLER PERFORMANCE
CREATE VIEW v_seller_performance AS
SELECT 
    seller_id,
    SUM(total_payment_value) AS revenue,
    COUNT(order_id) AS orders_handled
FROM fact_orders
GROUP BY seller_id
ORDER BY revenue DESC;

-- PAYMENT ANALYSIS
CREATE VIEW v_revenue_by_payment AS
SELECT 
    primary_payment_type,
    SUM(total_payment_value) AS revenue,
    COUNT(order_id) AS orders
FROM fact_orders
GROUP BY primary_payment_type;

-- CUSTOMER SEGMENTATION
CREATE VIEW v_customer_segments AS
SELECT 
    customer_id,
    COUNT(order_id) AS order_count,
    CASE 
        WHEN COUNT(order_id) > 1 THEN 'Repeat'
        ELSE 'One-time'
    END AS customer_type
FROM fact_orders
GROUP BY customer_id;

-- DELIVERY PERFORMANCE
CREATE VIEW v_delivery_performance AS
SELECT 
    order_id,
    DATEDIFF(delivered_date, order_date) AS delivery_days
FROM stg_orders
WHERE delivered_date IS NOT NULL;

-- DELIVERY DELAYS
CREATE VIEW v_delivery_delay AS
SELECT 
    order_id,
    DATEDIFF(delivered_date, estimated_delivery_date) AS delay_days
FROM stg_orders
WHERE delivered_date IS NOT NULL;
