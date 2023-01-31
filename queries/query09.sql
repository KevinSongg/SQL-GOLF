-- Out of those counties with temperature of more than 60, 
-- retrieve the pair that had the largest absolute difference in temperature
-- and their corresponding temperatures.
-- The second county in the pair has a temperature larger than the first county's temperature. 
-- If multiple pairs exist, retrieve the pair with the smallest FIP of the first county in the pair.


-- 1.05 marks: < 10 operators
-- 1.0 marks: < 12 operators
-- 0.8 marks: correct answer

SELECT `county1`.`name`, `county1`.`temp`, `county2`.`name`, `county2`.`temp`
FROM `counties`.`County` AS `county1`, `counties`.`County` AS `county2`
WHERE `county1`.`temp` > 60 
AND `county2`.`temp` > 60
ORDER BY `county1`.`temp` - `county2`.`temp` ASC ,`county1`.`fips` ASC
LIMIT 1;

