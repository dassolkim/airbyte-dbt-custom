{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('new_custom_tables_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        adapter.quote('key'),
        adapter.quote('date'),
        'created',
        'updated',
        'new_tested',
        'new_deceased',
        'total_tested',
        'new_confirmed',
        'new_recovered',
        'total_deceased',
    ]) }} as _airbyte_new_custom_tables_hashid,
    tmp.*
from {{ ref('new_custom_tables_ab2') }} tmp
-- new_custom_tables
where 1 = 1

