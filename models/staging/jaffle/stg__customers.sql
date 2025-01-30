with
source as (
    select * from {{ source('jaffle_data','raw_customers') }}
)

, columns_renamed as (
    select
        id as customer_id
        , name as customer_name
    from
        source
)

select * from columns_renamed
