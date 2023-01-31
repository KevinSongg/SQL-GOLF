-- Retrieve names of top 10 counties and 
-- their growth ratio in terms of population compared between the latest census year and the oldest census year, 
-- in an descending order by their growth ratio.

-- 1.05 marks: < 15 operators
-- 1.0 marks: < 17 operators
-- 0.9 marks: < 19 operators
-- 0.8 marks: correct answer

SELECT `c`.`name`, (`latest`.`population` / `oldest`.`population`) as `popGrowthRatio`
FROM `counties`.`County` as `c`
JOIN `counties`.`CountyPopulation` as `oldest` on (`c`.`fips` = `oldest`.`county`)
JOIN `counties`.`CountyPopulation` as `latest` on (`c`.`fips` = `latest`.`county`)
WHERE `oldest`.`year` = (SELECT MIN(`year`) 
        FROM `counties`.`CountyPopulation`as `min`
        JOIN `counties`.`County` as `minCounty` on (`minCounty`.`fips` = `min`.`county`))
      and `latest`.`year` = (SELECT MAX(`year`) 
        FROM `counties`.`CountyPopulation` AS `max`
        JOIN `counties`.`County` as `maxCounty` on (`maxCounty`.`fips` = `max`.`county`))
      and `latest`.`county` = `oldest`.`county`
ORDER BY `popGrowthRatio` DESC
LIMIT 10;

