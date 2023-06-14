with orders as (
    select order_id,{{extract_from_timestamp('order_purchase_timestamp','time')}} as order_time
    from {{ ref('stg_orders') }}
),

orders_by_time as (
    select order_id,order_time,
    case when order_time between '00:00:00' and '06:59:59' then "dawn_order" 
    when order_time between '07:00:00' and '12:59:59' then "morning_order" 
    when order_time between '13:00:00' and '18:59:59' then "afternoon_order" 
    when order_time between '19:00:00' and '23:59:59' then "night_order" 
    end as time_of_order
    from orders
),
final as (
    select time_of_order,count(distinct(order_id)) as number_of_orders 
    from orders_by_time group by time_of_order order by number_of_orders desc limit 1
)

select * from final 