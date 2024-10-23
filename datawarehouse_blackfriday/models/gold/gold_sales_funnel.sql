WITH CTE_Stakeholder AS (
    -- Website visits
    SELECT 'visitas_site' AS Etapa, COUNT(*) AS Views
    FROM {{ ref('silver_google_analytics') }}
    
    UNION ALL
    
    -- Funnel steps
    SELECT "Etapa", CAST("Views" AS INTEGER) AS Views
    FROM {{ ref('etapas_views_variacoes') }}
    
    UNION ALL
    
    -- Finished forms (assuming a silver_typeform table exists)
    SELECT 'forms_finalizado' AS Etapa, COUNT(*) AS Views
    FROM {{ ref('silver_typeform') }}
    
    UNION ALL
    
    -- Sales
    SELECT 'vendas' AS Etapa, COUNT(*) AS Views
    FROM {{ ref('vendas') }}
)

SELECT 
    Etapa,
    Views,
    ROW_NUMBER() OVER (ORDER BY Views DESC) AS Ranking
FROM CTE_Stakeholder
ORDER BY Views DESC