-- DELIVERY PERFORMANCE ANALYSIS
-- Measures how long deliveries take

SELECT 
    order_id,
    DATEDIFF(delivered_date, order_date) AS delivery_days
FROM stg_orders
WHERE delivered_date IS NOT NULL;
