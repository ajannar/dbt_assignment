with orders as (
    select
        order_id,
        customer_id,
        format_timestamp("%B", order_purchase_timestamp) as order_month
    from
        {{ ref('stg_orders') }}
),

customers as (
    select
        customer_id,
        customer_state as state
    from {{ ref('stg_customers') }}
),

orders_customers as (
    select
        order_month,
        order_id,
        state
    from orders
    left join customers on orders.customer_id = customers.customer_id
),

final as (
    select
        state,
        order_month,
        count(distinct order_id) as number_of_orders
    from orders_customers group by state, order_month order by state
)

select * from final
