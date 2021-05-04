with topic_map as

    (
      select

        topic_set,
        split(topic_set,"|") as topics

      FROM {{ref('stg_questions')}}

      where topic_set is not null

      group by 1
      
    ),

final as

    (
      select

        {{  dbt_utils.surrogate_key('topic_set')  }} topic_set_fk,
        {{  dbt_utils.surrogate_key('topic')  }} as topic_fk,
        topic_set,
        topic

      from topic_map, unnest(topic_map.topics) as topic
    )

select  * from final
