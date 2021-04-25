/*
 * Count the number of tweets that use #coronavirus
 */

SELECT COUNT(DISTINCT data -> 'id') FROM tweets_jsonb
WHERE ((data -> 'extended_tweet'::text -> 'entities'::text) -> 'hashtags'::text) @> '[{"text": "coronavirus"}]' OR
   ((data -> 'entities'::text) -> 'hashtags'::text) @> '[{"text": "coronavirus"}]';
