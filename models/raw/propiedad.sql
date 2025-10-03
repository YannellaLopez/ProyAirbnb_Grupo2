-- TABLA RAW: PROPIEDAD


{{ config(
    materialized='table'
) }}

SELECT
    listing_id AS id_propiedad,       -- ID de la propiedad
    host_id AS id_anfitrion,          -- FK hacia anfitrión
    property_type AS tipo_propiedad,  
    room_type AS tipo_habitacion,     
    accommodates AS capacidad,        -- Cantidad de huéspedes
    bedrooms AS n_habitaciones,       
    price AS precio_noche,            
    minimum_nights AS min_noches,     
    maximum_nights AS max_noches,     
    neighbourhood AS barrio,          
    city AS ciudad,                   
    latitude,                         
    longitude                         
FROM {{ ref('stg_listing') }}
