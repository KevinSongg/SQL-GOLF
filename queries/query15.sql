-- Retrieve abbreviations for the states which contain at least 5 counties, 
-- and their population in year 2010 to area ratio 
-- in decreasing order of the aforementioned ratio. 
-- Round the ratio to 2 decimal places.

-- 1.05 marks: < 17 operators
-- 1.0 marks: < 19 operators
-- 0.9 marks: < 21 operators
-- 0.8 marks: correct answer

SELECT `abbr`, ROUND(SUM(`population`)/SUM(`sq_km`),2) AS `popPerSqKm`
FROM `counties`.`County` 
  JOIN `counties`.`State` ON (`state` = `id`)
    JOIN `counties`.`CountyPopulation` ON (`fips`=`county`)
WHERE `year` = 2010
GROUP BY `state`
HAVING COUNT(*) >= 5
ORDER BY `popPerSqKm` DESC;