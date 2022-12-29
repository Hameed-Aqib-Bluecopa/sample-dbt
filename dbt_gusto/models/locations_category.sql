{{ config(materialized='table') }}

select id
,uuid
,street_1
,street_2
,city
,state
,country
,zip
,active
,version
,company_id
,company_uuid
,phone_number
,filing_address
,mailing_address
from Gusto.locations