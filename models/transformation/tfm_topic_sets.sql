with topic_map as

    (

      select

        topic_set_fk as topic_set_pk,
        topic_set

      FROM {{  ref('tfm_posts')  }}

      where topic_set is not null

      group by 1,2

    ),

final as

    (

    select * from topic_map

    )

select  * from final
