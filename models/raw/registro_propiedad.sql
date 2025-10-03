
-- TABLA RAW: REGISTRO DE PROPIEDADES


{{ config(
    materialized='table'
) }}

SELECT
    listing_id AS id_registro,      -- ID de registro (puede generarse igual que la propiedad si no hay otro)
    listing_id AS id_propiedad,     -- FK hacia propiedad
    CAST(NULL AS DATE) AS fecha_registro, -- Por ahora vacío, se puede llenar si hay histórico
    CAST(NULL AS VARCHAR) AS estado       -- Estado de la propiedad (activa, pausada, eliminada)
FROM {{ ref('stg_listing') }}
