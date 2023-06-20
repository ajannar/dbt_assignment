with locations as (
    select
        location_id,
        city
    from {{ source('employee_source', 'locations') }}
)

select * from locations
