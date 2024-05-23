with fact_sale_order_deail_rename as (
    SELECT
            SalesOrderID AS sales_order_key,
            SalesOrderDetailID sales_order_detail_key,
            CarrierTrackingNumber carrier_tracking_number,
            OrderQty order_qty,
            ProductID product_key,
            SpecialOfferID special_offer_key,
            UnitPrice unit_price,
            UnitPriceDiscount unit_price_discount,
            LineTotal line_total
    FROM  `adventureworks2019.Sales.SalesOrderDetail` 
)
select * from fact_sale_order_deail_rename