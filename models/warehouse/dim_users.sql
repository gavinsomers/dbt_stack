select
  row_number() over() id,
  id as userId,
  display_name displayName,
  location,
  cast(age as int64) age
from
  {{ ref('stg_users') }}
  order by id