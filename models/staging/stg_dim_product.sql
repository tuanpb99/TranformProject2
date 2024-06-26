with dim_Product__rename as (
    SELECT 
        ProductID as product_key,
        Name as product_name,
        ProductNumber as product_number,
        MakeFlag as make_flag,
        FinishedGoodsFlag as finished_goods_flag,
        Color color,
        SafetyStockLevel as safety_stock_level,
        ReorderPoint as reorder_point,
        StandardCost standard_cost,
        ListPrice as list_price,
        Size as size,
        SizeUnitMeasureCode as size_unit_measure_code,
        WeightUnitMeasureCode as weight_unit_measure_code,
        Weight as weight,
        DaysToManufacture as days_to_manufacture,
        ProductLine as product_line,
        Class as class,
        Style as style,
        ProductSubcategoryID as product_subcategory_key,
        ProductModelID as product_model_key,
        SellStartDate as sell_start_date,
        SellEndDate as sell_end_date,
        DiscontinuedDate as discontinued_date,
        rowguid as rowguid,
        ModifiedDate as modified_date
    from `adventureworks2019.Production.Product`
),
dim_Product__cast_type as (
    SELECT 
        product_key,
        product_name,
        product_number,
         make_flag,
        finished_goods_flag,
        color,
        cast(safety_stock_level as int)safety_stock_level,
        reorder_point,
        standard_cost,
        list_price,
        size,
        size_unit_measure_code,
        weight_unit_measure_code,
        weight,
        days_to_manufacture,
        product_line,
        class,
        style,
        cast(if(product_subcategory_key='NULL','-1',product_subcategory_key) as int) product_subcategory_key,
        cast(IF(product_model_key='NULL','-1',product_model_key) as int) as product_model_key,
        sell_start_date,
        sell_end_date,
        discontinued_date,
        rowguid,
        modified_date
    from dim_Product__rename
 )
select * from dim_Product__cast_type