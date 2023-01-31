-- Retrieve the distinct abbreviations of states which have a county that does NOT have the 
-- "Management of companies and enterprises" industry 
-- and also the corresponding total number of counties in each state
-- in descending order of the number of distinct counties in each state, then in alphebatical order of the abbreviations.
-- Your query need to use the name "Management of companies and enterprises" to filter the tuples, instead of just the industry id as prior knowledge.

-- 1.05 marks: < 13 operators
-- 1.0 marks: < 15 operators
-- 0.8 marks: correct answer

SELECT `abbr`, COUNT(`x`.`name`) AS `numCounties`
FROM `counties`.`County` as `x`
  JOIN `counties`.`State` AS `stateId` ON (`state` = `id`)
    WHERE `x`.`fips` NOT IN 
    (SELECT `county` 
      FROM `counties`.`CountyIndustries` AS `countyIndustry` 
        JOIN `counties`.`Industry` AS `industryName` ON (`countyIndustry`.`industry` = `industryName`.`id`)
          WHERE `industryName`.`name` LIKE 'Management of companies and enterprises%'
    )
GROUP BY `stateId`.`id`
ORDER BY COUNT(`x`.`name`) DESC, `abbr`;
