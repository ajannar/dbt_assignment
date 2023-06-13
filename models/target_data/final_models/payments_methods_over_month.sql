
{%- set payment_methods = ['UPI', 'voucher', 'debit_card', 'credit_card'] -%}

with payments as (
   select order_id,payment_type from {{ ref('stg_payments') }}
),
orders as (
    select order_id,format_timestamp("%B",order_purchase_timestamp) as order_month from
    {{ ref('stg_orders') }}
),
order_payments as (
    select o.order_id,order_month,payment_type from orders o left join payments p on o.order_id=p.order_id
),
final as (
   select
       order_month,
       {% for payment_method in payment_methods -%}

       sum(case when payment_type = '{{ payment_method }}' then 1 else 0 end)
            as {{ payment_method }}_payment

       {%- if not loop.last -%}
         ,
       {% endif -%}

       {%- endfor %}
   from order_payments
   group by 1 order by 1
)

select * from final



