---Problem 1 - What will the query return? Correct it.
SELECT * FROM runners where runners.id NOT IN (SELECT winner_id FROM races);
---Explanation
---SELECT * FROM runners where runners.id NOT IN (SELECT winner_id FROM races where winner_id IS NOT NULL);
---NOT IN (NULL) evalutes to UNKNOWN with default ANSI_NULLS ON setting
---ANSI_NULLS should not be set to OFF - Bad Practise and will lead to other problems
---

---Problem 2 - What will be the result of the following Queries? What is a better way to write it
SELECT Name FROM Customers WHERE ReferredBy NOT IN (2);
SELECT Name FROM Customers WHERE ReferredBy <> 2;
SELECT Name FROM Customers WHERE ReferredBy = NULL OR ReferredBy <> 2;
---Explanation
---