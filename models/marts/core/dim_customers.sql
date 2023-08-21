
with customers as (
  select * from {{ ref ('stg_customers') }}
),

orders as (
  select * from {{ ref ('stg_orders') }}
),

payments as (
  select * from  {{ ref ('stg_payments') }}
),

customer_orders as (

  select
    customer_id,
    min(ordered_at) as first_order_date,
    max(ordered_at) as most_recent_order_date,
    count(order_id) as number_of_orders
  from orders
  group by 1

),

customer_payments as (

  select
    customer_id,
    sum(amount) as total_amount
  from payments
  group by 1

),

final as (
  
  select 
    customers.customer_id, 
    customers.name, 
    customer_orders.first_order_date,
    coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
    coalesce(customer_payments.total_amount, 0) as total_amount
  from customers
  left join customer_orders using (customer_id)
  left join customer_payments using (customer_id)

)

select * from final
