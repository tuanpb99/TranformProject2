with stg_dim_employee_rename as (
    SELECT
            BusinessEntityID AS business_entity_key,
            NationalIDNumber AS national_key_number,
            LoginID AS login_key,
            OrganizationNode AS organization_node,
            OrganizationLevel AS organization_level,
            JobTitle AS job_title,
            BirthDate AS birth_date,
            MaritalStatus AS marital_status,
            Gender gender,
            HireDate hire_date,
            SalariedFlag salaried_flag,
            VacationHours vacation_hours,
            SickLeaveHours sick_leave_hours,
            CurrentFlag current_flag
    FROM `adventureworks2019.HumanResources.Employee`
)  
        SELECT
            business_entity_key,
            national_key_number,
            login_key,
            organization_node,
            organization_level,
            job_title,
            birth_date,
            marital_status,
            gender,
            hire_date,
            salaried_flag,
            vacation_hours,
            sick_leave_hours,
            current_flag
        from stg_dim_employee_rename