{{ config(materialized='table') }}

select id
, uuid
, active
, version
, deletable
, benefit_id
, company_id
, description
, benefit_type
, company_uuid
, responsible_for_employee_w2
, supports_percentage_amounts
, responsible_for_employer_taxes
from Gusto.company_benefits