with dim_customer_rename as (
    SELECT 
        CustomerID as customer_key,
        PersonID as person_key,
        StoreID as store_key,
        TerritoryID as territory_key,
        AccountNumber account_number 
    FROM `adventureworks2019.Sales.Customer` 
),dim_customer_cast_type as (
    SELECT 
        customer_key,
        CAST(if(person_key='NULL','-1',person_key) AS INT64) person_key,
        CAST(if(store_key='NULL','-1',store_key) AS INT64) store_key,
        territory_key,
        account_number 
    FROM dim_customer_rename
), dim_customer__add_undefined_record as (
    SELECT 
        customer_key,
        person_key,
        store_key,
        territory_key,
        account_number 
    FROM dim_customer_cast_type
    UNION ALL 
    SELECT
        -1 customer_key,
        -1 person_key,
        -1 store_key,
        -1 territory_key,
        'Invalid' account_number 
)
 select * from dim_customer__add_undefined_record