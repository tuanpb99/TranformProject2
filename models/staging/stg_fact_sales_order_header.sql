WITH stg_fact_purchase_order_header_rename as (
    SELECT
        SalesOrderID sales_order_key,
        RevisionNumber revision_number,
        OrderDate Order_Date,
        DueDate Due_Date,
        ShipDate Ship_Date,
        Status,
        OnlineOrderFlag Online_Order_Flag,
        SalesOrderNumber Sales_Order_Number,
        PurchaseOrderNumber Purchase_Order_Number,
        AccountNumber Account_Number,
        CustomerID Customer_key,
        SalesPersonID Sales_Person_key,
        TerritoryID Territory_key,
        BillToAddressID Bill_To_Address_key,
        ShipToAddressID Ship_To_Address_key,
        ShipMethodID Ship_Method_key,
        CreditCardID Credit_Card_key,
        CreditCardApprovalCode Credit_Card_Approval_Code,
        CurrencyRateID Currency_Rate_key,
        SubTotal Sub_Total,
        TaxAmt Tax_Amt,
        Freight,
        TotalDue Total_Due,
        Comment

    from `adventureworks2019.Sales.SalesOrderHeader`
    )
select * from stg_fact_purchase_order_header_rename   