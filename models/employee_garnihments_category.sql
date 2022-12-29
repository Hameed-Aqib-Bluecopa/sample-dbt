{{ config(materialized='table') }}

select id emp_id
, json_extract_scalar(garnishments,'$.id') garnishments_id
, json_extract_scalar(garnishments,'$.times') garnishments_times
, json_extract_scalar(garnishments,'$.active') garnishments_active
, json_extract_scalar(garnishments,'$.amount') garnishments_amount
, json_extract_scalar(garnishments,'$.version') garnishments_version
, json_extract_scalar(garnishments,'$.recurring') garnishments_recurring
, json_extract_scalar(garnishments,'$.description') garnishments_description
, json_extract_scalar(garnishments,'$.employee_id') garnishments_employee_id
, json_extract_scalar(garnishments,'$.court_ordered') garnishments_court_ordered
, json_extract_scalar(garnishments,'$.annual_maximum') garnishments_annual_maximum
, json_extract_scalar(garnishments,'$.pay_period_maximum') garnishments_pay_period_maximum
, json_extract_scalar(garnishments,'$.deduct_as_percentage') garnishments_deduct_as_percentage
from Gusto.employees
left join unnest(garnishments) garnishments
where json_extract_scalar(garnishments,'$.id') is not null