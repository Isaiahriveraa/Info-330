Select Title, Checkouts, Creator, PublicationYear
From Works

Select Title, Checkouts, Creator, PublicationYear 
From Works
Where Checkouts >= 1000

Select Title, Creator, PublicationYear
From Works
Where Title like '%Harry Potter%'

Select Title, Creator
From Works
Where CheckoutYear BETWEEN 2021 AND 2023 AND Checkouts >= 50

Select Title, Publisher
From Works
Where Publisher like '%Co.'

Select Title, Checkouts
From Works
Where Checkouts >= all(Select Checkouts From Works)

Select Title, Publisher, PublicationYear
From Works
Where (Publisher = 'Chapman & Hall' OR Publisher = 'The Russian Messenger')
and PublicationYear < 2000

Select Title, Checkouts
From Works
Where Checkouts > (Select AVG(Checkouts)
From Works)

-- In class

-- Select count(*) as MyCount from Works

select PublicationYear, count(*) as PublishedCount
From Works
group by PublicationYear

Select top 10 Creator, count(*) as BooksPublished
From works
Group By Creator
Order By BooksPublished Desc

Select PublicationYear, count(*) as BooksPublished
From Works
Where MaterialType = 'Book'
group by PublicationYear

Select CheckoutYear, MaterialType, sum(Checkouts) as CheckoutCount
From Works
--where CheckoutYear = 2022
Group by CheckoutYear, MaterialType
order by CheckoutCount Desc 

select Creator, 
    count(*) as TotalWorks, 
    sum(Checkouts) as TotalCheckouts, 
    avg(Checkouts) as AvgCheckouts
from Works
group by Creator

--inner join
Select * from Subjects

select *
from 
    Works w
        join WorkSubjects ws on w.WorkID = ws.WorkID
        join Subjects s on ws.SubID = s.SubID
Where SubName in ('Fantasy', 'Science Fiction')

--left join 
select Title, count(SubName) as SubCnt
from 
    Works w
        Left join WorkSubjects ws on w.WorkID = ws.WorkID
        left join Subjects s on ws.SubID = s.SubID
group by Title
--right join
--full join

