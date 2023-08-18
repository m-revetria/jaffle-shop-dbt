with customers as (

  select
    id as customer_id,
    name
  from raw_jaffle_shop.customers

)

select * from customers
