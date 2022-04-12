/*Q1*/
select customer_name from customer
where customer_name LIKE "Ma%";

/*Q2*/
select oi.order_id, COUNT(oi.item_id), SUM(i.unit_price) from order_item oi
left join item i on oi.item_id = i.item_Id 
group by order_id; 

/*Q3*/
SELECT s.order_id , w.warehouse_city from shipment s
left join warehouse w on s.warehouse_id = w.warehouse_id
where w.warehouse_city="Arica";

/*Q4*/
select sum(result.total_price) from (
	select s.warehouse_id , oi.order_id, SUM(i.unit_price) total_price from shipment s
	left join order_item oi  on oi.order_id = s.order_id
	left join item i on oi.item_id = i.item_id
	group by s.warehouse_id , oi.order_id
	having s.warehouse_id=8
) as result;

/*Q5*/
select w.warehouse_id , w.warehouse_city , count(s.order_id) Orders_No from warehouse w
left join shipment s on s.warehouse_id = w.warehouse_id
group by w.warehouse_id;

/*Q6*/
select c.customer_name , count(o.order_id) Orders_No from customer c
left join orderr o on c.customer_id = o.customer_id
group by c.customer_id;

/*Q7*/
select distinct i.item_id from item i
left join order_item oi on oi.item_id = i.item_id
where isnull(oi.order_id);
