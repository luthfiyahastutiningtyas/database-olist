-- Find the top 3 customers per year and per month based on total spending

SELECT TOP 3
	MONTH(olist_orders_dataset.order_purchase_timestamp) as month, 
	YEAR(olist_orders_dataset.order_purchase_timestamp) as year,
	olist_orders_dataset.customer_id,
    sum(olist_order_items_dataset.price * olist_order_items_dataset.order_item_id) as total_spending
FROM olist_orders_dataset
INNER JOIN olist_order_items_dataset ON olist_order_items_dataset.order_id = olist_orders_dataset.order_id
WHERE olist_orders_dataset.order_status = 'delivered'
GROUP BY MONTH(olist_orders_dataset.order_purchase_timestamp), YEAR(olist_orders_dataset.order_purchase_timestamp), olist_orders_dataset.customer_id
ORDER BY total_spending DESC;