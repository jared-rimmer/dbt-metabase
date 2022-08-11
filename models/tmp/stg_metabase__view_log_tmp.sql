-- select * from {{ source('metabase', 'view_log') }}
select * from {{ var('view_log') }}