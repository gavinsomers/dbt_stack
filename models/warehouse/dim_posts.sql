with posts as (

    select

      post_pk,
      title,
      body,
      post_type

    from {{  ref('tfm_posts')  }}

),

final as (

    select * from posts

)

select * from final

{% if target.name == 'dev' %}
LIMIT 500
{% endif %}
