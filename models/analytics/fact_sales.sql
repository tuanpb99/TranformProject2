with stg_fact_sale as (
    SELECT
            sohd.sales_order_detail_key,
            sohd.sales_order_key,
            sohd.product_key,
            soh.Customer_key,
            soh.territory_key,
            soh.sales_person_key,
            soh.order_date,
            soh.Status as sales_order_status,
            soh.bill_to_address_key,
            soh.ship_to_address_key,
            soh.Ship_Method_key,
            sohd.order_qty,
            sohd.unit_price,
            sohd.unit_price_discount,
            soh.tax_amt,
            sohd.order_qty * sohd.unit_price as gross_amount,
            soh.sub_total,
            soh.total_due
    from {{ref("stg_fact_sales_order_header")}} soh  
    left join {{ref("stg_fact_sale_order_detail")}} sohd 
        on soh.sales_order_key = sohd.sales_order_key 

)
select * from stg_fact_sale