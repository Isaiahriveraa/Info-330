-- Question  1)
Select Name
From Bank_Branch
Where State = 'WA' or State = 'NY'

-- Question 2)
Select ID, Name
From Bank_Customer
Where City like '%ville'

-- Question 3)
SELECT a.Name, b.Name as Department
FROM Bank_Employee a
JOIN Bank_Department b ON a.DepartmentID = b.Id
WHERE b.Name = 'Loans'

-- Question 4) (3pts) List the names of bank branch and the number of checking accounts at each branch. Checking accounts have a type of “CHECKING”.
select b.Name, count(a.Id) as NumberOfCheckingAccounts
from Bank_Account a 
join Bank_Branch b on a.OpenBranchID = b.Id
where a.Type = 'Checking'
GROUP by b.Name

--(3pts) List all employees who work for John Smith in any bank branch in Massachusetts (MA).
select a.Id, a.Name, a.Title as Job, b.Name as WhoTheyWorkFor
from Bank_Employee a
join Bank_Employee b on a.SupervisorID = b.Id
join Bank_Branch c on a.BranchID = c.Id
where b.Name = 'John Smith' and c.State = 'MA'