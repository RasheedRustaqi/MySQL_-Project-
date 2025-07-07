-- 1. Combine the menu_items and order_details tables into a single table.
     Select * 
     From order_details od
     left join  menu_items mi
		on od.item_id = mi.menu_item_id;
-- 2. What were the least and most ordered items? What categories were they in?
 
 Select item_name, category, count(order_details_id) as Num_purch
     From order_details od
     left join  menu_items mi
		on od.item_id = mi.menu_item_id
        group by item_name, category
        order by num_purch desc;
        
-- 3. What were the top 5 orders that spent the most money?
  Select ORDER_ID, sum(price) as total_spending
     From order_details od
     left join  menu_items mi
		on od.item_id = mi.menu_item_id
        Group by Order_id
        order by total_spending DESC
        LIMIT 5;
        
	
-- 4. View the details of the highest spend order. What insights can you gather from the purchase?
      
     Select category, count(Item_id) as Num_items 
     From order_details od
     left join  menu_items mi
		on od.item_id = mi.menu_item_id
	Where order_id = '440'
    group by  category;
      
-- 5. View the details of the top 5 highest spend orders. What insights can you gather from the purchases?
    Select order_id, category, count(Item_id) as Num_items 
     From order_details od
     left join  menu_items mi
		on od.item_id = mi.menu_item_id
	Where order_id in (440, 2075, 1957, 330, 2675)
    group by order_id, category;