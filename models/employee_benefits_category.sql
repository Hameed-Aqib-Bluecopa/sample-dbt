{{ config(materialized='table') }}

select id
, uuid
, active
, version
, catch_up
, elective
, employee_id
, json_extract_scalar(contribution,'$.type') contribution_type
, json_extract_scalar(contribution,'$.value') contribution_value
, limit_option
, employee_uuid
, coverage_amount
, company_benefit_id
, employee_deduction
, company_benefit_uuid
, company_contribution
, deduct_as_percentage
, contribute_as_percentage
, coverage_salary_multiplier
, retirement_loan_identifier
, deduction_reduces_taxable_income
, employee_deduction_annual_maximum
, company_contribution_annual_maximum
from Gusto.employee_benefits