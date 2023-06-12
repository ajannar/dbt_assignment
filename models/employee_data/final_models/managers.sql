
with employees as (
    select * from {{ ref('stg_employees') }}
),
departments as (
    select * from {{ ref('stg_departments') }}
),
final as (
    select m.full_name manager_name,d.department_name,e.full_name emp_name
from employees e left join employees m on m.employee_id=e.manager_id
left join departments d on e.manager_id=d.manager_id
)

select * from final