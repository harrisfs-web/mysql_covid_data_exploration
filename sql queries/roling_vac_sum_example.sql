SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
SUM(v.new_vaccinations) OVER (PARTITION BY d.Location ORDER BY d.location, d.Date) AS rolling_vaccinated
FROM deaths d
JOIN vaccinations v
ON d.location = v.location
AND d.date = v.date
WHERE d.continent IS NOT NULL and d.location like "Denmark"
ORDER BY 2, 3;