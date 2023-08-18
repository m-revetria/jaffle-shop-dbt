with orders as  (

  select
    id as order_id,
    customer as customer_id,
    ordered_at
  from raw_jaffle_shop.orders

)

select * from orders
