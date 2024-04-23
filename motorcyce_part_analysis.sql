
--Focusing on wholesale clients only. What is the net revenue for each product line per warehouse every month
SELECT 
    product_line,
    CASE 
        WHEN EXTRACT (MONTH from date) = 6 THEN 'June'
        WHEN EXTRACT (MONTH from date) = 7 THEN 'July'
        WHEN EXTRACT (MONTH from date) = 8 THEN 'August'
        END AS month,
        warehouse,
        ROUND(SUM(total * (1-payment_fee))::numeric,2) AS net_revenue
FROM sales
WHERE client_type='Wholesale'
GROUP BY product_line, month, warehouse
ORDER BY product_line, month DESC, warehouse
;

-- What is the net revenue for each warehouse month by month
SELECT 
    warehouse,
    ROUND(SUM(total * (1-payment_fee))::numeric,2) AS net_revenue,
    CASE 
        WHEN EXTRACT (MONTH from date) = 6 THEN 'June'
        WHEN EXTRACT (MONTH from date) = 7 THEN 'July'
        WHEN EXTRACT (MONTH from date) = 8 THEN 'August'
        END AS month,
    client_type    
FROM sales
GROUP BY warehouse, month, client_type
ORDER BY month DESC, warehouse, client_type
;

-- Which product line generate the highest revenue
SELECT 
    product_line,
    CASE 
        WHEN EXTRACT (MONTH from date) = 6 THEN 'June'
        WHEN EXTRACT (MONTH from date) = 7 THEN 'July'
        WHEN EXTRACT (MONTH from date) = 8 THEN 'August'
        END AS month,
    ROUND(SUM(total * (1-payment_fee))::numeric,2) AS net_revenue
FROM sales
GROUP BY product_line, month
ORDER BY net_revenue DESC, product_line, month DESC
;

SELECT * FROM sales;