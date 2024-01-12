/*
4.3 Query 3 Write a SQL query that outputs the article number, article author and article pages for the articles which have not been read for more
than 20 minutes by any subscriber who has the string 'er' (with that capitalization) appearing anywhere in their name. No duplicates should appear
in your result.
*/

SELECT DISTINCT a.articleNum, a.articleAuthor, a.articlePage
FROM Articles a
WHERE NOT EXISTS ( SELECT *
                   FROM ReadArticles ra, Subscribers s
                   WHERE ra.subscriberPhone = s.subscriberPhone
                     AND s.subscriberName LIKE '%er%'
                     AND ra.editionDate = a.editionDate
                     AND ra.articleNum = a.articleNum
                     AND ra.readInterval > INTERVAL '20 minutes' );

