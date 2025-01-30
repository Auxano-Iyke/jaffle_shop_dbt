with source as (
    select *
    from {{ source('stripe','raw_payments') }}
)

, columns_renamed as (
    select
        id as payment_id
        , order_id
        , payment_method
        , amount / 100.0 as payment_amount
    from
        source
)

select * from columns_renamed
