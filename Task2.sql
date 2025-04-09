--SELECT distinct --Distincs the higher result
--Title, PublicationYear
--from Works
--where 

--select * 
--from Subjects
--where SubName LIKE '%fiction%' AND SubName not '%Nonfiction%'

--select *
-- from Works
--WHERE Title like '%Century' and PublicationYear = 2020

-- select distinct Title, PublicationYear
-- from Works
-- where Title like '%ho__it%' -- and PublicationYear = 2018

--SELECT * from PeopleSalaries where HourlyRate != 8.50 and HourRate is null
select top 5 Title, PublicationYear, Checkouts
from Works
where PublicationYear > 2010
order by Checkouts desc 

