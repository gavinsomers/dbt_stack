with a as
(select split(topicSet,"|") topicSet
FROM ${ref('_posts')}
where topicSet is not null
)

select  row_number() over() topicId,topic
from a,unnest(a.topicSet) topic
group by topic
order by topicId