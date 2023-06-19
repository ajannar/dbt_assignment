with employees as (
    select * from {{ ref('stg_employees') }}
),

departments as (
    select * from {{ ref('stg_departments') }}
),

final as (
    select
        m.full_name as manager_name,
        d.department_name,
        e.full_name as emp_name
    from employees as e left join employees as m on m.employee_id = e.manager_id
    left join departments as d on e.manager_id = d.manager_id
)

select * from final
