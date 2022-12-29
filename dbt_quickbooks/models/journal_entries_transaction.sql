{{ config(materialized='table') }}

with cte_journal_entries as (
select *
from
{{ ref('journal_entries_stg') }}
)
, cte_journal_entries_line as (
select *
from {{ ref('journal_entries_line_stg') }}
)

select
journal_entry_id
,currency_id
,currency_name
,exchange_rate
,adjustment
,doc_number
,private_note
,created_at
,updated_at
,sync_token
,transaction_date
,tax_rate_id
,tax_rate_name
,journal_entries_line_Id
,journal_entries_line_amount
,detail_type
,description
,account_id
,account_name
,posting_type
from cte_journal_entries
left join cte_journal_entries_line
on cte_journal_entries._airbyte_journal_entries_hashid = cte_journal_entries_line._airbyte_journal_entries_hashid