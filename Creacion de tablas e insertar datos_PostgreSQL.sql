CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  telefono INTEGER
);

CREATE TABLE sucursal (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  direccion TEXT
);

CREATE TABLE orden (
  id SERIAL PRIMARY KEY,
  cliente_id INTEGER REFERENCES cliente(id),
  sucursal_id INTEGER REFERENCES sucursal(id),
  fecha_orden DATE NOT NULL,
  total REAL NOT NULL,
  CONSTRAINT fk_orden_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  CONSTRAINT fk_orden_sucursal FOREIGN KEY (sucursal_id) REFERENCES sucursal(id)
);

CREATE TABLE categoria (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL
);

CREATE TABLE producto (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  marca TEXT,
  categoria_id INTEGER REFERENCES categoria(id),
  precio_unitario REAL,
  CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE stock (
  id SERIAL PRIMARY KEY,
  sucursal_id INTEGER REFERENCES sucursal(id),
  producto_id INTEGER REFERENCES producto(id),
  total REAL NOT NULL,
  UNIQUE (sucursal_id, producto_id),
  CONSTRAINT fk_stock_sucursal FOREIGN KEY (sucursal_id) REFERENCES sucursal(id),
  CONSTRAINT fk_stock_producto FOREIGN KEY (producto_id) REFERENCES producto(id)
);

CREATE TABLE item (
  id SERIAL PRIMARY KEY,
  orden_id INTEGER REFERENCES orden(id),
  producto_id INTEGER REFERENCES producto(id),
  cantidad REAL NOT NULL,
  monto_venta REAL NOT NULL,
  CONSTRAINT fk_item_orden FOREIGN KEY (orden_id) REFERENCES orden(id),
  CONSTRAINT fk_item_producto FOREIGN KEY (producto_id) REFERENCES producto(id)
);

INSERT INTO categoria (nombre) VALUES
  ('Electrónicos'),
  ('Ropa'),
  ('Hogar'),
  ('Deportes'),
  ('Juguetes');

INSERT INTO producto (nombre, marca, categoria_id, precio_unitario) VALUES
  ('Televisor', 'Sony', 1, 1000.0),
  ('Laptop', 'HP', 1, 800.0),
  ('Camisa', 'Zara', 2, 50.0),
  ('Pantalón', 'Levi''s', 2, 70.0),
  ('Sartén', 'T-fal', 3, 30.0),
  ('Toalla', 'Cannon', 3, 20.0),
  ('Pelota', 'Nike', 4, 15.0),
  ('Raqueta', 'Wilson', 4, 50.0),
  ('Muñeca', 'Barbie', 5, 25.0),
  ('Carro', 'Hot Wheels', 5, 10.0);
 
 INSERT INTO sucursal (nombre, direccion) VALUES
  ('Sucursal A', 'Calle 1'),
  ('Sucursal B', 'Calle 2'),
  ('Sucursal C', 'Calle 3');
 
 ALTER TABLE cliente ALTER column telefono TYPE bigint;
 
 INSERT INTO cliente (nombre, telefono) VALUES
  ('Juan', 1234567890),
  ('María', 0987654321),
  ('Pedro', 5555555555);
 
 INSERT INTO orden (cliente_id, sucursal_id, fecha_orden, total) VALUES
  (1, 3, '2023-06-12', 575),
  (2, 1, '2023-06-12', 705),
  (3, 3, '2023-06-12', 9000),
  (2, 3, '2023-06-12', 10400),
  (3, 3, '2023-06-12', 85),
  (1, 1, '2023-06-12', 830),
  (1, 1, '2023-06-12', 490),
  (3, 3, '2023-06-12', 16100),
  (3, 2, '2023-06-12', 680),
  (2, 1, '2023-06-12', 7525),
  (2, 3, '2023-06-12', 725),
  (3, 1, '2023-06-12', 11430),
  (3, 3, '2023-06-12', 4900),
  (3, 3, '2023-06-12', 5490),
  (1, 1, '2023-06-12', 420);
 
 INSERT INTO stock (sucursal_id, producto_id, total) VALUES
  (1, 1, 65),
  (1, 2, 71),
  (1, 3, 8),
  (1, 4, 42),
  (1, 5, 61),
  (1, 6, 14),
  (1, 7, 70),
  (1, 8, 66),
  (1, 9, 13),
  (1, 10, 68),
  (2, 1, 14),
  (2, 2, 67),
  (2, 3, 74),
  (2, 4, 32),
  (2, 5, 75),
  (2, 6, 37),
  (2, 7, 14),
  (2, 8, 42),
  (2, 9, 51),
  (2, 10, 41),
  (3, 1, 59),
  (3, 2, 98),
  (3, 3, 52),
  (3, 4, 85),
  (3, 5, 31),
  (3, 6, 17),
  (3, 7, 13),
  (3, 8, 18),
  (3, 9, 76),
  (3, 10, 1);
 
 INSERT INTO item (orden_id, producto_id, cantidad, monto_venta) VALUES
  (1, 9, 7, 175),
  (1, 8, 8, 400),
  (2, 9, 3, 75),
  (2, 5, 9, 270),
  (2, 5, 10, 300),
  (2, 6, 3, 60),
  (3, 1, 9, 9000),
  (4, 1, 4, 4000),
  (4, 2, 8, 6400),
  (5, 6, 2, 40),
  (5, 7, 3, 45),
  (6, 4, 9, 630),
  (6, 9, 4, 100),
  (6, 3, 2, 100),
  (7, 5, 8, 240),
  (7, 9, 6, 150),
  (7, 8, 2, 100),
  (8, 1, 6, 6000),
  (8, 1, 10, 10000),
  (8, 3, 2, 100),
  (9, 8, 9, 450),
  (9, 3, 3, 150),
  (9, 7, 2, 30),
  (9, 10, 5, 50),
  (10, 9, 9, 225),
  (10, 1, 7, 7000),
  (10, 3, 6, 300),
  (11, 7, 5, 75),
  (11, 9, 8, 200),
  (11, 3, 9, 450),
  (12, 2, 7, 5600),
  (12, 1, 5, 5000),
  (12, 6, 9, 180),
  (12, 8, 9, 450),
  (12, 8, 4, 200),
  (13, 9, 4, 100),
  (13, 2, 6, 4800),
  (14, 1, 5, 5000),
  (14, 4, 7, 490),
  (15, 9, 6, 150),
  (15, 5, 9, 270);
