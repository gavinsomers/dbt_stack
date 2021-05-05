with topic_sets as (

    select

      topic_set_pk as topic_set_fk,
      split(topic_set,"|") as topics

    from {{  ref('dim_topic_sets')  }}

),

final as (

    SELECT

      topic_set_fk,
      {{  dbt_utils.surrogate_key('topic')  }} as topic_fk,
      topic

    FROM topic_sets, unnest(topic_sets.topics) topic

    group by 1,2,3

)

select * from final
