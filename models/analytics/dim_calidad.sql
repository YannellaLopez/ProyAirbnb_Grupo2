-- Dimensión Calidad limpia
{{ config(materialized='table') }}

SELECT
    CAST(id_calificacion AS INT) AS id_calidad,
    CAST(puntaje_global AS INT) AS puntaje_global,
    CAST(puntaje_precision AS INT) AS puntaje_precision,
    CAST(puntaje_limpieza AS INT) AS puntaje_limpieza,
    CAST(puntaje_checkin AS INT) AS puntaje_checkin,
    CAST(puntaje_comunicacion AS INT) AS puntaje_comunicacion,
    CAST(puntaje_ubicacion AS INT) AS puntaje_ubicacion,
    CAST(puntaje_valor AS INT) AS puntaje_valor
FROM (
    SELECT
        DISTINCT
        id_resena AS id_calificacion,   -- ID único de calificación
        puntaje_global,
        puntaje_precision,
        puntaje_limpieza,
        puntaje_checkin,
        puntaje_comunicacion,
        puntaje_ubicacion,
        puntaje_valor
    FROM {{ ref('calificacion') }}
) t
