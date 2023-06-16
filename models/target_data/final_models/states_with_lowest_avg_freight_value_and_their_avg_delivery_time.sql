with orders as (
    select
        order_id,
        customer_id,
        date(order_purchase_timestamp) as order_date,
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
        o.customer_id,
        state,
        order_date,
        delivery_date
    from orders as o left join customers as c on o.customer_id = c.customer_id
),

order_cost as (
    select
        order_id,
        sum(freight_value) as total_order_freight
    from {{ ref('stg_order_items') }} group by order_id
),

order_cost_state as (
    select
        o.order_id,
        o.state,
        {{ date_difference('delivery_date','order_date','day') }} as delivery_time_in_days,
        total_order_freight
    from orders_customers as o
    left join order_cost as oc
        on o.order_id = oc.order_id
),

states as (
    select * from {{ ref('state_details') }}
),

final as (
    select state_name,
        {{ precision('avg(delivery_time_in_days)') }} as avg_delivery_time,
        {{precision('avg(total_order_freight)')}} as avg_freight_value
    from order_cost_state
    inner join states on order_cost_state.state = states.geolocation_state
    group by state_name
    order by avg_freight_value limit 5
)

select * from final
