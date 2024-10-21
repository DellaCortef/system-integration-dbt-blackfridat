-- Required table CTE
WITH google_analytics as (
    SELECT * 
    FROM {{ source('della-postgre', 'google_analytics_zapflow')}}
)


-- Consultation on the need for CTE
SELECT * FROM google_analytics