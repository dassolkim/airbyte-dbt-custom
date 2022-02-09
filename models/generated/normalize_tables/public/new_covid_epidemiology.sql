{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('key') }},
    cast({{ adapter.quote('date') }} as date),
    cast(new_tested as bigint),
    cast(new_deceased as integer),
    cast(total_tested as bigint),
    new_confirmed,
    new_recovered
   
  
from {{ ref('covid_epidemiology_ab3') }}
-- covid_epidemiology from {{ source('public', '_airbyte_raw_covid_epidemiology') }}

