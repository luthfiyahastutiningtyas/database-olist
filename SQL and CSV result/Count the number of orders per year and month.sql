-- Count the number of orders per year and month

SELECT 
	MONTH(order_purchase_timestamp) as month, 
	YEAR(order_purchase_timestamp) as year,
    count(*) as count_order
FROM olist_orders_dataset
WHERE olist_orders_dataset.order_status = 'delivered'
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY year, month;