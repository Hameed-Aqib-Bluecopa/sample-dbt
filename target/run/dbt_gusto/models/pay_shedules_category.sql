
  
    

    create or replace table `blu-api-dev-359208`.`dbt_gusto_main`.`pay_shedules_category`
    
    
    OPTIONS()
    as (
      

select distinct
id
, name
, uuid
, day_1
, day_2
, version
, frequency
, auto_pilot
, anchor_pay_date
, anchor_end_of_pay_period
from `blu-api-dev-359208`.`Gusto`.`pay_schedules`
    );
  