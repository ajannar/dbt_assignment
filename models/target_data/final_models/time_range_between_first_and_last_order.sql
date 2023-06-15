with orders as (
    select
        date(min(order_purchase_timestamp)) as first_order,
        date(max(order_purchase_timestamp)) as last_order
    from {{ ref('stg_orders') }}
),

final as (
    select *,
        {{ date_difference('last_order','first_order','month') }} as time_range_months
    from orders
)

select * from final
