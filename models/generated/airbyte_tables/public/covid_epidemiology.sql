{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('key') }},
    {{ adapter.quote('date') }},
    new_tested,
    new_deceased,
    total_tested,
    new_confirmed,
    new_recovered,
    total_deceased,
    total_confirmed,
    total_recovered,
    _airbyte_emitted_at,
    _airbyte_covid_epidemiology_hashid
from {{ ref('covid_epidemiology_ab3') }}
-- covid_epidemiology from {{ source('public', '_airbyte_raw_covid_epidemiology') }}

