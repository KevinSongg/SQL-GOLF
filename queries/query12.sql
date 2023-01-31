-- Retrieve the top 5 industries 
-- in a decreasing order by number of employees, 
-- together with the corresponding number of employments 
-- and the average payroll. 

-- 1.05 marks: < 12 operators
-- 1.0 marks: < 14 operators
-- 0.8 marks: correct answer

SELECT `name`, SUM(`employees`) AS `totalEmployees`, AVG(`payroll`) AS `avgPayroll`
FROM `counties`.`Industry`
    JOIN `counties`.`CountyIndustries` ON (`industry` = `id`)
GROUP BY `name`
ORDER BY SUM(`employees`) DESC
LIMIT 5;