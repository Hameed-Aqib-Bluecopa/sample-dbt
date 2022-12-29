{{ config(materialized='table') }}

select 'Default' earning_type
, json_extract_scalar(default_earning_type,'$.name') name
, json_extract_scalar(default_earning_type,'$.uuid') uuid
from Gusto.earning_types
left join unnest(`default`) default_earning_type
where json_extract_scalar(default_earning_type,'$.name') is not null
union all
select 'Custom' earning_type
, json_extract_scalar(custom_earning_type,'$.name') name
, json_extract_scalar(custom_earning_type,'$.uuid') uuid
from Gusto.earning_types
left join unnest(`custom`) custom_earning_type
where json_extract_scalar(custom_earning_type,'$.name') is not null