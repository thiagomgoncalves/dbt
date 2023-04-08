{{
  config(
    materialized = 'table'
    )
}}

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
        customer_name,
        country_key,
        marketing_segment
    from {{ ref('stg_customer') }}

),

country as (

    select 
        country_key,
        country_name
    from {{ ref('stg_nation') }}

),

final_joins as (

    select 
        customer_name,
        country_name,
        marketing_segment,
        total
    from orders
    inner join customers on orders.customer_key = customers.customer_key
    inner join country on country.country_key = customers.country_key

)

select *
from final_joins
order by total desc