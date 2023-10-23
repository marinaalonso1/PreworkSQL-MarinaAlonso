/*y*/  1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto).

CREATE TABLE IF NOT EXISTS clientes (
	id SERIAL PRIMARY KEY,
	name VARCHAR (255),
	email VARCHAR (255)
)
/*y*/  2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".

INSERT INTO public.clientes (name, email)
VALUES ('Juan','juan@example.com')

/*y*/  3. Actualizar el email del cliente con id=1 a "juan@gmail.com".

UPDATE public.clientes
SET email = 'juan@gmail.com'
WHERE id=1

/*y*/  4. Eliminar el cliente con id=1 de la tabla "Clientes".

DELETE FROM public.clientes
WHERE id =1

/*y*/  5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).

CREATE TABLE IF NOT EXISTS pedidos (
	id SERIAL PRIMARY KEY,
	cliente_id INT,
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes (id),
	producto VARCHAR (255),
	cantidad INT
)
/*y*/  6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.

INSERT INTO public.clientes (name, email)
VALUES ('Juan','juan@example.com')
INSERT INTO public.pedidos (cliente_id, producto, cantidad)
VALUES (1,'Camiseta', 2)

/*y*/  7. Actualizar la cantidad del pedido con id=1 a 3.

UPDATE public.pedidos
SET cantidad =3
WHERE id = 1

/*y*/  8. Eliminar el pedido con id=1 de la tabla "Pedidos".

DELETE FROM public.pedidos
WHERE id =1

/*y*/  9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).

CREATE TABLE IF NOT EXISTS productos (
	id SERIAL PRIMARY KEY,
	Nombre VARCHAR (255),
	Precio DEC
)
/*y*/  10. Insertar varios productos en la tabla "Productos" con diferentes valores.

INSERT INTO public.productos (nombre,precio)
VALUES ('camiseta',4),('vestido',10),('pantalon', 7)

/*y*/  11. Consultar todos los clientes de la tabla "Clientes".

SELECT * FROM  public.clientes

/*y*/  12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.

SELECT * FROM public.clientes c
lEFT JOIN public.pedidos p
on c.id =p.cliente_id

/*y*/  13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.

SELECT * FROM public.productos
WHERE precio>50

/*y*/  14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.

SELECT * FROM public.pedidos
WHERE cantidad>=5

/*y*/  15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra"A".

SELECT * FROM public.clientes
WHERE name ILIKE 'A%'

/*y*/  16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.

SELECT c.name as nombre,
p.cantidad as pedido
FROM public.clientes c
LEFT JOIN public.pedidos p
ON c.id =p.cliente_id

/*y*/  17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.

SELECT pr.nombre as producto,
pe.cantidad
FROM public.productos pr
LEFT JOIN public.pedidos pe
ON pr.nombre = pe.producto

/*y*/  18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.

ALTER TABLE public.pedidos
ADD COLUMN fecha DATE

/*y*/  19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".

ALTER TABLE public.pedidos
ALTER COLUMN producto TYPE INT USING producto::integer,
ADD FOREIGN KEY (producto) REFERENCES PRODUCTOS (id)

/*y*/  20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.

SELECT c.name as nombre,
po.nombre as producto,
pe.cantidad cantidad
FROM public.clientes c
LEFT JOIN public.pedidos pe
ON c.id = pe.cliente_id
LEFT JOIN public.productos po
ON pe.producto = po.id