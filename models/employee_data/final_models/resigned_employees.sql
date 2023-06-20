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
        e.employee_id,
        e.full_name,
        e.salary as last_withdrawn_salary,
        d.department_name,
        j.end_date as last_working_day,
        l.city
    from employees as e
    left join departments as d on e.department_id = d.department_id
    left join locations as l on d.location_id = l.location_id
    left join job_history as j on e.employee_id = j.employee_id
    where j.end_date is not null
)

select * from final
