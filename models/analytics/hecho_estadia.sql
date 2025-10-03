-- MODELO HECHO_ESTADIA
-- Esta tabla será creada físicamente en la BD
{{ config(materialized='table') }}

WITH calidad_filtrada AS (
    SELECT *
    FROM {{ ref('dim_calidad') }}
    WHERE id_calidad IS NOT NULL
),

tiempo_filtrado AS (
    SELECT *
    FROM {{ ref('dim_tiempo') }}
    WHERE id_tiempo IS NOT NULL
),

propiedad_filtrada AS (
    SELECT *
    FROM {{ ref('propiedad') }}
    WHERE id_propiedad IS NOT NULL
      AND precio_noche IS NOT NULL
      AND min_noches IS NOT NULL
      AND max_noches IS NOT NULL
),

resena_filtrada AS (
    SELECT *
    FROM {{ ref('resena') }}
    WHERE id_resena IS NOT NULL
      AND id_propiedad IS NOT NULL
      AND id_huesped IS NOT NULL
      AND fecha_resena IS NOT NULL
)

-- MODELO HECHO_ESTADIA
-- Esta tabla será creada físicamente en la BD
{{ config(materialized='table') }}

WITH calidad_filtrada AS (
    SELECT *
    FROM {{ ref('dim_calidad') }}
    WHERE id_calidad IS NOT NULL
),

tiempo_filtrado AS (
    SELECT *
    FROM {{ ref('dim_tiempo') }}
    WHERE id_tiempo IS NOT NULL
),

propiedad_filtrada AS (
    SELECT *
    FROM {{ ref('propiedad') }}
    WHERE id_propiedad IS NOT NULL
      AND precio_noche IS NOT NULL
      AND min_noches IS NOT NULL
      AND max_noches IS NOT NULL
),

resena_filtrada AS (
    SELECT *
    FROM {{ ref('resena') }}
    WHERE id_resena IS NOT NULL
      AND id_propiedad IS NOT NULL
      AND id_huesped IS NOT NULL
      AND fecha_resena IS NOT NULL
)

SELECT
    CAST(r.id_resena AS INT) AS id_estadia,                   -- ID único de la estadía
    CAST(r.id_propiedad AS INT) AS id_propiedad,             -- FK hacia la propiedad
    CAST(p.id_anfitrion AS INT) AS id_anfitrion,            -- FK hacia el anfitrión
    CAST(r.id_huesped AS INT) AS id_huesped,                -- FK hacia el huésped
    t.id_tiempo,                                            -- FK hacia dimensión tiempo
    c.id_calidad,                                           -- FK hacia dimensión calidad
    (p.precio_noche * p.min_noches)::DECIMAL AS ingreso_estimado,       -- Calculamos ingreso estimado
    LEAST((p.min_noches::DECIMAL / p.max_noches) * 100, 100) AS ocupacion_estimada  -- % ocupación estimada
FROM resena_filtrada r
INNER JOIN propiedad_filtrada p 
    ON r.id_propiedad = p.id_propiedad
INNER JOIN tiempo_filtrado t 
    ON r.fecha_resena = t.fecha_resena
INNER JOIN calidad_filtrada c 
    ON r.id_resena = c.id_calidad
Limit 500
