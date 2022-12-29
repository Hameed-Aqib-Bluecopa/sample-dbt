{{ config(materialized='view') }}

with cte_journal_entries as
(
select distinct
j._airbyte_journal_entries_hashid
,j.Id as journal_entry_id
,jc.value as currency_id
,jc.name as currency_name
,j.ExchangeRate as exchange_rate
,j.Adjustment as adjustment
,j.DocNumber as doc_number
--  as total_amount
--  as home_total_amount
,j.PrivateNote as private_note
,jm.CreateTime as created_at
,jm.LastUpdatedTime as updated_at
,j.SyncToken as sync_token
,j.TxnDate as transaction_date
--  as total_tax
--  as tax_code_id
,jt.value as tax_rate_id
,jt.name as tax_rate_name
-- ,j.domain
from {{ source('quickbook', 'journal_entries') }} j
left join {{ source('quickbook', 'journal_entries_CurrencyRef') }} jc
on j._airbyte_journal_entries_hashid = jc._airbyte_journal_entries_hashid
left join {{ source('quickbook', 'journal_entries_MetaData') }} jm
on j._airbyte_journal_entries_hashid = jm._airbyte_journal_entries_hashid
left join {{ source('quickbook', 'journal_entries_TaxRateRef') }} jt
on j._airbyte_journal_entries_hashid = jt._airbyte_journal_entries_hashid
)

select *
from cte_journal_entries