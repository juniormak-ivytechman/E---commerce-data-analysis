-- SELLER EFFICIENCY
-- Average revenue per order per seller

SELECT 
    seller_id,
    SUM(total_payment_value) / COUNT(order_id) AS avg_order_value
FROM fact_orders
GROUP BY seller_id;
