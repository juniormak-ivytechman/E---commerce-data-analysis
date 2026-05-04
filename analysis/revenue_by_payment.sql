-- REVENUE BY PAYMENT METHOD
-- Shows which payment types generate the most revenue

SELECT 
    primary_payment_type,
    SUM(total_payment_value) AS revenue,
    COUNT(order_id) AS total_orders
FROM fact_orders
GROUP BY primary_payment_type
ORDER BY revenue DESC;
