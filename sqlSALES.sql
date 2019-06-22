SELECT customer_id as Customer,
        MAX(order_number) as Total_Orders,
        ROUND(SUM(cast(substr(order_value,2) as decimal)),2) as Sales
  FROM orders
GROUP BY customer_id
ORDER BY MAX(order_number);
