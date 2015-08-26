
-- What 3 towns have the highest population of citizens that are 65 years and older?

SELECT town FROM town_health_records
ORDER BY pop_over_65 DESC LIMIT 3;

-- What 3 towns have the highest population of citizens that are 19 years and younger?

SELECT town FROM town_health_records
ORDER BY pop_0_to_19 DESC LIMIT 3;

-- What 5 towns have the lowest per capita income?

SELECT town FROM town_health_records
ORDER BY income DESC LIMIT 5;

-- Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?

SELECT town FROM town_health_records
WHERE town != 'Boston'
AND town != 'Becket'
AND town != 'Beverly'
ORDER BY teen_births DESC LIMIT 1;

-- Omitting Boston, what town has the highest number of infant mortalities?

SELECT town FROM town_health_records
WHERE town != 'Boston'
ORDER BY infant_mortality_rate DESC LIMIT 1;
