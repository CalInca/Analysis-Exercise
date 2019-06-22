SELECT order_number as Cust_Order,
       strftime('%W', shipment_date) AS Week,
       ROUND(AVG(cast(substr(order_value,2) as decimal)),2) as Avg_Spend
  FROM orders
GROUP BY 1, 2
ORDER BY 2;
