{{ config(materialized='table') }}

select distinct
pm.Id as payment_method_id
, pm.Active as active
, pmm.CreateTime as created_at
, pm.Name as name
, pm.SyncToken as sync_token
, pm.Type as type
, pmm.LastUpdatedTime as updated_at
--, pm.domain
from {{ source('quickbook', 'payment_methods') }} pm
left join {{ source('quickbook', 'payment_methods_MetaData') }} pmm
on pm._airbyte_payment_methods_hashid = pmm._airbyte_payment_methods_hashid
order by pm.id