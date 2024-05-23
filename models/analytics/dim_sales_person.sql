WITH dim_sales_person AS (
  SELECT 
        stg_dim_sale_person.business_entity_key as person_key,
        stg_dim_person.title as sales_person_tile,
        stg_dim_person.first_name,
        stg_dim_person.middle_name,
        stg_dim_person.last_name,
        stg_dim_employee.job_title,
        stg_dim_employee.gender,
        stg_dim_sale_person.bonus,
        stg_dim_sale_person.commission_pct

    FROM {{ref("stg_dim_sale_person")}} as stg_dim_sale_person
    LEFT JOIN {{ref("stg_dim_employee")}} as stg_dim_employee
    on stg_dim_employee.business_entity_key = stg_dim_sale_person.business_entity_key 
    LEFT JOIN {{ref("stg_dim_person")}} as stg_dim_person
        ON stg_dim_person.business_entity_key = stg_dim_employee.business_entity_key

)
select * from dim_sales_person