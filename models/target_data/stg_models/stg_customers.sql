with customers as (
    select
        customer_id,
        customer_unique_id,
        customer_state
    from {{ source('target_source', 'customers') }}
)

select * from customers
