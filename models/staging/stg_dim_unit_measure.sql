with dim_unit_measure_rename AS(
    SELECT
        UnitMeasureCode as unit_measure_code,
        Name as unit_measure_name
    FROM `adventureworks2019.Production.UnitMeasure`
),dim_unit_measure_rename_add_undefined_record as (
    SELECT
        unit_measure_code,
        unit_measure_name
    from dim_unit_measure_rename
    UNION all 
    SELECT
        'Invalid' unit_measure_code,
        'Invalid' unit_measure_name 
)select * from dim_unit_measure_rename_add_undefined_record