{{ config(materialized='table') }}

select id emp_id
, json_extract_scalar(jobs,'$.two_percent_shareholder') jobs_two_percent_shareholder
, json_extract_scalar(jobs,'$.hire_date') jobs_hire_date
, json_extract_scalar(jobs,'$.title') jobs_title
, json_extract_scalar(jobs,'$.uuid') jobs_uuid
, json_extract_scalar(jobs,'$.version') jobs_version
, json_extract_scalar(jobs,'$.location_id') jobs_location_id
, json_extract_scalar(jobs,'$.location_uuid') jobs_location_uuid
, json_extract_scalar(jobs,'$.current_compensation_uuid') jobs_current_compensation_uuid
, json_extract_scalar(jobs,'$.current_compensation_id') jobs_current_compensation_id
, json_extract_scalar(jobs,'$.employee_uuid') jobs_employee_uuid
, json_extract_scalar(jobs,'$.rate') jobs_rate
, json_extract_scalar(jobs,'$.employee_id') jobs_employee_id
, json_extract_scalar(jobs,'$.location.id') jobs_location_id
, json_extract_scalar(jobs,'$.location.uuid') jobs_location_uuid
, json_extract_scalar(jobs,'$.location.street_1') jobs_location_street_1
, json_extract_scalar(jobs,'$.location.street_2') jobs_location_street_2
, json_extract_scalar(jobs,'$.location.city') jobs_location_city
, json_extract_scalar(jobs,'$.location.state') jobs_location_state
, json_extract_scalar(jobs,'$.location.country') jobs_location_country
, json_extract_scalar(jobs,'$.location.zip') jobs_location_zip
, json_extract_scalar(jobs,'$.location.inactive') jobs_location_inactive
, json_extract_scalar(jobs,'$.id') jobs_id
, json_extract_scalar(jobs,'$.payment_unit') jobs_payment_unit
, json_extract_scalar(jobs,'$.primary') jobs_primary
, json_extract_scalar(compensations,'$.job_uuid') compensations_job_uuid
, json_extract_scalar(compensations,'$.flsa_status') job_compensations_flsa_status
, json_extract_scalar(compensations,'$.rate') job_compensations_rate
, json_extract_scalar(compensations,'$.job_id') job_compensations_job_id
, json_extract_scalar(compensations,'$.effective_date') job_compensations_effective_date
, json_extract_scalar(compensations,'$.id') job_compensations_id
, json_extract_scalar(compensations,'$.payment_unit') job_compensations_payment_unit
, json_extract_scalar(compensations,'$.adjust_for_minimum_wage') job_compensations_adjust_for_minimum_wage
, json_extract_scalar(compensations,'$.uuid') job_compensations_uuid
, json_extract_scalar(compensations,'$.version') job_compensations_version
-- , json_extract_array(compensations,'$.minimum_wages') minimum_wages
from Gusto.employees
left join unnest(jobs) jobs
left join unnest(json_extract_array(jobs, '$.compensations')) compensations