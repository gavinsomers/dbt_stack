with topics as (

    select

      topic_fk as topic_pk,
      topic

    from {{  ref('tfm_bridge_topics')  }}

    group by 1,2

),

final as (

    select * from topics

)

select * from final
