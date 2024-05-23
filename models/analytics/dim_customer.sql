with stag_dim_customer as (
    select
        dc.customer_key, 
        if(dp.business_entity_key is null,0,1) as is_reseller,
        ds.store_key as reseller_store_key,
        ds.store_name as reseller_store_name,
        dc.territory_key ,
        st.territory_name,
        dp.title persion_title,
        dp.first_name,
        dp.middle_name,
        dp.last_name  
    from 
    {{ref("stg_dim_customer")}} dc  
    LEFT JOIN {{ref("dim_sales_person")}} sp  
        on sp.person_key = dc.person_key 
    left join {{ref("stg_dim_store")}} ds 
    on ds.store_key = dc.store_key
        and ds.sales_person_key = dc.person_key
    left join {{ref("stg_dim_sales_territory")}} st 
        on st.territory_key = dc.territory_key 
    left join {{ref("stg_dim_person")}} dp
        on dp.business_entity_key = dc.person_key
)
select * from stag_dim_customer