with
source as (
    select * from {{ source('jaffle_data','raw_order') }}
)

, columns_renamed as (
    select
        id as order_id
        , customer_id
        , ordered_at as order_date
        , store_id as location_id
        , tax_paid as tax
        , order_total
    from
        source
)

select * from columns_renamed
