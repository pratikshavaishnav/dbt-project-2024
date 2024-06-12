{{
        config(
            materialized='view'
            )
}}

with customer as
(
   select * from {{ref('stg_cust')}} 
),

orders_cte as
(
    select * from {{ref('stg_order')}}
),

customer_orders as
(
    select c.C_CUSTKEY,
    count(o.O_ORDERKEY) Number,
    sum(o.O_TOTALPRICE) Total
    from customer c inner join orders_cte o on c.C_CUSTKEY=o.O_CUSTKEY
    group by c.C_CUSTKEY
    order by Number desc
)


select * from customer_orders limit 10