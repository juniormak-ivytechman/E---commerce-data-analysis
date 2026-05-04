-- CUSTOMER SEGMENTATION
-- Classifies customers into repeat vs one-time buyers

SELECT 
    customer_id,
    COUNT(order_id) AS order_count,
    CASE 
        WHEN COUNT(order_id) > 1 THEN 'Repeat Customer'
        ELSE 'One-time Customer'
    END AS customer_segment
FROM fact_orders
GROUP BY customer_id;
