with badges as (

    select * from {{  ref('stg_badges')  }}

),

final as (

    select * from badges

)

select * from final

{% if target.name == 'dev' %}
LIMIT 500
{% endif %}
