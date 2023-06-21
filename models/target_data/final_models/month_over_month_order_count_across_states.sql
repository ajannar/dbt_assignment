with orders as (
    select
        order_id,
        customer_id,
        format_timestamp("%B", order_purchase_timestamp) as order_month,
        {{extract_from_timestamp('order_purchase_timestamp','year')}} as order_year
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
        order_year,
        order_id,
        state
    from orders
    left join customers on orders.customer_id = customers.customer_id
),

final as (
    select
        state,order_year,
        order_month,
        count(distinct order_id) as number_of_orders
    from orders_customers group by state,order_year,order_month order by state,order_month
)

select * from final
