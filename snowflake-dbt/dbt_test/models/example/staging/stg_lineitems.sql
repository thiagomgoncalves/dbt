with source as (
      select 
        l_orderkey as order_key,
        l_linenumber as item_number,
        l_quantity as quantity,
        l_discount as discount,
        l_extendedprice as price,
        l_shipdate as shipment_date,
        l_receiptdate as delivery_date,
        l_shipmode as ship_mode
      from {{ source('orders', 'lineitem') }}
)
select * from source
  