with dim_product_model_rename as (
    SELECT
        ProductModelID as product_model_key,
        Name as product_model_name,
        CatalogDescription as catalog_description,
        Instructions instructions 
    FROM `adventureworks2019.Production.ProductModel`
), dim_product_model_add_undefined_record as(
    select 
        product_model_key,
        product_model_name,
        catalog_description,
        instructions 
    from dim_product_model_rename
    UNION all 
    SELECT
        -1 product_model_key,
        'Invalid' product_model_name,
        'Invalid' catalog_description ,
        'Invalid' instructions
)
select * from dim_product_model_add_undefined_record