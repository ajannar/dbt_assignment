with employees as (
    select employee_id,concat(first_name,' ',last_name) full_name,
    parse_date('%d-%m-%Y',  nullif(hire_date,'null')) hire_date,salary,safe_cast(manager_id as int) manager_id,safe_cast(department_id as int) department_id from {{ source('employee_source', 'employee') }}
)

select * from employees