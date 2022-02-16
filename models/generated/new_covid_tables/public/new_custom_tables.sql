{{ config(
    schema = "public",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('covid_data_ab3') }}
select
    {{ adapter.quote('key') }},
    cast({{ adapter.quote('date') }} as date),
    cast(new_tested as bigint),
    cast(new_deceased as integer),
    cast(total_tested as bigint),
    cast(new_confirmed as bigint),
    new_recovered,
    total_deceased,
    -- cast(new_recovered as bigint),
    -- cast(total_deceased as bigint),
    -- create new column 
    {{ current_timestamp() }} as created,
    {{ current_timestamp() }} as updated
from {{ ref('covid_data_ab3') }}
-- covid_data from {{ source('public', '_airbyte_raw_covid_data') }}

