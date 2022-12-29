{{ config(materialized='table') }}

select benefit_id
, json_extract_scalar(catch_up,'$.editable') catch_up_editable
, json_extract_scalar(catch_up,'$.default_value') catch_up_default_value
, json_extract_scalar(catch_up,'$.choices') catch_up_choices
, json_extract_scalar(catch_up,'$.required') catch_up_required
, json_extract_scalar(contribution,'$.editable') contribution_editable
, json_extract_scalar(contribution,'$.default_value') contribution_default_value
, json_extract_scalar(contribution,'$.choices') contribution_choices
, json_extract_scalar(contribution,'$.required') contribution_required
, json_extract_scalar(limit_option,'$.editable') limit_option_editable
, json_extract_scalar(limit_option,'$.default_value') limit_option_default_value
, json_extract_scalar(limit_option,'$.choices') limit_option_choices
, json_extract_scalar(limit_option,'$.required') limit_option_required
, json_extract_scalar(coverage_amount,'$.editable') coverage_amount_editable
, json_extract_scalar(coverage_amount,'$.default_value') coverage_amount_default_value
, json_extract_scalar(coverage_amount,'$.choices') coverage_amount_choices
, json_extract_scalar(coverage_amount,'$.required') coverage_amount_required
, json_extract_scalar(employee_deduction,'$.editable') employee_deduction_editable
, json_extract_scalar(employee_deduction,'$.default_value') employee_deduction_default_value
, json_extract_scalar(employee_deduction,'$.choices') employee_deduction_choices
, json_extract_scalar(employee_deduction,'$.required') employee_deduction_required
, json_extract_scalar(deduct_as_percentage,'$.editable') deduct_as_percentage_editable
, json_extract_scalar(deduct_as_percentage,'$.default_value') deduct_as_percentage_default_value
, json_extract_scalar(deduct_as_percentage,'$.choices') deduct_as_percentage_choices
, json_extract_scalar(deduct_as_percentage,'$.required') deduct_as_percentage_required
, json_extract_scalar(coverage_salary_multiplier,'$.editable') coverage_salary_multiplier_editable
, json_extract_scalar(coverage_salary_multiplier,'$.default_value') coverage_salary_multiplier_default_value
, json_extract_scalar(coverage_salary_multiplier,'$.choices') coverage_salary_multiplier_choices
, json_extract_scalar(coverage_salary_multiplier,'$.required') coverage_salary_multiplier_required
, json_extract_scalar(company_contribution_annual_maximum,'$.editable') company_contribution_annual_maximum_editable
, json_extract_scalar(company_contribution_annual_maximum,'$.default_value') company_contribution_annual_maximum_default_value
, json_extract_scalar(company_contribution_annual_maximum,'$.choices') company_contribution_annual_maximum_choices
, json_extract_scalar(company_contribution_annual_maximum,'$.required') company_contribution_annual_maximum_required
from Gusto.company_benefits_by_gusto_requirements