with orders as (

    select 
        customer_key,
        sum(total_price) as total
    from {{ref("stg_orders")}}
    group by customer_key
    order by total desc
    
),

customers as (

    select 
        customer_key,
        country_key,
        marketing_segment
    from {{ ref('stg_customer') }}

)


select *
from orders
inner join customers on orders.customer_key = customers.customer_key