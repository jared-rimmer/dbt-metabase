with dashboards as (
  select *
  from {{ ref('stg_metabase__report_dashboard_tmp')}}
)

select 
    id,
    name,
    description,
    archived,
    created_at,
    updated_at
from dashboards
