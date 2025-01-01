-- Top 20 product categories based on total revenue and total order (only for delivered orders)

SELECT TOP 20
	olist_products_dataset.product_category_name as product_category,
    count(olist_order_items_dataset.order_id) as total_orders,
    sum(olist_order_items_dataset.price * olist_order_items_dataset.order_item_id) as total_revenue
FROM olist_order_items_dataset
INNER JOIN olist_products_dataset ON olist_products_dataset.product_id = olist_order_items_dataset.product_id
INNER JOIN olist_orders_dataset ON olist_order_items_dataset.order_id = olist_orders_dataset.order_id
WHERE olist_orders_dataset.order_status = 'delivered'
GROUP BY olist_products_dataset.product_category_name
ORDER BY total_revenue DESC, total_orders DESC;