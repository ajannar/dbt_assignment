with employees as (
    select * from {{ ref('stg_employees') }}
),
departments as (
    select * from {{ ref('stg_departments') }}
),
salary_ranking as (
    select employee_id,full_name,salary,department_id,
    dense_rank() over (partition by department_id order by salary desc) sal_rank from employees
),
final as (
    select d.department_name,s.salary as second_highest_salary,s.employee_id,s.full_name
    from salary_ranking s
    left join departments d on s.department_id=d.department_id where sal_rank=2
)
select * from final