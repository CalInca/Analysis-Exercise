SELECT order_number as Cust_Order,
       strftime('%W', shipment_date) AS Week,
       COUNT(*) as Cust_Count,
       ROUND(AVG(cast(substr(order_value,2) as decimal)),2) as Avg_Spend
  FROM orders
GROUP BY order_number, strftime('%W', shipment_date)
ORDER BY strftime('%W', shipment_date);
