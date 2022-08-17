{{ config(
  enabled=false
) }}

select * from {{ var('permissions_group_members') }}