COPY sales (
order_number,
date,
warehouse,
client_type,
product_line,
quantity,
unit_price,
total,
payment,
payment_fee
    )
FROM '/mnt/c/Users/kyoto/OneDrive/Documents/Motorcycle_parts_sale/Motorcycle_parts_sale_SQL/sales.csv'
WITH CSV HEADER;
