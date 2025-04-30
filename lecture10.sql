create view VideoGameData as
select 
    year_released,
    genre,
    count(game_name) as Releases,
    sum(NA_Sales + EU_Sales + JP_Sales + Other_Sales) as Total
--into #VideoGameData
From VideoGameSales
group by year_released, genre

select * from #VideoGameData

select year_released, sum(Releases) as ReleasesPerYear
from #VideoGameData
where year_released is not null
group by year_released
having sum(Releases) > 1000
order by ReleasesPerYear desc --- ranking 

-- get top 10 genres group by genre based on sales 
Select top 10 genre, sum(Total) as GenreSales
From #VideoGameData
Group by genre
Order by GenreSales desc

--top 5 most profitable years 
select top 5 year_released, sum(Total) as T
from #VideoGameData
group by year_released
order by T desc

--view is a quick query
-- into is a temp table for the session of coding


