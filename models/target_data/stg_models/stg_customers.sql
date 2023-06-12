with customers as (
    select * from {{ source('target_source', 'customers') }}
)

select * from customers