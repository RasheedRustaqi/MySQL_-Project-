-- 1. View the order_details table.
              
	Select * From order_details;
    
-- 2. What is the date range of the table?
  
	Select max(order_date), min(Order_date)
	From order_details;

-- 3. How many orders were made within this date range?
	 Select count(distinct order_id) 
	 from order_details;

-- 4. How many items were ordered within this date range?

     select count(Order_details_id)
     FRom order_details;
    
-- 5. Which orders had the most number of items?

    Select Order_id, count(item_id) as Num_items
	From order_details
    group by order_id
    order by num_items desc;

-- 6. How many orders had more than 12 items?
Select count(*)
From 
( Select Order_id, count(item_id) as Num_items
	From order_details
    group by order_id
   having num_items > 12) As numb_order