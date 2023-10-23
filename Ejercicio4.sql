/**y**/ 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").

CREATE TABLE IF NOT EXISTS pedidos (
	id SERIAL PRIMARY KEY,
	usuario_id INT,
	CONSTRAINT FK_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
	producto_id INT,
	CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES productos (id)
)
/**y**/ 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.

INSERT INTO public.pedidos (usuario_id,producto_id)
VALUES (1,2),(3,3),(1,4)

/**y**/ 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).

SELECT u.nombre as nombre,
COALESCE (po.producto,' ') as productos
FROM public.usuarios u
LEFT JOIN public.pedidos pe
ON u.id = pe.usuario_id
LEFT JOIN public.productos po
ON po.id = pe.producto_id

/**y**/ 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).

SELECT  u.nombre as nombre
FROM public.usuarios u
LEFT JOIN public.pedidos pe
ON u.id = pe.usuario_id

/**y**/ 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)

ALTER TABLE public.pedidos
ADD COLUMN cantidad INT

UPDATE public.pedidos
SET cantidad = 5
WHERE id = 4