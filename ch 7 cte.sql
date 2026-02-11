------------------

with top_gold_winter as (
	select country, count(gold) as total_gold
	from winter_games
	inner join countries
	on winter_games.country_id = countries.id
	group by country
	order by total_gold desc
	limit 5
)

select *
from top_gold_winter
where total_gold >= 5;

----------------

with tall_athletes as (
	select *
	from athletes
	where height > (select avg(height) from athletes)
)

select * 
from tall_athletes
where gender = 'F' AND age > 30;

---------------

with tall_over30_female_athletes as (
	select * 
	from athletes
	where height > (select avg(height) from athletes)
	and gender = 'F' and age > 30
) 

select round(avg(weight),2) as avg_weight
from tall_over30_female_athletes;



-- Winter Olympics Gold Medals

-- Write a CTE called top_gold_winter to find the top 5 gold-medal-winning countries for Winter Olympics.
-- Query the CTE to select countries and their medal counts where gold medals won are ≥ 5.
-- Tall Athletes

-- Write a CTE called tall_athletes to find athletes taller than the average height for athletes in the database.
-- Query the CTE to return only female athletes over age 30 who meet the criteria.
-- Average Weight of Female Athletes

-- Write a CTE called tall_over30_female_athletes for the results of Exercise 2.
-- Query the CTE to find the average weight of these athletes.






