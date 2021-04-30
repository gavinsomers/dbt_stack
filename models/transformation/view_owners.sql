select 
id ownerId,
userId ownerUserId,
displayName ownerDisplayName,
location ownerLocation,
age ownerAge
from 
  ${ref("dim_users")}