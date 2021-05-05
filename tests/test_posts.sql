{{
    config(
        severity='warn'
    )
}}

with dim_posts as (

    SELECT

      "post" as row_type,
      count(*) as count

    FROM {{ ref('dim_posts') }}

),

stg_questions as (

    select

      "question" as row_type,
      - count(*) as count

    FROM {{  ref('stg_questions')  }}

),

stg_answers as (

    SELECT

      "answer" as row_type,
      count(*) as count

    FROM {{  ref('stg_answers')  }}

),

final as (

    select * from dim_posts

    union all

    select * from stg_questions

    union all

    select * from stg_answers

)

select sum(count) num from final

having sum(count) != 0
