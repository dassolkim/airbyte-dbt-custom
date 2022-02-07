{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('key'),
        adapter.quote('date'),
        'new_tested',
        'new_deceased',
        'total_tested',
        'new_confirmed',
        'new_recovered',
        'total_deceased',
        'total_confirmed',
        'total_recovered',
    ]) }} as _airbyte_covid_data_hashid
from {{ ref('covid_data_ab2') }}
-- covid_data

