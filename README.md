# Motorcycle Parts Sale project - Postgresql
This is a SQL project idea suggested by Datacamp.com.

 I will look into the data of a company that sells motorcycle parts to get insights about their sales over time across three warehouse sites and help them understand their revenue streams.
 
The areas that I looked into are:
1. How much net revenue is the company getting from each product lines by month and warehouse.
2. The net revenue trend for each warehouse over time
3. Which production line generates the most net revenue over time

## About the project:

- A table was created to store the dataset as follows:

```
    sales

    order_number     VARCHAR
    date             DATE
    warehouse        VARCHAR
    client_type      VARCHAR
    product_line     VARCHAR
    quantity         INT
    unit_price       FLOAT
    total            FLOAT
    payment          VARCHAR
    payment_fee      FLOAT
```
- Data in `sales.csv` was copied onto the `sales` table
- The `date` provided in the dataset is in YYYY-MM-DD format. The year and day remain the same (2021 , 01) for all the dates so it will be more meaningful to only report the month. This is done using the `case` syntax:
 ```
        CASE 
             WHEN EXTRACT (MONTH from date) = 6 THEN 'June'
             WHEN EXTRACT (MONTH from date) = 7 THEN 'July'
             WHEN EXTRACT (MONTH from date) = 8 THEN 'August'
        END AS month
 ```

- To find the net revenue, payment fee has to be subtracted from total. 
- To answer the questions of net revenue from each warehouse or product line, an aggregate function called `SUM` is used.  `GROUP BY` statement is used to group rows of the same warehouse or product line together in order to calculate the total net revenue. 

## About the dataset:

```
    Column Name      Datatype     Description

    order_number     VARCHAR      Unique order number
    date             DATE         Date of the order
    warehouse        VARCHAR      Warehouse where order was from 
    client_type      VARCHAR      Type of client 
    product_line     VARCHAR      Type of product
    quantity         INT          Number of units ordered
    unit_price       FLOAT        Price per product
    total            FLOAT        Total price for the order
    payment          VARCHAR      Payment method
    payment_fee      FLOAT        A percentage charge based on the
                                  payment method
```

