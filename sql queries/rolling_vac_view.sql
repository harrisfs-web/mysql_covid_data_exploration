-- Creating a View to store data for later visualizations.
DROP VIEW IF EXISTS PercentPopulationVaccinated;
CREATE VIEW PercentPopulationVaccinated AS
SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
SUM(v.new_vaccinations) OVER (PARTITION BY d.Location ORDER BY d.location, d.Date) AS rollingvac
FROM deaths d
JOIN vaccinations v
ON d.location = v.location
AND d.date = v.date
WHERE d.continent <> "";