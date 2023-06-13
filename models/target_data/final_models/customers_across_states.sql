with customers as (
    select customer_unique_id,customer_state as state from {{ ref('stg_customers') }}
),
final as (
    select state,count(customer_unique_id) as number_of_customers from customers group by state
)

select * from final
