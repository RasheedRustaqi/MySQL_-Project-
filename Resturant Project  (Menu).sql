Use Restaurant_db;

-------- 1.viwe the menu item table 
Select *
From menu_items;

-------- 2. Find the number of iteam in the menu
 
 Select count(*)
From menu_items;

-------- 3. what are the least and most expensive iteam in the menu

Select * From menu_items
order by price asc;

Select * From menu_items
order by price desc;
----------- 4. how many italian dishes are in the menu and most expensive italian dishe
Select * From menu_items
where category = 'Italian';

Select * From menu_items
where category = 'Italian'
order by Price desc;

-------------- 5. how many dishes are in each category

Select category, count(menu_item_id) as Num_dishes
 From menu_items
group by category;

-------------- 6. Average dishes price within each category 
Select category, avg(Price) as avg_price
from menu_items
Group by category;