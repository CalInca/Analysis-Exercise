# SQL MARKDOWN

 - SQLAOV
   - Pulled the Order Number, Week Number from the Shipment Date, and the Average of the Order Value rounded to 2 decimal places from the Orders table
   - Grouped by the Order Number and the Week Number
   - Ordered by the Week Number
 - SQLSALES
   - Pulled the Customer ID, Total Orders Placed, Average Order Value rounded to 2 decimal places from the Orders table
   - Grouped by Customer ID
   - Ordered by Totals Orders Placed
 - SQLRETEN
   - Created 3 Temp Tables
    - Week first order shipped by customer
    - Week each transaction shipped
    - Number of customers by first order week
   - Pulled First Order Week, The Progressive Week, Total Number of Customer from the First Order Week, Total Number of Customers from the Progressive Week, The Retention Rate
   - Joined the temp tables to the orders table
   - Grouped by First Order Week and Progressive Week
   - Ordered by First Order Week and Progressive Week
    
