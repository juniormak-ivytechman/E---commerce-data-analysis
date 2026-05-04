-- PRODUCT PERFORMANCE ANALYSIS
-- Identifies top performing products by revenue and sales volume

SELECT 
    product_id,
    SUM(price) AS gross_sales,
    SUM(freight_value) AS shipping_cost,
    SUM(total_payment_value) AS revenue,
    COUNT(order_id) AS total_orders
FROM fact_orders
GROUP BY product_id
ORDER BY revenue DESC;
