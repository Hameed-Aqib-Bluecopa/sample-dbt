
  
    

    create or replace table `blu-api-dev-359208`.`dbt_gusto_main`.`pay_periods_transaction`
    
    
    OPTIONS()
    as (
      

select
ppp.processed
,ppp.payroll_deadline
,pp.end_date
,pp.start_date
,pp.pay_schedule_id
,pp.pay_schedule_uuid
,ppe.id as employee_id
,ppe.uuid as employee_uuid
,ppe.job_ids as employee_job_ids
,ppe.job_uuids as employee_job_uuids
from `blu-api-dev-359208`.`Gusto`.`pay_periods` pp 
left join `blu-api-dev-359208`.`Gusto`.`pay_periods_eligible_employees` ppe
on ppe._airbyte_pay_periods_hashid = ppe._airbyte_pay_periods_hashid
left join `blu-api-dev-359208`.`Gusto`.`pay_periods_payroll` ppp
on pp._airbyte_pay_periods_hashid = ppp._airbyte_pay_periods_hashid
    );
  