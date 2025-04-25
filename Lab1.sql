-- 1. Write a query to return the title, the number of checkouts, creator, and publication year of
-- Audiobooks that were published in 2020.

SELECT Title, Checkouts, Creator, PublicationYear
FROM Works
WHERE MaterialType = 'AUDIOBOOK' AND PublicationYear = 2020;

-- 2. a) Write a query to list the title, number of checkouts, and publication year of the most
-- popular works (i.e., those works that have been checked out at least 1000 times).
-- b) Based on your query results, what can we say about the data in the database?
-- c) How might we modify our query to address this problem?
-- 3. Write a query to return the title, creator, publication year of works that contain the works
-- “Harry Potter” in the title.
-- 4. Write a query to return the title and creator for works checked out between 2021 and
-- 2023 that have at least 50 checkouts. Your query output should be presented with no
-- duplicates of work titles.
-- 5. Write a query to display the titles and publishers of works with a Publisher name ending
-- in "Co.".
-- 6. Write a query to return the checkout month and the number of distinct work titles
-- checked out monthly. Name the new column ‘DistinctTitles’.
-- 7. Write a query to return the title and the number of checkouts for the work with the
-- highest number of checkouts.
-- 8. Write a query to display the title, publisher and the publication year for works published
-- by either Chapman & Hall or The Russian Messenger whose publication year is before
-- 2000. Present the output in a descending order of years.
-- 9. Write a query to display the title, and checkouts of all works that have more checkouts
-- than the average number of checkouts across all works
