with dim_person_rename as (
    SELECT
        BusinessEntityID as business_entity_key,
        PersonType person_type,
        NameStyle name_style,
        Title title,
        FirstName first_name,
        MiddleName middle_name,
        LastName last_name,
        Suffix suffix,
        EmailPromotion email_promotion,
        AdditionalContactInfo additional_contact_info,
        Demographics  demographics
    from `adventureworks2019.Person.Person` 
), dim_person_add_undifined_record as (
    SELECT
        business_entity_key,
        person_type,
        name_style,
        title,
        first_name,
        middle_name,
        last_name,
        suffix,
        email_promotion,
        additional_contact_info,
        demographics
    FROM dim_person_rename
    UNION all 
    select
        -1 business_entity_key,
        'Invalid' person_type,
        -1 name_style,
        'Invalid' title,
        'Invalid' first_name,
        'Invalid' middle_name,
        'Invalid' last_name,
        'Invalid' suffix,
        -1 email_promotion,
        'Invalid' additional_contact_info,
        'Invalid' demographics
    )
select * from dim_person_add_undifined_record