WITH vacpop (continent, location, date, population, new_vaccinations, rollingvac) AS
(
    SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
    SUM(v.new_vaccinations) OVER (PARTITION BY d.Location ORDER BY d.location, d.Date) AS rollingvac
    FROM deaths d
    JOIN vaccinations v
    ON d.location = v.location
    AND d.date = v.date
    WHERE d.continent <> ""
)
SELECT *, round((rollingvac/population)*100,2) as "rollingvac%"
FROM vacpop
WHERE location like "Germany";