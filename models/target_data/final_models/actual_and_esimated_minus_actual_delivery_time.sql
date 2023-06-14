with orders as (
    select
        order_id,
        date(order_purchase_timestamp) as order_date,
        date(order_estimated_delivery_date) as estimated_delivery_date,
        date(order_delivered_customer_date) as delivery_date
    from
        {{ ref('stg_orders') }}
    where order_status = 'delivered'
),

final as (
    select order_id,
        {{ date_difference('delivery_date','order_date','day') }} as delivery_time_in_days,
    {{date_difference('estimated_delivery_date','delivery_date','day')}} as estimated_minus_actual_delivery_in_days
    from orders
)

select * from final
