WITH stg_dim_country_region_rename as ( 
    SELECT
        CountryRegionCode AS country_region_code,
        Name AS country_region_name
    FROM `adventureworks2019.Person.CountryRegion`
)
SELECT * FROM stg_dim_country_region_rename