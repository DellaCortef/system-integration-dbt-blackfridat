-- Configuration so that transformations are created in view
{{ config(
    materialized="view",
    schema="public"
)}}

-- Required table CTE
WITH typeform as (
    SELECT * 
    FROM {{ source('della-postgre', 'typeform_responses')}}
)


-- Creating View from my table CTE
SELECT * FROM typeform