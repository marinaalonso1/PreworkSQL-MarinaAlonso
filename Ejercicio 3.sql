/**y**/ 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).

CREATE TABLE IF NOT EXISTS productos(
	id SERIAL PRIMARY KEY,
	Producto VARCHAR (255),
	precio DEC
)
/**y**/ 2. Inserta al menos cinco registros en la tabla "Productos".

INSERT INTO public.productos (producto,precio)
VALUES ('sofa',325.50),('silla',49.99),('colchon',795),('canapé',325.49),('litera',625)

/**y**/ 3. Actualiza el precio de un producto en la tabla "Productos".

UPDATE public.productos
SET precio = 425.50
WHERE id =1

/**y**/ 4. Elimina un producto de la tabla "Productos".

DELETE FROM public.productos
WHERE id = 5

/**y**/ 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").

ALTER TABLE public.usuarios
ADD COLUMN producto_id INT,
ADD FOREIGN KEY (producto_id) REFERENCES productos (id)

SELECT u.nombre as nombre,
p.producto as producto
FROM public.usuarios u
INNER JOIN public.productos p
ON u.producto_id= p.id
