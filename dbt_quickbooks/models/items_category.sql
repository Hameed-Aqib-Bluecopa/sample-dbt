{{ config(materialized='table') }}

select distinct
cast(i.id as {{ dbt.type_string() }}) as item_id
, ia.value as asset_account_id
, ia.name as asset_account_name
, iia.value as income_account_id
, iia.name as income_account_name
, ie.value as expense_account_id
--,parent_item_id ➤ ITEM
--,sales_tax_code_id ➤ TAX_CODE
--,purchase_tax_code_id ➤ TAX_CODE
, i.Active as active
, im.CreateTime created_at
, i.Description as description
, ie.name as expense_account
, i.FullyQualifiedName as fully_qualified_name
,i.InvStartDate as inventory_start_date
--,level
, i.Name as name
, i.PurchaseCost as purchase_cost
, i.PurchaseDesc as purchase_description
--,purchase_tax_included
, i.QtyOnHand as quantity_on_hand
--,sales_tax_included
--,stock_keeping_unit
--,sub_item
, i.SyncToken as sync_token
, i.Taxable as taxable
, i.TrackQtyOnHand as track_quantity_on_hand
--,type
, i.UnitPrice as unit_price
, im.LastUpdatedTime as updated_at
--, Type
--, i.domain
--, i.patternProperties
from {{ source('quickbook', 'items') }} i
left join {{ source('quickbook', 'items_AssetAccountRef') }} ia
on i._airbyte_items_hashid = ia._airbyte_items_hashid
left join {{ source('quickbook', 'items_ExpenseAccountRef') }} ie
on i._airbyte_items_hashid = ie._airbyte_items_hashid
left join {{ source('quickbook', 'items_IncomeAccountRef') }} iia
on i._airbyte_items_hashid = iia._airbyte_items_hashid
left join {{ source('quickbook', 'items_MetaData') }} im
on i._airbyte_items_hashid = im._airbyte_items_hashid
order by i.id