
-- TABLA RAW: HUESPED

{{ config(
    materialized='table'
) }}

SELECT DISTINCT
    reviewer_id AS id_huesped  -- ID del huésped, clave primaria
FROM {{ ref('stg_reviews') }}
