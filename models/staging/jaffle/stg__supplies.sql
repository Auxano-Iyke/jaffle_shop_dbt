with
source as (
    select * from {{ source('jaffle_data','raw_supply') }}
),
columns_renamed as (
    select 
        md5(concat_ws('|', id::text, sku::text)) as supply_uuid,
        id as supply_id,
        sku as product_id,
        name as supply_name,

        (cost / 100.0) as supply_cost,
        perishable as is_persishable_supply
    from 
    source
)
select * from columns_renamed