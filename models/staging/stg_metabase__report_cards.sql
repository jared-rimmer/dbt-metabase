with source as (

  select * from {{ var('report_card') }}

),

renamed as (

  select
    /* Cards are called questions in the Metabase UI
       Changed terminology to relect this */
    id as question_id,
    name as question_name,
    description as question_description,
    
    display as display_type,
    dataset_query,    
    query_type,
    visualization_settings,
    cache_ttl,
    result_metadata,
    collection_position,
    embedding_params,
    parameters,
    parameter_mappings,
    creator_id,
    database_id,
    table_id,
    collection_id,
    public_uuid,
    made_public_by_id,
    entity_id,
    archived as is_archived,
    enable_embedding as is_embedding_enabled,
    dataset as is_dataset,
    collection_preview as is_collection_preview,
    created_at,
    updated_at
  
  from source

)

select * from renamed