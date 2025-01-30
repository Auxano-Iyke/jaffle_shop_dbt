with
source as (
    select * from {{ source('jaffle_data','raw_items') }}
)

, columns_renamed as (
    select
        id as order_item_id
        , order_id
        , sku as product_id
    from
        source
)

select * from columns_renamed
