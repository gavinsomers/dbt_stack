with source as (

    select * from {{ source('stackoverflow','users' ) }}

),

final as (

    select

      cast(id as numeric) user_pk,

      last_access_date as last_access_ts,
      creation_date as creation_ts,

      display_name,
      about_me as description,
      location,
      profile_image_url,
      website_url,

      cast(up_votes as numeric) as up_votes,
      cast(down_votes as numeric) as down_votes,
      cast(views as numeric) as views,
      cast(reputation as numeric) as reputation,
      cast(age as numeric) as age

    from source

)

select * from final
