with order_items as (
    select
        order_id,
        price,
        freight_value
    from {{ source('target_source', 'order_items') }}
)

select * from order_items
