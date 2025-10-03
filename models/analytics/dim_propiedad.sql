-- Dimensión Propiedad limpia y normalizada
{{ config(materialized='table') }}

SELECT
    DISTINCT
    CAST(id_propiedad AS INT) AS id_propiedad,
    LOWER(TRIM(tipo_propiedad)) AS tipo_propiedad,
    LOWER(TRIM(tipo_habitacion)) AS tipo_habitacion,
    CAST(capacidad AS INT) AS capacidad,
    CAST(precio_noche AS DECIMAL) AS precio_noche,
    LOWER(TRIM(barrio)) AS barrio,
    LOWER(TRIM(ciudad)) AS ciudad,
    CURRENT_DATE AS fecha_registro          -- Fecha de registro como fecha de ejecución
FROM {{ ref('propiedad') }}
