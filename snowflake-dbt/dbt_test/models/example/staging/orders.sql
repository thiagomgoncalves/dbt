with source as (
      select * from {{ source('orders', 'orders') }}
),
renamed as (
    select
        {{ adapter.quote("O_ORDERKEY") }} as order_key,
        {{ adapter.quote("O_CUSTKEY") }} as customer_key,
        {{ adapter.quote("O_ORDERSTATUS") }} as order_status,
        {{ adapter.quote("O_TOTALPRICE") }} as total_price,
        {{ adapter.quote("O_ORDERDATE") }} as creation_date

    from source
)
select * from renamed
order by creation_date asc
  