{{ config(materialized='table') }}

select
json_extract_scalar(total,'$.wages') wages
, json_extract_scalar(total,'$.reimbursements') reimbursements
, json_extract_scalar(cp_cp,'$.reimbursement_total') reimbursement_total
, json_extract_scalar(cp_cp,'$.contractor_id') contractor_id
, json_extract_scalar(cp_cp,'$.contractor_uuid') contractor_uuid
, json_extract_scalar(cp_cp,'$.wage_total') wage_total
, json_extract_scalar(cp_cp_payments,'$.date') pay_date
, json_extract_scalar(cp_cp_payments,'$.hours') payments_hours
, json_extract_scalar(cp_cp_payments,'$.bonus') payments_bonus
, json_extract_scalar(cp_cp_payments,'$.contractor_uuid') payments_contractor_uuid
, json_extract_scalar(cp_cp_payments,'$.uuid') payments_uuid
, json_extract_scalar(cp_cp_payments,'$.contractor_id') payments_contractor_id
, json_extract_scalar(cp_cp_payments,'$.hourly_rate') payments_hourly_rate
, json_extract_scalar(cp_cp_payments,'$.reimbursement') payments_reimbursement
, json_extract_scalar(cp_cp_payments,'$.payment_method') payments_payment_method
, json_extract_scalar(cp_cp_payments,'$.wage_total') payments_wage_total
, json_extract_scalar(cp_cp_payments,'$.may_cancel') payments_may_cancel
, json_extract_scalar(cp_cp_payments,'$.wage') payments_wage
, json_extract_scalar(cp_cp_payments,'$.wage_type') payments_wage_type
from Gusto.contractor_payments cp
left join unnest(cp.contractor_payments) cp_cp
left join unnest(json_extract_array(cp_cp,'$.payments')) cp_cp_payments