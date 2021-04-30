with source as (

    select * from {{ source('stackoverflow','users' ) }}

),

base as (

    select 

      cast(id as user_natural_key,

      last_access_date as last_access_ts,
      creation_date as creation_ts,

      display_name,
      about_me,
      location,
      profile_image_url,
      website_url
      up_votes,
      
      cast(down_votes as numeric) as down_votes,
      cast(views as numeric) as views,
      cast(reputation as numeric) as reputation,
      cast(age as numeric) as age
      

    from source

)

select * from base