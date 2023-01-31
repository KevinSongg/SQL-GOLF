-- Retrieve all states that have their abbreviartion names starting with 'A' 
-- and contain at least 20 counties,
-- ordered by the total area. 

-- 1.05 marks: < 7 operators
-- 1.0 marks: < 8 operators
-- 0.8 marks: correct answer

SELECT `abbr`
FROM `counties`.`County`
  JOIN `counties`.`State` ON (`state` = `id`)
WHERE `abbr` LIKE 'A%'
GROUP BY `id` HAVING COUNT(*) >= 20
ORDER BY SUM(`sq_km`);