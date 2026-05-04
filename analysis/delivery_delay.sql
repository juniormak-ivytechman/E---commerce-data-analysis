-- DELIVERY DELAY ANALYSIS
-- Measures delays vs expected delivery date

SELECT 
    order_id,
    DATEDIFF(delivered_date, estimated_delivery_date) AS delay_days
FROM stg_orders
WHERE delivered_date IS NOT NULL;
