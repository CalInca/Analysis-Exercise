SELECT customer_id AS Customer,
       MAX(order_number) AS Total_Orders,
       ROUND(SUM(CAST (substr(order_value, 2) AS DECIMAL) ), 2) AS Sales
  FROM orders
 GROUP BY 1
 ORDER BY 2;
