with source as (

  select * from {{ var('core_user') }}

),

renamed as (

  select
    
    id as user_id,
    email as user_email,
    first_name,
    last_name,
    is_superuser,
    is_active,
    is_qbnewb as is_query_builder_newbie,
    is_datasetnewb as is_dataset_newbie,
    google_auth as has_google_auth,
    ldap_auth as has_ldap_auth,
    reset_token,
    reset_triggered,
    login_attributes,
    sso_source,
    locale,
    settings,
    date_joined as joined_at,
    last_login as last_login_at,
    updated_at

  from source

)

select * from renamed