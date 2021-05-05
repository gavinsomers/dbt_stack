with source as (

    select * from {{ source('stackoverflow','badges' ) }}

),

final as (

    select

      cast(id as numeric) as badges_pk,
      cast(user_id as numeric) as user_nk,

      date as date_ts,

      name,
      cast(class as numeric) as class,
      cast(tag_based as boolean) as tag_based

    from source

)

select * from final
