with report_cards as (
  select *
  from {{ ref('stg_metabase__report_cards')}}
)

select 
    id,
    name,
    description,
    archived,
    display,
    query_type,
    creator_id,
    database_id,
    table_id,
    created_at,
    updated_at
from report_cards
