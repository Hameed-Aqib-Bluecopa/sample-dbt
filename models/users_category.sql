{{ config(materialized='table') }}

select id user_id
,uuid user_uuid
,email user_email
,json_extract_scalar(payroll_admin_company,'$.id') payroll_admin_company_id
,json_extract_scalar(payroll_admin_company,'$.uuid') payroll_admin_company_uuid
,json_extract_scalar(payroll_admin_company,'$.trade_name') payroll_admin_company_trade_name
,json_extract_scalar(payroll_admin_company,'$.name') name
,json_extract_scalar(payroll_admin_company,'$.tier') tier
,json_extract_scalar(payroll_admin_company,'$.is_partner_managed') is_partner_managed
,json_extract_scalar(payroll_admin_company_location,'$.id') locations_id
,json_extract_scalar(payroll_admin_company_location,'$.street_1') locations_street_1
,json_extract_scalar(payroll_admin_company_location,'$.street_2') locations_street_2
,json_extract_scalar(payroll_admin_company_location,'$.city') locations_city
,json_extract_scalar(payroll_admin_company_location,'$.state') locations_state
,json_extract_scalar(payroll_admin_company_location,'$.country') locations_country
,json_extract_scalar(payroll_admin_company_location,'$.zip') locations_zip
,json_extract_scalar(payroll_admin_company_location,'$.active') locations_active
from Gusto.users
left join unnest(json_extract_array(roles,'$.payroll_admin.companies') ) as payroll_admin_company
left join unnest(json_extract_array(payroll_admin_company,'$.locations') ) as payroll_admin_company_location