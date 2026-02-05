-- A: Find which county had the most months with unemployment rates above the state average:
-- i:   Write a query to calculate the state average unemployment rate.
select AVG(value) 
from unemployment
-- ii:  Use this query in the WHERE clause of an outer query to filter for months above the average.
select period_name, count(period_name) as months_over_avg
from unemployment
where value > (select AVG(value) 
				from unemployment)
group by  period_name
order by months_over_avg DESC;
-- iii: Use Select to count the number of months each county was above the average. 
-- 			Which country had the most? 
select county, count(period_name) as months_over_avg
from unemployment
where value > (select AVG(value) 
				from unemployment)
group by county
order by months_over_avg DESC;

-- B: Find the average number of jobs created for each county based on projects involving the largest capital investment by each company:
-- i:   Write a query to find each company’s largest capital investment, 
-- 			returning the company name along with the relevant 
-- 			capital investment amount for each.
select company, max(capital_investment)
from ecd
group by company

-- ii:  Use this query in the FROM clause of an outer query, alias it, and join it with the original table.
-- 			Use Select * in the outer query to make sure your join worked properly
select *
from (select company, max(capital_investment)
		from ecd
		group by company) as largest_investment
join ecd
using(company)
order by company asc;

-- iii: Adjust the SELECT clause to calculate the average number of jobs created by county.
select distinct county, avg_jobs
from (select county, round(avg(new_jobs),2) as avg_jobs
		from ecd
		group by county) as avg_job_county
join ecd
using(county)
order by avg_jobs desc;



