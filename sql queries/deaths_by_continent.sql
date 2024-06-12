SELECT continent, MAX(total_deaths) AS total_death_count
FROM deaths
WHERE continent <> ""
GROUP BY continent
ORDER BY total_death_count DESC;