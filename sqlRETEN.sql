WITH cohort_week as (
        SELECT customer_id,
                strftime('%W',shipment_date) as first_week
        FROM orders
        WHERE order_number In(1)
        GROUP BY 1,2),
    sales_activity as (
        SELECT customer_id,
                strftime('%W',shipment_date) as sales_week
        FROM orders
        GROUP BY 1,2),
    cohort_count as (
        SELECT strftime('%W',shipment_date) as week,
                count(*) as first_count
        FROM orders
        WHERE order_number IN(1)
        GROUP BY 1)
SELECT Week1, SalesWeek, NewCust, RtrnCust, RetRate
FROM (
    SELECT 
        cohort_week.first_week as Week1,
        sales_activity.sales_week - cohort_week.first_week as SalesWeek,
        cohort_count.first_count as NewCust,
        COUNT(DISTINCT(sales_activity.customer_id)) as RtrnCust,
        COUNT(DISTINCT(sales_activity.customer_id)) / COUNT(DISTINCT(cohort_week.customer_id)) as RetRate
    FROM orders
    LEFT JOIN cohort_week ON
        orders.customer_id = cohort_week.customer_id
    LEFT JOIN sales_activity ON
        strftime('%W',orders.shipment_date) = sales_activity.sales_week
        AND orders.customer_id = sales_activity.customer_id
    LEFT JOIN cohort_count ON
        cohort_week.first_week = cohort_count.week
GROUP BY 1,2)
GROUP BY 1,2
