with job_history as (
    select
        employee_id,
        start_date,
        parse_date('%d-%m-%Y', nullif(end_date, 'null')) as end_date,
        safe_cast(nullif(department_id, 'null') as int) as department_id,
        ifnull(parse_date('%d-%m-%Y', nullif(end_date, 'null')), current_date()) as curr_date_when_null
    from {{ source('employee_source', 'job_history') }}
)

select * from job_history
