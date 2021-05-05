with topic_map as

    (

      select

        topic_set_fk as topic_set_pk,
        topic_set,
        split(topic_set,"|") as topics

      FROM {{  ref('tfm_posts')  }}

      where topic_set is not null

    ),

final as

    (

      select

        topic_set_pk,
        {{  dbt_utils.surrogate_key('topic')  }} as topic_fk,
        topic_set,
        topic

      from topic_map, unnest(topic_map.topics) as topic

      group by 1,2,3,4

    )

select  * from final
