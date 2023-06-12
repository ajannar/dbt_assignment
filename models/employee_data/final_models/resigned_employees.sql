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
    select e.employee_id,e.full_name,e.salary last_withdrawn_salary,
    d.department_name,j.end_date last_working_day,l.city from employees e
    left join departments d on e.department_id=d.department_id
    left join locations l on d.location_id=l.location_id
    left join job_history j on e.employee_id=j.employee_id where j.end_date is not null
)

select * from final