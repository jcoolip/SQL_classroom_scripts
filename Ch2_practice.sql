-- i
select count(distinct county)
from ecd;
--ii  
SELECT company
FROM (
    SELECT company
    FROM ecd
    GROUP BY company
    HAVING SUM(CASE WHEN ed > '0' THEN 1 ELSE 0 END) = 0
)
order by company asc;
-- iii
select sum(capital_investment) as fjtap_cap_invest_mil
from ecd
where fjtap > '0';
-- iv
select county_tier, avg(new_jobs)
from ecd
group by county_tier
order by county_tier asc;
-- v
select distinct company
from ecd
where company ilike '%llc%'

