with posts as (

    select

      post_pk,
      accepted_answer_nk,
      last_editor_nk,
      owner_nk,
      parent_nk,
      topic_set_fk,

      community_owned_ts,
      creation_ts,
      last_activity_ts,
      last_edit_ts,

      answer_count,
      comment_count,
      score,
      view_count,
      favorite_count

      from {{  ref('tfm_posts')  }}

),

final as (

    select * from posts

)

select * from final

{% if target.name == 'dev' %}
LIMIT 500
{% endif %}
