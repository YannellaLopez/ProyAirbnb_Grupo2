-- TABLA RAW: CALIFICACION
{{ config(
    materialized='table'
) }}

SELECT
    CAST(r.review_id AS INT) AS id_calificacion,           -- ID de la calificación (igual al review_id)
    CAST(r.review_id AS INT) AS id_resena,                 -- FK hacia la reseña
    CAST(l.review_scores_rating AS INT) AS puntaje_global,
    CAST(l.review_scores_accuracy AS INT) AS puntaje_precision,
    CAST(l.review_scores_cleanliness AS INT) AS puntaje_limpieza,
    CAST(l.review_scores_checkin AS INT) AS puntaje_checkin,
    CAST(l.review_scores_communication AS INT) AS puntaje_comunicacion,
    CAST(l.review_scores_location AS INT) AS puntaje_ubicacion,
    CAST(l.review_scores_value AS INT) AS puntaje_valor
FROM {{ ref('stg_reviews') }} r
LEFT JOIN {{ ref('stg_listing') }} l
    ON r.listing_id = l.listing_id
WHERE l.review_scores_rating IS NOT NULL
