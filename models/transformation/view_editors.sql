select 
id lastEditorId,
userId lastEditorUserId,
displayName lastEditorDisplayName,
location lastEditorLocation,
age lastEditorAge
from 
  ${ref("dim_users")}