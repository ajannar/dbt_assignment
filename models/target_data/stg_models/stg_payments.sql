with payments as (
    select
        order_id,
        payment_type,
        payment_installments,
        payment_value
    from {{ source('target_source', 'payments') }}
)

select * from payments
