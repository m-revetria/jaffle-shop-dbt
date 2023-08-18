with payments as (

  select
    id as payment_id,
    order_id,
    customer_id,
    amount
  from raw_stripe.payments

)

select * from payments
