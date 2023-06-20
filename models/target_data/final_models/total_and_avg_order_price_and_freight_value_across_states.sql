with orders as (
    select
        order_id,
        customer_id
    from {{ ref('stg_orders') }}
),

customers as (
    select
        customer_id,
        customer_state as state
    from {{ ref('stg_customers') }}
),

order_cost as (
    select
        order_id,
        sum(price) as total_order_price,
        sum(freight_value) as total_order_freight
    from {{ ref('stg_order_items') }} group by order_id
),

orders_customers as (
    select
        order_id,
        o.customer_id,
        state
    from orders as o
    left join customers as c on c.customer_id = o.customer_id
),

orders_customers_cost as (
    select
        oc.order_id,
        oc.total_order_price,
        oc.total_order_freight,
        ocus.customer_id,
        ocus.state
    from order_cost as oc left join
        orders_customers as ocus
        on oc.order_id = ocus.order_id
),

final as (
    select state,{{ precision('sum(total_order_price)') }} as total_orders_price,
        {{precision('sum(total_order_price)/count(total_order_price)')}} as avg_per_order_price,
        {{precision('sum(total_order_freight)')}} as total_orders_freight,
        {{precision('sum(total_order_freight)/count(total_order_freight)')}} as avg_per_order_freight,
    from 
        orders_customers_cost 
    group by state
)

select * from final
