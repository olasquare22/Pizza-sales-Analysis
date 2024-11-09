select * from pizza_sales
 UPDATE `pizza_sales`
SET `order_date` = STR_TO_DATE(`order_date`, '%d-%m-%Y');

-- Step 2: Alter the table to change data type
ALTER TABLE `pizza_sales`
MODIFY COLUMN `order_date` DATE;


UPDATE `pizza_sales`
SET `order_time` = STR_TO_DATE(`order_time`, '%H:%i:%s');

-- Step 2: Alter the table to change data type
ALTER TABLE `pizza_sales`
MODIFY COLUMN `order_time` TIME;