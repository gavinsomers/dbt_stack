with source as (

    select * from {{ source('stackoverflow','posts_questions' ) }}

),

base as (

    select 

      cast(id as numeric) as answer_natural_key,
      cast(accepted_answer_id as numeric) as accepted_answer_natural_key,
      cast(last_editor_user_id as numeric) as last_editor_natural_key,
      cast(owner_user_id as numeric) as owner_natural_key,
      cast(parent_id as numeric) as parent_natural_key,
      cast(post_type_id as numeric) as post_type_natural_key,

      community_owned_date as community_owned_ts,
      creation_date as creation_ts,
      last_activity_date as last_activity_ts,
      last_edit_date as last_edit_ts,

      title,
      body,
      last_editor_display_name,
      owner_display_name,
      tags,

      cast(answer_count as numeric) as answer_count,
      cast(comment_count as numeric) as comment_count,
      cast(score as numeric) as score,
      cast(view_count as numeric) view_count,
      cast(favorite_count as numeric) as favorite_count


    from source

)

select * from base
