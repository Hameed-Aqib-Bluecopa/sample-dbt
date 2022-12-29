{{ config(materialized='view') }}

with cte_journal_entries_line as
(
select distinct
jl._airbyte_journal_entries_hashid
,jl.Id as journal_entries_line_Id
,jl.Amount as journal_entries_line_amount
,jl.DetailType as detail_type
,jl.Description as description
,jla.value as account_id
,jla.name as account_name
,jld.PostingType as posting_type
from {{ source('quickbook', 'journal_entries_Line') }} jl
left join {{ source('quickbook', 'journal_entries_Line_JournalEntryLineDetail') }} jld
on jl._airbyte_Line_hashid = jld._airbyte_Line_hashid
left join {{ source('quickbook', 'journal_entries_Line_JournalEntryLineDetail_AccountRef') }} jla
on jld._airbyte_JournalEntryLineDetail_hashid = jla._airbyte_JournalEntryLineDetail_hashid
)

select *
from cte_journal_entries_line