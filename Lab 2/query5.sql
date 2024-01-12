/*
4.5 Query 5 For each article in the Articles table, articleAuthor gives the name of the author, and editionDate specifies the edition in which the
article appears.  There could be a subscriber who has the same name as an article author. Write a SQL query that finds the subscriber name,
and subscriber address and edition whenever that subscriber's name appears as the author of more than one article which is in that edition.
The attributes in your result should appear as theSubscriberName, theSubscriberAddress and theEditionDate.  No duplicates should appear in your result.
*/

SELECT DISTINCT sr.subscriberName AS theSubscriberName, sr.subscriberAddress AS theSubscriberAddress, a1.editionDate AS theEditionDate
FROM Subscribers sr, Articles a1, Articles a2
WHERE sr.subscriberName = a1.articleAuthor
  AND sr.subscriberName = a2.articleAuthor
  AND a1.editionDate = a2.editionDate
  AND a1.articleNum <> a2.articleNum;

-- OR could be

SELECT DISTINCT sr.subscriberName AS theSubscriberName, sr.subscriberAddress AS theSubscriberAddress, e.editionDate AS theEditionDate
FROM Subscribers sr, Editions e
WHERE ( SELECT COUNT(*)
        FROM Articles a
        WHERE a.editionDate = e.editionDate
          AND a.articleAuthor = sr.subscriberName ) >= 2;
