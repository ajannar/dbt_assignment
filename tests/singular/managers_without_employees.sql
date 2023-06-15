with manager_details as (
    select * from {{ ref("managers") }}
)

select
    manager_name,
    count(*) as emp_count
from manager_details
group by manager_name
having emp_count < 0
