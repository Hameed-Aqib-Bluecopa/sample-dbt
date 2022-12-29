

select
id contractors_id
,ein
,type
,uuid
,email
,json_extract_scalar(address,'$.street_1') street_1
,json_extract_scalar(address,'$.street_2') street_2
,json_extract_scalar(address,'$.city') city
,json_extract_scalar(address,'$.state') state
,json_extract_scalar(address,'$.country') country
,json_extract_scalar(address,'$.zip') zip
,has_ein
,has_ssn
,version
,is_active
,last_name
,onboarded
,wage_type
,company_id
,first_name
,start_date
,work_state
,hourly_rate
,company_uuid
,business_name
,middle_initial
,payment_method
,onboarding_status
,file_new_hire_report
from Gusto.contractors