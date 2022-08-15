with dashboards as (
  select *
  from {{ ref('stg_metabase__report_dashboards')}}
)

select 
    id,
    name,
    description,
    archived,
    created_at,
    updated_at
from dashboards
