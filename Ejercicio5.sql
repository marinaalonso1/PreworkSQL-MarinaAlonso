/*y*/ 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto).

CREATE TABLE IF NOT EXISTS Clientes (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255)
 )
/*y*/ 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".

INSERT INTO public.clientes (nombre)
VALUES ('John')

/*y*/ 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".

UPDATE public.clientes
SET nombre = 'John Doe'
WHERE id =1

/*y*/ 4. Elimina el cliente con id=1 de la tabla "Clientes".

DELETE FROM public.clientes
WHERE id= 1

/*y*/ 5. Lee todos los clientes de la tabla "Clientes".

SELECT * FROM public.clientes
ORDER BY id ASC 

/*y*/6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id entero.

CREATE TABLE IF NOT EXISTS Pedidos (
	id SERIAL PRIMARY KEY,
	cliente_id INT,
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes (id)
)
/*y*/7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".

INSERT INTO public.pedidos (cliente_id)
VALUES (1)
/*y*/8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".

UPDATE public.pedidos
SET cliente_id = 3
WHERE id = 1

/*y*/9. Elimina el pedido con id=1 de la tabla "Pedidos".

DELETE FROM public.pedidos
WHERE id = 1

/*y*/10. Lee todos los pedidos de la tabla "Pedidos".

SELECT * FROM public.pedidos
ORDER BY id ASC 

/*y*/11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto).

CREATE TABLE IF NOT EXISTS Productos (
	id SERIAL PRIMARY KEY,
	producto VARCHAR (255)
)
/*y*/12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".

INSERT INTO public.productos (producto)
VALUES ('Camisa')

/*y*/13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".

UPDATE public.productos
SET producto = 'Pantalon'
WHERE id = 1

/*y*/14. Elimina el producto con id=1 de la tabla "Productos".

DELETE FROM public.productos
WHERE id = 1

/*y*/15. Lee todos los productos de la tabla "Productos".

SELECT * FROM public.productos
ORDER BY id ASC 

/*y*/16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero).

CREATE TABLE IF NOT EXISTS DetallePedido(
	id SERIAL PRIMARY KEY,
	pedido_id INT,
	CONSTRAINT FK_pedido_id FOREIGN KEY (pedido_id) REFERENCES pedidos (id),
	producto_id INT,
	CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES productos (id)
)
/*y*/17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".

INSERT INTO public.detallepedido (pedido_id,producto_id)
VALUES (1,1)

/*y*/18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido".

UPDATE public.detallepedido
SET producto_id = 2
WHERE pedido_id =1

/*y*/19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".

DELETE FROM public.detallepedido
WHERE pedido_id =1

/*y*/20. Lee todos los detalles de pedido de la tabla "DetallesPedido".

SELECT * FROM public.detallepedido
ORDER BY id ASC 

/*y*/21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join.

SELECT c.nombre as nombre,
po.producto as producto 
FROM public.clientes c
INNER JOIN public.pedidos pe
ON pe.cliente_id = c.id
INNER JOIN public.detallepedido d
ON d.pedido_id = pe.id
INNER JOIN public.productos po
ON po.id= d.producto_id

/*y*/22. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join.

SELECT c.nombre as nombre,
po.producto as producto 
FROM public.clientes c
LEFT JOIN public.pedidos pe
ON pe.cliente_id = c.id
LEFT JOIN public.detallepedido d
ON d.pedido_id = pe.id
LEFT JOIN public.productos po
ON po.id= d.producto_id

/*y*/23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join.

SELECT po.producto as producto,
d.pedido_id as detalle_pedido 
FROM public.productos po
INNER JOIN public.detallepedido d
ON po.id = d.producto_id 

/*y*/24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.

SELECT po.producto as producto,
d.pedido_id as detalle_pedido 
FROM public.productos po
LEFT JOIN public.detallepedido d
ON po.id = d.producto_id

/*y*/25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes".

ALTER TABLE public.clientes
ADD COLUMN telefono VARCHAR (255)

/*y*/26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero.

ALTER TABLE public.clientes
ALTER COLUMN telefono TYPE INT USING telefono::integer

/*y*/27. Elimina la columna "telefono" de la tabla "Clientes".

ALTER TABLE public.clientes
DROP COLUMN telefono

/*y*/28. Cambia el nombre de la tabla "Clientes" a "Usuarios".

ALTER TABLE public.clientes
RENAME TO usuarios

/*y*/29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo".

ALTER TABLE public.usuarios
RENAME COLUMN nombre TO nombre_completo

/*y*/30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".

ALTER TABLE public.usuarios
ADD PRIMARY KEY (id)