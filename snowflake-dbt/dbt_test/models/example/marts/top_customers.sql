with orders as (

    select 
        customer_key,
        sum(total_price) as total
    from {{ref("stg_orders")}}
    group by customer_key
    order by total desc
    
)

select *
from orders