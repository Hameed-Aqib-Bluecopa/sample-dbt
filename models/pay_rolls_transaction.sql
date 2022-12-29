{{ config(materialized='table') }}

select payroll_id
, payroll_uuid
, company_uuid
, company_id
, check_date
, calculated_at
, processed_date
, payroll_deadline
, version
, off_cycle
, processed
, json_extract_scalar(totals,'$.benefits') totals_benefits
, json_extract_scalar(totals,'$.deferred_payroll_taxes') totals_deferred_payroll_taxes
, json_extract_scalar(totals,'$.employee_commissions') totals_employee_commissions
, json_extract_scalar(totals,'$.additional_earnings') totals_additional_earnings
, json_extract_scalar(totals,'$.company_debit') totals_company_debit
, json_extract_scalar(totals,'$.reimbursements') totals_reimbursements
, json_extract_scalar(totals,'$.gross_pay') totals_gross_pay
, json_extract_scalar(totals,'$.employer_taxes') totals_employer_taxes
, json_extract_scalar(totals,'$.employee_taxes') totals_employee_taxes
, json_extract_scalar(totals,'$.net_pay') totals_net_pay
, json_extract_scalar(totals,'$.reimbursement_debit') totals_reimbursement_debit
, json_extract_scalar(totals,'$.net_pay_debit') totals_net_pay_debit
, json_extract_scalar(totals,'$.tax_debit') totals_tax_debit
, json_extract_scalar(totals,'$.child_support_debit') totals_child_support_debit
, json_extract_scalar(totals,'$.employee_paycheck_tips') totals_employee_paycheck_tips
, json_extract_scalar(totals,'$.owners_draw') totals_owners_draw
, json_extract_scalar(totals,'$.check_amount') totals_check_amount
, json_extract_scalar(totals,'$.employee_benefits_deductions') totals_employee_benefits_deductions
, json_extract_scalar(totals,'$.employee_bonuses') totals_employee_bonuses
, json_extract_scalar(totals,'$.employee_cash_tips') totals_employee_cash_tips
, json_extract_scalar(pay_period,'$.pay_schedule_uuid') pay_period_pay_schedule_uuid
, json_extract_scalar(pay_period,'$.pay_schedule_id') pay_period_pay_schedule_id
, json_extract_scalar(pay_period,'$.start_date') pay_period_start_date
, json_extract_scalar(pay_period,'$.end_date') pay_period_end_date
from Gusto.pay_rolls