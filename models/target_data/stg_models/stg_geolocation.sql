with geolocation as (
    select
        geolocation_city,
        geolocation_state
    from {{ source('target_source', 'geolocation') }}
)

select * from geolocation
