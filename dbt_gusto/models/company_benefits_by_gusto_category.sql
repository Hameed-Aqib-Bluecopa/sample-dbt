{{ config(materialized='table') }}

select id
, name
, pretax
, imputed
, posttax
, category
, healthcare
, retirement
, description
, benefit_type
, yearly_limit
from Gusto.company_benefits_by_gusto