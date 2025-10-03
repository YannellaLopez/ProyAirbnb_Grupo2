
-- TABLA RAW: RESENA


{{ config(
    materialized='table'
) }}

SELECT
    review_id AS id_resena,                 -- ID de la reseña
    listing_id AS id_propiedad,             -- FK hacia propiedad
    reviewer_id AS id_huesped,              -- FK hacia huésped
    CAST(fecha AS DATE) AS fecha_resena        -- Fecha de la reseña
FROM {{ ref('stg_reviews') }}
