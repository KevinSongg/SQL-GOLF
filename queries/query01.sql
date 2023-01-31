-- Retrieve the abbreviations of states that have over 150 counties 
-- which have an employment rate of at least 90% for each county in 2008, 
-- ordered by the number of counties in each state in descending order.

-- 1.05 marks: <8 operators
-- 1.0 marks: <10 operators
-- 0.8 marks: correct answer

SELECT `abbr`
FROM `counties`.`State`
    JOIN `counties`.`County` ON (`state` = `id`)
        JOIN `counties`.`CountyLabourStats` ON (`fips` = `county`)
WHERE `year` = 2008 AND `employed` / `labour_force` > 0.9
GROUP BY `id`
HAVING COUNT(*) >= 150
ORDER BY `abbr` DESC;
