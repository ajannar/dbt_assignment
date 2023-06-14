with payments as (
    select order_id,payment_installments from 
    {{ ref('stg_payments') }}
),
final as (
    select payment_installments,count(distinct order_id) as number_of_orders 
    from payments where payment_installments>1
    group by payment_installments
)

select * from final
