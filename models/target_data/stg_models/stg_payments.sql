with payments as (
    select * from {{ source('target_source', 'payments') }}
)

select * from payments