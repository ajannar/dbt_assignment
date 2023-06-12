with job_history as (
    select employee_id,start_date,
    parse_date('%d-%m-%Y',  nullif(end_date,'null')) end_date,
    safe_cast(nullif(department_id,'null') as int) department_id
    from {{ source('employee_source', 'job_history') }}
)

select * from job_history