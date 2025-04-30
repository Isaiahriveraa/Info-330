select d.Name, d.Address
From HomeworkBars_Drinker as d
inner join HomeworkBars_Frequents as f
 on f.Drinker = d.name
where f.Bar = 'Big Time Brewery';

Select Bar
From HomeworkBars_serves
Where Beer in ('Budweiser', 'Corona Extra')
Group BY Bar
Having Count(Distinct Beer) >= 2;

SELECT DISTINCT s.bar
FROM HomeworkBars_Serves AS s
JOIN HomeworkBars_Likes AS l 
    ON l.beer = s.beer
WHERE l.drinker = 'Andrey Waterville' AND s.price <= 3.50;

Select s.Beer
From HomeworkBars_Serves as s
Where not exists (
    select 1 
    From HomeworkBars_frequents as f 
    join HomeworkBars_likes as l
        on f.Drinker = l.Drinker
    Where f.bar = s.bar 
        and l.Beer = s.Beer
);


