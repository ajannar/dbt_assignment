with geolocation as (
    select * from {{ source('target_source', 'geolocation') }}
)

select * from geolocation