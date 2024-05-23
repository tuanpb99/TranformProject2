WITH dim_product_subcategory_rename as (
    
    SELECT 
        ProductSubcategoryID	as product_subcategory_key,
        ProductCategoryID	as product_category_key,
        Name	as product_subcategory_name 
    FROM `adventureworks2019.Production.ProductSubcategory`
),dim_product_subcategory_undefined_record AS(
    select 
        product_subcategory_key,
        product_category_key,
        product_subcategory_name 
    from dim_product_subcategory_rename
    UNION all 
    SELECT
        -1 product_subcategory_key,
        -1 product_category_key,
        'Invalid' product_subcategory_name 
)

select * from dim_product_subcategory_undefined_record