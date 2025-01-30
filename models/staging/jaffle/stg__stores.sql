with
source as (
    select * from {{ source('jaffle_data','raw_stores') }}
)

, columns_renamed as (
    select
        id as store_id
        , name as store_name
        , opened_at as store_opened_at
        , tax_rate as store_tax_rate
    from
        source
)

select * from columns_renamed
