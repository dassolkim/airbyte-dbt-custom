{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('key') }},
    cast({{ adapter.quote('date') }} as timestamp),
    cast(new_tested as bigint),
    cast(new_deceased as integer),
    cast(total_tested as bigint),
    cast(new_confirmed as bigint),
    cast(new_recovered as bigint)
   
  
from {{ ref('covid_epidemiology_ab3') }}
-- covid_epidemiology from {{ source('public', '_airbyte_raw_covid_epidemiology') }}

