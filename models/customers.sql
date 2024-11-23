{{ config(materialized='table') }}

with customer_orders as (
    select
    c.id,c.first_name,c.last_name
    ,min(o.order_date) as first_order,
    max(o.order_date) as most_recent_order
    ,count(o.id) as number_of_orders
    from
    {{ source('raw','raw_customers') }} c 
    left join
    {{ source('raw','raw_orders') }} o 
    on c.id = o.user_id
    group by c.id,c.first_name,c.last_name
),
customer_payments as (
    select o.user_id as customer_id,
    sum(p.amount) as customer_lifetime_value
    from
    {{ source("raw","raw_orders") }} o 
    join
    {{ source("raw","raw_payments") }} p 
    on o.id = p.order_id
    group by o.user_id
)
select 
co.id,co.first_name,co.last_name,co.first_order
,co.most_recent_order,co.number_of_orders,cp.customer_lifetime_value
from customer_orders co
left join
customer_payments cp
on co.id = cp.customer_id