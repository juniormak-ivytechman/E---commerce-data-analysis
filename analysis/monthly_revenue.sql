-- MONTHLY REVENUE TREND
-- Tracks revenue and order volume over time

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_payment_value) AS revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;
