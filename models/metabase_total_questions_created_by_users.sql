with report_cards as (
  select *
  from {{ ref('stg_metabase__report_cards')}}
),

users as (
  select *
  from {{ ref('stg_metabase__core_users')}}
)

select 
  count(report_cards.id) as total_questions_created,
  users.first_name,
  users.last_name,
  users.email
from report_cards
left join users
  on report_cards.creator_id = users.id
group by
  users.first_name,
  users.last_name,
  users.email