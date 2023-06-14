with locations as (
    select
        geolocation_city as city,
        geolocation_state as state
    from {{ ref('stg_geolocation') }}
),

final as (
    select
        count(distinct city) as number_of_cities,
        count(distinct state) as number_of_states
    from locations
)

select * from final
