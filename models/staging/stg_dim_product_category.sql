with dim_product_category_rename AS(
    SELECT
        ProductCategoryID	as product_category_key,
        Name as product_category_name
    FROM `adventureworks2019.Production.ProductCategory`   
), dim_product_category_add_undefined AS (
    select  
        product_category_key,
        product_category_name
    from dim_product_category_rename
    UNION all 
    SELECT 
        -1 as product_category_key,
        'Invalid' product_category_name
)
select * from dim_product_category_add_undefined