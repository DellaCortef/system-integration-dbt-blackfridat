-- Required table CTE
WITH google_analytics as (
    SELECT * 
    FROM {{ source('public', 'google_analytics_zapflow')}}
)


-- Consultation on the need for CTE
SELECT * FROM google_analytics