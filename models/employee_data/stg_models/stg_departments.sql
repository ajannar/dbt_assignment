with departments as (
    select * from {{ source('employee_source', 'departments') }}
)

select * from departments