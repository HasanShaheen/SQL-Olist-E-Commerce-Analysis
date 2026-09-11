select c.customer_state,
	round(avg(datediff(o.order_delivered_customer_date,o.order_estimated_delivery_date)), 2) as delay_in_days,
    round(avg (orev.review_score),2) as average_score
from orders o 
join customers c on c.customer_id = o.customer_id
join order_reviews orev on o.order_id = orev.order_id 
where o.order_status = 'delivered'
group by c.customer_state
order by delay_in_days 
;
