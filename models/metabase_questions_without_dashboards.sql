
with report_cards as (
  select *
  from {{ ref('stg_metabase__report_cards')}}
),

report_dashboard_cards as (
    select *
    from {{ ref('stg_metabase__report_dashboard_cards')}}
)

select
    report_cards.id,
    report_cards.name,
    report_cards.description,
    report_cards.display,
    report_cards.query_type
from report_cards
left join report_dashboard_cards
    on report_dashboard_cards.card_id = report_cards.id
where report_cards.archived is false 
and report_dashboard_cards.id is null