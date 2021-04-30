with source as (

    select * from {{ source('stackoverflow','badges' ) }}

),

base as (

    select

      cast(id as numeric) as badges_natural_key,
      cast(user_id as numeric) as user_natural_key,

      date as date_ts,

      name,
      cast(class as numeric) as class,
      cast(tag_based as boolean) as tag_based

    from source

)

select * from base