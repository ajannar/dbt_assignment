with products as (
    select * from {{ source('target_source', 'products') }}
)

select * from products