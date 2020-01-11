---Notes Start---

---What is the dual TABLE in oracle? 
---The DUAL table is a special one-row, one-column table present by default in Oracle and other database installations. 
---In Oracle, the table has a single VARCHAR2(1) column called DUMMY that has a value of 'X'. 
---It is suitable for use in selecting a pseudo column such as SYSDATE or USER.

---What is TRUNCATE clause?
---Use TRUNCATE (drops all rows without deleting table) instead of DROP to drop tables

---What is the Exists clause?
---

---Notes End---

---Problem 1
---What will the query return? Correct it.
SELECT * FROM runners where runners.id NOT IN (SELECT winner_id FROM races);
---Explanation
SELECT * FROM runners where runners.id NOT IN (SELECT winner_id FROM races where winner_id IS NOT NULL);
---NOT IN (NULL) evalutes to UNKNOWN with default ANSI_NULLS ON setting
---ANSI_NULLS should not be set to OFF - Bad Practise and will lead to other problems
---

---Problem 2
---What will be the result of the following Queries? What is a better way to write it
SELECT Name FROM Customers WHERE ReferredBy NOT IN (2);
SELECT Name FROM Customers WHERE ReferredBy <> 2;
SELECT Name FROM Customers WHERE ReferredBy = NULL OR ReferredBy <> 2;/
---Explanation
SELECT Name FROM Customers WHERE ReferredBy IS NULL OR ReferredBy  NOT IN (2);/
---SELECT Name FROM Customers WHERE ReferredBy IS NULL OR ReferredBy  <> 2;
---SQL Server uses three-valued logic - TRUE, FALSE and UNKNOWN. Anything compared to NULL evaluates to the third value in three-valued logic: UNKNOWN.
---The third query will also fail as ANYTHING (even NULL) compared to NULL will evalute to UNKNOWN.
---SQL provides the IS NULL and IS NOT NULL operators to specifically check for NULL.
---

---Problem 3
---From the Invoices table show the Invoice ID, the billing date, the customer’s name, and the name of the customer who referred that customer (if any). 
---The list should be ordered by billing date
---Explanation
SELECT
  i.id as Invoice_Id, 
  i.BillingDate as Billing_Date,
  c1.name as Customer_Name,
  c2.name as Reffered_By
FROM
  Invoices i
INNER JOIN
  Customers c1 ON c1.id=i.id
LEFT JOIN
  Customers c2 ON c1.ReferredBy=c2.id
ORDER BY i.BillingDate ASC;
---Same table with different alias can be joined multiple times as per the requirement
---INNER JOIN on the first JOIN condition to retrive only those invoices which have a customer
---LEFT  JOIN on the first JOIN condition to retrive all invoices irrespective of customer present or not
---

---Problem 4
---How many rows will be displayed in the following SQL query
SELECT * FROM Invoices,Customers;
---Explanation
SELECT (SELECT  COUNT(*) from Invoices) * (SELECT COUNT(*) FROM Customers) as Total_Rows FROM dual;
---The query will return a CARTESIAN PRODUCT or CROSS JOIN when WHERE clause is ommited
---

---Problem 5
---Write a query to fetch invoices that do not have a customer without using the NOT keyword
SELECT 
  * 
FROM 
  Invoices i
LEFT JOIN
  Customers c ON i.id=c.id
WHERE
  c.id IS NULL;
---Explanation
---We can have WHERE conditions on the joined columns. This way we can filter based on the joined tables
---

---Problem 6
---For the Binary_Values table write a query to return 2 where the val is 0 and 3 where the val is 1
SELECT 
  CASE 
    WHEN val=0 THEN val+2
    ELSE val+3 
  END 
  as updated_val 
FROM 
  Binary_Values;
---Explanation
---Do not forget END keyword for case statements
---

---Problem 7
---Write SQL query to find the 4th highest employee salary from the Employees table
SELECT * FROM (
    SELECT * FROM (
        SELECT * FROM Employees ORDER BY salary DESC
    )  WHERE ROWNUM <= 4 ORDER BY salary ASC
) WHERE ROWNUM = 1;
---Explanation
---First we select all the employees and order by salary descending.
--- Then we get the top 4 from the sorted using WHERE ROWNUM <= 4 and order by salary ascending.
---Then we select ROWNUM = 1 to get desired employee
---This complex procedure is required in Oracle as it does not have offset and limit or top concepts found in other databases.
---ROWNUM is only useful for comparing = 1, < something or <= something. Eg. ROWNUM = 3 will not work.
---ROWNUM are assigned temporarily and sequentially to the rows that are fetched and returned. If the row is not returned the assigned value is tossed away.
--- https://stackoverflow.com/a/9679099
---

---Problem 8
---Write a query usning UNION ALL to return names from Customers and Employees tables and use WHERE clause to eliminate duplicates

---Explanation









