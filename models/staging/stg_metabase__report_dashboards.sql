with source as (

  select * from {{ var('report_dashboard') }}

),

renamed as (

  select

    id as dashboard_id,
    name as dashboard_name,
    description as dashboard_description,
    parameters,
    points_of_interest,
    caveats,
    embedding_params,
    position,
    collection_position,
    creator_id,
    public_uuid,
    made_public_by_id,
    entity_id,
    collection_id,
    cache_ttl,
    archived as is_archived,
    show_in_getting_started as is_shown_in_getting_started,
    enable_embedding as is_embedding_enabled,
    created_at,
    updated_at
    
  from source
)

select * from renamed