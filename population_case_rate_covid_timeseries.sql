select Location, date, round((total_cases/population)*100,2) as "Population Cases %", total_cases_per_million, total_deaths_per_million
from deaths
where location like "world"