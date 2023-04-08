with source as (
      select * from {{ source('orders', 'nation') }}
),
renamed as (
    select
        {{ adapter.quote("N_NATIONKEY") }} as country_key,
        {{ adapter.quote("N_NAME") }} as country_name

    from source
)
select * from renamed