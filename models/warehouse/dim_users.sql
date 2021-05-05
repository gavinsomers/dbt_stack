with users as (

    select

      user_pk,
      display_name,
      description,
      location,
      profile_image_url,
      age,

      up_votes,
      down_votes,
      reputation

   from {{  ref('stg_users')  }}

),

final as (

    select * from users

)

select * from final

{% if target.name == 'dev' %}
LIMIT 500
{% endif %}
