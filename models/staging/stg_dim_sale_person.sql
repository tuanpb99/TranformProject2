with dim_sale_person_rename as (
    SELECT
        BusinessEntityID business_entity_key,
        TerritoryID AS territory_key,
        SalesQuota AS sales_quota,
        Bonus AS bonus,
        CommissionPct AS commission_pct
     FROM `adventureworks2019.Sales.SalesPerson`
),
 dim_sale_person_cast_type as (
    select  
        business_entity_key,
        CAST(if(territory_key='NULL','-1',territory_key) AS INT64) territory_key,
        sales_quota,
        bonus,
        commission_pct 
    FROM dim_sale_person_rename
)
,dim_sale_person_add_undefined_record as ( 
    select 
        business_entity_key,
        territory_key,
        sales_quota,
        bonus,
        commission_pct 
    FROM dim_sale_person_cast_type
    UNION ALL 
    select
        -1 business_entity_key,
        -1 territory_key,
        'Invalid' sales_quota,
        -1 bonus,
        -1 commission_pct 
)
SELECT * FROM dim_sale_person_add_undefined_record