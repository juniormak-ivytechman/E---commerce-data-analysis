-- SELLER PERFORMANCE ANALYSIS
-- Tracks seller revenue and order volume

SELECT 
    seller_id,
    SUM(total_payment_value) AS revenue,
    COUNT(order_id) AS orders_handled
FROM fact_orders
GROUP BY seller_id
ORDER BY revenue DESC;
