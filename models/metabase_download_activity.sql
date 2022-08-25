with query_executions as (
  select *
  from {{ ref('stg_metabase__query_executions')}}
),

report_cards as (
  select *
  from {{ ref('stg_metabase__report_cards')}}
),

report_dashboards as (
  select *
  from {{ ref('stg_metabase__report_dashboards')}}
),

databases as (
  select *
  from {{ ref('stg_metabase__databases')}}
),

core_users as (
  select *
  from {{ ref('stg_metabase__core_users')}}
)

select 
  query_executions.id,
  query_executions.context,
  query_executions.running_time,
  query_executions.result_rows,
  query_executions.native,
  query_executions.pulse_id,

  report_cards.name as card_name,
  report_dashboards.name as dashboard_name,
  databases.name as database_name,
  core_users.first_name,
  core_users.last_name
 
from query_executions
left join report_cards
  on query_executions.card_id = report_cards.id
left join report_dashboards
  on query_executions.dashboard_id = report_dashboards.id
left join databases
  on query_executions.database_id = databases.id
left join core_users
  on query_executions.executor_id = core_users.id
where query_executions.context in ('xlsx-download', 'csv-download')
