-- Required table CTE
WITH google_analytics as (
    SELECT * 
    FROM {{ source('datajourneydatapipeline_9nhn', 'google_analytics_zapflow')}}
)


-- Consultation on the need for CTE
SELECT * FROM google_analytics