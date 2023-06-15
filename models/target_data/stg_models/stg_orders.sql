with orders as (
    select
        order_id,
        customer_id,
        order_status,
        order_purchase_timestamp,
        order_delivered_customer_date,
        order_estimated_delivery_date
    from 
        {{ source('target_source', 'orders') }}
)

select * from orders
