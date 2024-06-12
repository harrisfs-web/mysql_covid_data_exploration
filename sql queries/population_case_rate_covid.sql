-- deaths per case and totals per country
select Location, round(avg(total_cases/population)*100,2) as "Population Cases %", max(total_deaths) as "Total Deaths"
from deaths
group by 1
having max(total_deaths) > 100 -- avoid showing small countries that cause outliers
order by 2 desc