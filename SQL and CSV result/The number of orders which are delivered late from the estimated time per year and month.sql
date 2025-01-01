-- The number of orders which are delivered late from the estimated time per year and month

SELECT
	MONTH(order_purchase_timestamp) as month, 
	YEAR(order_purchase_timestamp) as year,
    count(*) as late_order
FROM olist_order_items_dataset
INNER JOIN olist_orders_dataset ON olist_order_items_dataset.order_id = olist_orders_dataset.order_id
WHERE olist_orders_dataset.order_status = 'delivered' and olist_orders_dataset.order_delivered_customer_date > olist_orders_dataset.order_estimated_delivery_date
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY year, month;