with source as (
      select * from {{ source('orders', 'customer') }}
),
renamed as (
    select
        "C_CUSTKEY" as customer_key,
        "C_NAME"    as customer_name,
        "C_NATIONKEY" as country_key,
        "C_MKTSEGMENT" as marketing_segment

    from source
)
select * from renamed