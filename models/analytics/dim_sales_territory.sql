WITH stg_dim_sales_territory AS (
    SELECT
        st.territory_key,
        st.territory_name,
        cr.country_region_name,
        st.group as group_name
    FROM {{ref("stg_dim_sales_territory")}} as st 
    LEFT JOIN {{ref("stg_dim_country_region")}} AS cr
        on st.country_region_code = cr.country_region_code

    )
    select * from stg_dim_sales_territory