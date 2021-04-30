select
postId,
parentId,
postType,
title,
acceptedAnswerId
from
  ${ref("_posts")}