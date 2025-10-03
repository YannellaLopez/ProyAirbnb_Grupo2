-- Dimensión Huésped limpia
{{ config(materialized='table') }}

SELECT
    DISTINCT
    CAST(id_huesped AS INT) AS id_huesped
FROM {{ ref('huesped') }}
