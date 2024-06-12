SELECT Location, MAX(total_deaths/population) AS "Deaths/capita"
FROM deaths
WHERE continent IS NOT NULL 
GROUP BY Location
ORDER BY MAX(total_deaths/population) DESC;