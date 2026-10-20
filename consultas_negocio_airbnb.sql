SELECT 
    distrito,
    COUNT(id_anuncio) AS total_departamentos,
    ROUND(AVG(precio), 2) AS precio_promedio_noche
FROM alojamientos
GROUP BY distrito
ORDER BY precio_promedio_noche DESC;

SELECT 
    titulo_anuncio,
    nombre_anfitrion,
    distrito,
    precio,
    cantidad_resenas,
    (precio * cantidad_resenas) AS ingresos_estimados_minimos
FROM alojamientos
WHERE cantidad_resenas > 0 
ORDER BY ingresos_estimados_minimos DESC
LIMIT 10;

SELECT 
    barrio,
    COUNT(id_anuncio) AS cantidad_propiedades,
    ROUND(AVG(precio), 2) AS precio_promedio,
    ROUND(AVG(puntuacion), 2) AS puntuacion_promedio
FROM alojamientos
GROUP BY barrio
HAVING cantidad_propiedades > 30  -- Filtramos barrios con poca muestra
ORDER BY puntuacion_promedio DESC, precio_promedio ASC
LIMIT 10;