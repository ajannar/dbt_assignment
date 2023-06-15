with employees as (
    select
        employee_id,
        salary,
        concat(first_name, ' ', last_name) as full_name,
        parse_date('%d-%m-%Y', nullif(hire_date, 'null')) as hire_date,
        safe_cast(manager_id as int) as manager_id,
        safe_cast(department_id as int) as department_id
    from {{ source('employee_source', 'employee') }}
)

select * from employees
