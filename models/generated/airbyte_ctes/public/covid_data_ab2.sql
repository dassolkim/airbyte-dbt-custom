{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('key') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('key') }},
    cast({{ adapter.quote('date') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('date') }},
    cast(new_tested as {{ dbt_utils.type_float() }}) as new_tested,
    cast(new_deceased as {{ dbt_utils.type_float() }}) as new_deceased,
    cast(total_tested as {{ dbt_utils.type_float() }}) as total_tested,
    cast(new_confirmed as {{ dbt_utils.type_float() }}) as new_confirmed,
    cast(new_recovered as {{ dbt_utils.type_float() }}) as new_recovered,
    cast(total_deceased as {{ dbt_utils.type_float() }}) as total_deceased,
    cast(total_confirmed as {{ dbt_utils.type_float() }}) as total_confirmed,
    cast(total_recovered as {{ dbt_utils.type_float() }}) as total_recovered,
    _airbyte_emitted_at
from {{ ref('covid_data_ab1') }}
-- covid_data

