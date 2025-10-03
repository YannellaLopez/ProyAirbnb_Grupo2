-- Dimensión Tiempo limpia
{{ config(materialized='table') }}

SELECT
    DISTINCT
    fecha_resena::DATE AS fecha_resena,
    EXTRACT(YEAR FROM fecha_resena) AS anio,
    EXTRACT(MONTH FROM fecha_resena) AS mes,
    EXTRACT(QUARTER FROM fecha_resena) AS trimestre,
    CASE 
        WHEN EXTRACT(MONTH FROM fecha_resena) IN (12,1,2) THEN 'Baja'
        WHEN EXTRACT(MONTH FROM fecha_resena) IN (3,4,5,9,10,11) THEN 'Media'
        ELSE 'Alta'
    END AS temporada,
    ROW_NUMBER() OVER (ORDER BY fecha_resena) AS id_tiempo  -- Generar ID único
FROM {{ ref('resena') }}
