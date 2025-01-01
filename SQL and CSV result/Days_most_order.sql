-- Sort of days order with the most orders

SELECT
  DATENAME(WEEKDAY, olist_orders_dataset.order_purchase_timestamp) as day_order,
  COUNT(*) as total_order
FROM olist_orders_dataset
WHERE olist_orders_dataset.order_status = 'delivered'
GROUP BY DATENAME(WEEKDAY, olist_orders_dataset.order_purchase_timestamp)
ORDER BY total_order DESC;