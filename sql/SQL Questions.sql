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
---SELECT Name FROM Customers WHERE ReferredBy IS NULL OR ReferredBy  NOT IN (2);
---SELECT Name FROM Customers WHERE ReferredBy IS NULL OR ReferredBy  <> 2;
---SQL Server uses three-valued logic - TRUE, FALSE and UNKNOWN. Anything compared to NULL evaluates to the third value in three-valued logic: UNKNOWN.
---The third query will also fail as ANYTHING (even NULL) compared to NULL will evalute to UNKNOWN.
---SQL provides the IS NULL and IS NOT NULL operators to specifically check for NULL.
---

---Problem 3 -

---Explanation
---
