with posts as (

    select

      * except(answer_nk),
      answer_nk as post_pk

    from {{  ref('stg_answers')  }}

    union all

    select

      * except(question_nk),
      question_nk as post_pk

    from {{  ref('stg_questions')  }}

),

final as (

    select

      *,
      case when post_type_nk = 1 then "question" else "answer" end as post_type

    from posts

)

select * from final
