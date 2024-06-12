DROP TABLE IF EXISTS vaccinations_perc;
CREATE TABLE vaccinations_perc
(
    Continent NVARCHAR(255),
    Location NVARCHAR(255),
    Date DATETIME,
    Population NUMERIC,
    New_vaccinations NUMERIC,
    RollingPeopleVaccinated NUMERIC
);

INSERT INTO vaccinations_perc
SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
SUM(v.new_vaccinations) OVER (PARTITION BY d.Location ORDER BY d.location, d.Date) AS RollingPeopleVaccinated
FROM deaths d
JOIN vaccinations v
ON d.location = v.location
AND d.date = v.date;

SELECT *, (RollingPeopleVaccinated/Population)*100
FROM vaccinations_perc;