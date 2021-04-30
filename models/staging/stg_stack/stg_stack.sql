with source as (

    select * from {{ source('stackoverflow','posts_questions' ) }}

),

final as (

    select * from source

)

select * from final
