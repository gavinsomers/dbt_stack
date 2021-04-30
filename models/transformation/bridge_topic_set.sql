with b as

(select row_number() over() topicSetId, topicSet
from ${ref('_posts')}
group by topicSet
order by topicSetId),

c as
(select topicSetId,topicSet,split(topicSet,'|') topics
from b),

d as
(select row_number() over() id,topicSetid,topicSet, topic
from c,unnest(c.topics) topic)

select d.* except(topic),topicId
from d
left join ${ref('dim_topics')} e
on d.topic = e.topic