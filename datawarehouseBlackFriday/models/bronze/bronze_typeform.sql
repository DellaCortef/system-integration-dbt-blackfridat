-- Configuration so that transformations are created in view
{ 
    config(
        materialized="view"
    )
}

-- Required table CTE
WITH typeform_responses as (
    SELECT * 
    FROM {{ source('della-postgre', 'typeform_responses')}}
)


-- Creating View from my table CTE
SELECT * FROM typeform_responses