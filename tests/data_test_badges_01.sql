{{
    config(
        severity='warn'
    )
}}

SELECT id,count(*) cnt

FROM {{ ref('stg_badges') }}

group by 1

having cnt =1
