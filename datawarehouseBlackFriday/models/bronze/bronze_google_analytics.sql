-- Required table CTE
WITH google_analytics as (
    SELECT * 
    FROM {{ source('della-postgre', 'google_analytics_zapflow')}}
)


-- Creating View from my table CTE
SELECT * FROM google_analytics