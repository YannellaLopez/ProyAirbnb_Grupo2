
-- TABLA RAW: ANFITRION


{{ config(
    materialized='table'
) }}

SELECT
    host_id AS id_anfitrion,           -- ID del anfitrión, clave primaria
    host_is_superhost AS es_superhost, -- TRUE si es Superhost
    host_total_listings_count AS total_propiedades_host, -- Total de propiedades que gestiona
    host_identity_verified AS identidad_verificada      -- TRUE si identidad verificada
FROM {{ ref('stg_listing') }}
