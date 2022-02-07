select
    {{ adapter.quote('key') }},
    {{ adapter.quote('date') }},
    new_tested,
    cast(new_deceased as integer),
    total_tested,
    new_confirmed,
    new_recovered,
    cast(total_deceased as integer),
    total_confirmed,
    total_recovered,
from {{ ref('covid_data') }}