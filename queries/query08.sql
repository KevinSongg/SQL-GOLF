-- Retrieve the list of counties sorted by the ratio 
-- between male and female population for each county 
-- in descending order or the aforementioned ratio, and then in the ascending order of county FIP.
-- Exclude tuples with ratio of 1:1 from returned result.

-- 1.05 marks: < 7 operators
-- 1.0 marks: < 8 operators
-- 0.8 marks: correct answer

SELECT `male`.`county` as `county`, (`male`.`population`/`female`.`population`) as 'ratio'
FROM `counties`.`GenderBreakdown` as `male`
    JOIN `counties`.`GenderBreakdown` as `female` ON `male`.`county` = `female`.`county`
WHERE `male`.`gender` = 'male'
AND `female`.`gender`= 'female'
AND `male`.`population` != `female`.`population`
AND `male`.`county` = `female`.`county`
ORDER BY `ratio` DESC, `county` ASC;