/*
4.1 Query 1 The Editions table has attribute which specify the date of that edition, the number of articles in that edition and the number of pages in
that edition.  But database systems don't understand English; obvious English constraints about values (like article numbers and page numbers) aren't
enforced unless databases and applications enforce them. Write a SQL query which finds the editionDate of editions which have at least one article
whose article number is more than the number of articles in that edition, and whose page number is more than the number of pages in that edition.
The attribute in your result should appear as theEditionDate.  No duplicates should appear in your result.
*/


SELECT DISTINCT e.editionDate AS theEditionDate
FROM Editions e, Articles a
WHERE a.editionDate = e.editionDate
  AND a.articleNum > e.numArticles
  AND a.articlePage > e.numPages;

-- OR could be

SELECT e.editionDate AS theEditionDate
FROM Editions e
WHERE EXISTS ( SELECT *
               FROM Articles a
               WHERE a.editionDate = e.editionDate
                 AND a.articleNum > e.numArticles
                 AND a.articlePage > e.numPages );

