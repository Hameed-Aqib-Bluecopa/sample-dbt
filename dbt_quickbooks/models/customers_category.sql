{{ config(materialized='table') }}

select distinct
cast(c.id as {{ dbt.type_string() }}) as customer_id
, ccr.value as currency_id
, ccr.name as currency_name
, cpmr.value as payment_method_id
, cpmr.name as payment_method_name
, csa.Id as ship_address_Id
-- , csa.Lat as ship_address_Lat
-- , csa.Long as ship_address_Long
, csa.City as ship_address_City
, csa.Line1 as ship_address_Line1
, csa.Country as ship_address_Country
, csa.PostalCode as ship_address_PostalCode
, csa.CountrySubDivisionCode as ship_address_CountrySubDivisionCode
, cba.Id as bill_address_Id
-- , cba.Lat as bill_address_Lat
-- , cba.Long as bill_address_Long
, cba.City as bill_address_City
, cba.Line1 as bill_address_Line1
, cba.Country as bill_address_Country
, cba.PostalCode as bill_address_PostalCode
, cba.CountrySubDivisionCode as bill_address_CountrySubDivisionCode
, cdtcr.value as default_tax_code_id
, cdtcr.name as default_tax_code_name
, cstr.name as sales_term_id
, cstr.value as sales_term_value
--,ar_account_id
, c.FamilyName as family_name
, c.FullyQualifiedName as fully_qualified_name
, c.GivenName as given_name
, c.CompanyName as company_name
, c.BillWithParent as bill_with_parent
, c.PreferredDeliveryMethod as prefered_delivery_method
, c.DisplayName as display_name
, c.ResaleNum as resale_number
, c.Job as job
, cpea.Address as email
--,notes
, cwa.URI as website
, cpp.FreeFormNumber as phone_number
, c.PrintOnCheckName as print_on_check_name
--,title
, c.MiddleName as middle_name
--,open_balance_date
, cm.FreeFormNumber as mobile_number
, cpr.value as Parent_customer_id
, c.Active as active
--,suffix
, c.BalanceWithJobs as balance_with_jobs
, c.Level as level
, cf.FreeFormNumber as fax_number
, c.Balance as balance
, c.Taxable as taxable
, cmd.CreateTime as created_at
, cmd.LastUpdatedTime as updated_at
, c.SyncToken as sync_token
--,tax_excemption_reason_id
--,alternate_phone_number
--, c.domain
from {{ source('quickbook', 'customers') }} c
left join {{ source('quickbook', 'customers_BillAddr') }} cba
on c._airbyte_customers_hashid = cba._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_CurrencyRef') }} ccr
on c._airbyte_customers_hashid = ccr._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_DefaultTaxCodeRef') }} cdtcr
on cdtcr._airbyte_customers_hashid = c._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_Fax') }} cf
on cf._airbyte_customers_hashid = c._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_MetaData') }} cmd
on cmd._airbyte_customers_hashid = c._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_Mobile') }} cm
on cm._airbyte_customers_hashid = c._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_ParentRef') }} cpr
on cpr._airbyte_customers_hashid = c._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_PaymentMethodRef') }} cpmr
on cpmr._airbyte_customers_hashid = c._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_PrimaryEmailAddr') }} cpea
on cpea._airbyte_customers_hashid = c._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_PrimaryPhone') }} cpp
on cpp._airbyte_customers_hashid = c._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_SalesTermRef') }} cstr
on cstr._airbyte_customers_hashid = c._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_ShipAddr') }} csa
on csa._airbyte_customers_hashid = c._airbyte_customers_hashid
left join {{ source('quickbook', 'customers_WebAddr') }} cwa
on cwa._airbyte_customers_hashid = c._airbyte_customers_hashid
order by c.id