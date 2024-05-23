WITH stg_dim_business_entity_contract_rename as (
    SELECT
    BusinessEntityID AS business_entity_key,
    PersonID person_key,
    ContactTypeID AS contact_type_key
    FROM `adventureworks2019.Person.BusinessEntityContact`
    )
SELECT * FROM stg_dim_business_entity_contract_rename