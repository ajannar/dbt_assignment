with order_items as (
    select * from {{ source('target_source', 'order_items') }}
)

select * from order_items