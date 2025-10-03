-- Dimensión Anfitrión limpia y normalizada
{{ config(materialized='table') }}

SELECT
    DISTINCT
    CAST(id_anfitrion AS INT) AS id_anfitrion,      -- ID único del host
    es_superhost::BOOLEAN AS es_superhost,         -- Convertir a boolean
    CAST(total_propiedades_host AS INT) AS total_propiedades_host,
    identidad_verificada::BOOLEAN AS identidad_verificada
FROM {{ ref('anfitrion') }}
