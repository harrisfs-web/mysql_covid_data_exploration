SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 AS death_percentage
FROM deaths
WHERE continent <> ""
ORDER BY 1, 2;