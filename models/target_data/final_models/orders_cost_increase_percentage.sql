with order_cost as (
    select order_id,sum(payment_value) as total_order_value 
    from {{ ref('stg_payments') }} group by order_id
),
orders as (
    select order_id,{{extract_from_timestamp('order_purchase_timestamp','year')}} as order_year,
    {{extract_from_timestamp('order_purchase_timestamp','month')}} as order_month from
    {{ ref('stg_orders') }}
),
order_cost_by_year as (
    select order_year,sum(total_order_value) as current_year_cost from order_cost oc
    left join orders o on o.order_id=oc.order_id where total_order_value is not null
    and order_year in (2017,2018) and order_month between 1 and 8 group by order_year
),
year_over_year_cost as (
    select order_year,current_year_cost,
    lag(current_year_cost) over (order by order_year) as last_year_order_cost
    from order_cost_by_year order by order_year desc
),
final as (
    select order_year,{{precision('current_year_cost')}} as current_year_cost,
    {{precision('last_year_order_cost')}} as last_year_order_cost,
    concat({{precision('(current_year_cost/last_year_order_cost)*100')}},' %') as cost_increase_percentage
    from year_over_year_cost
)

select * from final