with stg_dim_product as (
    SELECT
        dp.product_key,
        dp.product_name,
        dp.make_flag,
        dp.finished_goods_flag,
        sub_cate.product_subcategory_key,
        sub_cate.product_subcategory_name,
        cate.product_category_key,
        cate.product_category_name,
        model.product_model_key,
        model.product_model_name,
        dp.size_unit_measure_code,
        size_measure.unit_measure_name as size_unit_measure_name,
        dp.weight_unit_measure_code,
        weigh_measure.unit_measure_name as weight_unit_measure_name,
        dp.color,
        dp.size,
        dp.weight,
        dp.safety_stock_level,
        dp.standard_cost,
        dp.list_price
    from {{ref("stg_dim_product")}} as dp
    left join {{ref("stg_dim_product_subcategory")}} as sub_cate
        on dp.product_subcategory_key = sub_cate.product_subcategory_key
    left join {{ref("stg_dim_product_category")}} cate
        on sub_cate.product_category_key = cate.product_category_key
    left join {{ref("stg_dim_product_model")}} model 
        on model.product_model_key = dp.product_model_key
    left join {{ref("stg_dim_unit_measure")}} size_measure
        on size_measure.unit_measure_code = dp.size_unit_measure_code 
    left join {{ref("stg_dim_unit_measure")}} weigh_measure
        on weigh_measure.unit_measure_code = dp.weight_unit_measure_code 

)

select * from stg_dim_product