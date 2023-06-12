with locations as (
    select * from {{ source('employee_source', 'locations') }}
)

select * from locations