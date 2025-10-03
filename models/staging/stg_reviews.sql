
-- Esta tabla será creada físicamente en la BD
{{ config(
    materialized='table'  
) }}


SELECT
    CAST(listing_id AS INT) AS listing_id,      -- ID de la propiedad convertido a entero
    CAST(review_id AS INT) AS review_id,        -- ID de la reseña convertido a entero
    CAST(date AS DATE) AS fecha,       -- Convertimos la fecha a tipo DATE
    CAST(reviewer_id AS INT) AS reviewer_id     -- ID del usuario que hizo la reseña convertido a entero
FROM {{ ref('reviews') }}  -- Este ref() apunta al seed 'reviews.csv', es decir, tu archivo CSV cargado en DBT
