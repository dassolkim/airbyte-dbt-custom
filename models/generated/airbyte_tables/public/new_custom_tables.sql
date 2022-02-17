{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "public",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('new_custom_tables_ab3') }}
select
    {{ adapter.quote('key') }},
    cast({{ adapter.quote('date') }} as date),
    new_tested,
    new_deceased,
    total_tested,
    cast(new_confirmed as float),
    new_recovered,
    total_deceased,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_new_custom_tables_hashid
from {{ ref('new_custom_tables_ab3') }}
-- new_custom_tables from {{ source('public', '_airbyte_raw_new_custom_tables') }}
where 1 = 1

