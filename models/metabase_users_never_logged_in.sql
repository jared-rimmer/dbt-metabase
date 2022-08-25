with core_users as (
  select *
  from {{ ref('stg_metabase__core_users')}}
)

select 
  id, 
  email, 
  first_name, 
  last_name
from core_users
where last_login is null