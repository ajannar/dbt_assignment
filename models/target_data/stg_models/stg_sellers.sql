with sellers as (
    select * from {{ source('target_source', 'sellers') }}
)

select * from sellers