-- TOP PRODUCTS BY REVENUE
-- Ranks products by total revenue

SELECT 
    product_id,
    SUM(total_payment_value) AS revenue,
    COUNT(order_id) AS sales_count
FROM fact_orders
GROUP BY product_id
ORDER BY revenue DESC;
