with payment as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        {{ cents_to_dollars('amount') }} as amount, --store as dollars instead of cents
        created as created_at
    from {{ source('stripe', 'payment') }}
)

select * from payment