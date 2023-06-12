with order_reviews as (
    select * from {{ source('target_source', 'order_reviews') }}
)

select * from order_reviews