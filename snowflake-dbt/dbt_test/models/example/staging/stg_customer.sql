with source as (
      select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.customer
),
renamed as (
    select
        "C_CUSTKEY" as customer_key,
        "C_NATIONKEY" as country_key,
        "C_MKTSEGMENT" as marketing_segment

    from source
)
select * from renamed