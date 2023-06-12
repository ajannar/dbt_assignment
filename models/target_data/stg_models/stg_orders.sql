with orders as (
    select * from {{ source('target_source', 'orders') }}
)

select * from orders