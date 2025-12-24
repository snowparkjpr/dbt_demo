{{ config(materialized='view') }}

with cte_orders as
(SELECT ORDER_ID, CUSTOMER_ID, ORDER_DATE, STATUS, TOTAL_AMOUNT, SHIPPING_ADDRESS, PAYMENT_METHOD, LAST_UPDATED_TIMESTAMP 
FROM DEMO_DB.RAW_DATA.ORDERS)

SELECT
    order_id,
    customer_id,
    order_date,
    TOTAL_AMOUNT AS total_amount_usd,
    -- Standardize the status field
    CASE
        WHEN status = 'Delivered' THEN 'Delivered'
        WHEN status = 'Processing' THEN 'Processing'
        WHEN status = 'Shipped' THEN 'Shipped'
        WHEN status = 'Cancelled' THEN 'Cancelled'
        ELSE 'Unknown'
    END AS order_status
FROM cte_orders

