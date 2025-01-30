with
source as (
    select * from {{ source('jaffle_data','raw_supply') }}
)

, columns_renamed as (
    select
        id as supply_id
        , sku as product_id
        , name as supply_name
        , perishable as is_persishable_supply

        , md5(concat_ws('|', id::text, sku::text)) as supply_uuid
        , (cost / 100.0) as supply_cost
    from
        source
)

select * from columns_renamed
