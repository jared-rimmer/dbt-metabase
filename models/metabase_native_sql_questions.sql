with report_cards as (
  select *
  from {{ ref('stg_metabase__report_cards')}}
)

select 
  id,
  name,
  description,
  display,
  creator_id,
  database_id,
  table_id,
  query_type,
  archived

from report_cards
where query_type = 'native'
