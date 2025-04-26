-- Yonie Isaiah Rivera Aguilar

-- (1) Inner JOIN Practice:
-- Given the dbo.Bank tables, inner join every table together in the comment block below.
-- (e.g. join the following tables together: Bank_Account, Bank_Branch, Bank_Customer,
-- Bank_Department, Bank_Employee, Bank_Transactions)
-- TODO: Complete the JOINing below.

Select * 
FROM Bank_Account AS ba
INNER JOIN Bank_Branch AS bb ON ba.OpenBranchId = bb.ID
INNER JOIN Bank_Customer AS bc ON ba.CustomerID = bc.ID
INNER JOIN Bank_Employee  AS be ON ba.OpenEmployeeId = be.ID
INNER JOIN Bank_Department AS bd ON be.DepartmentID = bd.ID
INNER JOIN Bank_Transactions AS bt ON bt.AccountID = ba.ID

-- (2.1) Self JOIN Bank_Employee with an "employee-supervisor" relationship
-- TODO: fill in the ...s
-- SELECT ... AS EmployeeName, ... AS EmployeeID, ... AS SupervisorID, ... AS SupervisorName
-- FROM Bank_Employee e1
-- JOIN Bank_Employee e2 ON ...;
 
SELECT
  e1.Name AS EmployeeName,
  e1.ID   AS EmployeeID,
  e1.SupervisorID,
  e2.Name AS SupervisorName
FROM Bank_Employee AS e1          
Inner JOIN Bank_Employee AS e2      
       ON e1.SupervisorID = e2.ID;

-- (2.2) Ordering matters (swap around e1 and e2 in JOIN).
-- TODO: fill in the ...s.
-- SELECT ... AS EmployeeName, ... AS EmployeeID, ... AS SupervisorID, ... AS SupervisorName
-- FROM Bank_Employee e1
-- JOIN Bank_Employee e2 ON ; -- Swap the references to e1 & e2 in ON, what is the
-- difference? Flips the Employee and the Supervisor names

Select 
  e1.Name AS EmployeeName,
  e1.ID   AS EmployeeID,
  e1.SupervisorID,
  e2.Name AS SupervisorName
From Bank_Employee as e1
Inner Join Bank_Employee as e2
    on e2.SupervisorID = e1.ID

-- (2.3) Take the code that we had for 2.1, but let's try an outer join.
-- How does the result differ compared to inner join? When might we want to use it?

SELECT
  e1.Name AS EmployeeName,
  e1.ID   AS EmployeeID,
  e1.SupervisorID,
  e2.Name AS SupervisorName
FROM Bank_Employee AS e1          
left JOIN Bank_Employee AS e2      
       ON e1.SupervisorID = e2.ID;

/*
This next section will focus on subqueries, which we will be using tables
starting with the prefix HomeworkBars.
*/
-- Since these are new tables that we haven't worked with before, let's see what they look like.
SELECT TOP 1 * FROM HomeworkBars_bar;
SELECT TOP 1 * FROM HomeworkBars_beer;
SELECT TOP 1 * FROM HomeworkBars_drinker;
SELECT TOP 1 * FROM HomeworkBars_frequents;
SELECT TOP 1 * FROM HomeworkBars_likes;
SELECT TOP 1 * FROM HomeworkBars_serves;

-- (3) Find everyone who visits (frequents) bars more times per week than the average person
-- using subqueries.

WITH visits_per_drinker AS (
    SELECT
        f.Drinker,                
        SUM(f.times_a_week) AS visits   
    FROM HomeworkBars_frequents AS f
    GROUP BY f.Drinker
),


avg_visits AS (
    SELECT AVG(visits) AS avg_visits
    FROM visits_per_drinker          
)

SELECT d.Name
FROM   HomeworkBars_drinker  AS d
JOIN   visits_per_drinker    AS v  ON v.Drinker = d.Name
CROSS  JOIN avg_visits       AS a                 
WHERE  v.visits > a.avg_visits;                  


-- Step 1: Find the average times a person visits bars per week.
-- SELECT AVG(times_a_week) AS num_visits
-- FROM HomeworkBars_frequents;
-- The above is not quite right, can you see why based on the table?
-- SELECT * FROM HomeworkBars_frequents;
-- Step 1.1
-- TODO: Find the total number of times of frequents per person / Drinker.
-- Step 1.2
-- TODO: Find the average based on ^^^
-- Step 2:
-- TODO: Using code from Step 1, compare that value to all drinkers to answer the question

WITH visits_per_drinker AS (         
    SELECT f.drinker,
           SUM(f.times_a_week) AS visits
    FROM   HomeworkBars_frequents AS f
    GROUP  BY f.drinker
),
avg_visits AS (                      
    SELECT AVG(visits) AS avg_visits
    FROM   visits_per_drinker
)
SELECT d.name                      
FROM   HomeworkBars_drinker  AS d
JOIN   visits_per_drinker  AS v ON v.drinker = d.name
CROSS  JOIN avg_visits       AS a
WHERE  v.visits > a.avg_visits;

-- (4) TODO: Same question as (3), but use CTEs instead
-- Extra Challenge Questions:
-- Q1: Find the top beer that Kevin Fleming drinks that contains the letter H
-- Order by beer descending (yes this is slightly nonsensical,
-- but I want the results to match so do it and trust me)
-- Find the average price of the beer at all the bars that serve it
-- Now find all the bars that serve that beer where the price is
-- less than the average (put the 2 queries together)
-- Q2: Find all the bars that serve all the beer that Kevin likes
-- 1. Pick a bar
-- 2. Find all the beers that Kevin likes
-- 3. Find all the bars that serve the beer that Kevin likes
-- 4. If no results, then no bars have all the beer that Kevin likes
