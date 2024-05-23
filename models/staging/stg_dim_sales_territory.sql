with dim_sales_territory_rename as (
    SELECT
        TerritoryID as territory_key,
        Name as territory_name,
        CountryRegionCode as country_region_code,
        a.group
    FROM `adventureworks2019.Sales.SalesTerritory` a
),dim_sales_territory_add_undefined_record as (
    select 
        territory_key,
        territory_name,
        country_region_code,
        a.group
    FROM dim_sales_territory_rename a
    UNION ALL 
      select 
        -1 AS territory_key,
        'Invalid' as territory_name,
        'Invalid' as country_region_code,
        'Invalid' 

)
SELECT * FROM dim_sales_territory_add_undefined_record