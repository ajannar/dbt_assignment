with orders as (
    select order_id,extract(year from order_purchase_timestamp) as order_year
    from
    {{ ref('stg_orders') }}
),
final as (
    select order_year,count(distinct(order_id)) as number_of_order from orders group by order_year 
    order by order_year desc
)
select * from final