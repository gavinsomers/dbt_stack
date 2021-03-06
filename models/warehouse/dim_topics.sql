with topics as (

    select

      topic_fk as topic_pk,
      topic

    from {{  ref('bridge_topics')  }}

    group by 1,2

),

final as (

    select * from topics

)

select * from final

{% if target.name == 'dev' %}
LIMIT 500
{% endif %}
