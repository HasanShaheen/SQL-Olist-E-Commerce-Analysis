use olist_ecommerce;

select c.customer_state,
	avg(ot.freight_value) as average_freight_value, 
    avg(ot.price) as average_price,
	ROUND((SUM(ot.freight_value) * 100) / NULLIF(SUM(ot.price), 0), 2) AS freight_ratio

from orders o 
join customers c on c.customer_id = o.customer_id
join order_items ot on o.order_id = ot.order_id 

where o.order_status = 'delivered'

group by c.customer_state

order by freight_ratio desc 
;