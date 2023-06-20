with employees as (
    select * from {{ ref('stg_employees') }}
),

departments as (
    select * from {{ ref('stg_departments') }}
),

job_history as (
    select * from {{ ref('stg_job_history') }}
),

locations as (
    select * from {{ ref('stg_locations') }}
),

final as (
    select
        employees.employee_id,
        employees.full_name,
        employees.salary,
        departments.department_name,
        locations.city,
        {{ date_difference('ifnull(end_date, current_date())', 'start_date', 'year') }}
        as years_worked
    from
        employees
    left join departments on departments.department_id = employees.department_id
    left join locations on departments.location_id = locations.location_id
    left join job_history on employees.employee_id = job_history.employee_id
)

select * from final
