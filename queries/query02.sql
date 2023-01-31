-- Retrieve the list of states (showing both the id and abbreviation) 
-- and their corresponding total area, 
-- not accounting for the counties that have more than 10000 population in the year of 2010, 
-- sorted by area in descending order.

-- 1.05 marks: < 11 operators
-- 1.0 marks: < 13 operators
-- 0.8 marks: correct answer

SELECT `id`, `abbr`, SUM(`sq_km`) AS `area`
FROM `counties`.`County`
  JOIN `counties`.`State` ON (`state` = `id`)
    JOIN `counties`.`CountyPopulation` ON (`fips` = `county`)
WHERE `population` < 10000 AND `year` = '2010'
GROUP BY `state`
ORDER BY sum(`sq_km`) DESC;