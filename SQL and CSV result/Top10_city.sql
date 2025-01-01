-- TOP 10 City with the most customer and order

SELECT TOP 10
  olist_customers_dataset.customer_city as customer_city,
  COUNT(olist_customers_dataset.customer_id) as customer_id,
  COUNT(olist_orders_dataset.order_id) as total_order
FROM olist_orders_dataset
INNER JOIN olist_customers_dataset ON olist_customers_dataset.customer_id = olist_orders_dataset.customer_id
WHERE olist_orders_dataset.order_status = 'delivered'
GROUP BY olist_customers_dataset.customer_city
ORDER BY total_order DESC, customer_id DESC;