/**y**/ Nivel de dificultad: Fácil
/**y**/ 1. Crea una base de datos llamada "MiBaseDeDatos".

CREATE DATABASE MiBaseDeDatos 

/**y**/ 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).

CREATE TABLE IF NOT EXISTS Usuarios (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255),
	Edad INT
)
/**y**/ 3. Inserta dos registros en la tabla "Usuarios".

INSERT INTO public.usuarios (nombre,edad)
VALUES ('Marina',29),('Javier',32)

/**y**/ 4. Actualiza la edad de un usuario en la tabla "Usuarios".

UPDATE public.usuarios
SET edad = 30
WHERE id=2

/**y**/ 5. Elimina un usuario de la tabla "Usuarios".

DELETE FROM public.usuarios
WHERE ID=2

/**y**/ Nivel de dificultad: Moderado
/**y**/ 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).

CREATE TABLE IF NOT EXISTS ciudades (
	id SERIAL PRIMARY KEY,
	ciudad VARCHAR (255),
	Pais VARCHAR (255)
)
/**y**/ 2. Inserta al menos tres registros en la tabla "Ciudades".

INSERT INTO public.ciudades (ciudad,pais)
VALUES ('sevilla','españa'), ('madrid','españa'), ('paris','francia')

/**y**/ 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".

ALTER TABLE public.usuarios
ADD ciudad_id INT,
ADD FOREIGN KEY (ciudad_id) REFERENCES ciudades (id)

/**y**/ 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).

SELECT u.nombre as nombre,
c.ciudad as ciudad,
c.pais as pais
FROM public.usuarios u
LEFT JOIN public.ciudades c
ON u.ciudad_id = c.id

/**y**/ 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).

SELECT u.nombre as nombre,
c.ciudad as ciudad,
c.pais as pais
FROM public.usuarios u
INNER JOIN public.ciudades c
ON u.ciudad_id = c.id