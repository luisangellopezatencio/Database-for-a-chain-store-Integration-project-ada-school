CREATE TABLE inventario (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    categoria VARCHAR(255),
    precio DECIMAL,
    cantidad_stock INTEGER,
    fecha_ultima_reposicion DATE
);  

INSERT INTO inventario (id_producto, nombre, categoria, precio, cantidad_stock, fecha_ultima_reposicion) VALUES
(1, 'Leche Entera', 'Lácteos', 1.20, 25, '2023-11-10'),
(2, 'Pan Integral', 'Panadería', 1.50, 15, '2023-11-15'),
(3, 'Manzanas Rojas', 'Frutas', 0.30, 50, '2023-11-16'),
(4, 'Cereal de Avena', 'Desayuno', 2.50, 10, '2023-11-12'),
(5, 'Yogur Natural', 'Lácteos', 0.80, 30, '2023-11-17'),
(6, 'Tomates', 'Verduras', 0.25, 40, '2023-11-18'),
(7, 'Pollo Entero', 'Carnes', 5.00, 20, '2023-11-14'),
(8, 'Atún en Lata', 'Conservas', 1.75, 50, '2023-11-11'),
(9, 'Arroz Blanco', 'Almacén', 1.00, 60, '2023-11-13'),
(10, 'Huevos (docena)', 'Lácteos', 1.50, 18, '2023-11-19'),
(11, 'Chocolate en Barra', 'Snacks', 1.20, 35, '2023-11-15'),
(12, 'Espinacas', 'Verduras', 0.60, 5, '2023-11-16'),
(13, 'Pasta Penne', 'Almacén', 0.90, 25, '2023-11-17'),
(14, 'Aceite de Oliva', 'Almacén', 3.50, 20, '2023-11-18'),
(15, 'Agua Mineral', 'Bebidas', 0.50, 100, '2023-11-19');


select * from inventario
where cantidad_stock < 10

