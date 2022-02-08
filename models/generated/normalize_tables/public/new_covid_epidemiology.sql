{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('key') }},
    {{ adapter.quote('date') }},
    new_tested,
    cast(new_deceased as integer),
    total_tested,
    new_confirmed,
    new_recovered
  
from {{ ref('covid_epidemiology_ab3') }}
-- covid_epidemiology from {{ source('public', '_airbyte_raw_covid_epidemiology') }}

