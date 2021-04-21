with Orders AS 
(
    select * from {{ref('stg_orders')}}
),
Payments AS
(
    select * from {{ref('stg_payments')}}
),
Order_Payments AS
(
    select  SUM(Amount) AS Amount
            ,Order_ID
    from Payments
    where Status <> 'fail'
    Group by Order_ID
),
Final AS
(
    select  O.customer_id
            ,O.order_id
            ,O.status
            ,OP.amount
            ,O.order_date
    from Orders O 
        left join Order_Payments OP ON 
            O.Order_ID = OP.Order_ID
)

select * from Final
