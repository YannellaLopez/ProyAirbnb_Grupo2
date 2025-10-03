-- Esta tabla será creada físicamente en la base de datos, no es solo una vista.

{{ config(
    materialized='table'  
) }}


SELECT
    CAST(listing_id AS INT) AS listing_id,                 -- Convertimos listing_id a entero
    name,                                                 -- Nombre de la propiedad
    CAST(host_id AS INT) AS host_id,                      -- ID del anfitrión convertido a entero
    TO_DATE(CAST(host_since AS VARCHAR), 'YYYY-MM-DD') AS host_since,      -- Convertimos la fecha a formato DATE
    host_location,                                       -- Ubicación del host
    host_response_time,                                  -- Tiempo de respuesta del host
    host_response_rate,                                  -- Tasa de respuesta
    host_acceptance_rate,                                -- Tasa de aceptación
    host_is_superhost,                                   -- Si es superhost (t/f)
    CAST(host_total_listings_count AS INT) AS host_total_listings_count,  -- Total de propiedades del host
    host_has_profile_pic,                                -- Tiene foto de perfil (t/f)
    host_identity_verified,                              -- Identidad verificada (t/f)
    neighbourhood,                                       -- Barrio
    district,                                            -- Distrito
    city,                                                -- Ciudad
    CAST(latitude AS DECIMAL) AS latitude,               -- Latitud
    CAST(longitude AS DECIMAL) AS longitude,            -- Longitud
    property_type,                                       -- Tipo de propiedad
    room_type,                                           -- Tipo de habitación
    CAST(accommodates AS INT) AS accommodates,          -- Cantidad de huéspedes
    CAST(bedrooms AS INT) AS bedrooms,                  -- Cantidad de habitaciones
    amenities,                                           -- Lista de amenities como texto
    CAST(price AS DECIMAL) AS price,                     -- Precio por noche
    CAST(minimum_nights AS INT) AS minimum_nights,       -- Mínimo de noches
    CAST(maximum_nights AS INT) AS maximum_nights,       -- Máximo de noches
    CAST(review_scores_rating AS INT) AS review_scores_rating,           -- Puntaje global
    CAST(review_scores_accuracy AS INT) AS review_scores_accuracy,       -- Puntaje precisión
    CAST(review_scores_cleanliness AS INT) AS review_scores_cleanliness, -- Puntaje limpieza
    CAST(review_scores_checkin AS INT) AS review_scores_checkin,         -- Puntaje checkin
    CAST(review_scores_communication AS INT) AS review_scores_communication, -- Puntaje comunicación
    CAST(review_scores_location AS INT) AS review_scores_location,       -- Puntaje ubicación
    CAST(review_scores_value AS INT) AS review_scores_value,             -- Puntaje valor
    instant_bookable                                     -- Si es reservable al instante (t/f)
FROM {{ ref('listings') }}  -- Este ref() apunta al seed 'listings.csv', es decir, tu archivo CSV cargado en dbt