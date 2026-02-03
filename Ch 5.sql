select * from winter_games;
select * from summer_games;
select * from athletes;



-- Find Athletes from Summer or Winter Games
-- Write a query to list all athlete names who participated in the Summer or Winter Olympics. 
-- Ensure no duplicates appear in the final table using a set theory clause.
select name
from athletes
inner join summer_games
on athletes.id = summer_games.athlete_id
union
select name 
from athletes
inner join winter_games
on athletes.id = winter_games.athlete_id;


-- Find Countries Participating in Both Games
-- Write a query to retrieve country_id and country_name for countries in the Summer Olympics.
-- Add a JOIN to include the country’s 2016 population and exclude the country_id from the SELECT statement.
-- Repeat the process for the Winter Olympics.
-- Use a set theory clause to combine the results.
select country, pop_in_millions
from countries
INNER join summer_games
on countries.id = summer_games.country_id
inner join country_stats
on countries.id = country_stats.country_id
where country_stats.year = '2016-01-01'
union all
select country, pop_in_millions
from countries
INNER join winter_games
on countries.id = winter_games.country_id
inner join country_stats
on countries.id = country_stats.country_id
where country_stats.year = '2016-01-01';


-- Identify Countries Exclusive to the Summer Olympics
-- Return the country_name and region for countries present in the countries table but not in the winter_games table.
-- (Hint: Use a set theory clause where the top query doesn’t involve a JOIN, but the bottom query does.)

select country, region
from countries
except
select country, region
from countries
inner join winter_games
on countries.id = winter_games.country_id;








