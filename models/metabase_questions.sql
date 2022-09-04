/* Cards are called questions in the Metabase UI
   Changed terminology to relect this */
with questions as (
  select *
  from {{ ref('stg_metabase__report_cards')}}
)

select * from questions
