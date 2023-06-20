with departments as (
    select
        department_id,
        department_name,
        manager_id,
        location_id
    from {{ source('employee_source', 'departments') }}
)

select * from departments
