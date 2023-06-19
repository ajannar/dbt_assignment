with orders as (
    select
        order_id,
        customer_id,
        date(order_purchase_timestamp) as order_date,
        date(order_estimated_delivery_date) as estimated_delivery_date,
        date(order_delivered_customer_date) as delivery_date
    from
        {{ ref('stg_orders') }}
    where order_status = 'delivered' and order_delivered_customer_date is not null
),

customers as (
    select
        customer_id,
        customer_state as state
    from {{ ref('stg_customers') }}
),

orders_customers as (
    select
        order_id,
        order_date,
        estimated_delivery_date,
        delivery_date,
        o.customer_id,
        state
    from orders as o left join customers as c on o.customer_id = c.customer_id
),

orders_delivery_time as (
    select
        order_id,
        state,
        {{ date_difference('estimated_delivery_date','delivery_date','day') }} as estimated_minus_actual_delivery_in_days
    from orders_customers
),

final as (
    select state,
        {{ precision('avg(estimated_minus_actual_delivery_in_days)') }} as avg_estimated_minus_actual_delivery_time
    from orders_delivery_time
    group by state
    order by avg_estimated_minus_actual_delivery_time desc
    limit 5
)

select * from final
