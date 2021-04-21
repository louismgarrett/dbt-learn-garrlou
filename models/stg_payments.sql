SELECT 
    ID AS Payment_ID
    ,OrderID AS Order_ID
    ,PaymentMethod AS Payment_Method
    ,(Amount/100) AS Amount
    ,Status
    ,Created AS Created_At
    ,_Batched_At
FROM raw.stripe.payment